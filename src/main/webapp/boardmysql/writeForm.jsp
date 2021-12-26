<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    %>
<%--writeForm.jsp --%>

<%
request.setCharacterEncoding("UTF-8");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>writeForm.jsp</title>

<link rel="stylesheet" type="text/css" href="style.css">

<script src="//code.jquery.com/jquery-3.6.0.min.js"></script>

<script type="text/javascript" src="script.js"></script>
</head>

<%
int num=0;//변수
int ref=1;//글 그룹
int re_step=0;//글 순서 정리
int re_level=0;//글 깊이

if(request.getParameter("num") != null){//답글이면
	num=Integer.parseInt(request.getParameter("num"));
	ref=Integer.parseInt(request.getParameter("ref"));
	re_step=Integer.parseInt(request.getParameter("re_step"));
	re_level=Integer.parseInt(request.getParameter("re_level"));
}
%>
<body>
<%
if(num == 0){
%>
<h2>글쓰기</h2>
<%	
}else{
%>
<h2>답글쓰기</h2>
<%	
}
%>

<form name="writeForm" method="post" action="writePro.jsp" onSubmit="return writeSave()">
	<input type="hidden" name="num" value="<%= num%>">
	<input type="hidden" name="ref" value="<%= ref%>">
	<input type="hidden" name="re_step" value="<%= re_step%>">
	<input type="hidden" name="re_level" value="<%= re_level%>">
	
	<table>
		<tr>
			<td colspan="2" align="right">
				<a href="list.jsp">리스트</a>
			</td>
		</tr>
		
		<tr>
			<td>이름</td>
			<td><input type="text" name="writer" id="writer" size="30"></td>
		</tr>
		
		<tr>
			<td>글제목</td>
			<td>
			<%
			if(request.getParameter("num")==null){//원글
				%>
				<input type="text" name="subject" id="subject" size="50">
				<%
			}else{//답글
				%>
				<input type="text" name="subject" id="subject" size="50" value="[답글]">
				<%
			}
			%>
			</td>
		</tr>
		
		<tr>
			<td>글내용</td>
			<td>
				<textarea name="content" id="content" rows="10" cols="50"></textarea>
			</td>
		</tr>
		
		<tr>
			<td>암호</td>
			<td><input typ
			e="password" name="pw" id="pw" size="12"></td>
		</tr>
		
		<tr>
			<td colspan="2" align="center">
				<%
				if(num == 0){
				%>
				<input type="submit" value="글쓰기">
				<%	
				}else{
				%>
				<input type="submit" value="답글쓰기">
				<%	
				}
				%>
				
				<input type="reset" value="다시쓰기">
				<input type="button" value="글목록" onClick="window.location='list.jsp'">
			</td><%--location='list.jsp'도 된다 --%>
		</tr>		
	</table>
</form>


</body>
</html>