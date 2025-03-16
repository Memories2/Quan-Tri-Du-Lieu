package vn.project.quanlykytucxa.controller.client;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import vn.project.quanlykytucxa.domain.SinhVien;
import vn.project.quanlykytucxa.service.ThongTinSinhVienService;

@Controller
public class ThongTinSinhVienController {

    @Autowired
    private ThongTinSinhVienService sinhVienService;

    // Xử lý yêu cầu khi người dùng bấm vào "Thông tin cá nhân"
    @GetMapping("/client/thong-tin-sinh-vien")
    public String thongTinSinhVien(Model model) {
        // Lấy maSV từ SecurityContext (userPrincipal)
        String maSV = SecurityContextHolder.getContext().getAuthentication().getName();

        // Truy vấn thông tin sinh viên từ cơ sở dữ liệu
        SinhVien sinhVien = sinhVienService.findByMaSV(maSV);

        // Thêm thông tin sinh viên vào model để hiển thị trong JSP
        model.addAttribute("sinhVien", sinhVien);

        // Trả về view thong-tin-sinh-vien.jsp
        return "client/thong-tin-sinh-vien/thong-tin-sinh-vien"; // Đảm bảo đúng đường dẫn tới JSP
    }
}
