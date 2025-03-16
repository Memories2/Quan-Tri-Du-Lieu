package vn.project.quanlykytucxa.controller.admin;

import java.math.BigDecimal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import vn.project.quanlykytucxa.domain.HoaDon;
import vn.project.quanlykytucxa.domain.Phong;
import vn.project.quanlykytucxa.domain.SinhVien;
import vn.project.quanlykytucxa.domain.SuDungDichVu;
import vn.project.quanlykytucxa.service.HoaDonService;

@Controller
public class HoaDonController {

    @Autowired
    private HoaDonService hoaDonService;

    // Trang báo cáo doanh thu
    @GetMapping("/admin/doanhthu")
    public String hoadon() {
        return "admin/doanhthu/bao-cao-doanh-thu";
    }

    // Báo cáo doanh thu theo tháng và năm
    @GetMapping("/admin/doanhthu/bao-cao-doanh-thu")
    public String baoCaoDoanhThu(@RequestParam("thang") int thang, @RequestParam("nam") int nam, Model model) {
        // Lấy doanh thu theo tháng và năm
        BigDecimal doanhThu = hoaDonService.baoCaoDoanhThuTheoThang(thang, nam, true);

        // Kiểm tra nếu doanh thu là null thì gán bằng 0
        if (doanhThu == null) {
            doanhThu = BigDecimal.ZERO;
        }

        // Đưa doanh thu vào model để hiển thị trong JSP
        model.addAttribute("doanhThu", doanhThu);
        return "admin/doanhthu/bao-cao-doanh-thu";
    }

    // Hiển thị danh sách hóa đơn
    @GetMapping("/admin/hoadon")
    public String danhSachHoaDon(Model model) {
        // Lấy danh sách hóa đơn từ service
        model.addAttribute("hoaDons", hoaDonService.findAll());
        return "admin/hoadon/danh-sach-hoa-don";  // Trả về trang danh sách hóa đơn
    }

    // Hiển thị chi tiết hóa đơn theo ID
    @GetMapping("/admin/hoadon/chi-tiet-hoa-don/{id}")
    public String chiTietHoaDon(@PathVariable("id") String id, Model model) {
        HoaDon hoaDon = hoaDonService.findById(id);
        if (hoaDon != null) {
            SuDungDichVu suDungDichVu = hoaDon.getSuDungDichVu();
            SinhVien sinhVien = suDungDichVu.getHopDong().getSinhVien();
            // Lấy thông tin phòng từ HopDong
            Phong phong = suDungDichVu.getHopDong().getPhong();
            model.addAttribute("hoaDon", hoaDon);
            model.addAttribute("sinhVien", sinhVien); // Thêm sinh viên vào model
            model.addAttribute("phong", phong);  // Thêm phòng vào model
            return "admin/hoadon/chi-tiet-hoa-don";  // Trả về trang chi tiết hóa đơn
        }
        return "redirect:/admin/hoadon";  // Nếu không tìm thấy hóa đơn, quay lại danh sách
    }
}
