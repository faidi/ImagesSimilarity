package services;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import org.hibernate.Session;

 

import util.HibernateUtil;
import dao.Image;
import dao.Signatures;
/*
 * c'est la classe qui contiet toutes les opération à faire sur les images vis à vis la base de données
 */
public class ImageRepository {

	public static void addImage(Image img) {

		Session session = HibernateUtil.getSession();
		session.beginTransaction();
		session.flush();

		session.save(img);
		session.getTransaction().commit();
	}

	public static void chargerImage(Image img) throws IOException {

		ImageRepository.addImage(img);
		System.out.println("l'image enregistré avec succes");

	}

	//convertir une image en  bytes en un fichier
	public static File writeBytesToFile(byte[] bytes) throws IOException {

		File theFile = null;
		BufferedOutputStream bos = null;

		try {
			FileOutputStream fos = new FileOutputStream(theFile);
			bos = new BufferedOutputStream(fos);
			bos.write(bytes);
		} finally {
			if (bos != null) {
				try {
					// flush and close the BufferedOutputStream
					bos.flush();
					bos.close();
				} catch (Exception e) {
				}
			}
		}

		return theFile;
	}

}
