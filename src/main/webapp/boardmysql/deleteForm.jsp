<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--deleteForm.jsp --%>

<%
//content.jsp가 보내준 데이터 받기
int num=Integer.parseInt(request.getParameter("num"));
String pageNum=request.getParameter("pageNum");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script>
  function check(){
	  if(document.delForm.pw.value==''){
		  alert("암호를 입력 하세요");
		  document.delForm.pw.focus();
		  return false;
	  }
	  document.delForm.submit();//전송
  }
</script>

</head>
<body>
 <h2>글삭제</h2>
 <form name="delForm" method="post" action="deletePro.jsp?pageNum=<%= pageNum%>">
   <table border="5" bordercolor="blue">
     
     <tr height="30">
       <td>
        <b>암호를 입력 하세요</b>
       </td>
     </tr>
     
     <tr height="30">
       <td>
       	암호입력 : <input type="password" name="pw" size="12">※암호는 필수 입력
       			<input type="hidden" name="num" value="<%= num%>"> 
       </td>
     </tr>
     
     <tr height="30">
       <td align="center">
         <input type="button" value="글삭제" onClick="check()">
         <input type="button" value="글목록" onClick="document.location='list.jsp?pageNum=<%= pageNum%>'">
       </td>
     </tr>
   </table>
 
 </form>

</body>
</html>