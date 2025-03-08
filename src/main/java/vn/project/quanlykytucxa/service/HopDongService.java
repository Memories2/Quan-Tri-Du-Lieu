package vn.project.quanlykytucxa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import vn.project.quanlykytucxa.domain.HopDong;
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

    @Transactional(readOnly = true)
    public List<HopDong> layTatCaHopDongHopLeCuaMotPhong(String maPhong) {

        List<HopDong> hopDongs = hopDongRepository.findAllByPhongId(maPhong);
        List<HopDong> hopDongsHopLe = hopDongs.stream()
                .filter(hopDong -> hopDong.getNgayKetThuc().isAfter(java.time.LocalDate.now())).toList();
        return hopDongsHopLe;
    }

}