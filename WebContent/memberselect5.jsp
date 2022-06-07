<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<%@ include file="DBConn.jsp" %>
<section id="sec1">
<h2>회원 매출 정보 조회(회원번호별 집계)</h2>
<%
int a=0;
%>

<table border="1" id="tab1">
<tr>
<th>no</th>
<th>상품코드</th>
<th>상품명</th>
<th>매출</th>
</tr>

<%
PreparedStatement pstmt=null;
ResultSet rs=null;
try{
	String sql="select m.pcode,p.pname,sum(m.price) from product0607 p, money0607 m where p.pcode=m.pcode group by m.pcode,p.pname order by pcode" ;
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	while(rs.next()){
		String pcode=rs.getString(1);
		String pname=rs.getString(2);
		String price=rs.getString(3);
		
	
		a++;
	
%>
<tr>
<td><%=a %></td>
<td><%=pcode %></td>
<td><%=pname %></td>
<td><%=price %></td>
</tr>
<% 
}
}catch(Exception e){
	e.printStackTrace();
	
}
%>
</table>
<div style="text-align: center"><input type="button" value="작성" onclick="location.href='memberinsert.jsp'" style="color: white;background:gray;"></div>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>