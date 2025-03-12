package vn.project.quanlykytucxa.service;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import jakarta.persistence.EntityNotFoundException;
import vn.project.quanlykytucxa.domain.SinhVien;
import vn.project.quanlykytucxa.repository.SinhVienRepository;
import vn.project.quanlykytucxa.viewModel.SinhVienIndexViewModel;

@Service
public class SinhVienService {

	@Autowired
	private SinhVienRepository sinhVienRepository;

	@Transactional(readOnly = true) // Đảm bảo transaction tồn tại
	public List<SinhVienIndexViewModel> getDanhSachSinhVienTrongPhong(String soPhong) {
		List<SinhVien> svs = sinhVienRepository.getSinhVienTrongPhong(soPhong);
		List<SinhVienIndexViewModel> svms = new ArrayList<>();
		for (SinhVien sv : svs) {
			SinhVienIndexViewModel svm = new SinhVienIndexViewModel(sv.getMaSV(), sv.getHoTen(), sv.getGioiTinh(),
					sv.getSoDienThoai());

			svms.add(svm);
		}
		return svms;
	}

	@Transactional(readOnly = true)
	public List<SinhVienIndexViewModel> getDanhSachSinhVien() {

		List<SinhVien> svs = sinhVienRepository.getSinhVien();
		List<SinhVienIndexViewModel> svms = new ArrayList<>();
		for (SinhVien sv : svs) {
			SinhVienIndexViewModel svm = new SinhVienIndexViewModel(sv.getMaSV(), sv.getHoTen(), sv.getGioiTinh(),
					sv.getSoDienThoai());

			svms.add(svm);
		}
		return svms;
	}

	@Transactional(readOnly = true)
	public List<SinhVienIndexViewModel> getSinhVienMasv(String masv) {
		List<SinhVien> svs = sinhVienRepository.getSinhVienMasv(masv);
		List<SinhVienIndexViewModel> svms = new ArrayList<>();
		for (SinhVien sv : svs) {
			SinhVienIndexViewModel svm = new SinhVienIndexViewModel(sv.getMaSV(), sv.getHoTen(), sv.getGioiTinh(),
					sv.getSoDienThoai());

			svms.add(svm);
		}
		return svms;
	}

	@Transactional(readOnly = true)
	public List<SinhVienIndexViewModel> getSinhVienTen(String tenSV) {
		List<SinhVien> svs = sinhVienRepository.getSinhVienTen(tenSV);
		List<SinhVienIndexViewModel> svms = new ArrayList<>();
		for (SinhVien sv : svs) {
			SinhVienIndexViewModel svm = new SinhVienIndexViewModel(sv.getMaSV(), sv.getHoTen(), sv.getGioiTinh(),
					sv.getSoDienThoai());

			svms.add(svm);
		}
		return svms;
	}
	
	@Transactional(readOnly = true)
	public List<SinhVienIndexViewModel> getSinhVienSDT(String soDienThoai) {
		List<SinhVien> svs = sinhVienRepository.getSinhVienSDT(soDienThoai);
		List<SinhVienIndexViewModel> svms = new ArrayList<>();
		for (SinhVien sv : svs) {
			SinhVienIndexViewModel svm = new SinhVienIndexViewModel(sv.getMaSV(), sv.getHoTen(), sv.getGioiTinh(),
					sv.getSoDienThoai());

			svms.add(svm);
		}
		return svms;
	}
	
	
	@Transactional(readOnly = true)
	public int countSinhVien() {
		return sinhVienRepository.countSinhVien();
	}

	public List<SinhVienIndexViewModel> getSinhVienNgayCuTru(LocalDate ngay) {
		List<SinhVien> svs = sinhVienRepository.getSinhVienNgayCuTru(ngay);
		List<SinhVienIndexViewModel> svms = new ArrayList<>();
		for (SinhVien sv : svs) {
			SinhVienIndexViewModel svm = new SinhVienIndexViewModel(sv.getMaSV(), sv.getHoTen(), sv.getGioiTinh(),
					sv.getSoDienThoai());

			svms.add(svm);
		}
		System.out.println("Ngày truyền vào stored procedure: " + ngay+"**********************************************************************************************************************************************************************");

		return svms;
	}
	
	public String phongSinhvienDangOHienTai(String id) {
		if(sinhVienRepository.getTenPhong(id)!=null) return sinhVienRepository.getTenPhong(id);  
		return null;
	}
	
	

	public SinhVien findById(String id) {
		// TODO Auto-generated method stub
		return sinhVienRepository.findById(id).orElse(null);
	}
	
	public List<SinhVienIndexViewModel> getSinhVienMTrangThaiHopDong(int trangThaiHopDong) {
		List<SinhVien> svs = sinhVienRepository.getSinhVienMTrangThaiHopDong(trangThaiHopDong);
		List<SinhVienIndexViewModel> svms = new ArrayList<>();
		for (SinhVien sv : svs) {
			SinhVienIndexViewModel svm = new SinhVienIndexViewModel(sv.getMaSV(), sv.getHoTen(), sv.getGioiTinh(),
					sv.getSoDienThoai());

			svms.add(svm);
		}

		return svms;
	}
	/////////////////////////////////////////////////////////////////////////// Đỗ Thành Tài ////////////////////////////////
	
	public boolean checkSinhVienExist(String maSV) {
		List<SinhVien> sv = sinhVienRepository.getSinhVienMasv(maSV);
		return sv.size() > 0;
	}



	







}
