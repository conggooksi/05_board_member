<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="boardmysql.*"
    %>
<%--updateForm.jsp --%>

<%
request.setCharacterEncoding("UTF-8");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="style.css" rel="stylesheet" type="text/css">

<script>
function check(){
	if(document.updateForm.pw.value==''){
		alert("암호를 입력 하시오.");
		document.updateForm.pw.focus();
		return false;
	}
	document.updateForm.submit();//서버로 전송
}
</script>
</head>
<%
//content.jsp 보내준 데이터 받기
int num=Integer.parseInt(request.getParameter("num"));
String pageNum=request.getParameter("pageNum");

BoardDAO dao=BoardDAO.getDAO();//dao 객체 얻기
BoardDTO dto=dao.getUpdate(num);//num에 해당하는 자료를 받는다
%>

<body>
	<h2>글수정</h2>
	<form name="updateForm" method="post" action="updatePro.jsp?pageNum=<%= pageNum%>">
		<table border="1">
			<tr>
				<td>이름</td>
				<td>
				<input type="text" name="writer" size="30" value="<%= dto.getWriter()%> %>">
				<input type="hidden" name="num" value="<%= num%>">
				</td>
			</tr>
			
			<tr>
				<td>글제목</td>
				<td>
				<input type="text" name="subject" size="50" value="<%= dto.getSubject()%>">
				</td>
			</tr>
			
			<tr>
				<td>글내용</td>
				<td>
				<textarea name="content" rows="10" cols="50"><%= dto.getContent()%></textarea>
				</td>
			</tr>
			
			<tr>
				<td>암호</td>
				<td>
				<input type="password" name="pw" size="12">
				<font color=red>암호는 필수 입력</font>
				</td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
				<input type="button" value="글수정" onClick="check()">
				<input type="reset" value="다시쓰기">
				<input type="button" value="글목록" onClick="document.location='list.jsp?pageNum=<%=pageNum%>'">
				</td>
			</tr>
		</table>
	</form>


</body>
</html>