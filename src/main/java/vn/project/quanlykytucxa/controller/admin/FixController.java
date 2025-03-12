//package vn.project.quanlykytucxa.controller.admin;
//
//import java.util.ArrayList;
//import java.util.List;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//
//import vn.project.quanlykytucxa.DTO.SuaTrangThaiPhongDTO;
//import vn.project.quanlykytucxa.domain.HopDong;
//import vn.project.quanlykytucxa.domain.Phong;
//import vn.project.quanlykytucxa.service.HoaDonService;
//import vn.project.quanlykytucxa.service.HopDongService;
//import vn.project.quanlykytucxa.service.PhongService;
//import vn.project.quanlykytucxa.service.SinhVienService;
//
//@Controller
//public class FixController {
//	@Autowired
//	private SinhVienService sinhVienService;
//	@Autowired
//	private PhongService phongService;
//	@Autowired
//	private HoaDonService hoaDonService;
//	@Autowired
//	private HopDongService hopDongService;
//
////Dùng để sửa sai trong cơ sở dữ liệu
//	@GetMapping("/fix")
//	public String getAllSinhVien(Model model) {
//		// Lấy tất cả danh sách các phòng
//		List<Phong> phongs = phongService.findAllPhong();
//
//		// Lấy mã phòng và số lượng sinh viên thực tế của từng phòng
//		List<SuaTrangThaiPhongDTO> suaTrangThaiPhongDTOs = new ArrayList<>(); 
//		List<HopDong> hds = hopDongService.layTatCaHopDong();
//
//		for (HopDong hd : hds) {
//			System.out.println(hd.toString());
//			SuaTrangThaiPhongDTO dto = new SuaTrangThaiPhongDTO();
//			dto.maPhong = hd.getPhong().getMaPhong();
//			dto.sldangchua = phongService.demSoLuongHopDong(hd.getPhong().getMaPhong());
//			suaTrangThaiPhongDTOs.add(dto);
//		}
//
//		// Lặp qua tất cả các phòng để kiểm tra và cập nhật trạng thái
//		for (Phong p : phongs) {
//			for (SuaTrangThaiPhongDTO dto : suaTrangThaiPhongDTOs) {
//				if (p.getMaPhong().equals(dto.getMaPhong())) { // So sánh chuỗi đúng cách
//					String trangThaiMoi = (p.getSoLuongToiDa() > dto.sldangchua) ? "TRONG" : "DAY";
//
//					int updatedRows = phongService.capNhatTrangThaiPhong(p.getMaPhong(), trangThaiMoi);
//
//					if (updatedRows > 0) {
//						System.out.println(
//								"Cập nhật trạng thái phòng " + p.getMaPhong() + " thành công: " + trangThaiMoi);
//					} else {
//						System.out.println("Không tìm thấy phòng: " + p.getMaPhong());
//					}
//				}
//			}
//		}
//		return "fix thành công";
//	}
//
//}
