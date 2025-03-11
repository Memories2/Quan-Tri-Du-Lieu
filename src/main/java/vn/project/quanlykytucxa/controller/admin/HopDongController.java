package vn.project.quanlykytucxa.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import vn.project.quanlykytucxa.service.HopDongService;

@Controller
public class HopDongController {

    @Autowired
    private HopDongService hopDongService;

    // Trả về trang JSP để nhập MSSV
    @GetMapping("/admin/hopdong")
    public String hopdong() {
        return "admin/hopdong/kiem-tra-hop-dong";
    }

    // Kiểm tra hợp đồng hết hạn
    @GetMapping("/admin/hopdong/kiem-tra-hop-dong")
    public String kiemTraHopDong(@RequestParam("maSV") String maSV, Model model) {
        // Gọi service để kiểm tra hợp đồng của sinh viên
        String result = hopDongService.kiemTraHopDong(maSV);
        
        // Thêm kết quả vào model để hiển thị trên JSP
        model.addAttribute("result", result);
        model.addAttribute("maSV", maSV);

        return "admin/hopdong/kiem-tra-hop-dong"; // Trả về trang JSP
    }
}

