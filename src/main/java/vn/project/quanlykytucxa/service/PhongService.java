package vn.project.quanlykytucxa.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import vn.project.quanlykytucxa.domain.LoaiPhong;
import vn.project.quanlykytucxa.domain.Phong;
import vn.project.quanlykytucxa.repository.HopDongRepository;
import vn.project.quanlykytucxa.repository.LoaiPhongRepository;
import vn.project.quanlykytucxa.repository.PhongRepository;

@Service
public class PhongService {

	private final PhongRepository phongRepository;
	private final LoaiPhongRepository loaiPhongRepository;
	private final HopDongRepository hopDongRepository;
	private final HopDongService hopDongService;

	public PhongService(PhongRepository phongRepository, LoaiPhongRepository loaiPhongRepository,
			HopDongRepository hopDongRepository, HopDongService hopDongService) {
		this.phongRepository = phongRepository;
		this.loaiPhongRepository = loaiPhongRepository;
		this.hopDongRepository = hopDongRepository;
		this.hopDongService = hopDongService;

	}

	@Transactional
	public void handleSavePhong(Phong phong) {
		// Make sure LoaiPhong exists before saving the Phong
		if (phong.getLoaiPhong() != null) {
			LoaiPhong loaiPhong = loaiPhongRepository.findByMaLoaiPhong(phong.getLoaiPhong().getMaLoaiPhong());
			if (loaiPhong != null) {
				phong.setLoaiPhong(loaiPhong);
			}
		}
		phongRepository.save(phong);
	}

	@Transactional
	public void deletePhong(String maPhong) {
		phongRepository.deleteById(maPhong);
	}

	public boolean existsById(String maPhong) {
		return phongRepository.existsById(maPhong);
	}

	// You would want to check if the room is referenced by any contracts
	// This is a placeholder - implement actual check when HopDongRepository is
	// completed
	public boolean isPhongInUse(String maPhong) {
		// Example implementation if you had a HopDongRepository:
		return hopDongRepository.existsByPhongMaPhong(maPhong);
		// return false;
	}

	public Optional<Phong> findPhongById(String maPhong) {
		return phongRepository.findById(maPhong);
	}

	public LoaiPhong getLoaiPhongByMaLoaiPhong(String maLoaiPhong) {
		return this.loaiPhongRepository.findByMaLoaiPhong(maLoaiPhong);
	}

	public int countPhong() {
		return (int) phongRepository.count();
	}

	public List<Phong> findAllPhong() {
		return phongRepository.findAll();
	}

	public List<Phong> danhSachPhongTrong() {
		if (phongRepository.danhSachPhongTrong().isEmpty()) {
			List<Phong> ps = new ArrayList<Phong>();
			return ps;
		}
		return phongRepository.danhSachPhongTrong();
	}
	/////////////////////////////////////////////////////////////////////////// dùng
	/////////////////////////////////////////////////////////////////////////// cho
	/////////////////////////////////////////////////////////////////////////// sv
	/////////////////////////////////////////////////////////////////////////// controller

	public void chuyenPhong(String idSinhVien, String phong) {
		try {
			phongRepository.chuyenPhongChoSinhVien(idSinhVien, phong);
		} catch (Exception e) {
			throw new RuntimeException("Lỗi khi chuyển phòng: " + e.getMessage());
		}

	}

	// đếm số lượng hợp đồng trong từng phòng
	public int demSoLuongHopDong(String maPhong) {
		return phongRepository.demSoLuongHopDong(maPhong);
	}

	public int getSoLuongSinhVienHienTaiCuaMotPhong(String maPhong) {
		return hopDongService.layTatCaHopDongHopLeCuaMotPhong(maPhong).size();
	}

	

//	// Cập nhật trạng thái phòng
//	@Transactional
//	public int capNhatTrangThaiPhong(String id, String trangThaiMoi) {
//		return phongRepository.capNhatTrangThai(id, trangThaiMoi);
//	}
}
