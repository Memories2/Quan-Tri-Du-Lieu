package vn.project.quanlykytucxa.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.validation.Valid;
import vn.project.quanlykytucxa.domain.HopDong;
import vn.project.quanlykytucxa.domain.Phong;
import vn.project.quanlykytucxa.domain.SinhVien;
import vn.project.quanlykytucxa.service.HopDongService;
import vn.project.quanlykytucxa.service.PhongService;

import java.util.List;
import java.util.Optional;

@Controller
public class PhongController {

    private final PhongService phongService;
    private final HopDongService hopDongService;

    public PhongController(PhongService phongService, HopDongService hopDongService) {
        this.hopDongService = hopDongService;
        this.phongService = phongService;
    }

    //////////////////////////////// DANH SÁCH PHÒNG ////////////////////////////////
    @GetMapping("/admin/phong")
    public String getDanhSachPhong(Model model) {
        List<Phong> danhSachPhong = phongService.findAllPhong();
        model.addAttribute("danhSachPhong", danhSachPhong);
        return "admin/phong/danh-sach-phong";
    }

    //////////////////////////////// XEM CHI TIẾT PHÒNG ////////////////////////////////
    @GetMapping("/admin/phong/chitiet/{maPhong}")
    public String getChiTietPhong(@PathVariable String maPhong, Model model, RedirectAttributes redirectAttributes) {
        Optional<Phong> phongOptional = phongService.findPhongById(maPhong);

        List<HopDong> hopDongs = hopDongService.layTatCaHopDongHopLeCuaMotPhong(maPhong);

        // Chuyển sang sách hợp đồng thành danh sách sinh viên
        List<SinhVien> sinhViens = hopDongs.stream().map(HopDong::getSinhVien).toList();
        
        if (phongOptional.isPresent()) {
            model.addAttribute("phong", phongOptional.get());
            model.addAttribute("sinhVienList", sinhViens);
            return "admin/phong/chi-tiet-phong";
        } else {
            redirectAttributes.addFlashAttribute("errorMessage", "Không tìm thấy phòng với mã " + maPhong);
            return "redirect:/admin/phong";
        }
    }

   
    //////////////////////////////// CREATE PHONG ////////////////////////////////
    @GetMapping("/admin/phong/taophong")
    public String getTrangTaoPhong(Model model) {
        model.addAttribute("newPhong", new Phong());
        return "admin/phong/tao-phong";
    }

    @PostMapping("/admin/phong/taophong")
    public String postTaoPhong(Model model, @ModelAttribute("newPhong") Phong newPhong) {

        newPhong.setLoaiPhong(this.phongService.getLoaiPhongByMaLoaiPhong(newPhong.getLoaiPhong().getMaLoaiPhong()));
        // save phong
        this.phongService.handleSavePhong(newPhong);

        return "redirect:/admin/phong/taophong";
    }

    //////////////////////////////// EDIT PHONG ////////////////////////////////
    @GetMapping("/admin/phong/suaphong/{maPhong}")
    public String getTrangSuaPhong(@PathVariable String maPhong, Model model, RedirectAttributes redirectAttributes) {
        Optional<Phong> phongOptional = phongService.findPhongById(maPhong);

        if (phongOptional.isPresent()) {
            model.addAttribute("phong", phongOptional.get());
            return "admin/phong/sua-phong";
        } else {
            redirectAttributes.addFlashAttribute("errorMessage", "Không tìm thấy phòng với mã " + maPhong);
            return "redirect:/admin/phong";
        }
    }

    @PostMapping("/admin/phong/suaphong/{maPhong}")
    public String postSuaPhong(@PathVariable String maPhong,
            @ModelAttribute("phong") Phong phong,
            RedirectAttributes redirectAttributes) {
        // Ensure we're updating the correct phong
        phong.setMaPhong(maPhong);

        // Set the loaiPhong object from its ID
        phong.setLoaiPhong(this.phongService.getLoaiPhongByMaLoaiPhong(phong.getLoaiPhong().getMaLoaiPhong()));

        // Save the updated phong
        this.phongService.handleSavePhong(phong);

        redirectAttributes.addFlashAttribute("successMessage", "Cập nhật phòng thành công");
        return "redirect:/admin/phong";
    }

    //////////////////////////////// DELETE PHONG ////////////////////////////////
    @GetMapping("/admin/phong/xoaphong/{maPhong}")
    public String getXoaPhong(@PathVariable String maPhong, Model model, RedirectAttributes redirectAttributes) {
        Optional<Phong> phongOptional = phongService.findPhongById(maPhong);

        if (phongOptional.isPresent()) {
            // Check if the room is in use
            if (phongService.isPhongInUse(maPhong)) {
                redirectAttributes.addFlashAttribute("errorMessage",
                        "Không thể xóa phòng vì phòng đang được sử dụng trong hợp đồng.");
                return "redirect:/admin/phong";
            }

            model.addAttribute("phong", phongOptional.get());
            return "admin/phong/xoa-phong";
        } else {
            redirectAttributes.addFlashAttribute("errorMessage", "Không tìm thấy phòng với mã " + maPhong);
            return "redirect:/admin/phong";
        }
    }

    @PostMapping("/admin/phong/xoaphong/{maPhong}")
    public String postXoaPhong(@PathVariable String maPhong, RedirectAttributes redirectAttributes) {
        if (!phongService.existsById(maPhong)) {
            redirectAttributes.addFlashAttribute("errorMessage", "Không tìm thấy phòng với mã " + maPhong);
            return "redirect:/admin/phong";
        }

        if (phongService.isPhongInUse(maPhong)) {
            redirectAttributes.addFlashAttribute("errorMessage",
                    "Không thể xóa phòng vì phòng đang được sử dụng trong hợp đồng.");
            return "redirect:/admin/phong";
        }

        try {
            phongService.deletePhong(maPhong);
            redirectAttributes.addFlashAttribute("successMessage", "Xóa phòng thành công");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage", "Lỗi khi xóa phòng: " + e.getMessage());
        }

        return "redirect:/admin/phong";
    }
}
