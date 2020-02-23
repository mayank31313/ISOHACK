package hack;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import hack.db.PersonDAO;
import hack.fields.Person;

/**
 * Servlet implementation class Register
 */
@WebServlet("/register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private PersonDAO person_repo;
	
    public Register() {
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
    	Person p = new Person();
		p.phone = request.getParameter("phone");
		p.password = request.getParameter("password");
		p.role = request.getParameter("type");
		p.district = request.getParameter("district");
		p.state = request.getParameter("state");
		p.name = request.getParameter("name");
		boolean b = person_repo.updatePerson(p);
		System.out.println(b);
		if(b){
			request.setAttribute("msg", "User registered successfully");
			request.getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);
			System.out.println("Registered Successfully");
		}else{
			request.setAttribute("msg", "Internal Server Error");
			System.out.println("Could not register");
			if(p.role.equals("farmer"))
				request.getServletContext().getRequestDispatcher("/fsignup.jsp").forward(request, response);
			else
				request.getServletContext().getRequestDispatcher("/bsignup.jsp").forward(request, response);
		}
	}

}
