package vn.project.quanlykytucxa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import vn.project.quanlykytucxa.domain.PhieuDangKy;
import vn.project.quanlykytucxa.repository.PhieuDangKyRepository;

@Service
public class PhieuDangKyService {
    @Autowired
    private PhieuDangKyRepository phieuDangKyRepository;

    public List<PhieuDangKy> getAllPhieuDangKy() {
        return phieuDangKyRepository.findAll();
    }

    public PhieuDangKy getPhieuDangKyById(Long id) {
        return phieuDangKyRepository.findById(id).orElse(null);
    }

    public PhieuDangKy savePhieuDangKy(PhieuDangKy phieuDangKy) {
        return phieuDangKyRepository.save(phieuDangKy);
    }

    public void deletePhieuDangKy(Long id) {
        phieuDangKyRepository.deleteById(id);
    }

    public PhieuDangKy findPhieuDangKyById(Long maPhieuDK) {
        return phieuDangKyRepository.findByMaPhieuDK(maPhieuDK);
    }
}
