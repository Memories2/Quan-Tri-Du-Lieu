package vn.project.quanlykytucxa.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.project.quanlykytucxa.domain.LoaiPhong;

@Repository
public interface LoaiPhongRepository extends JpaRepository<LoaiPhong, String> {
	LoaiPhong findByMaLoaiPhong(String maLoaiPhong);
}
