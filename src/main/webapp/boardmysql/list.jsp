<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="boardmysql.*"
    import="java.util.*"
    import="java.text.SimpleDateFormat"
    %>
    
<%--list.jsp --%>
<%
request.setCharacterEncoding("UTF-8");
%>

<%!
int pageSize=10;
SimpleDateFormat sdf=new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
%>

<%
String pageNum=request.getParameter("pageNum");//현재 페이지 받기
if(pageNum==null){pageNum="1";}

int currentPage=Integer.parseInt(pageNum);//현재 페이지 정수 타입으로
int startRow=(currentPage-1)*pageSize+1;//페이지의 시작 글 번호
//	        			(1-1)*10+1=1
//	        			(2-1)*10+1=11
//	        			(3-1)*10+1=21
//	        			(4-1)*10+1=31
//	        			(5-1)*10+1=41
int endRow=currentPage*pageSize;//페이지의 끝 글번호
//					1*10=10
//					2*10=20
//					3*10=30
//					4*10=40
//					5*10=50

int count=0;//글 개수
int number=0;//글번호
List <BoardDTO>list=null;//데이터 받을 변수

BoardDAO dao=BoardDAO.getDAO();//dao객체 얻기
count=dao.getBoardCount();//글 개수 얻기

if(count>0){//글이 존재하면
	list=dao.getList(startRow, pageSize);//pageSize=10
	//                  위치부터, 몇개
}

number=count-(currentPage-1)*pageSize;//보여줄 글번호
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>list.jsp</title>
	<link type="text/css" rel="stylesheet" href="style.css">
</head>
<body>
	<b><h2>글목록(전체글:<%= count%>)(º д º ;;)</h2></b>

	<table>
		<tr>
			<td align="right">
				<a href="writeForm.jsp">새글쓰기</a>
			</td>
		</tr>
	</table>

	<%
	if(count==0){//글이 없으면
		out.println("<h2>게시판에 저장된 글이 없습니다</h2>");
	}else{//글이 존재하면
		%>
		<table border="1">
			<tr>
				<td>글번호</td>
				<td>글제목</td>
				<td>작성자</td>
				<td>작성일</td>
				<td>조회수</td>
				<td>ip</td>
			</tr>
			
			<%
			for(int i=0; i<list.size(); i++){
				BoardDTO dto=(BoardDTO)list.get(i);
			
				%>
				<tr>
					<td><%= number--%></td>
					
					<%----------------------글제목 시작 ----------------------%>
					
					<td>
					<%
					int wid=0;//변수
					if(dto.getRe_level()>0){//답글이면
						wid=5*(dto.getRe_level());
					%>
					<img src="../imgs/level.gif" width="<%=wid%>" height="16">
					<img src="../imgs/re.gif">
					<%
					}else{//원글
					%>
					<img src="../imgs/level.gif" width="<%=wid%>" height="16">
					<%	
					}//else-end
					%>
					
					<%--글제목을 클릭하면 글 내용 보기로 간다 --%>
					<a href="content.jsp?num=<%= dto.getNum()%>&pageNum=<%= currentPage%>">
					<%= dto.getSubject()%>
					</a>
					
					<%--조회수가 10번 이상이면 hot.gif 표시 --%>
					<%
					if(dto.getReadcount()>=10){
						%>
						<img src="../imgs/hot.gif" height="10" border="0">
						<%
					}//if-end
					%>
					</td>
					<%----------------------글제목 끝 ----------------------%>
					
					<td><%= dto.getWriter()%></td>
					<td><%= sdf.format(dto.getRegdate())%></td>
					<td><%= dto.getReadcount()%></td>
					<td><%= dto.getIp()%></td>
				</tr>
				<%
			}//for-end
			%>
		</table>
		<%
	}//else-end------------데이터 출력 끝
	%>
	
	<%--블럭처리, 페이지 처리 --%>
	
	<%
	if(count>0){//<--글이 있을 때만 처리하게 해주려고
		%>
		<table border="1">
		  <tr>
		    <td>
		    <%
		    //전체 페이지 수 구하기
		    int pageCount=count/pageSize+(count%pageSize==0?0:1);//37개 글이라면 4페이지가 된다
		    //int pageCount=(int)(Math.ceil(count/pageSize)); <-- 앞에서는 이렇게 했었다
		    
		    int pageBlock=10;//블럭당 페이지수
		    int startPage=(int)(currentPage/pageBlock)*10+1;//시작 페이지
		    //                           (1/10)*10+1=1  (1/10)이 0이 되쥬?
		    //                           (2/10)*10+1=1
		    //                           (9/10)*10+1=1
		    
		    //                           (10/10)*10+1=11
		    //                           (19/10)*10+1=11
		    
		    //                           (20/10)*10+1=21
		    //                           (29/10)*10+1=21
		    
		    int endPage=startPage+pageBlock-1;//끝페이지
		    //                  1+10-1=10
		    //                  11+10-1=20
		    //                  21+10-1=30
		    
		    if(endPage>pageCount){//에러방지를 위해서
		    	endPage=pageCount;
		    }
		    
		    //이전블럭
		    if(startPage>10){
		    	%>
		    	<a href="list.jsp?pageNum=<%= startPage-10%>">[이전블럭]</a>
		    	<%
		    }//if-end
		    
		    //페이지 처리
		    for(int i=startPage; i<=endPage; i++){
		    	%>
		    	<a href="list.jsp?pageNum=<%= i%>">[<%= i%>]</a>
		    	<%
		    }//for-end
		    
		    //다음블럭
		    if(endPage<pageCount){
		    	%>
		    	<a href="list.jsp?pageNum=<%= startPage+10%>">[다음블럭]</a>
		    	<%
		    }//if-end
		    %>
		    </td>
		  </tr>
		</table>
		<%
	}//if-end-글이 존재할 떄
	%>
 
</body>
</html>