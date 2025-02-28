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
}
