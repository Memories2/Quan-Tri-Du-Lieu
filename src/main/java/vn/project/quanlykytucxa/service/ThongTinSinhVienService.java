package vn.project.quanlykytucxa.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import vn.project.quanlykytucxa.domain.SinhVien;
import vn.project.quanlykytucxa.repository.SinhVienRepository;

@Service
public class ThongTinSinhVienService {

    @Autowired
    private SinhVienRepository sinhVienRepository;

    public SinhVien findByMaSV(String maSV) {
        return sinhVienRepository.findById(maSV).orElse(null);
    }
}
