package servlet_crud;

import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.Transaction;

@WebServlet("/delete")
public class DeleteServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	int id =Integer.parseInt(req.getParameter("id"));
	
		EntityManagerFactory factory = Persistence.createEntityManagerFactory("E3");
		EntityManager manager = factory.createEntityManager();
		EntityTransaction transaction = manager.getTransaction();

		Employee employee = manager.find(Employee.class, id);

		transaction.begin();
		manager.remove(employee);
		transaction.commit();

		resp.getWriter().print("<h1 align='center'> Record deleted successfully</h1> ");
		req.getRequestDispatcher("fetch").include(req,resp);

	}
}