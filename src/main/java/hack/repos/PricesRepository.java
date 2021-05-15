package hack.repos;

import org.springframework.data.mongodb.repository.MongoRepository;

import hack.fields.Prices;

public interface PricesRepository extends MongoRepository<Prices, String>{

}
