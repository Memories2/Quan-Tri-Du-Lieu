package vn.project.quanlykytucxa.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.query.Procedure;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import vn.project.quanlykytucxa.domain.Phong;

@Repository
public interface PhongRepository extends JpaRepository<Phong, String> {

	Phong save(Phong user);

	long count();

	// Page<User> findAll(Pageable page);

	// Optional<User> findById(Long id);

	// void deleteById(Long id);

	// boolean existsByEmail(String email);

	// User findByEmail(String email);

	@Query(value = "CALL DanhSachPhongTrong()", nativeQuery = true)
	List<Phong> danhSachPhongTrong();

	@Procedure(name = "ChuyenPhongChoSinhVien")
	void chuyenPhongChoSinhVien(@Param("p_masv") String idSinhVien, @Param("p_ma_phong_moi") String maPhong);

	// đếm số lượng hợp đồng trong từng phòng
	@Query(value = "SELECT DemSoLuongHopDong(:maPhong)", nativeQuery = true)
	int demSoLuongHopDong(@Param("maPhong") String maPhong);

//Đếm số lượng hợp đồng trong từng phòng
	@Query(value = "SELECT DemSoLuongHopDong(?1)", nativeQuery = true)
	int getSoLuongHopDong(String maPhong);
}
