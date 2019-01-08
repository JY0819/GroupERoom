package com.semi.common.websocket;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import com.semi.common.service.AlarmService;
import com.semi.common.vo.Alarm;

@ServerEndpoint("/alarmStart")
public class ServerStart {
	private static Set<Session> clients = Collections.synchronizedSet(new HashSet<Session>());

	@OnOpen
	public void onOpen(Session session) {
		//서버 연결한 시점에 동작하는 메소드
		
		//기존 사용자 리스트에 새로 연결 요청이 들어온 사용자를 추가한다
		clients.add(session);
	}

	@OnMessage
	public void onMessage(String msg, Session session) throws IOException {
		//서버로부터 데이터를 전송받을 경우 동작할 메소드
		System.out.println("알람 생성");
		String resultMsg = "";
		ArrayList<Alarm> alarm = null;
		ArrayList<Integer> apprLine = null;
		String[] temp = msg.split(",");
		int alarmCount = 0;
		
		System.out.println(msg + " - 전달받은 메세지");
		
		if (temp[1].equals("msg")) {
			alarmCount = new AlarmService().chkAlarmMsg(Integer.parseInt(temp[0]));
			
			if (alarmCount > 0) { // - 알람이 존재
				resultMsg = alarmCount + "," + temp[1] + "," + temp[0];
			} else {
				resultMsg = alarmCount + ",error";
			}
			
		} else if (temp[1].equals("board")) {
			alarm = new AlarmService().chkNoticeMsg();
			
			if (alarm.size() > 0) { // - 알람이 존재
				resultMsg = addHashChkBoard(alarm) + "," + temp[1];
			} else {
				resultMsg = alarmCount + ",error";
			}
			
		} else if (temp[1].equals("apprEnd")) { // 결재선 완료 조회
			apprLine = new AlarmService().chkApprEndMsg();
			
			if (apprLine.size() > 0) {
				for (int i = 0; i < apprLine.size(); i++) {
					resultMsg += apprLine.get(i);
					
					if (i != apprLine.size() - 1) {
						resultMsg += "|";
					}
				}
				
				resultMsg += "," + temp[1];
			} else {
				resultMsg = alarmCount + ",error";
			}
			
		} else if (temp[1].equals("apprIn")) { // 새 결재선 등록 조회
			apprLine = new AlarmService().chkApprInMsg();
			
			if (apprLine.size() > 0) {
				for (int i = 0; i < apprLine.size(); i++) {
					resultMsg += apprLine.get(i);
					
					if (i != apprLine.size() - 1) {
						resultMsg += "|";
					}
				}
				
				resultMsg += "," + temp[1];
			} else {
				resultMsg = alarmCount + ",error";
			}
			
		}
		

		
		//하나의 일 처리를 수행하는동안 사용자의 변경이 일어나면 안된다.
		//즉 NullPointer를 방지하기 위해 동기화 처리를 해준다.
		synchronized(clients) {
			for(Session client : clients) {
				client.getBasicRemote().sendText(resultMsg);
				
			}
		}
	}
	
	@OnError
	public void onError(Throwable e) {
		//데이터를 전달하는 과정에서 에러가 발생할 경우 동작하는 메소드
		e.printStackTrace();
	}
	
	@OnClose
	public void onClose(Session session) {
		//지워주지 않으면 Set에 이미 나간 사용자가 남아있기 때문에 메세지 전송시 에러 난다.
		clients.remove(session);
	}
	
	public String addHashChkBoard(ArrayList<Alarm> alarm) {
		int numOfNotice = alarm.size();
		System.out.println("공지 갯수 : " + alarm.size());
		System.out.println(alarm.toString());
		HashMap<Integer, String> hmap = new HashMap<Integer, String>();
		String[] temp = null; // array 분리용
		String result = "";
		
		for (int i = 0; i < numOfNotice; i++) {
			result += i + ":";
			temp = alarm.get(i).getAlarmContents().split(",");
			
			for (int j = 0; j < temp.length; j++) {
				
				result += temp[j];
				
				if (j != temp.length - 1) {
					result += "-";
				}
			}
			temp = null;
			
			if (i != numOfNotice - 1) {
				result += "|";
			}
			
		}
		// result는 1:1-1001-1003-|2:1-1003-|3:2-1002- 처럼 들어간다.
		return result;
	}
	
	
}
