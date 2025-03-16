package vn.project.quanlykytucxa.repository;

import java.math.BigDecimal;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import vn.project.quanlykytucxa.domain.HoaDon;

public interface HoaDonRepository extends JpaRepository<HoaDon, String> {

    // Truy vấn tính tổng tiền cho một tháng và năm, với trạng thái thanh toán
    @Query("SELECT SUM(h.tongTien) FROM HoaDon h WHERE MONTH(h.ngayLap) = :thang AND YEAR(h.ngayLap) = :nam AND h.daThanhToan = :trangThai")
    BigDecimal baoCaoDoanhThuTheoThang(@Param("thang") int thang, @Param("nam") int nam, @Param("trangThai") boolean trangThai);

    // Truy vấn lấy tất cả hóa đơn theo trạng thái thanh toán (đã thanh toán hoặc chưa)
    @Query("SELECT h FROM HoaDon h WHERE h.daThanhToan = :trangThai")
    List<HoaDon> findAllByTrangThaiThanhToan(@Param("trangThai") boolean trangThai);

	@Query("SELECT COUNT(h) FROM HoaDon h WHERE h.daThanhToan = false")
	long countHoaDonChuaThanhToan();
}
