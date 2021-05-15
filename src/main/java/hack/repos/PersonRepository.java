package hack.repos;

import java.util.Optional;

import org.springframework.data.mongodb.repository.MongoRepository;

import hack.fields.Person;

public interface PersonRepository extends MongoRepository<Person, String> {
	Optional<Person> findByPhone(String username);
}
