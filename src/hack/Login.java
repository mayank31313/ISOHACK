package hack;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import hack.db.PersonDAO;

import hack.fields.Person;

@WebServlet("/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private PersonDAO person_repo;
	
    public Login() {
        super();
        // TODO Auto-generated constructor stub
        try {
			person_repo = new PersonDAO();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.err.println("Could not initialize database object");
			e.printStackTrace();
		}
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String phone = request.getParameter("phone");
		String pass = request.getParameter("password");

		HttpSession session = request.getSession();
		Person person = person_repo.checkPerson(phone, pass);
		if(person != null){
			session.setAttribute("ID",person.id);
			if(person.role.equals("farmer")){
				request.getServletContext().getRequestDispatcher("farmer/index.jsp").forward(request, response);
			}else if( person.role.equals("buyer")){
				request.getServletContext().getRequestDispatcher("buyer/index.jsp").forward(request, response);
			}
		}
		else{
			request.setAttribute("msg", "Username or Password Incorrect");
			request.getServletContext().getRequestDispatcher("login.jsp").forward(request, response);
		}
	}
}
