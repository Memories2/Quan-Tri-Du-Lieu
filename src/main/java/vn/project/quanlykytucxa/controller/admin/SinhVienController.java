package vn.project.quanlykytucxa.controller.admin;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import vn.project.quanlykytucxa.DTO.DVDangSuDungDTO;
import vn.project.quanlykytucxa.DTO.SearchSVDTO;
import vn.project.quanlykytucxa.domain.Phong;
import vn.project.quanlykytucxa.domain.SinhVien;
import vn.project.quanlykytucxa.service.DichVuService;
import vn.project.quanlykytucxa.service.PhongService;
import vn.project.quanlykytucxa.service.SinhVienService;
import vn.project.quanlykytucxa.viewModel.SinhVienIndexViewModel;

@Controller
public class SinhVienController {

	@Autowired
	private SinhVienService sinhVienService;
	@Autowired
	private PhongService phongService;

	@Autowired
	private DichVuService dichVuService;

	@GetMapping("/admin/sinhvien/tiemkiem")
	public String timKiemSinhVien(@ModelAttribute SearchSVDTO searchDTO, Model model) {

		List<SinhVienIndexViewModel> danhSachSV = new ArrayList<>();

		// Tìm theo mã sinh viên
		if (searchDTO.getMasv() != null && !searchDTO.getMasv().trim().isEmpty()) {
			if (danhSachSV.isEmpty()) {
				danhSachSV = sinhVienService.getSinhVienMasv(searchDTO.getMasv());
			} else {
				List<SinhVienIndexViewModel> danhSachSV01 = sinhVienService.getSinhVienMasv(searchDTO.getMasv());
				danhSachSV.retainAll(danhSachSV01);
			}
		}

		// Tìm theo tên sinh viên
		if (searchDTO.getTenSV() != null && !searchDTO.getTenSV().trim().isEmpty()) {
			if (danhSachSV.isEmpty()) {
				danhSachSV = sinhVienService.getSinhVienTen(searchDTO.getTenSV());
			} else {
				List<SinhVienIndexViewModel> danhSachSV01 = sinhVienService.getSinhVienTen(searchDTO.getTenSV());
				danhSachSV.retainAll(danhSachSV01);
			}
		}

		// Tìm theo mã phòng
		if (searchDTO.getMaPhong() != null && !searchDTO.getMaPhong().trim().isEmpty()) {
			if (danhSachSV.isEmpty()) {
				danhSachSV = sinhVienService.getDanhSachSinhVienTrongPhong(searchDTO.getMaPhong());
			} else {
				List<SinhVienIndexViewModel> danhSachSV01 = sinhVienService
						.getDanhSachSinhVienTrongPhong(searchDTO.getMaPhong());
				danhSachSV.retainAll(danhSachSV01);
			}
		}

		// Tìm theo số điện thoại
		if (searchDTO.getSoDienThoai() != null && !searchDTO.getSoDienThoai().trim().isEmpty()) {
			if (danhSachSV.isEmpty()) {
				danhSachSV = sinhVienService.getSinhVienSDT(searchDTO.getSoDienThoai());
			} else {
				List<SinhVienIndexViewModel> danhSachSV01 = sinhVienService.getSinhVienSDT(searchDTO.getSoDienThoai());
				danhSachSV.retainAll(danhSachSV01);
			}
		}

		// Tìm theo ngày cư trú
		if (searchDTO.getNgay() != null) {
			if (danhSachSV.isEmpty()) {
				danhSachSV = sinhVienService.getSinhVienNgayCuTru(searchDTO.getNgay());
			} else {
				List<SinhVienIndexViewModel> danhSachSV01 = sinhVienService.getSinhVienNgayCuTru(searchDTO.getNgay());
				danhSachSV.retainAll(danhSachSV01);
			}
		}

		// Trạng thái hợp đồng
		if (searchDTO.getTrangThaiHopDong() == 1 || searchDTO.getTrangThaiHopDong() == 0) {
			if (danhSachSV.isEmpty()) {
				danhSachSV = sinhVienService.getSinhVienMTrangThaiHopDong(searchDTO.getTrangThaiHopDong());
			} else {
				List<SinhVienIndexViewModel> danhSachSV01 = sinhVienService
						.getSinhVienMTrangThaiHopDong(searchDTO.getTrangThaiHopDong());
				danhSachSV.retainAll(danhSachSV01);
			}
		}

		model.addAttribute("sinhVienList", danhSachSV);
		model.addAttribute("masv", searchDTO.getMasv());
		model.addAttribute("tenSV", searchDTO.getTenSV());
		model.addAttribute("maPhong", searchDTO.getMaPhong());
		model.addAttribute("soDienThoai", searchDTO.getSoDienThoai());
		model.addAttribute("ngay", searchDTO.getNgay());
		return "admin/sinhvien/index";
	}

	public static boolean hasNonEmptyField(Object dto) {
		if (dto == null)
			return false;

		for (Field field : dto.getClass().getDeclaredFields()) {
			field.setAccessible(true);
			try {
				Object value = field.get(dto);
				if (value instanceof String && !((String) value).trim().isEmpty()) {
					return true; // Có ít nhất một thuộc tính không rỗng
				}
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			}
		}
		return false; // Tất cả đều rỗng hoặc null
	}

	@GetMapping("/admin/sinhvien")
	public String getAllSinhVien(Model model) {
		List<SinhVienIndexViewModel> indexViewModels = sinhVienService.getDanhSachSinhVien();

		model.addAttribute("sinhVienList", indexViewModels);
		return "admin/sinhvien/index";
	}

	@GetMapping("/admin/sinhvien/chuyenphong/{id}")
	public String chuyenPhong(@PathVariable("id") String id, Model model) {
		System.out.println("******************************************************************************************************************************************************************************************************************************************************************************************************************************************");
		// Lấy tên phòng hiện tại sinh viên đang ở
		String phong = sinhVienService.phongSinhvienDangOHienTai(id);
		// Danh sách tạo compobox các phòng còn trống
		List<Phong> phongtrongs = phongService.danhSachPhongTrong();
		SinhVien sinhVien = sinhVienService.findById(id);

		model.addAttribute("phongtrongs", phongtrongs);
		model.addAttribute("phong", phong);
		model.addAttribute("idSinhVien", id);
		model.addAttribute("sinhVien", sinhVien);

		return "admin/sinhvien/chuyenphong";
	}

	@GetMapping("/admin/sinhvien/chuyenphong/save")
	public String chuyenPhongTransaction(@RequestParam("idSinhVien") String idSinhVien,
			@RequestParam("phong") String phong, Model model, RedirectAttributes redirectAttributes) {
		// Lấy tên phòng hiện tại sinh viên đang ở
		String phongHienTai = sinhVienService.phongSinhvienDangOHienTai(idSinhVien);

		// Danh sách tạo combobox các phòng còn trống
		List<Phong> phongTrongs = phongService.danhSachPhongTrong();
		SinhVien sinhVien = sinhVienService.findById(idSinhVien);

		try {
			phongService.chuyenPhong(idSinhVien, phong);
			redirectAttributes.addFlashAttribute("successMessage", "Chuyển phòng thành công!");
		} catch (Exception e) {
			redirectAttributes.addFlashAttribute("errorMessage", "Lỗi: " + e.getMessage());
		}

		model.addAttribute("phongtrongs", phongTrongs);
		model.addAttribute("phong", phong);
		model.addAttribute("idSinhVien", idSinhVien);
		model.addAttribute("sinhVien", sinhVien);

		return "redirect:/admin/sinhvien/chuyenphong/" + idSinhVien;

	}

	@GetMapping("/admin/sinhvien/dichvu/{id}")
	public String dichvusinhviendadangky(@PathVariable("id") String id, Model model,
			RedirectAttributes redirectAttributes) {
		// Kiểm tra sinh viên có còn hợp đồng hay không nếu không thì ngưng tra về index
		// kèm theo thông báo sinh viên không còn trong ktx
		List<SinhVienIndexViewModel> danhSachSV = new ArrayList<>();
		danhSachSV = sinhVienService.getSinhVienMTrangThaiHopDong(0);
		SinhVien sinhVien = sinhVienService.findById(id);
		for (SinhVienIndexViewModel sinhVienIndexViewModel : danhSachSV) {
			if (sinhVienIndexViewModel.getMaSV().equals(id)) {
				redirectAttributes.addFlashAttribute("err",
						"Hợp đồng sinh viên không còn hiệu lực không thể đăng ký dịch vụ");
				return "redirect:/admin/sinhvien";
			}
		}
		// Nếu sinh viên còn hợp đồng thì lấy danh sách tên và mã tất cả dịch vụ mà sv
		// đang sử dụng
		List<DVDangSuDungDTO> dtos = dichVuService.layTaCaDichVuSVDangSuDung(id);
		String sinhVienId = id;
		model.addAttribute("dtos", dtos);
		model.addAttribute("sinhVienId", id);
		return "admin/sinhvien/dich-vu-da-dang-ky";
	}

	@GetMapping("/admin/sinhvien/{dSV}/{idsdv}")
	public String xuatHoaDon(@PathVariable("idsdv") String idsdv, @PathVariable("idsdv") String idSV, Model model,
			RedirectAttributes redirectAttributes) {

		return "redirect:/admin/sinhvien/dichvu/" + idSV;
	}
}