package vn.project.quanlykytucxa.controller.admin;

import java.math.BigDecimal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import vn.project.quanlykytucxa.service.HoaDonService;

@Controller
public class HoaDonController {

    @Autowired
    private HoaDonService hoaDonService;

    @GetMapping("/admin/hoadon")
    public String hoadon() {
        return "admin/hoadon/bao-cao-doanh-thu";
    }

    @GetMapping("/admin/hoadon/bao-cao-doanh-thu")
    public String baoCaoDoanhThu(@RequestParam("thang") int thang, @RequestParam("nam") int nam, Model model) {
        // Lấy doanh thu theo tháng và năm
        BigDecimal doanhThu = hoaDonService.baoCaoDoanhThuTheoThang(thang, nam, true);

        // Kiểm tra nếu doanh thu là null thì gán bằng 0
        if (doanhThu == null) {
            doanhThu = BigDecimal.ZERO;
        }

        // Đưa doanh thu vào model để hiển thị trong JSP
        model.addAttribute("doanhThu", doanhThu);
        return "admin/hoadon/bao-cao-doanh-thu";
    }
}
