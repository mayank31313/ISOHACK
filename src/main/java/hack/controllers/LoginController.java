package hack.controllers;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import hack.details.MyUserDetails;
import hack.fields.Person;
import hack.repos.PersonRepository;

@Controller
public class LoginController {
	@Autowired
	AuthenticationManager authManager;
	@Autowired
	PersonRepository personRepository;
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@PostMapping("/register")
	public String register(@RequestParam String role,
							@RequestParam String password,
							@RequestParam String phone,
							@RequestParam String name) {
	
		Person person = new Person();
		person.name = name;
		person.phone = phone;
		person.role = role;
		person.password = passwordEncoder.encode(password);
		
		Optional<Person> optionalPerson = personRepository.findByPhone(phone);
		if(optionalPerson.isPresent()) {
			return "redirect:error";
		}
		
		personRepository.save(person);
		return "redirect:login";
	}
	
	@RequestMapping("/welcome")
	public String welcomePage(Authentication auth) {
		UserDetails userDetails = (MyUserDetails)auth.getPrincipal();
		List<GrantedAuthority> authorities = new ArrayList(userDetails.getAuthorities());
		String authority = authorities.get(0).getAuthority();
		if(authority.equals("ADMIN")) {
			return "redirect:admin/index";
		}
		else if(authority.equals("FARMER")) {
			return "redirect:Farmer/index";
		}
		else {
			return "redirect:Buyer/index";
		}
	}
	
	@GetMapping("/login")
	public String getLogin() {
		return "login";
	}
	
	@PostMapping("/login")
	public void login(@RequestParam String username, @RequestParam String password) {
		try {
			Authentication auth = authManager.authenticate(
					new UsernamePasswordAuthenticationToken(
							username, password
					));
			SecurityContextHolder.getContext().setAuthentication(auth);
		}catch(BadCredentialsException ex) {
			ex.printStackTrace();
		}
	}
}
