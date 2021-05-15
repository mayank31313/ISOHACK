package hack;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.security.crypto.password.PasswordEncoder;

import hack.fields.Person;
import hack.fields.Prices;
import hack.fields.Production;
import hack.repos.PersonRepository;
import hack.repos.PricesRepository;
import hack.repos.ProductionRepository;

@SpringBootApplication
@ComponentScan(basePackages = {"hack"})
public class Main implements ApplicationRunner{
	public static void main(String[] args) {
		SpringApplication.run(Main.class, args);
	}
	
	@Autowired
	private PricesRepository pricesRepository;
	@Autowired
	private PersonRepository personRepository;
	@Autowired
	private PasswordEncoder passwordEncoder; 
	@Autowired
	private ProductionRepository productionRepository;
	
	public void run(ApplicationArguments args) throws Exception {
		Person admin = new Person();
		admin.id="admin";
		admin.name = "Admin";
		admin.role = "ADMIN";
		admin.state = "MP";
		admin.password = passwordEncoder.encode("test@123");
		admin.phone = "1234512345";
		
		Person person = new Person();
		person.id = "default";
		person.name = "Test Farmer";
		person.password = passwordEncoder.encode("test@123");
		person.role = "FARMER";
		person.state = "MP";
		person.phone = "7415801082";
		
		Person person2 = new Person();
		person2.id = "default2";
		person2.name = "Test Buyer";
		person2.password = passwordEncoder.encode("test@123");
		person2.role = "BUYER";
		person2.state = "MP";
		person2.phone = "1234567890";
		
		personRepository.save(admin);
		personRepository.save(person);
		personRepository.save(person2);
		
		File file = new File("C:\\Users\\mayan\\Downloads\\apy.csv");
		BufferedReader reader = new BufferedReader(new FileReader(file));
		String line = reader.readLine();
		List<Production> productions = new ArrayList<Production>();
		
		while((line = reader.readLine()) != null) {
			String[] str = line.split(",");
			Production production = new Production();
			production.setState(str[0]);
			production.setDistrict(str[1]);
			production.setCrop(str[4]);
			production.setArea(Double.valueOf(str[5]));
			if(str.length == 7) {
				production.setProduction(Double.valueOf(str[6]));
			}
			else {
				production.setProduction(0.00);
			}
			productions.add(production);
		}
		
		//productionRepository.saveAll(productions);
		
		file = new File("C:\\Users\\mayan\\Downloads\\datafile.csv");
		reader = new BufferedReader(new FileReader(file));
		line = reader.readLine();
		List<Prices> prices = new ArrayList<Prices>();
		
		while((line = reader.readLine()) != null) {
			String[] str = line.split(",");
			if (str.length != 9) {
				System.out.println(str.length);
				continue;
			}
			Prices price = new Prices();
			
			price.state = str[0];
			price.district = str[1];
			price.commodity = str[3];
			price.variety = str[4];
			price.min_price = Integer.parseInt(str[6].substring(1,str[6].length() - 1));
			price.max_price = Integer.parseInt(str[7].substring(1,str[7].length() - 1));
			price.modal_price = Integer.parseInt(str[8].substring(1,str[8].length() - 1));
			
			
			prices.add(price);
		}
		
//		pricesRepository.saveAll(prices);
	}
}