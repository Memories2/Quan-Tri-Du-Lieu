package vn.project.quanlykytucxa.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.project.quanlykytucxa.domain.DichVu;
import vn.project.quanlykytucxa.domain.SuDungDichVu;

@Repository
public interface SuDungDichVuRepository extends JpaRepository<SuDungDichVu, String> {

	List<SuDungDichVu> findByDichVu(DichVu dichVu);

}
