package services;

import java.util.List;

import org.hibernate.Session;

 

import dao.Signatures;
import util.HibernateUtil;
/*
 * opérations sur les signatures vis a vis  la base de données
 */
public class SignatureRepository {

	//ajouter une signature
	public static void addSignature(Signatures sig){
		
		Session session=HibernateUtil.getSession();
		session.beginTransaction();
		session.save(sig);
		session.flush();
		session.getTransaction().commit(); 
	}
	// trouver une signature via ID
	public static Signatures getSignature(Long idS){
		Session session=HibernateUtil.getSession();
		session.beginTransaction();
		Signatures p = (Signatures) session.load(Signatures.class, idS);
		return p;
		
	} 
	//afficher toutes les signatures
	public static  List<Signatures> getAllSignatures(){
		
		Session session=HibernateUtil.getSession();
		session.beginTransaction();
		 
		
		return session.createQuery("from Signatures").list(); 
		
		
	}
	
	
	 
}
