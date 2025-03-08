package vn.project.quanlykytucxa.repository;

import java.math.BigDecimal;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import vn.project.quanlykytucxa.domain.HoaDon;

public interface HoaDonRepository extends JpaRepository<HoaDon, String> {

    @Query(value = "SELECT BaoCaoDoanhThuTheoThang(:thang, :nam, :trangThai)", nativeQuery = true)
    BigDecimal baoCaoDoanhThuTheoThang(@Param("thang") int thang, @Param("nam") int nam, @Param("trangThai") boolean trangThai);
}