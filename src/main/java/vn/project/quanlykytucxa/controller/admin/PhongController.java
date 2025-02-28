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
import vn.project.quanlykytucxa.domain.Phong;
import vn.project.quanlykytucxa.service.PhongService;

import java.util.List;
import java.util.Optional;

@Controller
public class PhongController {

    private final PhongService phongService;

    public PhongController(PhongService phongService) {
        this.phongService = phongService;
    }

    //////////////////////////////// XEM CHI TIET PHONG
    //////////////////////////////// ////////////////////////////////
    //////////////////////////////// ////////////////////////////////

    @GetMapping("/admin/phong/chitietphong")
    public String getChiTietPhong() {

        return "admin/phong/chitietphong";
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
}
