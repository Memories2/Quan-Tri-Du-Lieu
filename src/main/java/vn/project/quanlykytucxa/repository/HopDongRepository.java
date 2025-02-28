package vn.project.quanlykytucxa.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.project.quanlykytucxa.domain.HopDong;

@Repository
public interface HopDongRepository extends JpaRepository<HopDong, String> {
    // Check if there are any contracts using a specific room
    boolean existsByPhongMaPhong(String maPhong);
}
