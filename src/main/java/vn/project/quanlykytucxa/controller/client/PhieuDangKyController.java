package vn.project.quanlykytucxa.controller.client;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import vn.project.quanlykytucxa.domain.PhieuDangKy;
import vn.project.quanlykytucxa.domain.Phong;
import vn.project.quanlykytucxa.domain.SinhVien;
import vn.project.quanlykytucxa.service.HopDongService;
import vn.project.quanlykytucxa.service.PhieuDangKyService;
import vn.project.quanlykytucxa.service.PhongService;
import vn.project.quanlykytucxa.service.SinhVienService;

@Controller
public class PhieuDangKyController {

    @Autowired
    private PhongService phongService;

    @Autowired
    private SinhVienService sinhVienService;

    @Autowired
    private PhieuDangKyService phieuDangKyService;

    @Autowired
    private HopDongService hopDongService;

    @GetMapping("/client/phieudangky/{maPhong}")
    public String getDangKyPage(Model model, @PathVariable String maPhong,
            @AuthenticationPrincipal org.springframework.security.core.userdetails.UserDetails userDetails) {
        // Lấy thông tin phòng
        Phong phong = phongService.findPhongById(maPhong).orElse(null);
        if (phong == null) {
            return "redirect:/client?error=PhongKhongTonTai";
        }

        // Lấy số lượng sinh viên hiện có trong phòng
        int soLuongSinhVienHienTai = phongService.demSoLuongHopDong(maPhong);

        // Lấy thông tin sinh viên
        SinhVien sinhVien = sinhVienService.findById(userDetails.getUsername());

        model.addAttribute("phong", phong);
        model.addAttribute("soLuongSinhVienHienTai", soLuongSinhVienHienTai);
        model.addAttribute("newPhieuDangKy", new PhieuDangKy());
        model.addAttribute("sinhVien", sinhVien);
        return "client/phieudangky/phieu-dang-ky";
    }

    @PostMapping("/client/phieudangky/submit")
    public String submitDangKy(@RequestParam String maPhong,
            @AuthenticationPrincipal org.springframework.security.core.userdetails.UserDetails userDetails,
            RedirectAttributes redirectAttributes) {

        try {
            // Lấy thông tin sinh viên và phòng
            SinhVien sinhVien = sinhVienService.findById(userDetails.getUsername());
            Phong phong = phongService.findPhongById(maPhong).orElse(null);

            if (phong == null) {
                redirectAttributes.addFlashAttribute("errorMessage", "Phòng không tồn tại!");
                return "redirect:/client";
            }

            // Kiểm tra sinh viên đang có hợp đồng không ?
            if (hopDongService.kiemTraHopDongHopLe(sinhVien.getMaSV())) {
                redirectAttributes.addFlashAttribute("errorMessage", "Sinh viên đang có hợp đồng!");
                return "redirect:/client/phieudangky/" + maPhong;
            }

            // Kiểm tra tình trạng phòng
            if (phong.getTinhTrang() == Phong.TinhTrangPhong.DAY ||
                    phong.getTinhTrang() == Phong.TinhTrangPhong.SUACHUA) {
                redirectAttributes.addFlashAttribute("errorMessage", "Phòng đã đầy hoặc đang sửa chữa!");
                return "redirect:/client/phieudangky/" + maPhong;
            }

            // Tạo phiếu đăng ký mới
            PhieuDangKy phieuDangKy = new PhieuDangKy();
            phieuDangKy.setSinhVien(sinhVien);
            phieuDangKy.setPhong(phong);

            phieuDangKy.setTrangThai(0); // Chưa duyệt

            // Lưu phiếu đăng ký
            phieuDangKyService.savePhieuDangKy(phieuDangKy);

            redirectAttributes.addFlashAttribute("successMessage",
                    "Đăng ký phòng thành công! Vui lòng chờ quản lý ký túc xá phê duyệt.");
            return "redirect:/client";
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage", "Lỗi: " + e.getMessage());
            return "redirect:/client/phieudangky/" + maPhong;
        }
    }
}
