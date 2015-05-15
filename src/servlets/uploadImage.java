package servlets;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import services.ImageRepository;

import com.projet.controleur.Controleur;
//import com.projet.outiles.Signature;

import com.projet.outils.Signature;

import dao.Image;
import dao.Signatures;

/**
 * Servlet implementation class uploadImage
 */

// taille maximal du fichier
@WebServlet(name = "upload", description = "récupérer une image ,calculer ces signature et la stocker dans la base de données", urlPatterns = { "/upload" })
@MultipartConfig(maxFileSize = 50177215)
public class uploadImage extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final static Logger LOGGER = Logger.getLogger(uploadImage.class
			.getCanonicalName());
	File destinationDir = new File("/tmp");

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		final Part filePart = request.getPart("image");
		final String fileName = getFileName(filePart);
		OutputStream out = null;
		InputStream filecontent = null;

		final PrintWriter writer = response.getWriter();
		File tmpFile = new File(destinationDir + File.separator + fileName);

		try {

			/* lire l'image en entrée et créer un stocker dans le dossier Tmp
			 * 
			 */

			out = new FileOutputStream(tmpFile);

			filecontent = filePart.getInputStream();

			int read = 0;
			final byte[] bytes = new byte[1024];

			while ((read = filecontent.read(bytes)) != -1) {
				out.write(bytes, 0, read);
			}

			/* créer un objet Image à l'aide du fichier et son nom pour pouvoir
			 * 
			 */
			Image img = new Image(readBytesFromFile(tmpFile), fileName);
			
			/*instancier le controlleur
			 * 
			 */
			Controleur c = new Controleur();
			
			/* calcule signature
			 * 
			 */
			Signature sig2 = c.calculerSignature(tmpFile);
			/*  fabriquer une signatures destiné pour la BD
			 * 
			 */
			Signatures sig = new Signatures(sig2.getTabRg(), sig2.getTabBy(),
					sig2.getTabWb());

			// attrbuer la signature à l'image et enregistrer les deux dans la
			// base de données
			img.setSignature(sig);
			sig.setImage(img);
			
			
			ImageRepository.addImage(img);

			RequestDispatcher requestDispatcher;
			requestDispatcher = request.getRequestDispatcher("/success.jsp");
			requestDispatcher.forward(request, response);
			
			
		} catch (FileNotFoundException fne) {
			writer.println("vous n'avez pas choisit un fichier "
					+ " merci d choisir un nouveaux fichier " + "location.");
			writer.println("<br/> ERROR: " + fne.getMessage());

			LOGGER.log(Level.SEVERE,
					"un probléme pendant le chargement. Error: {0}",
					new Object[] { fne.getMessage() });
		} finally {
			if (out != null) {
				out.close();
			}
			if (filecontent != null) {
				filecontent.close();
			}
			if (writer != null) {
				writer.close();
			}
		}

	}

	// lire le nom du fichier
	private String getFileName(final Part part) {
		final String partHeader = part.getHeader("content-disposition");

		for (String content : part.getHeader("content-disposition").split(";")) {
			if (content.trim().startsWith("filename")) {
				return content.substring(content.indexOf('=') + 1).trim()
						.replace("\"", "");
			}
		}
		return null;
	}

	public static byte[] readBytesFromFile(File file) throws IOException {
		InputStream is = new FileInputStream(file);

		// Get the size of the file
		long length = file.length();

		// You cannot create an array using a long type.
		// It needs to be an int type.
		// Before converting to an int type, check
		// to ensure that file is not larger than Integer.MAX_VALUE.
		if (length > Integer.MAX_VALUE) {
			throw new IOException("Could not completely read file "
					+ file.getName() + " as it is too long (" + length
					+ " bytes, max supported " + Integer.MAX_VALUE + ")");
		}

		// Create the byte array to hold the data
		byte[] bytes = new byte[(int) length];

		// Read in the bytes
		int offset = 0;
		int numRead = 0;
		while (offset < bytes.length
				&& (numRead = is.read(bytes, offset, bytes.length - offset)) >= 0) {
			offset += numRead;
		}

		// Ensure all the bytes have been read in
		if (offset < bytes.length) {
			throw new IOException("Could not completely read file "
					+ file.getName());
		}

		// Close the input stream and return bytes
		is.close();
		return bytes;
	}
}
