
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
			
	calendarJson:[
					{
						text:"일정",
						nodes:[
							{text:"일정 관리",href:"/semi/views/schedule/calendar.jsp"},
							{text:"일정 목록",href:"/semi/views/schedule/calendarList.jsp"}
						]
					}
		
	],
	
	boardJson:[
				{
					text:"게시판",
					nodes:[
						{text:"공지사항",href:"/semi/views/board/boardNotice.jsp"},
						{text:"부서게시판",href:"/semi/views/board/boardTeam.jsp"},
						{text:"자유게시판",href:"/semi/views/board/boardFree.jsp"}
					]
				}
	]
			
}