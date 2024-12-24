package servlet_crud;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;

public class DatabaseLogic {
	
	EntityManagerFactory factory = Persistence.createEntityManagerFactory("E3");
	EntityManager manager = factory.createEntityManager();
	EntityTransaction transaction = manager.getTransaction();
	
	public void save(Employee emp) {
		transaction.begin();
		manager.persist(emp);
		transaction.commit();
	}
	
	public void delete(int id) {

		Employee employee = manager.find(Employee.class, id);

		transaction.begin();
		manager.remove(employee);
		transaction.commit();
	}
	
	public void update(Employee emp) {
		transaction.begin();
		manager.persist(emp);
		transaction.commit();
		
	}
	
	public Employee find(int id) {
		return manager.find(Employee.class, id);
	}

}
