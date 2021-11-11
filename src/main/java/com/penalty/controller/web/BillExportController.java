package com.penalty.controller.web;

import com.itextpdf.text.*;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.text.pdf.draw.LineSeparator;
import com.penalty.model.BillDetailModel;
import com.penalty.model.BillModel;
import com.penalty.service.IBillDetailService;
import com.penalty.service.IBillService;

import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

@WebServlet(urlPatterns = {"/billExport"})
public class BillExportController extends HttpServlet {
    @Inject
    private IBillService iBillService;
    @Inject
    private IBillDetailService iBillDetailService;

    private PdfPCell getCell(Paragraph text) {
        PdfPCell cell = new PdfPCell(new Phrase(text));
        cell.setPaddingTop(10);
        cell.setHorizontalAlignment(PdfPCell.ALIGN_LEFT);
        cell.setBorder(PdfPCell.NO_BORDER);
        return cell;
    }

    private PdfPCell getCell(Paragraph text, int alignment) {
        PdfPCell cell = new PdfPCell(new Phrase(text));
        cell.setPadding(7);
        cell.setHorizontalAlignment(alignment);
        return cell;
    }

    private PdfPCell getCell(Paragraph text, int alignment, int border) {
        PdfPCell cell = new PdfPCell(new Phrase(text));
        cell.setPadding(7);
        cell.setHorizontalAlignment(alignment);
        cell.setBorder(border);
        return cell;
    }

    // Create Bill
    private void createBill(String fullPath, String bill_id) throws IOException, DocumentException {
        Document document = new Document(PageSize.A4);
        document.addAuthor("Pham Quoc Cuong - quoc.cuong.yb.dhtb@gmail.com");
        document.addSubject("Exporting bill for Lan Huong Cosmetic's customer.");
        document.addTitle("Customer Bill");
        ServletContext fontContext = getServletContext();
        BaseFont baseFont = BaseFont.createFont(fontContext.getRealPath("/template/web/fonts/OpenSans-Regular.ttf"), BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
        Font boldFont = new Font(baseFont, 16, Font.BOLD);
        Font catFont = new Font(baseFont, 11);
        try {
            PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream(fullPath));
            document.open();
            Paragraph content = new Paragraph();
            BillModel billModel = iBillService.findOne(Integer.parseInt(bill_id));
            // Header
            PdfPTable tblHeader = new PdfPTable(3);
            tblHeader.setWidths(new float[]{3, 6, 2});
            tblHeader.addCell(getCell(new Paragraph("   ", catFont)));
            tblHeader.addCell(getCell(new Paragraph("HÓA ĐƠN THANH TOÁN", boldFont)));
            tblHeader.addCell(getCell(new Paragraph("Mã số:     " + billModel.getBill_id(), catFont)));
            content.add(tblHeader);

            content.add(Chunk.NEWLINE);

            // Body
            PdfPTable tblBody = new PdfPTable(2);
            tblBody.setTotalWidth(new float[]{60, 100});
            tblBody.addCell(getCell(new Paragraph("Đơn vị bán hàng:", catFont)));
            tblBody.addCell(getCell(new Paragraph("Mỹ Phẩm Lan Hương", new Font(baseFont, 13, Font.BOLD))));
            tblBody.addCell(getCell(new Paragraph("Mã số thuế:", catFont)));
            tblBody.addCell(getCell(new Paragraph("03247648132", catFont)));
            tblBody.addCell(getCell(new Paragraph("Địa chỉ:", catFont)));
            tblBody.addCell(getCell(new Paragraph("Số 234, Cầu Diễn, Quận Bắc Từ Liêm, Hà Nội", catFont)));
            tblBody.addCell(getCell(new Paragraph("Số điện thoại:", catFont)));
            tblBody.addCell(getCell(new Paragraph("0967832424", catFont)));
            tblBody.addCell(getCell(new Paragraph("Tài khoản số:", catFont)));
            tblBody.addCell(getCell(new Paragraph("1 1 7 5 9 4 8 7 3 3 4 5", catFont)));
            tblBody.addCell(getCell(new Paragraph("Tại:", catFont)));
            tblBody.addCell(getCell(new Paragraph("Ngân hàng Vietcombank, Chi nhánh Bắc Từ Liêm", catFont)));
            content.add(tblBody);

            content.add(new Chunk(new LineSeparator()));

            // Customer's Information
            PdfPTable tblBuyer = new PdfPTable(2);
            tblBuyer.setTotalWidth(new float[]{60, 100});
            tblBuyer.addCell(getCell(new Paragraph("Họ tên người mua hàng:", catFont)));
            tblBuyer.addCell(getCell(new Paragraph(billModel.getFull_name(), new Font(baseFont, 13, Font.BOLD))));
            tblBuyer.addCell(getCell(new Paragraph("Địa chỉ nhận hàng:", catFont)));
            tblBuyer.addCell(getCell(new Paragraph(billModel.getAddress(), catFont)));
            tblBuyer.addCell(getCell(new Paragraph("Số điện thoại:", catFont)));
            tblBuyer.addCell(getCell(new Paragraph(billModel.getPhone(), catFont)));
            tblBuyer.addCell(getCell(new Paragraph("Email:", catFont)));
            tblBuyer.addCell(getCell(new Paragraph(billModel.getEmail(), catFont)));
            tblBuyer.addCell(getCell(new Paragraph("Hình thức thanh toán:", catFont)));
            tblBuyer.addCell(getCell(new Paragraph("Thanh toán khi nhận hàng", catFont)));
            content.add(tblBuyer);

            content.add(new Chunk(new LineSeparator()));

            // Bill Detail
            BillDetailModel billDetailModel = new BillDetailModel();
            billDetailModel.setListResult(iBillDetailService.findBillDetailByBillId(Integer.parseInt(bill_id)));

            PdfPTable tblBilDetail = new PdfPTable(4);

            tblBilDetail.setTotalWidth(new float[]{75, 30, 30, 45});
            tblBilDetail.addCell(getCell(new Paragraph("Tên sản phẩm", new Font(baseFont, 12, Font.BOLD)), PdfPCell.ALIGN_CENTER));
            tblBilDetail.addCell(getCell(new Paragraph("Số lượng", new Font(baseFont, 12, Font.BOLD)), PdfPCell.ALIGN_CENTER));
            tblBilDetail.addCell(getCell(new Paragraph("Đơn giá", new Font(baseFont, 12, Font.BOLD)), PdfPCell.ALIGN_CENTER));
            tblBilDetail.addCell(getCell(new Paragraph("Thành tiền", new Font(baseFont, 12, Font.BOLD)), PdfPCell.ALIGN_CENTER));
            double total = 0;
            for (BillDetailModel bdm : billDetailModel.getListResult()) {
                double subtotal = bdm.getQuantity() * bdm.getProduct_price();
                tblBilDetail.addCell(getCell(new Paragraph(bdm.getProduct_name(), catFont), PdfPCell.ALIGN_JUSTIFIED));
                tblBilDetail.addCell(getCell(new Paragraph(String.valueOf(bdm.getQuantity())), PdfPCell.ALIGN_CENTER));
                tblBilDetail.addCell(getCell(new Paragraph((long) bdm.getProduct_price() + "đ", catFont), PdfPCell.ALIGN_CENTER));
                tblBilDetail.addCell(getCell(new Paragraph((long) subtotal + "đ", catFont), PdfPCell.ALIGN_CENTER));
                total += subtotal;
            }
            content.add(tblBilDetail);

            PdfPTable amount = new PdfPTable(2);
            amount.setTotalWidth(new float[]{135, 45});
            amount.addCell(getCell(new Paragraph("Tổng cộng thanh toán:", new Font(baseFont, 12, Font.BOLD)), PdfPCell.ALIGN_RIGHT));
            amount.addCell(getCell(new Paragraph((long) total + "đ", catFont), PdfPCell.ALIGN_CENTER));
            content.add(amount);

            content.add(new Chunk(new LineSeparator()));

            // Footer
            PdfPTable signature = new PdfPTable(3);
            signature.setTotalWidth(new float[]{55, 35, 70});
            signature.addCell(getCell(new Paragraph("Người mua hàng", new Font(baseFont, 12, Font.BOLD)), PdfPCell.ALIGN_CENTER, PdfPCell.NO_BORDER));
            signature.addCell(getCell(new Paragraph("   ", new Font(baseFont, 12, Font.BOLD)), PdfPCell.ALIGN_CENTER, PdfPCell.NO_BORDER));
            signature.addCell(getCell(new Paragraph("Người bán hàng", new Font(baseFont, 12, Font.BOLD)), PdfPCell.ALIGN_CENTER, PdfPCell.NO_BORDER));
            signature.addCell(getCell(new Paragraph("(Ký, ghi rõ họ tên)", new Font(baseFont, 12, Font.ITALIC)), PdfPCell.ALIGN_CENTER, PdfPCell.NO_BORDER));
            signature.addCell(getCell(new Paragraph("   ", new Font(baseFont, 12, Font.ITALIC)), PdfPCell.ALIGN_CENTER, PdfPCell.NO_BORDER));
            signature.addCell(getCell(new Paragraph("(Ký, ghi rõ họ tên, đóng dấu)", new Font(baseFont, 12, Font.ITALIC)), PdfPCell.ALIGN_CENTER, PdfPCell.NO_BORDER));
            signature.addCell(getCell(new Paragraph("   "), PdfPCell.ALIGN_CENTER, PdfPCell.NO_BORDER));
            signature.addCell(getCell(new Paragraph("   "), PdfPCell.ALIGN_CENTER, PdfPCell.NO_BORDER));

            ServletContext image = getServletContext();
            Image img = Image.getInstance(image.getRealPath("/template/web/img/stamp.jpg"));
            PdfPCell cellImg = new PdfPCell(img);
            cellImg.setBorder(PdfPCell.NO_BORDER);
            signature.addCell(cellImg);
            content.add(signature);

            document.add(content);
            document.close();
            writer.close();
        } catch (DocumentException | FileNotFoundException e) {
            e.printStackTrace();
        }
    }

    // Download Bill
    private void downloadBill(String fullPath, HttpServletResponse resp, String bill_id) throws IOException {
        Path path = Paths.get(fullPath);
        byte[] data = Files.readAllBytes(path);

        // Thiết lập thông tin trả về
        resp.setContentType("application/octet-stream");
        resp.setHeader("Content-disposition", "attachment; filename=BillNo_" + bill_id + " - Lan Huong Cosmetics .pdf");
        resp.setContentLength(data.length);
        InputStream inputStream = new BufferedInputStream(new ByteArrayInputStream(data));

        // Ghi file ra response outputstream.
        OutputStream outputStream = resp.getOutputStream();
        byte[] buffer = new byte[4096];
        int bytesRead = -1;
        while ((bytesRead = inputStream.read(buffer)) != -1) {
            outputStream.write(buffer, 0, bytesRead);
        }
        inputStream.close();
        outputStream.close();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        ServletContext context = getServletContext();
        String bill_id = req.getParameter("bill_id");
        String fullPath = context.getRealPath("/BillNo_" + bill_id + ".pdf");

        try {
            createBill(fullPath, bill_id);
            downloadBill(fullPath, resp, bill_id);
        } catch (DocumentException e) {
            e.printStackTrace();
        }
    }
}
