<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<table id="announce" style="display:table-cell;">
	<tr>
		<th colspan="2" style="font-weight:100;text-align:left;color:gray;" >공 지 사 항</th>
	</tr>
	<tr>
		<td colspan="2"><hr></td>
	</tr>
	<%for (Notice n:noticeList){%>
		<tr>
			<td width="500px"><p style="text-align: left;">
				<%Date today=new Date();
					boolean time;
					time=(today.getTime()-n.getbDate().getTime())/(24*3600*1000)<=1.5;
					if(time){%>
						<i style="color:#D76464;" class="xi-new-o xi-2x"></i>
				<%} %>
			<input type="hidden" name="bno" value="<%=n.getBno()%>">
			<input type="hidden" name="fileName" value="<%=n.getFile02()%>">
			<%=n.getbTitle() %></p></td>
			<td width="200px"><p style="text-align: right;"><%=n.getbDate() %></p></td>
		</tr>
		<tr>
			<td colspan="2" style="height:3px; padding:0px" colspan="7"><hr></td>
		</tr>
	<% }%>
	<%if(noticeList.size()==0){ %>
		<tr>
			<td colspan="2" height="3px" colspan="7">등록된 공지사항이 없습니다.</td>
		</tr>
		<tr>
			<td colspan="2" height="3px" colspan="7"><hr></td>
		</tr>
	<%} %>
</table>


<script type="text/javascript">
$(function(){
	<%if(noticeList.size()==0){}else{ %>

	$("#announce td").mouseenter(function(){
		$(this).parent().css({"color":"darkgrey", "cursor":"pointer"});
	}).mouseout(function(){
		$(this).parent().css({"color":"black"})
	}).click(function(){
		var num = $(this).parent().children().eq(0).children().children('input[name="bno"]').val()//->글번호 가져오기
		var fileName=$(this).parent().children().eq(0).children().children('input[name="fileName"]').val();
		console.log(num+''+fileName);
		location.href="<%=request.getContextPath()%>/selectOne.no?num="+num+"&fileName="+fileName;
	});
	<%}%>
});
</script>