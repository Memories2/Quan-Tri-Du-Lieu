package vn.project.quanlykytucxa.domain;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Column;
import java.util.Objects;

@Entity
public class PhieuDangKy {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long maPhieuDK;

    @ManyToOne
    @JoinColumn(name = "maSV")
    private SinhVien sinhVien;

    @ManyToOne
    @JoinColumn(name = "maPhong")
    private Phong phong;

    @Column(nullable = false)
    private int trangThai; // 0: chưa duyệt, 1: đã duyệt, 2: đã hủy

    // Constructors
    public PhieuDangKy() {
        super();
    }

    public PhieuDangKy(SinhVien sinhVien, Phong phong, int trangThai) {
        this.sinhVien = sinhVien;
        this.phong = phong;
        this.trangThai = trangThai;
    }

    // Getters and setters
    public Long getMaPhieuDK() {
        return maPhieuDK;
    }

    public void setMaPhieuDK(Long maPhieuDK) {
        this.maPhieuDK = maPhieuDK;
    }

    public SinhVien getSinhVien() {
        return sinhVien;
    }

    public void setSinhVien(SinhVien sinhVien) {
        this.sinhVien = sinhVien;
    }

    public Phong getPhong() {
        return phong;
    }

    public void setPhong(Phong phong) {
        this.phong = phong;
    }

    public int getTrangThai() {
        return trangThai;
    }

    public void setTrangThai(int trangThai) {
        this.trangThai = trangThai;
    }

    @Override
    public int hashCode() {
        return Objects.hash(maPhieuDK);
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        PhieuDangKy other = (PhieuDangKy) obj;
        return Objects.equals(maPhieuDK, other.maPhieuDK);
    }
}
