package hack;

import org.springframework.boot.web.server.ConfigurableWebServerFactory;
import org.springframework.boot.web.server.WebServerFactoryCustomizer;
import org.springframework.stereotype.Component;
@Component
public class SpringPorter implements WebServerFactoryCustomizer<ConfigurableWebServerFactory>{

	public void customize(ConfigurableWebServerFactory factory) {
		factory.setPort(9090);
	}

}
