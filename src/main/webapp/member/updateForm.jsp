<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"
    import="member.*"
    %>
<%--updateForm.jsp --%>

<%
    request.setCharacterEncoding("UTF-8");
    String id=(String)session.getAttribute("id");
    MemberDAO dao=MemberDAO.getDAO();//dao객체 얻기
    MemberDTO dto=dao.getMember(id);//id에 해당하는 데이터를 얻어서 화면에 반영한다
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

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
        function check(){
            if($('#pw').val()==''){
                alert("암호를 입력 하세요");
                $('#pw').focus();
                return false;
            }
            if($('#pw2').val()==''){
                alert("암호확인을 입력 하세요");
                $('#pw2').focus();
                return false;
            }
            if($("#pw").val() != $("#pw2").val()){
                alert("암호와 암호 확인이 일치하지 않습니다");
                $("#pw2").val('');
                $("#pw").val('').focus();
                return false;
            }
            return true;
        }
    </script>
    <title>Insert title here</title>
    <link rel="stylesheet" href="style.css" type="text/css">
</head>
<body>
<h2>내정보 수정</h2>
<form name="userForm" action="updatePro.jsp" onsubmit="return check()">
    <table border="1">
        <tr>
            <td>ID</td>
            <td><%= id%></td>
        </tr>

        <tr>
            <td>암호</td>
            <td><input type="password" name="pw" id="pw" size="12">*필수입력</td>
        </tr>

        <tr>
            <td>암호확인</td>
            <td><input type="password" name="pw2" id="pw2" size="12">*필수입력</td>
        </tr>

        <tr>
            <td>이름</td>
            <td><input type="text" name="name" id="name" size20 value="<%=dto.getName()%>"></td>
        </tr>

        <tr>
            <td>이메일</td>
            <td><input type="text" name="email" id="email" size="30" value="<%=dto.getEmail()%>"></td>
        </tr>

        <tr>
            <td>전화</td>
            <td><input type="text" name="tel" id="tel" size="14" value="<%=dto.getTel()%>"></td>
        </tr>

        <%
            String im=dto.getZipcode();
            if(im==null){
                im="";
            }

            String im2=dto.getAddr();
            if(im2==null){
                im2="";
            }

            String im3=dto.getAddr2();
            if(im3==null){
                im3="";
            }
        %>

        <tr>
            <td>우편번호</td>
            <td>
                <input type="text" name="zipcode" id="zipcode" size="6" value="<%=im%>">
                <input type="button" value="주소찾기" onclick="openDaumPostcode()">
            </td>
        </tr>

        <tr>
            <td>주소</td>
            <td>
                <input type="text" name="addr" id="addr" size="50" value="<%=im2%>">
                <br>
                상세주소 : <input type="text" name="addr2" id="addr2" value="<%=im3%>">
            </td>
        </tr>

        <tr>
            <td colspan="2" align="center">
                <input type="submit" value="내정보 수정">
                <input type="reset" value="다시입력">
                <input type="button" value="취소" onclick="location='main.jsp'">
            </td>
        </tr>
    </table>
</form>
</body>
</html>
