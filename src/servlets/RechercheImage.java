package servlets;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
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

import com.projet.controleur.Controleur;
import com.projet.outils.Signature;
//import com.projet.outiles.CalculeSimilariteSig;
//import com.projet.outiles.Signature;
import com.sun.org.apache.xerces.internal.impl.dv.util.Base64;
import com.sun.tools.javac.code.Attribute.Array;

import services.ImageForWeb;
import services.ImageRepository;
import services.SignatureRepository;
import dao.Image;
import dao.Signatures;
import util.Utils;

/**
 * Servlet implementation class uploadImage
 */

// taille maximal du fichier
@WebServlet(name = "recherche", description = "trouver des images similaire  en calculant la distance entres les signatures  ", urlPatterns = { "/recherche" })
@MultipartConfig(maxFileSize = 1177215)
public class RechercheImage extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final static Logger LOGGER = Logger.getLogger(RechercheImage.class
			.getCanonicalName());
	File destinationDir = new File("/tmp");
	ArrayList<Image> listImage = new ArrayList<Image>();
	ArrayList<ImageForWeb> ltw = new ArrayList<ImageForWeb>();
	ArrayList<ImageForWeb> ltw2 = new ArrayList<ImageForWeb>();
	ArrayList<ImageForWeb> ltw3 = new ArrayList<ImageForWeb>();
	Signatures sigUploaded;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		final Part filePart = request.getPart("image");
		final String fileName = getFileName(filePart);

		OutputStream out = null;
		InputStream filecontent = null;

		final PrintWriter writer = response.getWriter();

		File tmpFile = new File(destinationDir + File.separator + fileName);

		try {
			// lire l'image en entrée et créer un stocker dans le dossier Tmp
			out = new FileOutputStream(tmpFile);
			filecontent = filePart.getInputStream();

			int read = 0;
			final byte[] bytes = new byte[1024];

			while ((read = filecontent.read(bytes)) != -1) {
				out.write(bytes, 0, read);
			}
			// créer un objet Image à l'aide du fichier et son nom pour pouvoir
			// le comparer avec les images de la base
			Image img = new Image(readBytesFromFile(tmpFile), fileName);

			// encoder l'image charger pour pouvoir la réaffichier dans la JSP
			ImageForWeb imgW = Utils.encodeForWeb(img, 0);
			Controleur c = new Controleur();

			Signature sig2 = c.calculerSignature(tmpFile);
			// calcule de la signature
			// sigUploaded = Utils.calculerSignature(tmpFile);
			sigUploaded = new Signatures(sig2.getTabRg(), sig2.getTabBy(),
					sig2.getTabWb());

			// initialiser les distance à 0
			double distance = 0;
			double distance2 = 0;
			double distance3 = 0;
			

			// lire toute les signatures depuis la base de données
			Iterator<Signatures> signatures = SignatureRepository
					.getAllSignatures().iterator();

			// néttoyer les tableau d'images résultat envoyer précédement à la
			// jsp
			ltw.clear();
			ltw2.clear();
			ltw3.clear();
			

			// créer un Objet signature pour le calcule de similarité via algo de l'API
			  
			Signature sig2Uploaded = new Signature(sigUploaded.getTabRG(),
					sigUploaded.getTabBY(), sigUploaded.getTabWB());

			while (signatures.hasNext()) {

				Signatures sigFromDB = signatures.next();

				/**
				 * calcule de la distance euclidienne entre la signature de
				 * l'image charger et chaque signature de la base
				 */

				distance = (Utils.calculerDistanceEuclidienne(sigUploaded,
						sigFromDB));

				distance = (double) Math.round(distance * 100);

				/**
				 * si la distance est jugé similaire on l'ajoute dans une liste
				 * distiné pour la JSP
				 */

				if (distance <= 70) {

					ltw.add(Utils.encodeForWeb(sigFromDB.getImage(), distance));
				}
				/**
				 * création d'un objet signature(pour algo similarité) via les
				 * signatures depuis la base de données
				 **/
				Signature sig2fromDB = new Signature(sigFromDB.getTabRG(),
						sigFromDB.getTabBY(), sigFromDB.getTabWB());
				/** calcule de la distance de similarité */

				distance2 = Controleur.calculDeSimilariteDI(sig2Uploaded, sig2fromDB);

				distance2 = (double) Math.round(distance2 * 100);
				// si la distance est jugé similaire on l'ajoute dans une liste
				// pour la JSP
				if (distance2 >= 30) {

					ltw2.add(Utils.encodeForWeb(sigFromDB.getImage(), distance2));

				}
				
				distance3 = Controleur.calculDeSimilariteIH(sig2Uploaded, sig2fromDB);

				distance3 = (double) Math.round(distance3 * 100);
				// si la distance est jugé similaire on l'ajoute dans une liste
				// pour la JSP
				if (distance3 >= 30) {

					ltw3.add(Utils.encodeForWeb(sigFromDB.getImage(), distance3));

				}
				
				

			}

			// envoi de la liste 1 des images à la jsp
			
			request.setAttribute("images3", ltw3);
			request.setAttribute("images2", ltw2);

			request.setAttribute("images", ltw);
			request.setAttribute("uploadedImg", imgW);

			RequestDispatcher requestDispatcher;
			requestDispatcher = request
					.getRequestDispatcher("/result_search.jsp");
			requestDispatcher.forward(request, response);

		} catch (FileNotFoundException fne) {
			writer.println("vous n'avez pas choisit un fichier  ");
			writer.println("<br/> ERROR: " + fne.getMessage());

			LOGGER.log(Level.SEVERE, "Probléme pendant l'upload ",
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

	// lire le nom du fichier charger
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

	// lire un fichier en tant que chaine de bytes
	public static byte[] readBytesFromFile(File file) throws IOException {
		InputStream is = new FileInputStream(file);

		// Get the size of the file
		long length = file.length();

		if (length > Integer.MAX_VALUE) {
			throw new IOException("Could not completely read file "
					+ file.getName() + " as it is too long (" + length
					+ " bytes, max supported " + Integer.MAX_VALUE + ")");
		}

		byte[] bytes = new byte[(int) length];

		int offset = 0;
		int numRead = 0;
		while (offset < bytes.length
				&& (numRead = is.read(bytes, offset, bytes.length - offset)) >= 0) {
			offset += numRead;
		}

		if (offset < bytes.length) {
			throw new IOException("Could not completely read file "
					+ file.getName());
		}

		is.close();
		return bytes;
	}
}
