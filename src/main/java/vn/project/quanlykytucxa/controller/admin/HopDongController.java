package vn.project.quanlykytucxa.controller.admin;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.servlet.http.HttpServletResponse;
import jakarta.validation.Valid;
import vn.project.quanlykytucxa.domain.HopDong;
import vn.project.quanlykytucxa.domain.PhieuDangKy;
import vn.project.quanlykytucxa.domain.Phong;
import vn.project.quanlykytucxa.domain.SinhVien;
import vn.project.quanlykytucxa.exception.BusinessException;
import vn.project.quanlykytucxa.repository.HopDongRepository;
import vn.project.quanlykytucxa.service.HopDongService;
import vn.project.quanlykytucxa.service.PDFGeneratorService;
import vn.project.quanlykytucxa.service.PhieuDangKyService;
import vn.project.quanlykytucxa.service.PhongService;
import vn.project.quanlykytucxa.service.SinhVienService;

@Controller
public class HopDongController {

    @Autowired
    private HopDongService hopDongService;

    @Autowired
    private SinhVienService sinhVienService;

    @Autowired
    private PhongService phongService;

    @Autowired
    private HopDongRepository hopDongRepository;

    @Autowired
    private PDFGeneratorService pdfGeneratorService;

    @Autowired
    private PhieuDangKyService phieuDangKyService;

    @GetMapping("/admin/hopdong/kiem-tra-hop-dong")
    public String kiemTraHopDong(@RequestParam("maSV") String maSV, Model model) {
        // Gọi service để kiểm tra hợp đồng của sinh viên
        String result = hopDongService.kiemTraHopDong(maSV);

        // Thêm kết quả vào model để hiển thị trên JSP
        model.addAttribute("result", result);
        model.addAttribute("maSV", maSV);

        return "admin/hopdong/danh-sach-hop-dong"; // Trả về trang JSP
    }

    ////////////////////////// Thêm hợp đồng //////////////////////////
    @GetMapping("admin/hopdong/themHopDong")
    public String themHopDong(Model model) {

        HopDong newHopDong = new HopDong();
        newHopDong.setSinhVien(new SinhVien()); // Khởi tạo đối tượng SinhVien

        // Thiết lập giá trị mặc định cho ngày
        newHopDong.setNgayBatDau(LocalDate.now());
        newHopDong.setNgayKetThuc(LocalDate.now().plusMonths(3));

        model.addAttribute("newHopDong", newHopDong);

        return "admin/hopdong/them-hop-dong";
    }

    @GetMapping("admin/hopdong/themHopDong/{maPhieuDK}")
    public String themHopDong_2(@PathVariable("maPhieuDK") String maPhieuDK, Model model) {
        // lấy phiếu đăng ký từ maPhieuDK
        PhieuDangKy phieuDangKy = phieuDangKyService.findPhieuDangKyById(Long.parseLong(maPhieuDK));

        HopDong newHopDong = new HopDong();

        // lấy sinh viên từ phiếu đăng ký
        SinhVien sinhVien = phieuDangKy.getSinhVien();
        newHopDong.setSinhVien(sinhVien); // Khởi tạo đối tượng SinhVien

        // lấy phòng từ phiếu đăng ký
        Phong phong = phieuDangKy.getPhong();
        newHopDong.setPhong(phong); // Khởi tạo đối tượng Phong

        // Thiết lập giá trị mặc định cho ngày
        newHopDong.setNgayBatDau(LocalDate.now());
        newHopDong.setNgayKetThuc(LocalDate.now().plusMonths(3));

        model.addAttribute("newHopDong", newHopDong);

        return "admin/hopdong/them-hop-dong";
    }

    @PostMapping("admin/hopdong/themHopDong")
    public String themHopDong(
            @Valid @ModelAttribute("newHopDong") HopDong newHopDong,
            BindingResult bindingResult,
            Model model,
            RedirectAttributes redirectAttributes) {

        // 1. Validate required fields
        if (newHopDong.getSinhVien() == null || newHopDong.getSinhVien().getMaSV() == null
                || newHopDong.getSinhVien().getMaSV().isEmpty()) {
            bindingResult.rejectValue("sinhVien.maSV", "required", "Mã sinh viên không được để trống");
        }

        if (newHopDong.getPhong() == null || newHopDong.getPhong().getMaPhong() == null
                || newHopDong.getPhong().getMaPhong().isEmpty()) {
            bindingResult.rejectValue("phong.maPhong", "required", "Phòng không được để trống");
        }

        if (newHopDong.getMaHD() == null || newHopDong.getMaHD().isEmpty()) {
            bindingResult.rejectValue("maHD", "required", "Mã Hợp đồng không được để trống");
        }

        // 2. Validate date ranges
        LocalDate today = LocalDate.now();
        if (newHopDong.getNgayBatDau() == null) {
            bindingResult.rejectValue("ngayBatDau", "required", "Ngày bắt đầu không được để trống");
        } else if (newHopDong.getNgayBatDau().isBefore(today)) {
            bindingResult.rejectValue("ngayBatDau", "invalid", "Ngày bắt đầu không được nhỏ hơn ngày hiện tại");
        }

        if (newHopDong.getNgayKetThuc() == null) {
            bindingResult.rejectValue("ngayKetThuc", "required", "Ngày kết thúc không được để trống");
        } else if (newHopDong.getNgayBatDau() != null &&
                newHopDong.getNgayKetThuc().isBefore(newHopDong.getNgayBatDau())) {
            bindingResult.rejectValue("ngayKetThuc", "invalid", "Ngày kết thúc phải lớn hơn ngày bắt đầu");
        }

        // 3. Check for validation errors before proceeding with business logic
        if (bindingResult.hasErrors()) {
            // Reload danh sách phòng trống để hiển thị lại form
            model.addAttribute("newHopDong", newHopDong);
            return "admin/hopdong/them-hop-dong";
        }

        try {
            // 4. Business validation

            // check if maHD exists
            boolean hd = hopDongService.existsById(newHopDong.getMaHD());
            if (hd) {
                bindingResult.rejectValue("maHD", "duplicate", "Mã hợp đồng đã tồn tại");
                model.addAttribute("newHopDong", newHopDong);
                return "admin/hopdong/them-hop-dong";
            }

            // Check if student exists
            boolean sv = sinhVienService.checkSinhVienExist(newHopDong.getSinhVien().getMaSV());
            if (sv == false) {
                bindingResult.rejectValue("sinhVien.maSV", "notFound", "Không tìm thấy sinh viên với mã này");
                model.addAttribute("newHopDong", newHopDong);
                return "admin/hopdong/them-hop-dong";
            }

            // Check if room exists
            Phong phong = phongService.findPhongById(newHopDong.getPhong().getMaPhong())
                    .orElse(null);
            if (phong == null) {
                bindingResult.rejectValue("phong.maPhong", "notFound", "Không tìm thấy phòng với mã này");
                model.addAttribute("newHopDong", newHopDong);
                return "admin/hopdong/them-hop-dong";
            }

            // set trạng thái cho hợp đồng là đang hoạt động vì mới taọ
            // 1 là đang hoạt động
            // 0 là hết hạn
            newHopDong.setTrangThai(1);

            // Lưu hợp đồng (Trigger sẽ được kích hoạt tại đây)
            hopDongService.themHopDong(newHopDong);

            // Nếu thành công
            redirectAttributes.addFlashAttribute("successMessage",
                    "Hợp đồng đã được tạo thành công");
            return "redirect:/admin/hopdong/themHopDong";

        } catch (BusinessException e) {
            // Xử lý các lỗi từ trigger thông qua service
            switch (e.getCode()) {
                case "SV_EXISTS":
                    bindingResult.rejectValue("sinhVien.maSV", "duplicate", e.getMessage());
                    break;
                case "ROOM_MAINTENANCE":
                    bindingResult.rejectValue("phong.maPhong", "maintenance", e.getMessage());
                    break;
                case "ROOM_FULL":
                    bindingResult.rejectValue("phong.maPhong", "full", e.getMessage());
                    break;
                default:
                    bindingResult.reject("saveError", e.getMessage());
            }

            return "admin/hopdong/them-hop-dong";

        } catch (Exception e) {
            // Xử lý các lỗi khác không dự đoán được
            bindingResult.reject("saveError", "Lỗi khi lưu hợp đồng: " + e.getMessage());

            return "admin/hopdong/them-hop-dong";
        }
    }

    ////////////////////////// Trang chủ hợp đồng //////////////////////////
    @GetMapping("/admin/hopdong")
    public String getHopDongHome(Model model) {
        List<HopDong> hopDongs = hopDongService.layTatCaHopDong();
        model.addAttribute("hopDongs", hopDongs);
        return "admin/hopdong/danh-sach-hop-dong";
    }

    ///////////// Xem chi tiết hợp đồng /////////////
    @GetMapping("/admin/hopdong/chitiet/{maHD}")
    public String getChiTietHopDong(@PathVariable("maHD") String maHD, Model model) {
        HopDong hopDong = hopDongRepository.findById(maHD).orElse(null);
        if (hopDong == null) {
            model.addAttribute("errorMessage", "Không tìm thấy hợp đồng với mã " + maHD);
            return "admin/hopdong/chitiet-hop-dong";
        }
        model.addAttribute("hopDong", hopDong);
        return "admin/hopdong/chi-tiet-hop-dong";
    }

    @GetMapping("/admin/hopdong/xuatpdf/{maHD}")
    public void xuatPDF(@PathVariable("maHD") String maHD, HttpServletResponse response) throws IOException {
        HopDong hopDong = hopDongRepository.findById(maHD).orElse(null);

        if (hopDong == null) {
            response.sendRedirect("/admin/hopdong");
            return;
        }

        response.setContentType("application/pdf");
        String headerKey = "Content-Disposition";
        String headerValue = "attachment; filename=hopdong_" + maHD + ".pdf";
        response.setHeader(headerKey, headerValue);

        pdfGeneratorService.exportPDF(hopDong, response);
    }

}
