<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="member.*"
    %>
<%--deletePro.jsp --%>
<%
request.setCharacterEncoding("utf-8");
String id=(String)session.getAttribute("id");
String pw=request.getParameter("pw");

MemberDAO dao=MemberDAO.getDAO();
int x=dao.deleteMember(id, pw);//dao메서드 호출

if(x==1){//탈퇴 성공
	session.invalidate();//세션 무효화
	%>
	<font size="+2" color="blue"><b>탈퇴 되었습니다</b></font>
	<br>
	3초후에 메인으로 이동 합니다
	<meta http-equiv="Refresh" content="3;url=main.jsp">
	<%
}else if(x==-1){//암호 틀림
	%>
	<script>
	alert("암호가 틀립니다");
	history.back();
	</script>
	<%
}else if(x==0){//없는 id
	%>
	<script>
	alert("없는 id입니다");
	history.back();
	</script>
	<%
}
%>