package vn.project.quanlykytucxa.service;

import com.lowagie.text.*;
import com.lowagie.text.pdf.*;
import org.springframework.stereotype.Service;
import vn.project.quanlykytucxa.domain.HopDong;

// Thay đổi dòng này
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.text.NumberFormat;
import java.time.format.DateTimeFormatter;
import java.util.Locale;

@Service
public class PDFGeneratorService {

    private static final DateTimeFormatter DATE_FORMATTER = DateTimeFormatter.ofPattern("dd/MM/yyyy");
    private static final NumberFormat CURRENCY_FORMATTER = NumberFormat.getCurrencyInstance(new Locale("vi", "VN"));

    // Cập nhật signature của phương thức exportPDF
    public void exportPDF(HopDong hopDong, jakarta.servlet.http.HttpServletResponse response) throws IOException {
        Document document = new Document(PageSize.A4);
        PdfWriter.getInstance(document, response.getOutputStream());

        document.open();

        // Tiêu đề
        Font titleFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD);
        titleFont.setSize(18);

        Paragraph title = new Paragraph("HOP DONG KY TUC XA", titleFont);
        title.setAlignment(Paragraph.ALIGN_CENTER);
        title.setSpacingAfter(20);
        document.add(title);

        // Thông tin hợp đồng
        addParagraph(document, "Mã hợp đồng: " + hopDong.getMaHD());
        addParagraph(document, "Mã sinh viên: " + hopDong.getSinhVien().getMaSV());
        addParagraph(document, "Họ tên sinh viên: " + hopDong.getSinhVien().getHoTen());
        addParagraph(document, "Số điện thoại: " + hopDong.getSinhVien().getSoDienThoai());
        addParagraph(document, "Mã phòng: " + hopDong.getPhong().getMaPhong());
        addParagraph(document, "Loại phòng: " + hopDong.getPhong().getLoaiPhong().getTenLoaiPhong());
        addParagraph(document,
                "Giá thuê: " + CURRENCY_FORMATTER.format(hopDong.getPhong().getLoaiPhong().getGiaThue()));
        addParagraph(document, "Ngày bắt đầu: " + hopDong.getNgayBatDau().format(DATE_FORMATTER));
        addParagraph(document, "Ngày kết thúc: " + hopDong.getNgayKetThuc().format(DATE_FORMATTER));

        // Chữ ký
        addEmptyLines(document, 3);

        PdfPTable signatureTable = new PdfPTable(2);
        signatureTable.setWidthPercentage(100);

        PdfPCell cell1 = new PdfPCell(new Phrase("Đại diện KTX"));
        cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell1.setBorder(Rectangle.NO_BORDER);

        PdfPCell cell2 = new PdfPCell(new Phrase("Sinh viên"));
        cell2.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell2.setBorder(Rectangle.NO_BORDER);

        signatureTable.addCell(cell1);
        signatureTable.addCell(cell2);

        document.add(signatureTable);

        document.close();
    }

    private void addParagraph(Document document, String text) throws DocumentException {
        Paragraph paragraph = new Paragraph(text);
        paragraph.setSpacingAfter(10);
        document.add(paragraph);
    }

    private void addEmptyLines(Document document, int number) throws DocumentException {
        for (int i = 0; i < number; i++) {
            document.add(new Paragraph(" "));
        }
    }
}