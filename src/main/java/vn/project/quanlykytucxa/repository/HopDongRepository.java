package vn.project.quanlykytucxa.repository;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

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

	// get all contracts by sinh vien id
	@Query(value = "SELECT * FROM hop_dong WHERE maSV = :maSV", nativeQuery = true)
	List<HopDong> findAllBySinhVienId(@Param("maSV") String maSV);

// Kiểm tra xem hợp đồng có tồn tại cho mã sinh viên không
	boolean existsBySinhVienMaSV(String maSV);

	// Lấy ngày kết thúc hợp đồng của sinh viên theo mã sinh viên
	@Query("SELECT h.ngayKetThuc FROM HopDong h WHERE h.sinhVien.maSV = :maSV")
	LocalDate getNgayKetThucByMaSV(@Param("maSV") String maSV);

	@Query("SELECT COUNT(h) FROM HopDong h")
	long countAllHopDong();
//
//	@Query("SELECT h FROM HopDong h WHERE h.masv = :masv AND h.trang_thai = 1")
//	Optional<HopDong> findHopDongBySinhVienId(@Param("masv") String masv);
}
