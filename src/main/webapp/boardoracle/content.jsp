<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="boardoracle.*"
    import="java.text.SimpleDateFormat"
    %>
<%--content.jsp --%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
  <link type="text/css" rel="stylesheet" href="style.css">
</head>

<%
//list.jsp에서 보내준 데이터 받기
int num=Integer.parseInt(request.getParameter("num"));
String pageNum=request.getParameter("pageNum");
SimpleDateFormat sdf=new SimpleDateFormat("yyyy/mm/dd HH:mm:ss");

BoardDAO dao=BoardDAO.getDAO();//dao객체 얻기
BoardDTO dto=dao.getBoard(num);//num에 해당하는 데이터를 받는다

int ref=dto.getRef();
int re_step=dto.getRe_step();
int re_level=dto.getRe_level();
%>
<body>
  <h2>글내용보기</h2>
  <table border="1" cellpadding="3">
    <tr height="30">
      <td>글번호</td>
      <td><%= dto.getNum()%></td>
      
      <td>조회수</td>
      <td><%= dto.getReadcount()%></td>
    </tr>
    
    <tr height="30">
      <td>작성자</td>
      <td><%= dto.getWriter()%></td>
      
      <td>작성일</td>
      <td><%= dto.getRegdate() %></td>
    </tr>
    
    <tr height="30">
	  <td>글제목</td>  
	  <td colspan="3"><%= dto.getSubject()%></td>  
    </tr>
    
    <tr height="30">
      <td>글내용</td>
      <td colspan="3">
      <%
      String im=dto.getContent();
      im=im.replace("\n", "<br>");
      %>
      <%= im%>
      </td>
    </tr>
    
    <tr height="30">
      <td colspan="4" align="center">
        <input type="button" value="글수정" onClick="document.location.href='updateForm.jsp?num=<%= dto.getNum()%>&pageNum=<%= pageNum%>'">
        <input type="button" value="글삭제" onClick="document.location.href='deleteForm.jsp?num=<%= dto.getNum()%>&pageNum=<%= pageNum%>'">
        <input type="button" value="답글쓰기" onClick="document.location.href='writeForm.jsp?num=<%= dto.getNum()%>&pageNum=<%= pageNum%>&ref=<%= ref%>&re_step=<%= re_step%>&re_level=<%= re_level%>'">
        <input type="button" value="리스트" onClick="document.location.href='list.jsp?pageNum=<%= pageNum%>'">
      </td>
    </tr>
  </table>
</body>
</html>