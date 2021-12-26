<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="boardmysql.*"
    %>
<%--updatePro.jsp --%>
<%
request.setCharacterEncoding("UTF-8");
%>
<%--dto에 setter작업 --%>

<jsp:useBean id="dto" class="boardmysql.BoardDTO">
  <jsp:setProperty name="dto" property="*"/>
</jsp:useBean>

<%
String pageNum=request.getParameter("pageNum");
BoardDAO dao=BoardDAO.getDAO();//dao객체 얻기
int x=dao.updateBoard(dto);//dao메서드 호출
//x=1 수정완료
//x=0 암호 틀림

if(x==1){//수정완료
	response.sendRedirect("list.jsp?pageNum="+pageNum);
}else{//x=0 암호 틀림
		%>
	<script>
	alert("암호가 틀립니다");
	history.back();
	</script>	
		<%
}//else-end
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>