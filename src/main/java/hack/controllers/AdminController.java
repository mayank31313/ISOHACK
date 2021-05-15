package hack.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import hack.fields.Production;
import hack.repos.ProductionRepository;

@RestController
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private ProductionRepository productionRepository;
	
	@GetMapping("/productionReport")
	public List<Production> getProductionReport(@RequestParam String state){
		List<Production> productions = productionRepository.findByState(state);
		return productions.subList(0, Math.min(5, productions.size()));
	}
}
