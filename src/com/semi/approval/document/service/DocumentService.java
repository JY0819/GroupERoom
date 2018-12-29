package com.semi.approval.document.service;

import static com.semi.common.JDBCTemplate.close;
import static com.semi.common.JDBCTemplate.commit;
import static com.semi.common.JDBCTemplate.getConnection;
import static com.semi.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.semi.admin.user.model.vo.Employee;
import com.semi.approval.document.dao.DocumentDao;
import com.semi.approval.document.vo.Document;
import com.semi.approval.document.vo.SumEmpInfo;
import com.semi.common.service.CommonSeqService;
import com.semi.common.vo.Attachments;
public class DocumentService {

	public Document selectForm(int id) {
		Connection con = getConnection();
		Document document = new DocumentDao().selectForm(con, id);
		if(document != null) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		return document;
	}

	public HashMap<Integer, ArrayList<SumEmpInfo>> selectDept() {
		Connection con = getConnection();
		HashMap<Integer, ArrayList<SumEmpInfo>> hmap = new DocumentDao().selectDept(con);
		if(hmap != null) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		return hmap;
	}

	public int insertDocument(ArrayList<Object> list, ArrayList<Attachments> fileList) {
		Connection con = getConnection();
		int result = 0;
		int attachNo = new CommonSeqService(con).getFileSeq();
		int result1 = new DocumentDao().insertAttachments(con, attachNo, fileList);
		int result2 = new DocumentDao().insertDocument(con, attachNo, list);
		
		if(result1 > 0 && result2 > 0) {
			commit(con);
			result = 1;
		}else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}
	
}
