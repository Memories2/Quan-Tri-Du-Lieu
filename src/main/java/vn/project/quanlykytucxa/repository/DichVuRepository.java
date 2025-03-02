package vn.project.quanlykytucxa.repository;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.project.quanlykytucxa.domain.DichVu;
import vn.project.quanlykytucxa.domain.Phong;

@Repository
public interface DichVuRepository extends JpaRepository<DichVu, String> {

   DichVu save(DichVu user);

   // long count();
}
