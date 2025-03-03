package vn.project.quanlykytucxa.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import vn.project.quanlykytucxa.repository.HopDongRepository;

@Service
public class HopDongService {

    @Autowired
    private HopDongRepository hopDongRepository;

    @Transactional(readOnly = true)
    public boolean kiemTraHopDongHetHan(String maSV) {
        int result = hopDongRepository.kiemTraHopDongHetHan(maSV);
        return result == 1;
    }
}