<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="boardmysql.*"
    %>
<%--writePro.jsp --%>
<%
request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="dto" class="boardmysql.BoardDTO">
	<jsp:setProperty name="dto" property="*"/>
</jsp:useBean>

<%
dto.setIp(request.getRemoteAddr());//ip

BoardDAO dao=BoardDAO.getDAO();//dao객체 얻기
dao.insertBoard(dto);//dao메서드 호출, insert

response.sendRedirect("list.jsp");//list.jsp로 이동
%>