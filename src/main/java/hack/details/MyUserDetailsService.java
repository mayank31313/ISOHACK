package hack.details;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import hack.fields.Person;
import hack.repos.PersonRepository;

@Service
public class MyUserDetailsService implements UserDetailsService{
	
	@Autowired
	private PersonRepository personRepository;
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		Optional<Person> person = personRepository.findByPhone(username);
		if(!person.isPresent()) {
			throw new BadCredentialsException("User not found with username: " + username);
		}
		
		Person p = person.get();
		return new MyUserDetails(p.phone, p.password, p.role);
	}

}
