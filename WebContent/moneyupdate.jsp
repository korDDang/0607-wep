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
<section id="sec1">
<%@ include file="DBConn.jsp" %>
<%
ResultSet rs=null;
PreparedStatement pstmt=null;
String custno=request.getParameter("custno");
try{
	String sql="select custno,saleno,pcost,amount,price,pcode,to_char(sdate,'YYYY-MM-DD') from money0607 where custno=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, custno);
	rs=pstmt.executeQuery();
	if(rs.next()){
		custno=rs.getString("custno");
		String saleno=rs.getString("saleno");
		String pcost=rs.getString("pcost");
		String amount=rs.getString("amount");
		String price=rs.getString("price");
		String pcode=rs.getString("pcode");
		String sdate=rs.getString(7);
		

%>
<h2>회원 매출 수정화면</h2>
<hr>
<form name="form" method="post" action="moneyupdateProcess.jsp">
<table border="1" id="tab1">
<tr>
<th>회원번호(자동생성)</th>
<td>
<input type="text" name="custno" value="<%=custno %>"></td>
</tr>
<tr>
<th>판매번호</th>
<td>
<input type="text" name="saleno" value="<%=saleno %>"></td>
</tr>
<tr>
<th>단가</th>
<td>
<input type="text" name="pcost" value="<%=pcost %>"></td>
</tr>
<tr>
<th>수량</th>
<td>
<input type="text" name="amount" value="<%=amount %>"></td>
</tr>
<tr>
<th>가격</th>
<td>
<input type="text" name="price" value="<%=price %>"></td>
</tr>
<tr>
<th>상품코드</th>
<td>
<input type="text" name="pcode" value="<%=pcode %>"></td>
</tr>
<tr>
<th>판매일자</th>
<td>
<input type="text" name="sdate" value="<%=sdate %>"></td>
</tr>
<tr>
<td colspan="2" id="td1">
<input type="submit" value="등록" >
<input type="reset" value="취소">
</td>
</tr>
<% 
}
}catch(SQLException e){
	e.printStackTrace();
}
%>
</table>
<hr>
</form>



</section>
<%@ include file="footer.jsp" %>
</body>
</html>