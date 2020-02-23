package hack.rest;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import hack.db.PricesDAO;
import hack.fields.Prices;

@WebServlet("/restprices")
public class RestPrices extends HttpServlet {
	private static final long serialVersionUID = 1L;
    Gson gson = new GsonBuilder().setPrettyPrinting().create();
	PricesDAO prices;	
    public RestPrices() {
        super();
        // TODO Auto-generated constructor stub
        try {
			prices = new PricesDAO();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String district = request.getParameter("district");
		if(district == null){
			System.out.println("ERROR");
			return ;
		}
		List<Prices> price_list = prices.getData(district);
		response.setContentType("text/json");
		response.getWriter().print(gson.toJson(price_list));
	}

}
