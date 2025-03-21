package vn.project.quanlykytucxa.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

@Configuration
// Remove @EnableWebMvc to fix circular dependency issue
public class WebMvcConfig implements WebMvcConfigurer {

	// Cấu hình để controller biết cách trả về view
	@Bean
	public ViewResolver viewResolver() {
		final InternalResourceViewResolver bean = new InternalResourceViewResolver();
		bean.setViewClass(JstlView.class);
		bean.setPrefix("/WEB-INF/view/");
		bean.setSuffix(".jsp");
		return bean;
	}

	//
	@Override
	public void configureViewResolvers(ViewResolverRegistry registry) {
		registry.viewResolver(viewResolver());
		registry.order(1); // Thứ tự ưu tiên của ViewResolver
	}

	// Cấu hình để sử dụng các file nguồn tĩnh (html, image, ..)
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/css/**").addResourceLocations("/resources/css/");
		registry.addResourceHandler("/js/**").addResourceLocations("/resources/js/");
		registry.addResourceHandler("/images/**").addResourceLocations("/resources/images/");
		registry.addResourceHandler("/client/**").addResourceLocations("/resources/client/");

	}

}
