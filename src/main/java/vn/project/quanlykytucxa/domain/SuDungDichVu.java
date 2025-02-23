package vn.project.quanlykytucxa.domain;

import java.util.Objects;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;

@Entity
public class SuDungDichVu {
	@Id
	//@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(length = 8)
	private String maSDDV;

	@ManyToOne
	@JoinColumn(name = "maHD", nullable = false)
	private HopDong hopDong;

	@ManyToOne
	@JoinColumn(name = "maDV", nullable = false)
	private DichVu dichVu;

	@Column(nullable = false)
	private Integer soLuongSuDung;

	@Column(nullable = false)
	private Integer thangSuDung;

	@Column(nullable = false)
	private Integer namSuDung;

	public SuDungDichVu() {
		super();
		// TODO Auto-generated constructor stub
	}

	public SuDungDichVu(HopDong hopDong, DichVu dichVu, Integer soLuongSuDung, Integer thangSuDung, Integer namSuDung) {
		super();
		this.hopDong = hopDong;
		this.dichVu = dichVu;
		this.soLuongSuDung = soLuongSuDung;
		this.thangSuDung = thangSuDung;
		this.namSuDung = namSuDung;
	}

	public HopDong getHopDong() {
		return hopDong;
	}

	public void setHopDong(HopDong hopDong) {
		this.hopDong = hopDong;
	}

	public DichVu getDichVu() {
		return dichVu;
	}

	public void setDichVu(DichVu dichVu) {
		this.dichVu = dichVu;
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

	public Integer getNamSuDung() {
		return namSuDung;
	}

	public void setNamSuDung(Integer namSuDung) {
		this.namSuDung = namSuDung;
	}


	public SuDungDichVu(String maSDDV, HopDong hopDong, DichVu dichVu, Integer soLuongSuDung, Integer thangSuDung,
			Integer namSuDung) {
		super();
		this.maSDDV = maSDDV;
		this.hopDong = hopDong;
		this.dichVu = dichVu;
		this.soLuongSuDung = soLuongSuDung;
		this.thangSuDung = thangSuDung;
		this.namSuDung = namSuDung;
	}

	public String getMaSDDV() {
		return maSDDV;
	}

	public void setMaSDDV(String maSDDV) {
		this.maSDDV = maSDDV;
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
		SuDungDichVu other = (SuDungDichVu) obj;
		return Objects.equals(maSDDV, other.maSDDV);
	}

}