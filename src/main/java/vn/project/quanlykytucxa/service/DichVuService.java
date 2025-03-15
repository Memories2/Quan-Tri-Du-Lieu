package vn.project.quanlykytucxa.service;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import vn.project.quanlykytucxa.DTO.DVDangSuDungDTO;
import vn.project.quanlykytucxa.domain.DichVu;
import vn.project.quanlykytucxa.domain.HopDong;
import vn.project.quanlykytucxa.domain.SuDungDichVu;
import vn.project.quanlykytucxa.repository.DichVuRepository;
import vn.project.quanlykytucxa.repository.SuDungDichVuRepository;

@Service
public class DichVuService {

	private final DichVuRepository dichVuRepository;
	private final SuDungDichVuRepository suDungDichVuRepository;

	public DichVuService(DichVuRepository dichVuRepository, SuDungDichVuRepository suDungDichVuRepository) {
		super();
		this.dichVuRepository = dichVuRepository;
		this.suDungDichVuRepository = suDungDichVuRepository;
	}

	public void handleDichVu(DichVu dichVu) {
		dichVuRepository.save(dichVu);
	}

	// Lấy tất cả dịch vụ
	public List<DichVu> getAllDichVu() {
		return dichVuRepository.findAll();
	}

	// Tìm dịch vụ theo ID
	public Optional<DichVu> getDichVuById(String id) {
		return dichVuRepository.findById(id);
	}

	// Xóa dịch vụ theo ID
	public boolean deleteDichVuById(String id) {
		Optional<DichVu> dichVuOpt = dichVuRepository.findById(id);

		if (dichVuOpt.isEmpty()) {
			return false;
		}

		DichVu dichVu = dichVuOpt.get();

		// Check if there are any active contracts using this service
		LocalDate today = LocalDate.now();

		List<SuDungDichVu> suDungList = suDungDichVuRepository.findByDichVu(dichVu);

		for (SuDungDichVu suDung : suDungList) {
			HopDong hopDong = suDung.getHopDong();
			// If contract is still valid (end date is after today and status is active)
			if (hopDong.getNgayKetThuc().isAfter(today) && hopDong.getTrangThai() == 1) {
				return false; // Cannot delete
			}
		}

		// If we get here, we can delete the service and its usages
		suDungDichVuRepository.deleteAll(suDungList);
		dichVuRepository.delete(dichVu);

		return true;
	}

	public DichVu findById(String maDV) {

		return dichVuRepository.findById(maDV).orElse(null);
	}

	public List<DVDangSuDungDTO> layTaCaDichVuSVDangSuDung(String id) {
		List<DVDangSuDungDTO> dtos = new ArrayList<>();
		dtos = dichVuRepository.layTaCaDichVuSVDangSuDung(id);
		return dtos;
	}

}
