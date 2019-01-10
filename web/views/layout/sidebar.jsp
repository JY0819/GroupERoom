<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style type="text/css">
	.myProfile{
		padding: 15px;
	}
	
	.myProfile>#sideuserPhoto{
		border: 1px solid #777;
	    border-radius: 100%;
	    width: 120px;
	    height: 120px;
	    background-position: center;
	    background-size: 120px;
	    background-repeat: no-repeat;
	    margin: 0 auto;
	}
	.myProfile>#sideuserInfo{
		width:80px;
		height:120px;
		color:#777;
		margin: 0 auto;
		text-align: center;
   	 	padding: 10px 0 0 0px;
	}
	
	#menuIcon{
		transition:  1s;
	    -webkit-transition:  1s;
    }
	#sidemenu{
		min-width 	: 150px;
		z-index : 1;
		position : absolute;
		left : 250px;
		margin-top : 51px;
	}
					  
</style>
<script type="text/javascript">
	$(function(){
		myProfileInit();
		
		$("#memoArea").focusout(function(){
			var memoContents=$("#memoArea").val();
			var empId=loginUserInfo.emp_id;
			console.log(memoContents);
			$.ajax({
				url:"/semi/insert.memo",
				type:"post",
				data:{memoContents:memoContents, empId:empId},
				success:function(data){
					console.log("메모 저장 ajax 통신 성공");
				},
				error:function(data){
					console.log("메모 저장 ajax 통신 실패");
				},
				complete:function(data){
					console.log("메모 저장 ajax");
				}
			});
		});
		
		$("#menuIcon").on("click", function() {
			console.log("hhh")
	        $("#sidemenu").toggle(function(){
	        	var display = $("#sidemenu").css("display") || "block";
	        	
	        	if(display == "none"){
	        		$("#menuIcon").css("color", "black");
	        	}else{
	        		$("#menuIcon").css("color", "#205181");
	        	}
	        });
	    });
	});
	
	function myProfileInit(){
		var emp_name = loginUserInfo.emp_name;
		var dept_name = loginUserInfo.dept_name;
		var position_name = loginUserInfo.position_name;
		
		if(dept_name != ""){
			dept_name = dept_name + "팀";
		}
		
		$("#sideEmpName").html(emp_name);
		$("#sideEmpDept").html(dept_name);
		$("#sideEmpPosition").html(position_name);
		
		openMemo();
	}
	
	function openMemo(){
		var memoEmpId 	= loginUserInfo.emp_id;
		var photoId		= loginUserInfo.photo_id;
		console.log("empid:"+memoEmpId)
		console.log("메모");
		$.ajax({
			url:"/semi/select.memo",
			type:"post",
			data:{
					empId	: memoEmpId
				   ,photoId	: photoId
				  },
			success:function(data){
				console.log("메모 ajax 전송 성공");
				
				//메모area 
				var $memoArea=$("#memoArea");
				$memoArea.html(data.memoContents);
				
				//사원정보 area
				var $empPhoto=$("#sideuserPhoto");
				//사원 이미지 없으면 기본 이미지로
				if(photoId==0){
					$empPhoto.css("background-image","url('assets/images/upload_EmpImg/ProfileImg-None.png')");
				}else{
					$empPhoto.css("background-image","url('assets/images/upload_EmpImg/"+data.imgPath+"')");
				}
			},
			error:function(data){
				console.log("메모 ajax 전송 실패");
			},	
		});
	}
</script>
<div class="navbar-default sidebar" role="navigation">
    <div class="sidebar-nav navbar-collapse">
        <ul class="nav" id="side-menu">
            <!-- <li class="sidebar-search"> -->
            <li class="myProfile">
            	<div> <span class="fa fa-keyboard-o fa-fw" style="float: right; font-size: 20px; cursor: pointer;" id="menuIcon"></span> </div>
            	<div id="sideuserPhoto"></div>
				<div id="sideuserInfo">
					<p><label id="sideEmpName"></label></p>
					<p><label id="sideEmpDept"></label></p>
					<p><label id="sideEmpPosition"></label></p>
				</div>
                <!-- 
                <div class="input-group custom-search-form">
                    <input type="text" class="form-control" placeholder="Search...">
                    <span class="input-group-btn">
	                    <button class="btn btn-default" type="button">
	                        <i class="fa fa-search"></i>
	                    </button>
	                </span> 
                </div>
	            -->
            </li> 
            <li>
                <a href="<%=request.getContextPath()%>/selectMainServlet.sm"><i class="fa fa-files-o fa-fw"></i> Approve<span class="fa arrow"></span></a>
           		<ul class="nav nav-second-level">
           			<li>
                        <a href="/semi/selectMainServlet.sm">Main</a>
                    </li>
                    <li>
                        <a href="#">작업 문서함 <span class="fa arrow"></span></a>
                        <ul class="nav nav-third-level">
                            <li>
                                <a href="/semi/selectSubmitDocumentServlet.sds">결재할 문서</a>
                            </li>
                            <li>
                                <a href="/semi/selectStatusServlet.sss">문서 진행 현황</a>
                            </li>
                            <li>
                                <a href="/semi/returnBox.rb">반려함</a>
                            </li>
                            <li>
                                <a href="/semi/selectDocument.sd">내 문서함</a>
                            </li>
                        </ul>
                        <!-- /.nav-third-level -->
                    </li>
                    <li>
                        <a href="/semi/finishappr.fi">완료 문서함</a>
                    </li>
                    <li>
                        <a href="/semi/selecttrash.tr">휴지통</a>
                    </li>
                    <li>
                        <a href="/semi/views/approval/PreferencesBox/defaultSetting.jsp">환경설정</a>
                    </li>
                    
                </ul>
           
            </li>
            <li>
                <a href="#"><i class="fa fa-edit fa-fw"></i> Board<span class="fa arrow"></span></a>
              	<ul class="nav nav-second-level">
                	<li>
                        <a href="/semi/selectList.no">공지사항</a>
                    </li>
                    <li>
                        <a href="/semi/selectList.tm">부서게시판</a>
                    </li>
                    <li>
                        <a href="/semi/selectList.fr">자유게시판</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="#"><i class="fa fa-calendar-check-o fa-fw"></i> Schedule<span class="fa arrow"></span></a>
            	<ul class="nav nav-second-level">
                	<li>
                        <a href="/semi/schedule.sche">일정 관리</a>
                    </li>
                    <li>
                        <a href="/semi/scheList.sche">일정 목록</a>
                    </li>
                </ul>
            </li>
            
            <li>
                <a href="#"><i class="fa fa-user fa-fw"></i> My Page<span class="fa arrow"></span></a>
                <ul class="nav nav-second-level">
                	<li>
                        <a href="<%=request.getContextPath()%>/myPageMain"> Main</a>
                    </li>
                	<li>
                        <a href="/semi/showAddress">쪽지보내기 </a>
                    </li>
                    <li>
                        <a href="#">쪽지함 <span class="fa arrow"></span></a>
                        <ul class="nav nav-third-level">
                            <li>
                                <a href="/semi/myPageMessage">받은 쪽지함</a>
                            </li>
                            <li>
                                <a href="/semi/myPageSendMessage">보낸 쪽지함</a>
                            </li>
                            <li>
                                <a href="/semi/myPageLockerMessage">쪽지 보관함</a>
                            </li>
                        </ul>
                        <!-- /.nav-third-level -->
                    </li>
                    <li>
                        <a href="/semi/myPageLogOfVac">휴가 조회 </a>
                    </li>
                    <li>
                        <a href="/semi/chkAttend">근태 조회 </a>
                    </li>
                    <li>
                        <a href="/semi/selectOneEmp">정보 수정 </a>
                    </li>
                </ul>
                <!-- /.nav-second-level -->
            </li>
            <li class="adminYNClass">
                <a href="#"><i class="fa fa-gear fa-fw"></i> Admin<span class="fa arrow"></span></a>
                <ul class="nav nav-second-level">
                    <li>
                        <a href="#">사원 관리 <span class="fa arrow"></span></a>
                        <ul class="nav nav-third-level">
                            <li>
                                <a href="/semi/views/admin/user/addUserForm.jsp">사원 추가</a>
                            </li>
                            <li>
                                <a href="/semi/memberList.me">사원 조회</a>
                            </li>
                            <li>
                                <a href="/semi/vacList.va">휴가 조회</a>
                            </li>
                        </ul>
                        <!-- /.nav-third-level -->
                    </li>
                    <li>
                        <a href="#">기초 정보 <span class="fa arrow"></span></a>
                        <ul class="nav nav-third-level">
                            <li>
                                <a href="/semi/depList.dp">부서 관리</a>
                            </li>
                            <li>
                                <a href="/semi/posList.po">직책 관리</a>
                            </li>
                        </ul>
                        <!-- /.nav-third-level -->
                    </li>
                </ul>
                <!-- /.nav-second-level -->
            </li>
        </ul>
    </div>
    <!-- /.sidebar-collapse -->
</div>
   
<div id="sidemenu" class="sidebar" style="display:none;">
	<div id="memoDiv">
		<textarea id="memoArea"></textarea>
	</div>
</div>
<!-- /.navbar-static-side -->
