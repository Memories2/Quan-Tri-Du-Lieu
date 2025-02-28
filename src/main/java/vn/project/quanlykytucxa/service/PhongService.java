package vn.project.quanlykytucxa.service;

import org.springframework.stereotype.Service;

import vn.project.quanlykytucxa.domain.LoaiPhong;
import vn.project.quanlykytucxa.domain.Phong;
import vn.project.quanlykytucxa.repository.LoaiPhongRepository;
import vn.project.quanlykytucxa.repository.PhongRepository;

@Service
public class PhongService {

    private final PhongRepository phongRepository;
    private final LoaiPhongRepository loaiPhongRepository;

    public PhongService(PhongRepository phongRepository, LoaiPhongRepository loaiPhongRepository) {
        this.phongRepository = phongRepository;
        this.loaiPhongRepository = loaiPhongRepository;
    }

    public void handleSavePhong(Phong phong) {
        phongRepository.save(phong);
    }

    public LoaiPhong getLoaiPhongByMaLoaiPhong(String maLoaiPhong) {
        return this.loaiPhongRepository.findByMaLoaiPhong(maLoaiPhong);
    }

    

}
