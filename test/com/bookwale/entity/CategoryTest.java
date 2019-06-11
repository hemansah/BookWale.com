package com.bookwale.entity;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import com.bookwale.entity.Users;

public class CategoryTest {

	public static void main(String[] args) {
		Category cat = new Category("Advance Java"); 
		EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("bookwale");
		EntityManager entityManager = entityManagerFactory.createEntityManager(); 
		
		entityManager.getTransaction().begin();
		entityManager.persist(cat);
		entityManager.getTransaction().commit();
		entityManager.close();
		entityManagerFactory.close();
		
		System.out.println("Persisted");

	}

}
