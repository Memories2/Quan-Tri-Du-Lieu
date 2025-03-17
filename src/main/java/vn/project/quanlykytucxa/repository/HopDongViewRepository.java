package vn.project.quanlykytucxa.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.project.quanlykytucxa.domain.HopDong;

import java.util.List;

@Repository
public interface HopDongViewRepository extends JpaRepository<HopDong, String> {
    // Tìm các hợp đồng theo mã sinh viên
    List<HopDong> findBySinhVien_MaSV(String maSV);
}