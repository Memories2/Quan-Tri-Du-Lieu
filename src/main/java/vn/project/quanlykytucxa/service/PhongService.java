package vn.project.quanlykytucxa.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import vn.project.quanlykytucxa.domain.LoaiPhong;
import vn.project.quanlykytucxa.domain.Phong;
import vn.project.quanlykytucxa.repository.HopDongRepository;
import vn.project.quanlykytucxa.repository.LoaiPhongRepository;
import vn.project.quanlykytucxa.repository.PhongRepository;

import java.util.List;
import java.util.Optional;

@Service
public class PhongService {

    private final PhongRepository phongRepository;
    private final LoaiPhongRepository loaiPhongRepository;
    private final HopDongRepository hopDongRepository;

    public PhongService(PhongRepository phongRepository, LoaiPhongRepository loaiPhongRepository,
            HopDongRepository hopDongRepository) {
        this.phongRepository = phongRepository;
        this.loaiPhongRepository = loaiPhongRepository;
        this.hopDongRepository = hopDongRepository;
        
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
}
