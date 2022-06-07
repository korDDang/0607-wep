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
<th>회원번호</th>
<th>회원이름</th>
<th>고객등급</th>
<th>매출</th>

</tr>

<%
PreparedStatement pstmt=null;
ResultSet rs=null;
try{
	String sql="select e.custno,e.custname,e.grade,sum(m.price)from member0607 e, money0607 m where e.custno=m.custno group by e.custno,e.custname,e.grade order by sum(m.price) desc";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	while(rs.next()){
		String custno=rs.getString("custno");
		String custname=rs.getString("custname");
		String grade=rs.getString("grade");
		switch(grade){
		case "A" :
		             grade="VIP";
 					break;
		case"B" :
		          grade="일반";
		        		  break;
		case"C"  :      
		            grade="직원";
		            break;
		}
		String price=rs.getString(4);
	
		a++;
	
%>
<tr>
<td><%=a %></td>
<td><%=custno %></td>
<td><%=custname %></td>
<td><%=grade %></td>
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