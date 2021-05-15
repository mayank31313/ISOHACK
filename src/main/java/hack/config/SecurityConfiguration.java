package hack.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

import hack.details.MyUserDetailsService;

@Configuration
public class SecurityConfiguration extends WebSecurityConfigurerAdapter{
	@Autowired
	private MyUserDetailsService userDetailsService;
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(userDetailsService);
	}
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.authorizeRequests()
			.antMatchers("/index", "/resources/**", "/fsignup","/bsignup", "/register").permitAll()
			.antMatchers("/admin").hasRole("ADMIN")
			.anyRequest().authenticated()
			.and()
			.formLogin()
				.loginPage("/login").permitAll()
				.usernameParameter("username")
				.passwordParameter("password")
				.defaultSuccessUrl("/welcome")
			.and()
				.logout()
					.invalidateHttpSession(true)
					.logoutUrl("/logout")
					.logoutSuccessUrl("/index")
			.and().cors()
			.and()
				.csrf().disable();
	}
	
	@Override
	@Bean
	protected AuthenticationManager authenticationManager() throws Exception {
		return super.authenticationManager();
	}
}
