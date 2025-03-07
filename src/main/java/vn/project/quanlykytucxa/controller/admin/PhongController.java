package vn.project.quanlykytucxa.controller.admin;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import vn.project.quanlykytucxa.domain.LoaiPhong;
import vn.project.quanlykytucxa.domain.Phong;
import vn.project.quanlykytucxa.service.PhongService;
import vn.project.quanlykytucxa.service.SinhVienService;
import vn.project.quanlykytucxa.viewModel.SinhVienIndexViewModel;

import jakarta.validation.Valid;
import org.springframework.validation.BindingResult;

@Controller
public class PhongController {

	private final PhongService phongService;
	private final SinhVienService sinhVienService;

	public PhongController(PhongService phongService, SinhVienService sinhVienService) {
		this.phongService = phongService;
		this.sinhVienService = sinhVienService;
	}

	//////////////////////////////// DANH SÁCH PHÒNG
	//////////////////////////////// ////////////////////////////////
	@GetMapping("/admin/phong")
	public String getDanhSachPhong(Model model) {
		List<Phong> danhSachPhong = phongService.findAllPhong();
		model.addAttribute("danhSachPhong", danhSachPhong);
		return "admin/phong/danh-sach-phong";
	}

	//////////////////////////////// XEM CHI TIẾT PHÒNG
	//////////////////////////////// ////////////////////////////////
	@GetMapping("/admin/phong/chitiet/{maPhong}")
	public String getChiTietPhong(@PathVariable String maPhong, Model model, RedirectAttributes redirectAttributes) {
		Optional<Phong> phongOptional = phongService.findPhongById(maPhong);

		if (phongOptional.isPresent()) {

			// Danh sách sinh viên có trong phòng sử dụng Stored Procedure
			List<SinhVienIndexViewModel> danhSachSV = sinhVienService.getDanhSachSinhVienTrongPhong(maPhong);
			for (SinhVienIndexViewModel sv : danhSachSV) {
				System.out.println(sv.toString());
			}
			model.addAttribute("sinhVienList", danhSachSV);

			// Kết thúc danh sách dinh viên trong phòng

			model.addAttribute("phong", phongOptional.get());
			return "admin/phong/chi-tiet-phong";
		} else {
			redirectAttributes.addFlashAttribute("errorMessage", "Không tìm thấy phòng với mã " + maPhong);
			return "redirect:/admin/phong";
		}
	}

	//////////////////////////////// XEM CHI TIẾT PHÒNG
	//////////////////////////////// ////////////////////////////////
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
	public String postTaoPhong(Model model, @Valid @ModelAttribute("newPhong") Phong newPhong,
			BindingResult bindingResult) {

		// Custom validation
		if (phongService.existsById(newPhong.getMaPhong())) {
			bindingResult.rejectValue("maPhong", "duplicate", "Mã phòng đã tồn tại");
		}

		// Add specific validation for loaiPhong
		if (newPhong.getLoaiPhong() == null || newPhong.getLoaiPhong().getMaLoaiPhong() == null
				|| newPhong.getLoaiPhong().getMaLoaiPhong().isEmpty()) {
			bindingResult.rejectValue("loaiPhong", "required", "Loại phòng không được để trống");
		}

		// Check if there are validation errors
		if (bindingResult.hasErrors()) {
			return "admin/phong/tao-phong";
		}

		try {
			// Set the loaiPhong object from its ID
			LoaiPhong loaiPhong = phongService.getLoaiPhongByMaLoaiPhong(newPhong.getLoaiPhong().getMaLoaiPhong());
			if (loaiPhong == null) {
				bindingResult.rejectValue("loaiPhong", "invalid", "Loại phòng không hợp lệ");
				return "admin/phong/tao-phong";
			}

			newPhong.setLoaiPhong(loaiPhong);

			// Set enum value for tinhTrang if coming as string
			if (newPhong.getTinhTrang() == null) {
				newPhong.setTinhTrang(Phong.TinhTrangPhong.TRONG); // Default value
			}

			// Save phong
			phongService.handleSavePhong(newPhong);

			model.addAttribute("successMessage", "Tạo phòng mới thành công!");
			model.addAttribute("newPhong", new Phong());
			return "admin/phong/tao-phong";

		} catch (Exception e) {
			bindingResult.reject("saveError", "Lỗi khi lưu phòng: " + e.getMessage());
			return "admin/phong/tao-phong";
		}
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
	public String postSuaPhong(@PathVariable String maPhong, @ModelAttribute("phong") Phong phong,
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
