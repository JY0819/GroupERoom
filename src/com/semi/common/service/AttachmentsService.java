package com.semi.common.service;

import static com.semi.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.semi.admin.user.model.vo.Employee;
import com.semi.common.dao.AddressDao;
import com.semi.common.dao.AttachmentsDao;
import com.semi.common.vo.Attachments;
import com.semi.common.vo.DeptEmp;
import com.semi.schedule.model.dao.ScheduleDao;

public class AttachmentsService {

	public String getAttachmentPath(int userPhotoId) {
		Connection con = getConnection();
		
		String path = new AttachmentsDao().getAttachmentPath(con, userPhotoId);
		
		close(con);
		
		return path;
	}
}
