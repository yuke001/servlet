package servlet_crud;

import java.io.IOException;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/update")
public class UpdateServlet extends HttpServlet {
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = req.getParameter("name");
		String mobile = req.getParameter("mobile");
		String email = req.getParameter("email");
		String salary = req.getParameter("salary");
		String id = req.getParameter("id");
	

		Employee emp = new Employee();
		emp.setEmail(email);
		emp.setName(name);
		emp.setMobile(Long.parseLong(mobile));
		emp.setSalary(Long.parseLong(salary));
		emp.setId(Integer.parseInt(id));

		EntityManagerFactory factory = Persistence.createEntityManagerFactory("E3");
		EntityManager manager = factory.createEntityManager();
		EntityTransaction transaction = manager.getTransaction();

		transaction.begin();
		manager.merge(emp);
		transaction.commit();

		resp.getWriter().print("<h1 align='center'>Record Updated Success</h1>");
		req.getRequestDispatcher("fetch").include(req, resp);

}
}
