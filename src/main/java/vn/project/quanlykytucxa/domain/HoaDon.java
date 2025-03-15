package vn.project.quanlykytucxa.domain;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.Objects;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;

@Entity

public class HoaDon {
	@Id
	private String maHoaDon;

	@ManyToOne
	@JoinColumn(name = "maSDDV", nullable = false)
	private SuDungDichVu suDungDichVu;

	@Column(nullable = false)
	private LocalDate ngayLap;

	@Column(nullable = false)
	private LocalDate ngayHetHan;

	public HoaDon(String maHoaDon, SuDungDichVu suDungDichVu, LocalDate ngayLap, LocalDate ngayHetHan,
			BigDecimal tongTien) {
		super();
		this.maHoaDon = maHoaDon;
		this.suDungDichVu = suDungDichVu;
		this.ngayLap = ngayLap;
		this.ngayHetHan = ngayHetHan;
		this.tongTien = tongTien;
	}

	@Column(nullable = false, precision = 10, scale = 2)
	private BigDecimal tongTien;

	public HoaDon() {
		super();
		// TODO Auto-generated constructor stub
	}

	public HoaDon(SuDungDichVu suDungDichVu, LocalDate ngayLap, LocalDate ngayHetHan, BigDecimal tongTien) {
		super();
		this.suDungDichVu = suDungDichVu;
		this.ngayLap = ngayLap;
		this.ngayHetHan = ngayHetHan;
		this.tongTien = tongTien;
	}

	public SuDungDichVu getSuDungDichVu() {
		return suDungDichVu;
	}

	public void setSuDungDichVu(SuDungDichVu suDungDichVu) {
		this.suDungDichVu = suDungDichVu;
	}

	public LocalDate getNgayLap() {
		return ngayLap;
	}

	public void setNgayLap(LocalDate ngayLap) {
		this.ngayLap = ngayLap;
	}

	public LocalDate getNgayHetHan() {
		return ngayHetHan;
	}

	public void setNgayHetHan(LocalDate ngayHetHan) {
		this.ngayHetHan = ngayHetHan;
	}

	public BigDecimal getTongTien() {
		return tongTien;
	}

	public void setTongTien(BigDecimal tongTien) {
		this.tongTien = tongTien;
	}

	public String getMaHoaDon() {
		return maHoaDon;
	}

	@Override
	public int hashCode() {
		return Objects.hash(maHoaDon);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		HoaDon other = (HoaDon) obj;
		return Objects.equals(maHoaDon, other.maHoaDon);
	}

	@Column(nullable = false)
	private boolean daThanhToan;

	// ...existing code...

	public boolean isDaThanhToan() {
		return daThanhToan;
	}

	public void setDaThanhToan(boolean daThanhToan) {
		this.daThanhToan = daThanhToan;
	}
}
