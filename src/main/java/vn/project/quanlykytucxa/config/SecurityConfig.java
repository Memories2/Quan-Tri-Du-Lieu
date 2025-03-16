package vn.project.quanlykytucxa.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.password.NoOpPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

@Configuration
@EnableWebSecurity
public class SecurityConfig {

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http
                .csrf(csrf -> csrf.disable()) // For simplicity while testing
                .authorizeHttpRequests(authorize -> authorize
                        .requestMatchers("/css/**", "/js/**", "/images/**").permitAll()
                        // Add this line to exclude JSP files from security checks
                        .requestMatchers("/WEB-INF/view/**").permitAll()
                        .requestMatchers("/login", "/register", "/").permitAll()
                        .requestMatchers("/admin/**").hasRole("ADMIN")
                        .requestMatchers("/client/**").hasRole("USER")
                        .anyRequest().authenticated())
                .formLogin(form -> form
                        .loginPage("/login")
                        .loginProcessingUrl("/perform-login")
                        .usernameParameter("masv")
                        .passwordParameter("matKhau")
                        .successHandler(authenticationSuccessHandler()) // Add this line
                        .failureUrl("/login?error=true")
                        .permitAll());

        // .csrf(csrf -> csrf.disable())
        // .authorizeHttpRequests(authorize -> authorize
        // .anyRequest().permitAll() // Cho phép truy cập tất cả
        // )
        // .formLogin(form -> form.disable()); // Tắt form đăng nhập

        return http.build();
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        // WARNING: Only use this for development/testing!
        // In production, use BCryptPasswordEncoder instead
        return NoOpPasswordEncoder.getInstance();
    }

    @Bean
    public AuthenticationManager authenticationManager(AuthenticationConfiguration authConfig) throws Exception {
        return authConfig.getAuthenticationManager();
    }

    @Bean
    public AuthenticationSuccessHandler authenticationSuccessHandler() {
        return new CustomSuccessHandler();
    }
}