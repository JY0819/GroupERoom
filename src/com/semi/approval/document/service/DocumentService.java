package com.semi.approval.document.service;

import static com.semi.common.JDBCTemplate.close;
import static com.semi.common.JDBCTemplate.commit;
import static com.semi.common.JDBCTemplate.getConnection;
import static com.semi.common.JDBCTemplate.rollback;

import java.sql.Connection;

import com.semi.approval.document.dao.DocumentDao;
import com.semi.approval.document.vo.Document;
public class DocumentService {

	public Document selectForm() {
		Connection con = getConnection();
		Document document = new DocumentDao().selectForm(con);
		if(document != null) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		return document;
	}
	
}
