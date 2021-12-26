<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--deleteForm.jsp --%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script>
function check(){
	if(document.delForm.pw.value==''){
		alert("암호를 입력 하세요");
		document.delForm.pw.focus();
		return false;
	}
	return true;
}//check()-end
</script>
</head>
<body>
  <form name="delForm" method="post" action="deletePro.jsp" onSubmit="return check()">
    <table border="1" cellpadding="3" width="360" align="center">
      <tr>
        <td colspan="2" valign="center" align="center">
          <font size="+2"><b>회원탈퇴</b></font>
        </td>
      </tr>
      
      <tr height="30">
        <td>암호</td>
        <td><input type="password" name="pw" id="pw" size="12"></td>
      </tr>
      
      <tr>
        <td colspan="2" align="center">
          <input type="submit" value="회원탈퇴">
          <input type="button" value="취소" onClick="location='main.jsp'">
        </td>
      </tr>
    </table>  
  </form>
</body>
</html>