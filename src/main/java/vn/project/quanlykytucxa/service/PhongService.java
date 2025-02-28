package vn.project.quanlykytucxa.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import vn.project.quanlykytucxa.domain.LoaiPhong;
import vn.project.quanlykytucxa.domain.Phong;
import vn.project.quanlykytucxa.repository.LoaiPhongRepository;
import vn.project.quanlykytucxa.repository.PhongRepository;

import java.util.Optional;

@Service
public class PhongService {

    private final PhongRepository phongRepository;
    private final LoaiPhongRepository loaiPhongRepository;

    public PhongService(PhongRepository phongRepository, LoaiPhongRepository loaiPhongRepository) {
        this.phongRepository = phongRepository;
        this.loaiPhongRepository = loaiPhongRepository;
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

    public Optional<Phong> findPhongById(String maPhong) {
        return phongRepository.findById(maPhong);
    }

    public LoaiPhong getLoaiPhongByMaLoaiPhong(String maLoaiPhong) {
        return this.loaiPhongRepository.findByMaLoaiPhong(maLoaiPhong);
    }

    public int countPhong() {
        return (int) phongRepository.count();
    }
}
