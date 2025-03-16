package vn.project.quanlykytucxa.domain;

import java.util.Objects;
import java.util.ArrayList;
import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.CascadeType;

@Entity
public class SinhVien {
	@Id
	@Column(length = 8)
	private String maSV;

	@Column(nullable = false, length = 255)
	private String hoTen;

	@Enumerated(EnumType.STRING)
	@Column(nullable = false)
	private GioiTinh gioiTinh;

	@Column(nullable = false, unique = true, length = 15)
	private String soDienThoai;

	@Column(nullable = false, length = 255)
	private String matKhau;

	public enum GioiTinh {
		NAM, NU, KHAC
	}

	@Column
	private String role;

	@OneToMany(mappedBy = "sinhVien", cascade = CascadeType.ALL, orphanRemoval = true)
	private List<PhieuDangKy> phieuDangKyList = new ArrayList<>();

	public SinhVien() {
		super();
		// TODO Auto-generated constructor stub
	}

	public SinhVien(String maSV, String hoTen, GioiTinh gioiTinh, String soDienThoai, String matKhau) {
		super();
		this.maSV = maSV;
		this.hoTen = hoTen;
		this.gioiTinh = gioiTinh;
		this.soDienThoai = soDienThoai;
		this.matKhau = matKhau;
	}

	public String getMaSV() {
		return maSV;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public void setMaSV(String maSV) {
		this.maSV = maSV;
	}

	public String getHoTen() {
		return hoTen;
	}

	public void setHoTen(String hoTen) {
		this.hoTen = hoTen;
	}

	public GioiTinh getGioiTinh() {
		return gioiTinh;
	}

	public void setGioiTinh(GioiTinh gioiTinh) {
		this.gioiTinh = gioiTinh;
	}

	public String getSoDienThoai() {
		return soDienThoai;
	}

	public void setSoDienThoai(String soDienThoai) {
		this.soDienThoai = soDienThoai;
	}

	public String getMatKhau() {
		return matKhau;
	}

	public void setMatKhau(String matKhau) {
		this.matKhau = matKhau;
	}

	@Override
	public int hashCode() {
		return Objects.hash(maSV);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		SinhVien other = (SinhVien) obj;
		return Objects.equals(maSV, other.maSV);
	}

	public String getRole() {
		return role;
	}

	public List<PhieuDangKy> getPhieuDangKyList() {
		return phieuDangKyList;
	}

	public void setPhieuDangKyList(List<PhieuDangKy> phieuDangKyList) {
		this.phieuDangKyList = phieuDangKyList;
	}

	public void addPhieuDangKy(PhieuDangKy phieuDangKy) {
		phieuDangKyList.add(phieuDangKy);
		phieuDangKy.setSinhVien(this);
	}

	public void removePhieuDangKy(PhieuDangKy phieuDangKy) {
		phieuDangKyList.remove(phieuDangKy);
		phieuDangKy.setSinhVien(null);
	}

}
