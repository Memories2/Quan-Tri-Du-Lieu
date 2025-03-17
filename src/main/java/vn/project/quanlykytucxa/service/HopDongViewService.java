package vn.project.quanlykytucxa.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import vn.project.quanlykytucxa.domain.HopDong;
import vn.project.quanlykytucxa.repository.HopDongViewRepository;

import java.util.List;

@Service
public class HopDongViewService {

    @Autowired
    private HopDongViewRepository hopDongViewRepository;

    // Lấy danh sách hợp đồng theo mã sinh viên
    public List<HopDong> findByMaSV(String maSV) {
        return hopDongViewRepository.findBySinhVien_MaSV(maSV);
    }
}