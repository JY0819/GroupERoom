package com.semi.approval.document.service;

import static com.semi.common.JDBCTemplate.close;
import static com.semi.common.JDBCTemplate.commit;
import static com.semi.common.JDBCTemplate.getConnection;
import static com.semi.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.semi.admin.user.model.vo.Employee;
import com.semi.approval.approve.model.vo.ApprLine;
import com.semi.approval.document.dao.DocumentDao;
import com.semi.approval.document.vo.Document;
import com.semi.approval.document.vo.MyDocument;
import com.semi.approval.document.vo.SumEmpInfo;
import com.semi.common.dao.AddressDao;
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
	
	public ArrayList<String> selectDeptList() {
		Connection con = getConnection();
		ArrayList<String> list = new AddressDao().selectDeptIdList(con);
		
		if(list != null) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		
		return list;
	}

	public int insertDocument(ArrayList<Object> list, ApprLine[] apprLine, ArrayList<Attachments> fileList) {
		Connection con = getConnection();
		int result = 0;
		int attachNo = new CommonSeqService(con).getFileSeq();
		int result1 = new DocumentDao().insertAttachments(con, attachNo, fileList);
		int result2 = new DocumentDao().insertAppr(con, apprLine, list);
		int result3 = new DocumentDao().insertDoc(con, list);
		int result4 = 0;
		Document document = (Document)list.get(0);
		if(document.getManageClass().equals("1")) {
			result4 = new DocumentDao().insertFOVODocument(con, attachNo, list);
		}else if(document.getManageClass().equals("2")) {
			result4 = new DocumentDao().insertFOEODocument(con, attachNo, list);
		}else {
			result4 = new DocumentDao().insertFOWODocument(con, attachNo, list);
		}
		if(result1 > 0 && result2 > 0 && result3 > 0 && result4 > 1) {
			commit(con);
			result = 1;
		}else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}
	
	public int insertDocument(ArrayList<Object> list, ApprLine[] apprLine) {
		Connection con = getConnection();
		int attachNo = 0;
		int result = 0;
		int result1 = new DocumentDao().insertAppr(con, apprLine, list);
		int result2 = new DocumentDao().insertDoc(con, list);
		int result3 = 0;
		Document document = (Document)list.get(0);
		if(document.getManageClass().equals("1")) {
			result3 = new DocumentDao().insertFXVODocument(con, attachNo, list);
		}else if(document.getManageClass().equals("2")) {
			result3 = new DocumentDao().insertFXEODocument(con, attachNo, list);
		}else {
			result3 = new DocumentDao().insertFXWODocument(con, attachNo, list);
		}
		if(result1 > 0 && result2 > 0 && result3 > 0) {
			commit(con);
			result = 1;
		}else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public ArrayList<MyDocument> selectList() {
		Connection con = getConnection();
		ArrayList<MyDocument> list = new DocumentDao().selectList(con);
		
		if(list != null) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return list;
	}

	public int updateDocumentList(String[] docNumList) {
		Connection con = getConnection();
		int result = new DocumentDao().updateDocumentList(con, docNumList);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public ArrayList<MyDocument> selectSubmitList() {
		Connection con = getConnection();
		ArrayList<MyDocument> list = new DocumentDao().selectSubmitList(con);
		
		if(list != null) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		return list;
	}

	public int sendTrashList(String[] docNumList) {
		Connection con = getConnection();
		int result = new DocumentDao().sendTrashList(con, docNumList);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public int sendReturn(String[] docNumList) {
		Connection con = getConnection();
		int result = new DocumentDao().sendReturn(con, docNumList);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public ArrayList<MyDocument> selectReturnDocumentList() {
		Connection con = getConnection();
		ArrayList<MyDocument> list = new DocumentDao().selectReturnDocumentList(con);
		
		if(list != null) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return list;
	}

	public Document selectOne(int num) {
		Connection con = getConnection();
		Document document = new DocumentDao().selectOne(con, num);
		
		if(document != null) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		return document;
	}

	public Attachments selectFile(int num) {
		Connection con =getConnection();
		Attachments attachments = new DocumentDao().selectFile(con, num);
		
		if(attachments != null) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		return attachments;
	}

	public ArrayList<MyDocument> selectStatus(int empId) {
		Connection con = getConnection();
		ArrayList<MyDocument> list = new DocumentDao().selectStatus(con, empId);
		
		if(list != null) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		return list;
	}
	
}
