<%@page import="jdk.nashorn.internal.runtime.regexp.joni.Config"%>
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
<h2>회원 정보 목록</h2>
<%
ResultSet rs=null;
PreparedStatement pstmt=null;
int cnt=0;
int a=0;
try{
	String sql="select count(custno) from member0607";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	if(rs.next()){
		cnt=rs.getInt(1);
	}else{
		cnt=1;
	}
}catch(SQLException e){
	e.printStackTrace();
}

%>
총 <%=cnt %>명의 회원이 있습니다.
<table border="1" id="tab1">
<tr>
<th>no</th>
<th>회원번호</th>
<th>회원성명</th>
<th>전화번호</th>
<th>주소</th>
<th>가입일자</th>
<th>고객등급</th>
<th>거주지역</th>
<th>관심상품</th>
<th>구분</th>
</tr>

<%
try{
	String sql="select custno,custname,phone,address,to_char(joindate,'YYYY-MM-DD'),grade,city,goods from member0607";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	while(rs.next()){
		String custno=rs.getString("custno");
		String custname=rs.getString("custname");
		String phone=rs.getString("phone");
		String address=rs.getString("address");
		String joindate=rs.getString(5);
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
		String city=rs.getString("city");
		switch(city){
		
		case "01": city="서울";
		           break;
		case "02": city="경기";
        break;
		case "10": city="대전";
        break;
		case "20": city="부산";
        break;
		case "30": city="광주";
        break;
		case "40": city="울산";
        break;
		case "50": city="대구";
        break;
		case "60": city="강원";
        break;
		case "70": city="경상";
        break;
		case "90": city="제주";
        break;
        
		}
		String goods=rs.getString("goods");
		a++;
	
%>
<tr>
<td><%=a %></td>
<td><a href="memberupdate.jsp?custno=<%=custno %>"><%=custno %></a></td>
<td><%=custname %></td>
<td><%=phone %></td>
<td><%=address %></td>
<td><%=joindate %></td>
<td><%=grade %></td>
<td><%=city %></td>
<td><%=goods %></td>
<td><a href="memberdelete.jsp?custno=<%=custno%>"onclick="confirm('정말로 삭제하시겠습니까?')">삭제</a></td>
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