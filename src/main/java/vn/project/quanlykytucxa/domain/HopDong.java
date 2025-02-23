package vn.project.quanlykytucxa.domain;

import java.time.LocalDate;
import java.util.Objects;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;

@Entity
public class HopDong {

	@Id
//	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(length = 8)
	private String maHD;

	@ManyToOne
	@JoinColumn(name = "maSV", nullable = false)
	private SinhVien sinhVien;

	@ManyToOne
	@JoinColumn(name = "maPhong", nullable = false)
	private Phong phong;

	@Column(nullable = false)
	private LocalDate ngayBatDau;

	@Column(nullable = false)
	private LocalDate ngayKetThuc;

	public HopDong() {
		super();
		// TODO Auto-generated constructor stub
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

	public LocalDate getNgayBatDau() {
		return ngayBatDau;
	}

	public void setNgayBatDau(LocalDate ngayBatDau) {
		this.ngayBatDau = ngayBatDau;
	}

	public LocalDate getNgayKetThuc() {
		return ngayKetThuc;
	}

	public void setNgayKetThuc(LocalDate ngayKetThuc) {
		this.ngayKetThuc = ngayKetThuc;
	}


	public String getMaHD() {
		return maHD;
	}

	public HopDong(String maHD, SinhVien sinhVien, Phong phong, LocalDate ngayBatDau, LocalDate ngayKetThuc) {
		super();
		this.maHD = maHD;
		this.sinhVien = sinhVien;
		this.phong = phong;
		this.ngayBatDau = ngayBatDau;
		this.ngayKetThuc = ngayKetThuc;
	}

	public void setMaHD(String maHD) {
		this.maHD = maHD;
	}

	@Override
	public int hashCode() {
		return Objects.hash(maHD);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		HopDong other = (HopDong) obj;
		return Objects.equals(maHD, other.maHD);
	}

}