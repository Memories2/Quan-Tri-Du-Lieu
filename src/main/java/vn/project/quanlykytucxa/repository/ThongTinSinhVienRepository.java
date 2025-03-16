package vn.project.quanlykytucxa.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.project.quanlykytucxa.domain.SinhVien;

@Repository
public interface ThongTinSinhVienRepository extends JpaRepository<SinhVien, String> {
    // Tìm sinh viên theo mã sinh viên (maSV)
    SinhVien findByMaSV(String maSV);
}
