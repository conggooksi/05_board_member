<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--loginForm.jsp --%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
 function focusIt(){
	 document.inForm.id.focus();
 }
 
 function check(){
	 inputForm=eval("document.inForm");
	 // eval()함수
	 // 1. 인자로 받은 문자열이 숫자라면 실제로 숫자로 바뀐다

	 // 인자로 받은 문자열의 내용이 자바스크립트가 인식할 수 있는
	 // 객체 형태라면 , 문자열을 받아서 자바스크립트객체로 리턴한다
	 // eval() 함수는 파싱도한다 
	 
	 if(inputForm.id.value==''){
		 alert("ID를 입력 하세요");
		 inputForm.id.focus();
		 return false;
	 }
	 
	 if(inputForm.pw.value==''){
		 alert("암호를 입력 하세요")
		 inputForm.pw.focus();
		 return false;
	 }
	 
	 return true;
 }
</script>
</head>
<body>
 <h2>로그인</h2>
   <form name="inForm" method="post" action="loginPro.jsp" onSubmit="return check()">
	      <table border="0" width="">
		     <tr>
		       <td>ID</td>
		       <td><input type="text" name="id" id="id" size="12"></td>
		     </tr>
		     
		     <tr>
		       <td>암호</td>
		       <td><input type="password" name="pw" id="pw" size="12"></td>
		     </tr>
		     
		     <tr>
		       <td colspan="2" align="center">
		          <input type="submit" value="로그인">
		          <input type="button" value="회원가입" onclick="location='inputForm.jsp'">
		       </td>
		     </tr>
 		    </table>
 		 </form>

</body>
</html>