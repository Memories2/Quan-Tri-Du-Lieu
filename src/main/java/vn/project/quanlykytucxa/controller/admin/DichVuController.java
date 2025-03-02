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
import vn.project.quanlykytucxa.domain.DichVu;
import vn.project.quanlykytucxa.domain.Phong;
import vn.project.quanlykytucxa.service.DichVuService;
import vn.project.quanlykytucxa.service.PhongService;

import java.util.List;
import java.util.Optional;


@Controller
public class DichVuController {

    private final DichVuService dichVuService;

    public DichVuController(DichVuService dichVuService) {
        this.dichVuService = dichVuService;
    }


    //////////////////////////////// DANH SÁCH DỊCH VỤ ////////////////////////////////
    @GetMapping("/admin/dichvu")
    public String getDanhSachDichVu(Model model) {
        return "admin/dichvu/danh-sach-dich-vu";
    }

    @GetMapping("/admin/dichvu/taodichvu")
    public String getTrangTaoDichVu(Model model) {
        model.addAttribute("newDichVu", new DichVu());
        return "admin/dichvu/tao-dich-vu";
    }

    @PostMapping("/admin/dichvu/taodichvu")
    public String postTaoPhong(Model model, @ModelAttribute("newDichVu") DichVu newDichVu) {

        this.dichVuService.handleDichVu(newDichVu);

        return "admin/dichvu/tao-dich-vu";
    }

}
