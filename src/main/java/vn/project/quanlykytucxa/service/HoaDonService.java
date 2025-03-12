package vn.project.quanlykytucxa.service;

import java.math.BigDecimal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import vn.project.quanlykytucxa.domain.HoaDon;
import vn.project.quanlykytucxa.repository.HoaDonRepository;

@Service
public class HoaDonService {
	 @Autowired
	    private HoaDonRepository hoaDonRepository;

	public List<HoaDon> findAll() {
		
		return hoaDonRepository.findAll();
	}


    public BigDecimal baoCaoDoanhThuTheoThang(int thang, int nam, boolean trangThai) {
        return hoaDonRepository.baoCaoDoanhThuTheoThang(thang, nam, trangThai);
    }

}
