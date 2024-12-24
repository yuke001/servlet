package servlet_crud;

import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/fetch")
public class FetchRecords extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory("E3");
		EntityManager manager = factory.createEntityManager();

		List<Employee> list = manager.createNativeQuery("select * from employee", Employee.class).getResultList();
		req.setAttribute("records", list);
		req.getRequestDispatcher("fetch.jsp").forward(req, resp);

	}
}