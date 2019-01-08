package com.semi.board.notice.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.board.Free.model.service.FreeService;
import com.semi.board.notice.model.service.NoticeService;
import com.semi.board.notice.model.vo.Attachment;

/**
 * Servlet implementation class DownloadFileNoticeServlet
 */
@WebServlet("/download.no")
public class DownloadFileNoticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DownloadFileNoticeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num = Integer.parseInt(request.getParameter("num"));
		
		Attachment file = new NoticeService().selectOneAttachment(num);
		
		//�������� ������ ���� ��Ʈ�� ����
		BufferedInputStream buf = null;
		
		//Ŭ���̾�Ʈ ������ ��� ��Ʈ��
		ServletOutputStream downOut = null;
		
		downOut = response.getOutputStream();
		
		//��Ʈ������ ������ ���� ��ü ����
		File downFile = new File(file.getFilePath()+ file.getChangeName());
		//=>������ Ǯ���
		
		response.setContentType("text/plain; charset=UTF-8");
		//text/plain:�⺻��
		
		//�ѱ� ���ϸ� ���� ���ڵ� ó��
		//���������� �ٿ�ε� ó��
		response.setHeader("Content-Disposition", "attachment; filename=\""+ new String(file.getOriginName().getBytes("UTF-8"), "ISO-8859-1")+"\"");
		//=>""�ȿ��� �� ���ڿ��� ���� ���� �� \""+����+"\"" ���� ��
		
		response.setContentLength((int)downFile.length());
		
		FileInputStream fin = new FileInputStream(downFile);
		
		buf = new BufferedInputStream(fin);
		
		int readBytes = 0;
		
		while((readBytes = buf.read()) != -1) {//1byte�� �����鼭 �ٿ�??
			downOut.write(readBytes);
		}
	
		downOut.close();
		buf.close();
	
	
	
	
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
