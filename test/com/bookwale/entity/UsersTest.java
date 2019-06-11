package com.bookwale.entity;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import com.bookwale.entity.Users;

public class UsersTest {

	public static void main(String[] args) {
		Users user1 = new Users();
		user1.setEmail("hello@email.com");
		user1.setFullName("hell name");
		user1.setPassword("1234567");
		EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("bookwale");
		EntityManager entityManager = entityManagerFactory.createEntityManager(); 
		
		entityManager.getTransaction().begin();
		entityManager.persist(user1);
		entityManager.getTransaction().commit();
		entityManager.close();
		entityManagerFactory.close();
		
		System.out.println("Persisted");

	}

}
