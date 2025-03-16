package vn.project.quanlykytucxa.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import vn.project.quanlykytucxa.service.DashboardService;

@Controller
public class DashboardController {

    private final DashboardService dashboardService;

    // Constructor injection
    public DashboardController(DashboardService dashboardService) {
        this.dashboardService = dashboardService;
    }

    @GetMapping("/admin")
    public String getDashboard(Model model) {
        // Truyền các dữ liệu thống kê vào model từ DashboardService
        model.addAttribute("countPhong", dashboardService.getCountPhong());
        model.addAttribute("countSinhVien", dashboardService.getCountSinhVien());
        model.addAttribute("countHopDong", dashboardService.getCountHopDong());
        model.addAttribute("countHoaDon", dashboardService.getCountHoaDonChuaThanhToan());

        return "admin/dashboard/home"; // Trả về trang dashboard
    }
}
