package vn.project.quanlykytucxa.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import vn.project.quanlykytucxa.service.PhongService;
import vn.project.quanlykytucxa.service.SinhVienService;

@Controller
public class DashboardController {

    private final PhongService phongService;
    private final SinhVienService sinhVienService;

    public DashboardController(PhongService phongService, SinhVienService sinhVienService) {
        this.phongService = phongService;
        this.sinhVienService = sinhVienService;
    }

    @GetMapping("/admin")
    public String getDashboard(Model model) {
        // Add counts for dormitory management
        model.addAttribute("countPhong", this.phongService.countPhong());
        model.addAttribute("countSinhVien", this.sinhVienService.countSinhVien());

        return "admin/dashboard/home";
    }
}


