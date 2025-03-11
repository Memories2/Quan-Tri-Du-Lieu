package vn.project.quanlykytucxa.repository;

import java.math.BigDecimal;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import vn.project.quanlykytucxa.domain.HoaDon;

public interface HoaDonRepository extends JpaRepository<HoaDon, String> {

    // Truy vấn tính tổng tiền cho một tháng và năm
    @Query("SELECT SUM(h.tongTien) FROM HoaDon h WHERE MONTH(h.ngayLap) = :thang AND YEAR(h.ngayLap) = :nam AND h.daThanhToan = :trangThai")
    BigDecimal baoCaoDoanhThuTheoThang(@Param("thang") int thang, @Param("nam") int nam, @Param("trangThai") boolean trangThai);
}
