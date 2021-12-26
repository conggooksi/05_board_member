<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"
    import="member.*"
    %>
<%--updatePro.jsp --%>
<%
    request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="dto" class="member.MemberDTO">
    <jsp:setProperty name="dto" property="*"/>
</jsp:useBean>

<%
    String id=(String)session.getAttribute("id");
    dto.setId(id);//setter 작업하여 back-end로 보낸다
    MemberDAO dao=MemberDAO.getDAO();
    dao.updateMember(dto);//dao메서드 호출
%>

<font size="5" color="blue"><b>회원 정보 수정 완료</b></font>

<form>
    <input type="button" value="메인으로" onclick="location='main.jsp'">
</form>

3초후에 메인으로 이동합니다
<meta http-equiv="Refresh" content="3;url=main.jsp">