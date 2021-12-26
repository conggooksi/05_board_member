<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
   import="member.*"
    
    %>
<%
request.setCharacterEncoding("UTF-8");
%>    
<%--inputPro.jsp --%>
 
<jsp:useBean id="dto" class="member.MemberDTO">
  <jsp:setProperty name="dto" property="*"/>
</jsp:useBean>

<%
MemberDAO dao=MemberDAO.getDAO();//dao객체 얻기 
dao.insertMember(dto);//dao메서드 호출 

response.sendRedirect("main.jsp");
%>