<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="/views/layout/layout-up.jsp" />

	<link rel="stylesheet" type="text/css" href="/semi/assets/css/adminPage.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
	<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.4/css/bootstrap.min.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-treeview/1.2.0/bootstrap-treeview.min.js"></script>
	
	<style type="text/css">
		/* 
		body{
		    padding-top: 30px; 
		} 
		*/
		#treaviewArea{
			width: 100%;
    		height: inherit;
		}
		.treeview ul li{ 
		    background: #F48B94;
		    color: #fff;
		}
		.treeview ul li:hover{
		    background: #fff;
		    color: #F48B94;
		}
	</style>
	
	<section class="content">
		<div class="content-left">
			<label>관리자</label>
				<div class="row" id="treaviewArea">
			      <div >
		          	<div id="treeview" class="treeview"></div>
			      </div>
				</div>
		</div>
		
		<div class="content-right"></div>
	</section>
	
	<script>
	$(function() {
	    var treeData = [
	      {
	        text: 'Menu 1',
	        href: '#menu1',
	        tags: ['4'],
	        nodes: [
	          {
	            text: 'Sub Menu 1',
	            href: '#submenu1',
	            tags: ['2'],
	            nodes: [
	              {
	                text: 'Sub Menu 1.1',
	                href: '#submenu1.1',
	                tags: ['0']
	              },
	              {
	                text: 'Sub Menu 1.2',
	                href: '#submenu1.2',
	                tags: ['0']
	              }
	            ]
	          },
	          {
	            text: 'Sub Menu 2',
	            href: '#submenu2',
	            tags: ['2'],
	            nodes: [
	              {
	                text: 'Sub Menu 2.1',
	                href: '#submenu2.1',
	                tags: ['0']
	              },
	              {
	                text: 'Sub Menu 2.2',
	                href: '#submenu2.2',
	                tags: ['0']
	              }
	            ]
	          },
	        ]
	      },
	      {
	        text: 'Menu 2',
	        href: '#menu2',
	        tags: ['0']
	      },
	      {
	        text: 'Menu 3',
	        href: '#menu3',
	         tags: ['0']
	      },
	      {
	        text: 'Menu 4',
	        href: '#menu4',
	        tags: ['0']
	      },
	      {
	        text: 'Menu 5',
	        href: '#menu5'  ,
	        tags: ['0']
	      }
	    ];

	    $('#treeview').treeview({
	      data: treeData,
	    });
		});
	</script>

<jsp:include page="/views/layout/layout-down.jsp" />