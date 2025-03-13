package vn.project.quanlykytucxa.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import vn.project.quanlykytucxa.domain.SinhVien;
import vn.project.quanlykytucxa.repository.SinhVienRepository;

import java.util.Collections;

@Service
public class SinhVienUserDetailsService implements UserDetailsService {

    @Autowired
    private SinhVienRepository sinhVienRepository;

    @Override
    public UserDetails loadUserByUsername(String masv) throws UsernameNotFoundException {
        // Use JPA's findById method which comes with JpaRepository
        SinhVien sinhVien = sinhVienRepository.findById(masv)
                .orElseThrow(() -> new UsernameNotFoundException("Không tìm thấy sinh viên với mã: " + masv));

        // Create authority based on role
        String role = "ROLE_" + sinhVien.getRole().toUpperCase();

        return User.builder()
                .username(sinhVien.getMaSV())
                .password(sinhVien.getMatKhau()) // Assume password is already encrypted
                .authorities(Collections.singletonList(new SimpleGrantedAuthority(role)))
                .build();
    }
    public SinhVien getSinhVienTen(String hoTen) {
        return (SinhVien) sinhVienRepository.getSinhVienTen(hoTen);
    }
}