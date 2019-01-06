
var treeviewJson = {
	adminJson : [
					{
						text: "관리자"
					   ,nodes: [
						   
								{ 
								   text: "사원 관리"
								  ,nodes: [ 
										     {text: "사원 추가", href: "/semi/views/admin/user/addUserForm.jsp"}
										    ,{text: "사원 조회", href: "/semi/memberList.me"} 
										    ,{text: "휴가 조회", href: "/semi/vacList.me"} 
								  		  ]
								}
							   ,{ 
								  text: "기초 정보"
								 ,nodes: [
									 		{text: "부서 관리", href: "/semi/depList.dp"}
									 	   ,{text: "직책 관리", href: "/semi/posList.po"}
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
							{text:"일정 목록", href:"/semi/scheList.sche"}
						]
					}
		
				],
	
	
	boardJson : [
				{
					text:"게시판",
					nodes:[
						{text:"공지사항", href:"/semi/selectList.no"},
						{text:"부서게시판", href:"/semi/selectList.tm"},
						{text:"자유게시판", href:"/semi/selectList.fr"}
					]
				}
			],



	approvalJson : [
		{
			text: "결재"
		   ,nodes: [
			   		{
			   			text: "Main" ,href : "/semi/selectMainServlet.sm"
			   			
			   		},
					{ 
					   text: "작업 문서함"
					  ,nodes: [ 
							     {text: "결재할 문서", href: "/semi/selectSubmitDocumentServlet.sds"}
							    ,{text: "문서 진행 현황", href: "/semi/selectStatusServlet.sss?"} 
							    ,{text: "반려함", href: "/semi/returnBox.rb"}
							    ,{text: "내 문서함", href: "/semi/selectDocument.sd"}
							    ,{text: "임시 보관함", href: "/semi/views/approval/taskBox/temporaryDocument.jsp"}
					  		  ]
					}
				   ,{ 
					  text: "완료 문서함"
					 ,nodes: [
						 		/*{text: "부서 문서함", href: "/semi/documentAppr.do"},*/
						 	   {text: "결재한 문서", href: "/semi/finishappr.fi"}
					 		]
					}
				  ,{
					  text: "휴지통" , href: "/semi/selecttrash.tr"
					 
				   }
				  ,{
					  text: "환경설정" , href: "/semi/views/approval/PreferencesBox/defaultSetting.jsp"
					 
					  
				  }
		   
			 ]
			   
		}
	],
	
	
	myPageJson : [
		{
			text: "마이페이지", href: "/semi/myPageMain"
		   ,nodes: [
			   		{
			   		   text: "쪽지보내기", href: "/semi/showAddress"
			   		},
					{ 
					   text: "쪽지함", href: "/semi/myPageMessage"
					  ,nodes: [ 
							     {text: "받은 쪽지함", href: "/semi/myPageMessage"}
							    ,{text: "보낸 쪽지함", href: "/semi/myPageSendMessage"} 
							    ,{text: "쪽지 보관함", href: "/semi/myPageLockerMessage"}
					  		  ]
					}
				   ,{
					  text: "휴가조회", href: "/semi/myPageLogOfVac"
				   	}
				   ,{
					  text: "근태조회", href: "/semi/chkAttend"
				   	}
				   ,{
					  text: "정보 수정", href: "/semi/views/myPage/myInfo/ChangeInfo.jsp"
					  
				   	}
			 ]
			   
		}

	]
	
}