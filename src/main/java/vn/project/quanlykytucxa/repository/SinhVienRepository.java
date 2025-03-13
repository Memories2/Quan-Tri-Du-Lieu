package vn.project.quanlykytucxa.repository;

import java.time.LocalDate;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import vn.project.quanlykytucxa.domain.SinhVien;

public interface SinhVienRepository extends JpaRepository<SinhVien, String> {

	@Query(value = "CALL GetSinhVienTrongPhong(:maPhong)", nativeQuery = true)
	List<SinhVien> getSinhVienTrongPhong(@Param("maPhong") String maPhong);

	@Query(value = "CALL GetSinhVien()", nativeQuery = true)
	List<SinhVien> getSinhVien();

	@Query(value = "CALL GetSinhVienMasv(:masv)", nativeQuery = true)
	List<SinhVien> getSinhVienMasv(@Param("masv") String masv);

	@Query(value = "CALL GetSinhVienTen(:tenSV)", nativeQuery = true)
	List<SinhVien> getSinhVienTen(@Param("tenSV") String tenSV);
	
	@Query(value = "CALL GetSinhVienMTrangThaiHopDong(:tt)", nativeQuery = true)
	List<SinhVien> getSinhVienMTrangThaiHopDong(@Param("tt") int trangthai);

	@Query(value = "CALL GetSinhVienSDT(:soDienThoai)", nativeQuery = true)
	List<SinhVien> getSinhVienSDT(@Param("soDienThoai") String soDienThoai);

	@Query("SELECT COUNT(s) FROM SinhVien s")
	int countSinhVien();

	

}
