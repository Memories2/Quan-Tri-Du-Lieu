package vn.project.quanlykytucxa;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

//@SpringBootApplication
@SpringBootApplication(exclude = org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration.class ) // tam thoi tat di phan dang nhap
public class QuanlykytucxaApplication {

	public static void main(String[] args) {
		SpringApplication.run(QuanlykytucxaApplication.class, args);
	}

}
