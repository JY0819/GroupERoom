
var treeviewJson = {
	//var jsonData = treeviewJson.adminJson;
	adminJson : [
					{
						text: "관리자"
					   ,nodes: [
						   
								{ 
								   text: "사원 관리"
								  ,nodes: [ 
										     {text: "사원 추가", href: "/semi/admin/management/user/userAdd"}
										    ,{text: "사원 조회 및 수정", href: "/semi/admin/management/user/searchAndUpdate"} 
										    ,{text: "휴가 조회", href: "/semi/admin/management/user/vacationSearch"} 
								  		  ]
								}
							   ,{ 
								  text: "기초정보"
								 ,nodes: [
									 		{text: "부서 관리", href: "/semi/admin/management/base/depManagement"}
									 	   ,{text: "직책 관리", href: "/semi/admin/management/base/posManagement"}
								 		]
								}
							  ,{
								  text: "게시판 관리"
								 ,nodes: [
									 		{text: "공지 관리", href: "/semi/views/admin/board/noticeList.jsp"}
									 	   ,{text: "일정 관리"}
								 		]
							   }
					   
						 ]
						   
					}
			],



	approvalJson : [
		{
			text: "결재"
		   ,nodes: [
			   
					{ 
					   text: "작업 문서함"
					  ,nodes: [ 
							     {text: "결재할 문서", href: "/semi/views/approval/taskBox/approvalDocument.jsp"}
							    ,{text: "문서 진행 현황", href: "/semi/views/approval/taskBox/documentStatus.jsp"} 
							    ,{text: "반려함", href: "/semi/views/approval/taskBox/returnBox.jsp"}
							    ,{text: "내 문서함", href: "/semi/views/approval/taskBox/myDocument.jsp"}
							    ,{text: "임시 보관함", href: "/semi/views/approval/taskBox/temporaryDocument.jsp"}
					  		  ]
					}
				   ,{ 
					  text: "완료 문서함"
					 ,nodes: [
						 		{text: "부서별 문서함", href: "/semi/views/approval/completeBox/departmentDocument.jsp"}
						 	   ,{text: "결재한 문서", href: "/semi/views/approval/completeBox/finishapproval.jsp"}
					 		]
					}
				  ,{
					  text: "휴지통"
					 ,nodes: [
						 		{text: "휴지통", href: "/semi/views/approval/trashBox/trash.jsp"}
					 		]
				   }
				  ,{
					  text: "환경설정"
					 ,nodes: [
						 		{text: "기본 설정", href: "/semi/views/approval/PreferencesBox/defaultSetting.jsp"}
					 		]
					  
				  }
		   
			 ]
			   
		}
	],
	
	myPageJson : [
		{
			text: "마이페이지"
		   ,nodes: [
			   
					{ 
					   text: "쪽지"
					  ,nodes: [ 
							     {text: "받은 쪽지함", href: "/semi/views/myPage/message/mypageMessage.jsp"}
							    ,{text: "보낸 쪽지함", href: "/semi/views/myPage/message/mypageSendMessageList.jsp"} 
							    ,{text: "쪽지 보관함", href: "/semi/views/myPage/message/mypageMessageLocker.jsp"}
					  		  ]
					}
				   ,{ 
					  text: "휴가"
					 ,nodes: [
						 		{text: "휴가 관리", href: "/semi/views/myPage/vacation/LeftVacDays.jsp"}
					 		]
					}
				  ,{
					  text: "주소록"
					 ,nodes: [
						 		{text: "주소록", href: "/semi/views/myPage/addressBook/AddressBook.jsp"}
					 		]
				   }
				  ,{
					  text: "정보수정"
					 ,nodes: [
						 		{text: "정보수정", href: "/semi/views/myPage/myInfo/ChangeInfo.jsp"}
					 		]
					  
				  }
		   
			 ]
			   
		}
	]
	
	



			
}