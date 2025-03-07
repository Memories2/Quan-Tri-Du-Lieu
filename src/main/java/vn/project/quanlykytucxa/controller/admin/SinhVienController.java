package vn.project.quanlykytucxa.controller.admin;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import vn.project.quanlykytucxa.DTO.SearchSVDTO;
import vn.project.quanlykytucxa.service.SinhVienService;
import vn.project.quanlykytucxa.viewModel.SinhVienIndexViewModel;

@Controller
public class SinhVienController {

	@Autowired
	private SinhVienService sinhVienService;

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

		model.addAttribute("sinhVienList", danhSachSV);
		model.addAttribute("masv", searchDTO.getMasv());
		model.addAttribute("tenSV", searchDTO.getTenSV());
		model.addAttribute("maPhong", searchDTO.getMaPhong());
		model.addAttribute("soDienThoai", searchDTO.getSoDienThoai());
		return "/admin/sinhvien/index";
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
}