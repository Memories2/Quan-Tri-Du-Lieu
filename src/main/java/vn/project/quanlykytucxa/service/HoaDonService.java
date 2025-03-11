package vn.project.quanlykytucxa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import vn.project.quanlykytucxa.domain.HoaDon;
import vn.project.quanlykytucxa.repository.HoaDonRepository;
import vn.project.quanlykytucxa.repository.HopDongRepository;

@Service
public class HoaDonService {
	 @Autowired
	    private HoaDonRepository hoaDonRepository;

	public List<HoaDon> findAll() {
		
		return hoaDonRepository.findAll();
	}
}
