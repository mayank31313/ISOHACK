
package hack.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

@Configuration
public class WebMvcConfig extends WebMvcConfigurerAdapter {
    @Bean
	public InternalResourceViewResolver viewResolver() {
	  InternalResourceViewResolver resolver = new InternalResourceViewResolver();
	  resolver.setPrefix("/WEB-INF/views/");
	  resolver.setSuffix(".jsp");
	  return resolver;
	}    
    
    @Override
    public void addViewControllers(ViewControllerRegistry registry) {     	
    	registry.addViewController("/index").setViewName("index");    	
    	registry.addViewController("/bsignup").setViewName("bsignup");
    	registry.addViewController("/fsignup").setViewName("fsignup");
    	registry.addViewController("/about").setViewName("about");
    	registry.addViewController("/contact").setViewName("contact");
    	registry.addViewController("/tutorial").setViewName("tutorial");
    	
    	registry.addViewController("/admin/index").setViewName("admin/index");
    	
    	registry.addViewController("/Farmer/index").setViewName("Farmer/index");
    	registry.addViewController("/Farmer/sell").setViewName("Farmer/sell");
    	
    	registry.addViewController("/Buyer/buy").setViewName("Buyer/buy");
    	registry.addViewController("/Buyer/index").setViewName("Buyer/index");
    }  
    
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
    	registry
    		.addResourceHandler("/resources/**")
    		.addResourceLocations("/resources/");
    }
}