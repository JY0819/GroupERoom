package com.semi.myPage.controller.Etc;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;

@WebServlet("/createQR")
public class CreateQR extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public CreateQR() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String root = request.getSession().getServletContext().getRealPath("/");
		String page = "http://naver.com"; // java IP 따는 메소드 이용해서 링크 만들것
		int chk = 1;
		String fileName = "";
		
		File path = new File(root + "QRThumbnail/");
		
		fileName = UUID.randomUUID().toString().replace("-", "");
		if(!path.exists()) {
			path.mkdirs();
		}
		
		QRCodeWriter writer = new QRCodeWriter();
		BitMatrix qrCode;
		try {
			qrCode = writer.encode(page, BarcodeFormat.QR_CODE, 200, 200);
			
			BufferedImage qrImage = MatrixToImageWriter.toBufferedImage(qrCode);
			
			ImageIO.write(qrImage, "PNG", new File(path, fileName + ".png"));
			
			request.setAttribute("fileName", fileName);
			System.out.println(fileName);
			page = "views/myPage/attendance/attendQR.jsp";
			
			RequestDispatcher view = request.getRequestDispatcher(page);
			view.forward(request, response);
			
		} catch (WriterException e) {
			e.printStackTrace();
		}
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
