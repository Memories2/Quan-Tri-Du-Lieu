package vn.project.quanlykytucxa.controller.client;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import vn.project.quanlykytucxa.domain.HopDong;
import vn.project.quanlykytucxa.service.HopDongViewService;

import java.util.List;

@Controller
public class HopDongViewController {

    @Autowired
    private HopDongViewService hopDongViewService;

    // Xử lý yêu cầu khi người dùng bấm vào "Hợp đồng sinh viên"
    @GetMapping("/client/hopdong")
    public String hopDongSinhVien(Model model) {
        // Lấy maSV từ SecurityContext (userPrincipal)
        String maSV = SecurityContextHolder.getContext().getAuthentication().getName();

        // Truy vấn danh sách hợp đồng của sinh viên từ cơ sở dữ liệu
        List<HopDong> hopDongs = hopDongViewService.findByMaSV(maSV);

        // Thêm danh sách hợp đồng vào model để hiển thị trong JSP
        model.addAttribute("hopDongs", hopDongs);

        // Trả về view hop-dong-sinh-vien.jsp
        return "client/hopdong/hop-dong-sinh-vien"; // Đảm bảo đúng đường dẫn tới JSP
    }
}