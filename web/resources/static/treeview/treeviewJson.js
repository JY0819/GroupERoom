
var treeviewJson = {
	//var jsonData = treeviewJson.adminJson;
	adminJson : [
					{
						text: "관리자"
					   ,nodes: [
						   
								{ 
								   text: "사원 관리"
								  ,nodes: [ 
										     {text: "사원 추가", href: "/semi/views/admin/user/addUserForm.jsp"}
										    ,{text: "사원 조회 및 수정", href: "/semi/views/admin/user/userSearchAndUpdate.jsp"} 
										    ,{text: "휴가 조회", href: "/semi/views/admin/user/vacationSearch.jsp"} 
								  		  ]
								}
							   ,{ 
								  text: "기초 정보"
								 ,nodes: [
									 		{text: "부서 관리", href: "/semi/views/admin/base/depManagement.jsp"}
									 	   ,{text: "직책 관리", href: "/semi/views/admin/base/posManagement.jsp"}
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

			
	calendarJson : [
					{
						text:"일정",
						nodes:[
							{text:"일정 관리", href:"/semi/schedule.sche"},
							{text:"일정 목록", href:"/semi/views/schedule/calendarList.jsp"}
						]
					}
		
				],
	
	
	boardJson : [
				{
					text:"게시판",
					nodes:[
						{text:"공지사항", href:"/semi/views/board/notice/noticeList.jsp"},
						{text:"부서게시판", href:"/semi/views/board/team/boardTeam.jsp"},
						{text:"자유게시판", href:"/semi/views/board/free/boardFree.jsp"}
					]
				}
			],



	approvalJson : [
		{
			text: "결재"
		   ,nodes: [
			   		{
			   			text: "Main",
			   			nodes: [
			   				{text: "Main", href: "/semi/views/approval/approvalMain.jsp"}
			   			]
			   		},
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
			text: "마이페이지", href: "/semi/myPageMain"
		   ,nodes: [
			   
					{ 
					   text: "쪽지", href: "/semi/myPageMessage"
					  ,nodes: [ 
							     {text: "받은 쪽지함", href: "/semi/myPageMessage"}
							    ,{text: "보낸 쪽지함", href: "/semi/myPageSendMessage"} 
							    ,{text: "쪽지 보관함", href: "/semi/myPageLockerMessage"}
					  		  ]
					}
				   ,{ 
					  text: "휴가", href: "/semi/myPageLogOfVac"
					}
				  ,{
					  text: "주소록", href: "/semi/views/myPage/addressBook/AddressBook.jsp"
				   }
				  ,{
					  text: "정보수정", href: "/semi/views/myPage/myInfo/ChangeInfo.jsp"
				   }
				  ,{
					  text: "근태관리", href: "/semi/views/myPage/myInfo/ChangeInfo.jsp"
				   }
			 ]
			   
		}

	]
	
}