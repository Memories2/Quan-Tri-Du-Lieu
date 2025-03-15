package vn.project.quanlykytucxa.repository;

import java.time.LocalDate;
import java.util.List;

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

	// get all contracts by phong id
	@Query(value = "SELECT * FROM hop_dong WHERE ma_phong = :maPhong", nativeQuery = true)
	List<HopDong> findAllByPhongId(@Param("maPhong") String maPhong);

// Kiểm tra xem hợp đồng có tồn tại cho mã sinh viên không
	boolean existsBySinhVienMaSV(String maSV);

	// Lấy ngày kết thúc hợp đồng của sinh viên theo mã sinh viên
	@Query("SELECT h.ngayKetThuc FROM HopDong h WHERE h.sinhVien.maSV = :maSV")
	LocalDate getNgayKetThucByMaSV(@Param("maSV") String maSV);

}
