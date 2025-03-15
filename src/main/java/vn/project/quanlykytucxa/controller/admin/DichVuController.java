package vn.project.quanlykytucxa.controller.admin;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.validation.Valid;
import vn.project.quanlykytucxa.domain.DichVu;
import vn.project.quanlykytucxa.service.DichVuService;

@Controller
@RequestMapping("/admin/dichvu")
public class DichVuController {

	private final DichVuService dichVuService;

	public DichVuController(DichVuService dichVuService) {
		this.dichVuService = dichVuService;
	}

	//////////////////////////////// DANH SÁCH DỊCH VỤ
	//////////////////////////////// ////////////////////////////////
	@GetMapping
	public String getDanhSachDichVu(Model model) {
		List<DichVu> danhSachDichVu = dichVuService.getAllDichVu();
		for (DichVu dichVu : danhSachDichVu) {
			System.out.println(
					dichVu.toString() + "//////////////////////////////////////////////////////////////////////////");
		}
		model.addAttribute("danhSachDichVu", danhSachDichVu);
		return "admin/dichvu/danh-sach-dich-vu";
	}

	//////////////////////////////// THÊM DỊCH VỤ ////////////////////////////////
	@GetMapping("/taodichvu")
	public String getTrangTaoDichVu(Model model) {
		model.addAttribute("dichVu", new DichVu());
		return "admin/dichvu/tao-dich-vu";
	}

	@PostMapping("/taodichvu")
	public String postTaoDichVu(@Valid @ModelAttribute("dichVu") DichVu dichVu, BindingResult result,
			RedirectAttributes redirectAttributes) {
		DichVu dichVu2 = dichVuService.findById(dichVu.getMaDV());

		// Kiểm tra lỗi validation hoặc mã dịch vụ đã tồn tại
		if (result.hasErrors() || dichVu2 != null) {
			redirectAttributes.addFlashAttribute("err", "❌ Mã dịch vụ đã tồn tại hoặc dữ liệu không hợp lệ!");
			return "redirect:/admin/dichvu/taodichvu"; // Sửa lại thành redirect
		}

		// Lưu dịch vụ mới
		dichVuService.handleDichVu(dichVu);
		redirectAttributes.addFlashAttribute("successMessage", "✅ Thêm dịch vụ thành công!");

		return "redirect:/admin/dichvu";
	}

	// Hiển thị form sửa dịch vụ
	@GetMapping("/sua/{id}")
	public String suaDichVu(@PathVariable("id") String id, Model model) {
		DichVu dichVu = dichVuService.findById(id); // Tìm dịch vụ theo ID
		if (dichVu == null) {
			model.addAttribute("errorMessage", "Không tìm thấy dịch vụ!");
			return "redirect:/admin/dichvu";
		}
		model.addAttribute("dichVu", dichVu); // Gửi object lên JSP
		return "admin/dichvu/sua-dich-vu"; // Trả về JSP
	}

	// Xử lý cập nhật dịch vụ
	@PostMapping("/sua/{id}")
	public String postSuaDichVu(@PathVariable("id") String id, @Valid @ModelAttribute("dichVu") DichVu dichVu,
			BindingResult result, RedirectAttributes redirectAttributes) {
		// Kiểm tra lỗi nhập liệu
		if (result.hasErrors()) {
			return "admin/dichvu/sua-dich-vu";
		}

		// Kiểm tra dịch vụ có tồn tại không
		Optional<DichVu> existingDichVu = dichVuService.getDichVuById(id);
		if (existingDichVu.isEmpty()) {
			redirectAttributes.addFlashAttribute("errorMessage", "Không tìm thấy dịch vụ để cập nhật!");
			return "redirect:/admin/dichvu";
		}

		// Cập nhật thông tin
		dichVu.setMaDV(id); // Đảm bảo đúng ID
		dichVuService.handleDichVu(dichVu);

		redirectAttributes.addFlashAttribute("successMessage", "Cập nhật dịch vụ thành công!");
		return "redirect:/admin/dichvu";
	}

	@GetMapping("/xoa/{id}")
	public String xoaDichVu(@PathVariable("id") String id, RedirectAttributes redirectAttributes) {
	    try {
	        boolean deleted = dichVuService.deleteDichVuById(id);
	        if (deleted) {
	            redirectAttributes.addFlashAttribute("successMessage", "Xóa dịch vụ thành công!");
	        } else {
	            redirectAttributes.addFlashAttribute("errorMessage", "Dịch vụ không tồn tại hoặc không thể xóa do còn hợp đồng trong hạn sử dụng dịch vụ này!");
	        }
	    } catch (Exception e) {
	        redirectAttributes.addFlashAttribute("errorMessage", "Lỗi khi xóa dịch vụ: " + e.getMessage());
	    }
	    return "redirect:/admin/dichvu";
	}
}
