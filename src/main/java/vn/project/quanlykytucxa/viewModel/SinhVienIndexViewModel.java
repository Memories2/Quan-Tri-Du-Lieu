package vn.project.quanlykytucxa.viewModel;

import java.util.Objects;

import vn.project.quanlykytucxa.domain.SinhVien.GioiTinh;

public class SinhVienIndexViewModel {

	public String maSV;
	public String hoTen;
	public GioiTinh gioiTinh;
	public String soDienThoai;
	public SinhVienIndexViewModel(String maSV, String hoTen, GioiTinh gioiTinh, String soDienThoai) {
	
		this.maSV = maSV;
		this.hoTen = hoTen;
		this.gioiTinh = gioiTinh;
		this.soDienThoai = soDienThoai;
	}
	public String getMaSV() {
		return maSV;
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
		SinhVienIndexViewModel other = (SinhVienIndexViewModel) obj;
		return Objects.equals(maSV, other.maSV);
	}
	
	

}
