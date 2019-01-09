package com.semi.wrapper;

import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import com.oreilly.servlet.MultipartRequest;
import com.semi.common.MyFileRenamePolicy;

public class LoginWrapper2 extends HttpServletRequestWrapper {

	public LoginWrapper2(HttpServletRequest request) {
		super(request);
	}

	@Override
	public String getParameter(String key) {
		
		String value = "";
		// getParameter로 key(userPwd)값이 넘어왔을 시 암호화 처리 getSha512로 userPwd 넘어감
		if (key != null && key.equals("userPwd")) {
			value = getSha512(super.getParameter("userPwd"));
		} else {
			// getParameter로 key(userPwd)값이 아닌게 넘어왔을 시 리턴값으로 출력
			value = super.getParameter(key);
		}

		return value;
	}

	private static String getSha512(String pwd) {
		String encPwd = "";

		try {
			// SHA-512 내장 메소드 사용 어떤식으로 암호화 처리 되는지는 알 수 없음
			MessageDigest md = MessageDigest.getInstance("SHA-512");
			byte[] bytes = pwd.getBytes(Charset.forName("UTF-8"));
			md.update(bytes); // 암호화 처리된 게 bytes 안에 있음(아직)
			
			// 암호화 처리 된게 문자열로 바뀐다.
			encPwd = Base64.getEncoder().encodeToString(md.digest());
			
			
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		
		return encPwd;
	}

}
