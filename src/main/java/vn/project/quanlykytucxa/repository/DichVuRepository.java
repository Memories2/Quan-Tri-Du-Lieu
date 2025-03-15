package vn.project.quanlykytucxa.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import vn.project.quanlykytucxa.DTO.DVDangSuDungDTO;
import vn.project.quanlykytucxa.domain.DichVu;

@Repository
public interface DichVuRepository extends JpaRepository<DichVu, String> {

	DichVu save(DichVu user);

	@Query(value = "CALL LayDanhSachTatCaDichVuMaSinhVienDangSuDung(:id)", nativeQuery = true)
	List<DVDangSuDungDTO> layTaCaDichVuSVDangSuDung(@Param("id") String id);

}
