package vn.project.quanlykytucxa.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import vn.project.quanlykytucxa.domain.HopDong;

@Repository
public interface HopDongRepository extends JpaRepository<HopDong, String> {
    // Check if there are any contracts using a specific room
    boolean existsByPhongMaPhong(String maPhong);

    
    @Query(value = "SELECT kiemTraHopDongHetHan(:maSV)", nativeQuery = true)
    int kiemTraHopDongHetHan(@Param("maSV") String maSV);
}
