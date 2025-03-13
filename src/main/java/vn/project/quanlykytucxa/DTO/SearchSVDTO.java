package vn.project.quanlykytucxa.DTO;

import java.time.LocalDate;
import java.util.Objects;

public class SearchSVDTO {
	public String masv;
	public String tenSV;
	public String maPhong;
	public String soDienThoai;
	public LocalDate ngay;
	public int trangThaiHopDong;

	public SearchSVDTO() {

	}

	public SearchSVDTO(String masv, String tenSV, String maPhong, String soDienThoai, LocalDate ngay,
			int trangThaiHopDong) {
		super();
		this.masv = masv;
		this.tenSV = tenSV;
		this.maPhong = maPhong;
		this.soDienThoai = soDienThoai;
		this.ngay = ngay;
		this.trangThaiHopDong = trangThaiHopDong;
	}

	public String getMasv() {
		return masv;
	}

	public void setMasv(String masv) {
		this.masv = masv;
	}

	public String getTenSV() {
		return tenSV;
	}

	public void setTenSV(String tenSV) {
		this.tenSV = tenSV;
	}

	public String getMaPhong() {
		return maPhong;
	}

	public void setMaPhong(String maPhong) {
		this.maPhong = maPhong;
	}

	public String getSoDienThoai() {
		return soDienThoai;
	}

	public void setSoDienThoai(String soDienThoai) {
		this.soDienThoai = soDienThoai;
	}

	public LocalDate getNgay() {
		return ngay;
	}

	public void setNgay(LocalDate ngay) {
		this.ngay = ngay;
	}

	public int getTrangThaiHopDong() {
		return trangThaiHopDong;
	}

	public void setTrangThaiHopDong(int trangThaiHopDong) {
		this.trangThaiHopDong = trangThaiHopDong;
	}

	@Override
	public int hashCode() {
		return Objects.hash(masv);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		SearchSVDTO other = (SearchSVDTO) obj;
		return Objects.equals(masv, other.masv);
	}

	

	
}
