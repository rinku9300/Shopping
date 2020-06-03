package com.app.mycart.dao;

import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.app.mycart.entities.Product;

public class ProductDao {

	private SessionFactory factory;
	private Session Session;

	public ProductDao(SessionFactory factory) {
		this.factory = factory;
	}

	public boolean SaveProduct(Product product) {
		Boolean f = false;
		try {
			Session session = factory.openSession();

			Transaction tx = session.beginTransaction();
			session.save(product);
			tx.commit();
			session.close();
			f = true;
		} catch (Exception e) {
			e.printStackTrace();
			f = false;
		}
		return f;

	}
	
		// get all Product
	public List<Product> getAllProducts() {
		Session s = factory.openSession();
		Query query = s.createQuery("from Product");
		List<Product> list = query.list();
		return list;

	}

	// get all Product of given category
	public List<Product> getAllProductsById(int cid) {
		Session s = factory.openSession();
		Query query = s.createQuery("from Product as p where p.category.categoryId =: id");
		query.setParameter("id", cid);
		List<Product> list = query.list();
		return list;
	}
}
