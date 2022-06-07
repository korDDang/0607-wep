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
<h2>회원 매출 정보 목록</h2>
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
총 <%=cnt %>건의 매출정보가 있습니다.
<table border="1" id="tab1">
<tr>
<th>no</th>
<th>회원번호</th>
<th>판매번호</th>
<th>단가</th>
<th>수량</th>
<th>가격</th>
<th>상품코드</th>
<th>판매일자</th>
<th>구분</th>
</tr>

<%
try{
	String sql="select custno,saleno,pcost,amount,price,pcode,to_char(sdate,'YYYY-MM-DD') from money0607  order by custno ";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	while(rs.next()){
		String custno=rs.getString("custno");
		String saleno=rs.getString("saleno");
		String pcost=rs.getString("pcost");
		String amount=rs.getString("amount");
		String price=rs.getString("price");
		String pcode=rs.getString("pcode");
		String sdate=rs.getString(7);
		a++;
	
%>
<tr>
<td><%=a %></td>
<td><a href="moneyupdate.jsp?custno=<%=custno %>"><%=custno %></a></td>
<td><%=saleno %></td>
<td><%=pcost %></td>
<td><%=amount %></td>
<td><%=price %></td>
<td><%=pcode %></td>
<td><%=sdate %></td>
<td><a href="moneydelete.jsp?custno=<%=custno %>"onclick="confirm('정말로 삭제하시겠습니까?')">삭제</a></td>
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