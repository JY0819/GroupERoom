/**
 * 
 */

var treeviewJson = {
			adminJson : [
							{
								text: "관리자"
							   ,nodes: [
								   
											{ 
											   text: "사원 관리"
											  ,nodes: [ 
													     {text: "사원 추가", href: "/semi/login"}
													    ,{text: "사원조회 및 수정"} 
													    ,{text: "휴가 조회"} 
											  		  ]
											}
										   ,{ 
											  text: "기초정보"
											 ,nodes: [
												 		{text: "부서 관리"}
												 	   ,{text: "직책 관리"}
											 		]
											}
										   ,{
											  text: "게시판 관리"
											 ,nodes: [
												 		{text: "공지 관리"}
												 	   ,{text: "일정 관리"}
											 		]
										   }
								   
									   ]
								   
							}
					]
}