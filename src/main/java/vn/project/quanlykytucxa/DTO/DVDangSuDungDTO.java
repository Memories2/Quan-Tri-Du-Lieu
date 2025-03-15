package vn.project.quanlykytucxa.DTO;

import java.math.BigDecimal;
import java.util.Objects;

public class DVDangSuDungDTO {
	private String maDV;
	private BigDecimal donGia;
	private String tenDichVu;
	private Integer namSuDung;
	private Integer soLuongSuDung;
	private Integer thangSuDung;
	private String maSDDV;

	public DVDangSuDungDTO() {

	}

	@Override
	public int hashCode() {
		return Objects.hash(maSDDV);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		DVDangSuDungDTO other = (DVDangSuDungDTO) obj;
		return Objects.equals(maSDDV, other.maSDDV);
	}

	public String getMaSDDV() {
		return maSDDV;
	}

	public void setMaSDDV(String maSDDV) {
		this.maSDDV = maSDDV;
	}

	public DVDangSuDungDTO(String maDV, BigDecimal donGia, String tenDichVu, Integer namSuDung, Integer soLuongSuDung,
			Integer thangSuDung, String maSDDV) {
		super();
		this.maDV = maDV;
		this.donGia = donGia;
		this.tenDichVu = tenDichVu;
		this.namSuDung = namSuDung;
		this.soLuongSuDung = soLuongSuDung;
		this.thangSuDung = thangSuDung;
		this.maSDDV = maSDDV;
	}

	public String getMaDV() {
		return maDV;
	}

	public void setMaDV(String maDV) {
		this.maDV = maDV;
	}

	public BigDecimal getDonGia() {
		return donGia;
	}

	public void setDonGia(BigDecimal donGia) {
		this.donGia = donGia;
	}

	public String getTenDichVu() {
		return tenDichVu;
	}

	public void setTenDichVu(String tenDichVu) {
		this.tenDichVu = tenDichVu;
	}

	public Integer getNamSuDung() {
		return namSuDung;
	}

	public void setNamSuDung(Integer namSuDung) {
		this.namSuDung = namSuDung;
	}

	public Integer getSoLuongSuDung() {
		return soLuongSuDung;
	}

	public void setSoLuongSuDung(Integer soLuongSuDung) {
		this.soLuongSuDung = soLuongSuDung;
	}

	public Integer getThangSuDung() {
		return thangSuDung;
	}

	public void setThangSuDung(Integer thangSuDung) {
		this.thangSuDung = thangSuDung;
	}

	@Override
	public String toString() {
		return "DVDangSuDungDTO [maDV=" + maDV + ", donGia=" + donGia + ", tenDichVu=" + tenDichVu + ", namSuDung="
				+ namSuDung + ", soLuongSuDung=" + soLuongSuDung + ", thangSuDung=" + thangSuDung + ", maSDDV=" + maSDDV
				+ "]";
	}

}
