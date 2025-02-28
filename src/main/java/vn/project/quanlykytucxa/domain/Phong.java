package vn.project.quanlykytucxa.domain;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;

@Entity
public class Phong {
	@Id
//	@GeneratedValue(strategy = GenerationType.IDENTITY)
//	private Integer maPhong;
	@Column(length = 8)
	private String maPhong;

	@ManyToOne
	@JoinColumn(name = "maLoaiPhong")
	private LoaiPhong loaiPhong;

	@Column(nullable = false, unique = true, length = 50)
	private String soPhong;

	@Column(nullable = false)
	private Integer soLuongToiDa;

	@Enumerated(EnumType.STRING)
	@Column(nullable = false)
	private TinhTrangPhong tinhTrang = TinhTrangPhong.TRONG;

	public enum TinhTrangPhong {
		TRONG,  // Empty
		DAY,    // Full
		SUACHUA // 
	}

	public Phong() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Phong(LoaiPhong loaiPhong, String soPhong, Integer soLuongToiDa, TinhTrangPhong tinhTrang) {
		super();
		this.loaiPhong = loaiPhong;
		this.soPhong = soPhong;
		this.soLuongToiDa = soLuongToiDa;
		this.tinhTrang = tinhTrang;
	}

	public LoaiPhong getLoaiPhong() {
		return loaiPhong;
	}

	public void setLoaiPhong(LoaiPhong loaiPhong) {
		this.loaiPhong = loaiPhong;
	}

	public String getSoPhong() {
		return soPhong;
	}

	public void setSoPhong(String soPhong) {
		this.soPhong = soPhong;
	}

	public Integer getSoLuongToiDa() {
		return soLuongToiDa;
	}

	public void setSoLuongToiDa(Integer soLuongToiDa) {
		this.soLuongToiDa = soLuongToiDa;
	}

	public TinhTrangPhong getTinhTrang() {
		return tinhTrang;
	}

	public void setTinhTrang(TinhTrangPhong tinhTrang) {
		this.tinhTrang = tinhTrang;
	}

	public String getMaPhong() {
		return maPhong;
	}

	public void setMaPhong(String maPhong) {
		this.maPhong = maPhong;
	}

	public Phong(String maPhong, LoaiPhong loaiPhong, String soPhong, Integer soLuongToiDa, TinhTrangPhong tinhTrang) {
		super();
		this.maPhong = maPhong;
		this.loaiPhong = loaiPhong;
		this.soPhong = soPhong;
		this.soLuongToiDa = soLuongToiDa;
		this.tinhTrang = tinhTrang;
	}

}