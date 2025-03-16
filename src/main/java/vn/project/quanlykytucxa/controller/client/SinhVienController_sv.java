package vn.project.quanlykytucxa.controller.client;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import vn.project.quanlykytucxa.domain.Phong;
import vn.project.quanlykytucxa.service.PhongService;

@Controller
public class SinhVienController_sv {

    private final PhongService phongService;

    public SinhVienController_sv(PhongService phongService) {
        this.phongService = phongService;
    }

    @GetMapping("/client")
    public String getSinhVienHomePage(Model model) {

        List<Phong> danhSachPhong = phongService.findAllPhong();
        model.addAttribute("danhSachPhong", danhSachPhong);

        Map<Phong, Integer> soLuongSinhVienHienTai = new HashMap<>();
        for (Phong phong : danhSachPhong) {
            soLuongSinhVienHienTai.put(phong, phongService.getSoLuongSinhVienHienTaiCuaMotPhong(phong.getMaPhong()));
        }
        model.addAttribute("soLuongSinhVienHienTai", soLuongSinhVienHienTai);
        return "client/dashboard/home";
    }

}
