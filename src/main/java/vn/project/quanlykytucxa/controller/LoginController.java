package vn.project.quanlykytucxa.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoginController {
    
    @GetMapping("/login")
    public String loginPage() {
        return "login"; // This must match a JSP file in /WEB-INF/view/login.jsp
    }
    
    @GetMapping("/")
    public String home() {
        return "redirect:/login";
    }
    
    @GetMapping("/admin/dashboard")
    public String adminDashboard() {
        return "redirect:/admin";
    }
    
    @GetMapping("/sinhvien/dashboard")
    public String sinhvienDashboard() {
        return "client/dashboard/dashboard";
    }
}