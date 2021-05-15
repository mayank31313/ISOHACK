package hack.rest;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import hack.fields.Prices;
import hack.repos.PricesRepository;


@RestController
@RequestMapping("/Farmer")
public class RestPrices extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Autowired
	PricesRepository pricesRepository;
	
	@GetMapping("/restprices")
	public List<Prices> restPrices(@RequestParam String district)  {
		return pricesRepository.findAll().subList(0, 100);
	}

}
