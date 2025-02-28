package vn.project.quanlykytucxa.repository;

import java.util.List;
import java.util.Optional;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.project.quanlykytucxa.domain.Phong;



@Repository
public interface PhongRepository extends  JpaRepository<Phong, String> {

   Phong save(Phong user);
   
   // Page<User> findAll(Pageable page);
   
   // Optional<User> findById(Long id);
   
   // void deleteById(Long id);

   // boolean existsByEmail(String email);

   // User findByEmail(String email);
}
    