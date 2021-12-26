<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="member.*"
    %>
<%--loginPro.jsp --%>
<%
request.setCharacterEncoding("UTF-8");
String id=request.getParameter("id");
String pw=request.getParameter("pw");

MemberDAO dao=MemberDAO.getDAO();//dao 객체 얻기
int x=dao.loginCheck(id, pw);//dao 메서드 호출

if(x==1){//인증 성공
	session.setAttribute("id", id);
	response.sendRedirect("main.jsp");
}else if(x==0){//암호틀림
	%>
	<script>
	alert("암호 틀림");
	history.back();
	</script>
	<%
}else if(x==-1){//없는 id
	%>
	<script>
	alert("없는 ID");
	history.back();
	</script>
	<%
}
%>