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
	
}
