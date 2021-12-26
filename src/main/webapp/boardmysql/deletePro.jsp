<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="boardmysql.*"
    %>
<%--deletePro.jsp --%>
<%
//넘어온 데이터 받기
int num=Integer.parseInt(request.getParameter("num"));
String pageNum=request.getParameter("pageNum");
String pw=request.getParameter("pw");

BoardDAO dao=BoardDAO.getDAO();//dao 객체 얻기
int x=dao.deleteBoard(num, pw);//dao메서드 호출

if(x==1){//삭제 성공
	response.sendRedirect("list.jsp?pageNum="+pageNum);
}else{//삭제 실패,암호 틀림
	%>
	<script>
	  alert("암호 틀림");
	  history.back();
	</script>
	<%
}
%>