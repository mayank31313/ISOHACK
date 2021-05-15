package hack.repos;

import java.util.List;

import org.springframework.data.mongodb.repository.MongoRepository;

import hack.fields.Production;

public interface ProductionRepository extends MongoRepository<Production, String> {
	List<Production> findByState(String state);
}
