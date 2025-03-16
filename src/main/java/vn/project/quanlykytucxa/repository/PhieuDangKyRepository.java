package vn.project.quanlykytucxa.repository;

import org.springframework.data.jpa.repository.JpaRepository;   
import vn.project.quanlykytucxa.domain.PhieuDangKy;

public interface PhieuDangKyRepository extends JpaRepository<PhieuDangKy, Long> {
    public PhieuDangKy findByMaPhieuDK(Long maPhieuDK);
}
