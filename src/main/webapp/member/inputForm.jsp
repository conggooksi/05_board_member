<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--inputForm.jsp --%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script src="//code.jquery.com/jquery-3.6.0.min.js"></script>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>
function openDaumPostcode(){

	new daum.Postcode({
      oncomplete:function(data){
         document.getElementById('zipcode').value=data.zonecode;
         document.getElementById('addr').value=data.address;
       }
   }).open();
}//openDaumPostcode()---
</script>

<script>
//데이터 유효성 체크
function check(){
	/* if($('#id').val()==''){
		alert("ID입력 하세요");
		$('#id').focus();
		return false;
	} */
	
	if($('#pw').val()==''){
		alert("암호입력 하세요");
		$('#pw').focus();
		return false;
	}
	
	if($('#pw2').val()==''){
		alert("암호확인 입력 하세요");
		$('#pw2').focus();
		return false;
	}
	
	if($('#pw').val()!=$('#pw2').val()){
		alert("암호와 암호 확인이 다릅니다");
		$('#pw').val('').focus();
		$('#pw2').val('');
		return false;
	}
	
	if($('#name').val()==''){
		alert("이름 입력 하세요");
		$('#name').focus();
		return false;
	}

	return true;
}//check()-end

//ajax 이용하여 id 중복체크
function confirmIDcheck(){
         if($('#id').val()==''){
            alert("id를 입력 하세요")
         }else{
            $.ajax({
               type:'POST',
               url:'confirmID.jsp',
               data:"id="+$('#id').val(),
               dataType:'JSON',
               success:function(data){
                  //alert(data);
                  //alert(data.check);
                  if(data.check==1){
                     alert("사용중인 id");
                     $('#id').val('').focus();
                  }else{
                     alert('사용가능한 id');
                     $('#pw').focus();
                  }//else-end
               }//success-end
            });
         }//else-end
      
}//confirmIDcheck()-end

</script>

<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#FF8C00">
  <h2>회원가입</h2>
  <form name="inputForm" method="post" action="inputPro.jsp" onSubmit="return check()"><%--return이 서버로 못 넘어가게 막는거 --%>
    <table border="1">
      
      <tr>
        <td>ID</td>
        <td>
          <input type="text" name="id" id="id" size="20">
          <input type="button" value="ID중복체크" onClick="confirmIDcheck()">
        </td>
      </tr>
      
      <tr>
        <td>암호</td>
        <td><input type="password" name="pw" id="pw" size="20"></td>
      </tr>
      
      <tr>
        <td>암호확인</td>
        <td><input type="password" name="pw2" id="pw2" size="20"></td>
      </tr>
      
      <tr>
        <td>이름</td>
        <td><input type="text" name="name" id="name" size="30"></td>
      </tr>
      
      <tr>
        <td>이메일</td>
        <td><input type="email" name="email" id="email" size="30"></td>
      </tr>
      
      <tr>
        <td>전화번호</td>
        <td><input type="tel" name="tel" id="tel" size="30">하이픈 "-" 넣지말고 번호만 넣으세요</td>
      </tr>
      
      <tr>
        <td>우편번호</td>
        <td>
          <input type="text" name="zipcode" id="zipcode" size="5">
          <input type="button" value="주소찾기" onClick="openDaumPostcode()">
        </td>
      </tr>
      
      <tr>
        <td>주소</td>
        <td>
          <input type="text" name="addr" id="addr" size="50">
          <br>
                      상세주소 : <input type="text" name="addr2" id="addr2" size="20">
        </td>
      </tr>
      
      <tr>
        <td colspan="2" align="center">
          <input type="submit" value="회원가입">
          <input type="reset" value="다시입력">
          
          <input type="button" value="가입안함" onClick="javascript:window:location='main.jsp'">
          <input type="button" value="가입안함" onClick="javascript.location='main.jsp'">
          <input type="button" value="가입안함" onClick="window.location='main.jsp'">
          <input type="button" value="가입안함" onClick="location='main.jsp'">
        </td>
      </tr>
    </table>
  </form>

</body>
</html>