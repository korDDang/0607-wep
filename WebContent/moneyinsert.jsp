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
<h2>상품 정보 등록화면</h2>
<hr>
<form name="form" method="post" action="moneyinsertProcess.jsp">
<table border="1" id="tab1">
<tr>
<th>회원번호(자동생성)</th>
<td>
<input type="text" name="custno" ></td>
</tr>
<tr>
<th>판매번호</th>
<td>
<input type="text" name="saleno" ></td>
</tr>
<tr>
<th>단가</th>
<td>
<input type="text" name="pcost" ></td>
</tr>
<tr>
<th>수량</th>
<td>
<input type="text" name="amount" ></td>
</tr>
<tr>
<th>가격</th>
<td>
<input type="text" name="price" ></td>
</tr>
<tr>
<th>상품코드</th>
<td>
<input type="text" name="pcode" ></td>
</tr>
<tr>
<th>판매일자</th>
<td>
<input type="text" name="sdate" ></td>
</tr>
<tr>
<td colspan="2" id="td1">
<input type="submit" value="등록" onclick="location.href='moneyinsertProcess.jsp'">
<input type="reset" value="취소">
</td>
</tr>

</table>
<hr>
</form>



</section>
<%@ include file="footer.jsp" %>
</body>
</html>