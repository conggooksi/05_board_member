<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--main.jsp --%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<!-- 
<link href="style.css" rel="stylesheet" type="text/css">
 -->
</head>
<body onLoad="focusIt()" bgcolor="margenta">
 <%
 if(session.getAttribute("id")==null){//로그인 하지 않은 상태
	 %>
 	   <table border="1" height="90%" width="100%">
	     <tr height="10%">
		     <td width="80%">home</td>
		     
		     <td align="right">
		     <%--
		       <a href="loginForm.jsp">로그인</a>
		        <a href="inputForm.jsp">회원가입</a>
		      --%>
		      <%@ include file="loginForm.jsp" %>
		      
		     </td>
	     </tr>
	     
	    
	    <tr>
	      <td colspan="2" height="80%">
	               메인 입니다
	      </td>
	    </tr>
	   </table>
	 <%
 }else{//로그인을 한 상태
	  %>
	  <table border="1" height="90%">
	    <tr>
	      <td height="10%">
	              반갑습니다
	      </td>
	    </tr>
	    
	    <tr>
	      <td align="right">
	      <%
	      String id=(String)session.getAttribute("id");
	      %>
	      <%= session.getAttribute("id") %>님의 방문을 환영합니다
	      <form method="post" action="logOut.jsp">
	       <input type="submit" value="로그아웃">
	       <input type="button" value="내정보수정" onClick="location='modify.jsp'">
	      </form>
	      </td>
	    </tr>
	    
	    <tr>
	      <td colspan="2" align="center" height="70%">
	                메인 입니다
	      </td>
	    </tr>
	  </table>
	  <%
 }//else-end---
 %>
</body>
</html>