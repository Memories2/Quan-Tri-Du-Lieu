package vn.project.quanlykytucxa.controller.admin;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import vn.project.quanlykytucxa.domain.PhieuDangKy;
import vn.project.quanlykytucxa.domain.Phong;
import vn.project.quanlykytucxa.domain.SinhVien;
import vn.project.quanlykytucxa.service.PhieuDangKyService;
import vn.project.quanlykytucxa.service.PhongService;
import vn.project.quanlykytucxa.service.SinhVienService;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class PhieuDangKyController_admin {

    private final PhieuDangKyService phieuDangKyService;
    private final PhongService phongService;
    private final SinhVienService sinhVienService;

    public PhieuDangKyController_admin(PhieuDangKyService phieuDangKyService,
            PhongService phongService,
            SinhVienService sinhVienService) {
        this.phieuDangKyService = phieuDangKyService;
        this.phongService = phongService;
        this.sinhVienService = sinhVienService;
    }

    @GetMapping("/admin/phieudangky")
    public String getPhieuDangKyPage_admString(Model model) {
        List<PhieuDangKy> phieuDangKyList = phieuDangKyService.getAllPhieuDangKy();
        model.addAttribute("phieuDangKyList", phieuDangKyList);
        return "admin/phieudangky/phieu-dang-ky";
    }

    @GetMapping("/admin/phieudangky/reject/{maPhieuDK}")
    public String rejectPhieuDangKy(@PathVariable("maPhieuDK") String maPhieuDK) {
        PhieuDangKy phieuDangKy = phieuDangKyService.findPhieuDangKyById(Long.parseLong(maPhieuDK));
        phieuDangKy.setTrangThai(2);
        phieuDangKyService.savePhieuDangKy(phieuDangKy);
        return "redirect:/admin/phieudangky";
    }
    


}
