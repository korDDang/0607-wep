<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
function check() {
	var doc=document.form;
	if(doc.custno.value==""){
		alert("회원번호가 입력되지 않았습니다");
		doc.custno.focus();
	}else if(doc.custname.value==""){
		alert("회원성명이 입력되지 않았습니다");
		doc.custname.focus();
	}else if(doc.phone.value==""){
		alert("회원전화가 입력되지 않았습니다");
		doc.phone.focus();
	}else if(doc.address.value==""){
		alert("회원주소가 입력되지 않았습니다");
		doc.address.focus();
	}else if(doc.joindate.value==""){
		alert("가입일자가 입력되지 않았습니다");
		doc.joindate.focus();
	}else if(doc.grade.value=="0"){
		alert("고객등급이 입력되지 않았습니다");
		doc.grade.focus();
	}else if(doc.city.value=="0"){
		alert("도시코드가 입력되지 않았습니다");
		doc.city.focus();
	}else if(doc.goods.value==""){
		alert("관심상품이 입력되지 않았습니다");
		doc.goods.focus();
	}else{
		doc.submit();
	}
}
</script>
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
	String sql="select custno,custname,phone,address,to_char(joindate,'YYYY-MM-DD'),grade,city,goods from member0607 where custno=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, custno);
	rs=pstmt.executeQuery();
	if(rs.next()){
		custno=rs.getString("custno");
		String custname=rs.getString("custname");
		String phone=rs.getString("phone");
		String address=rs.getString("address");
		String joindate=rs.getString(5);
		String grade=rs.getString("grade");
		String city=rs.getString("city");
		String goods=rs.getString("goods");
		String goodss[]=goods.split(",");
	

%>
<h2>홈쇼핑 회원 등록화면</h2>
<hr>
<form name="form" method="post" action="memberupdateProcess.jsp">
<table border="1" id="tab1">
<tr>
<th>회원번호(자동생성)</th>
<td>
<input type="text" name="custno" value="<%=custno %>"></td>
</tr>
<tr>
<th>회원성명</th>
<td>
<input type="text" name="custname" value="<%=custname %>"></td>
</tr>
<tr>
<th>회원전화</th>
<td>
<input type="text" name="phone" value="<%=phone %>"></td>
</tr>
<tr>
<th>회원주소</th>
<td>
<input type="text" name="address" value="<%=address %>"></td>
</tr>
<tr>
<th>가입일자</th>
<td>
<input type="text" name="joindate" value="<%=joindate %>"></td>
</tr>
<tr>
<th>고객등급</th>
<td>
<select name="grade">
<option value="0" <%=grade.equals("0")?"selected":""%> >선택하세요</option>
<option value="A"  <%=grade.equals("A")?"selected":""%> >A:VIP</option>
<option value="B"  <%=grade.equals("B")?"selected":""%> >B:일반</option>
<option value="C"  <%=grade.equals("C")?"selected":""%> >C:직원</option>
</select></td>
</tr>
<tr>
<th>도시코드</th>
<td>
<select name="city">
<option value="0"  <%=city.equals("0")?"selected":""%> >선택하세요</option>
<option value="01"  <%=city.equals("01")?"selected":""%> >01:서울</option>
<option value="02"  <%=city.equals("02")?"selected":""%> >02:경기</option>
<option value="10"  <%=city.equals("10")?"selected":""%> >10:대전</option>
<option value="20"  <%=city.equals("20")?"selected":""%> >20:부산</option>
<option value="30"  <%=city.equals("30")?"selected":""%> >30:광주</option>
<option value="40"  <%=city.equals("40")?"selected":""%> >40:울산</option>
<option value="50"  <%=city.equals("50")?"selected":""%> >50:대구</option>
<option value="60"  <%=city.equals("60")?"selected":""%> >60:강원</option>
<option value="70"  <%=city.equals("70")?"selected":""%> >70:경상</option>
<option value="80"  <%=city.equals("80")?"selected":""%> >80:충청</option>
<option value="90"  <%=city.equals("90")?"selected":""%> >90:제주</option>
</select></td>
</tr>
<tr>
<th>관심상품</th>
<td>
<input type="checkbox" name="goods" value="의류" <% for(int i=0;i<goodss.length;i++){if(goodss[i].equals("의류")){%>checked<%}}%> >의류
<input type="checkbox" name="goods" value="식료품" <%for(int i=0;i<goodss.length;i++){if(goodss[i].equals("식료품")){%>checked<%}}%>>식료품
<input type="checkbox" name="goods" value="컴퓨터" <%for(int i=0;i<goodss.length;i++){if(goodss[i].equals("컴퓨터")){%>checked<%}}%>>컴퓨터
<input type="checkbox" name="goods" value="공산품" <%for(int i=0;i<goodss.length;i++){if(goodss[i].equals("공산품")){%>checked<%}}%>>공산품
<input type="checkbox" name="goods" value="관광" <%for(int i=0;i<goodss.length;i++){if(goodss[i].equals("관광")){%>checked<%}}%>>관광
<input type="checkbox" name="goods" value="전자제품" <%for(int i=0;i<goodss.length;i++){if(goodss[i].equals("전자제품")){%>checked<%}}%>>전자제품
<input type="checkbox" name="goods" value="건강제품" <%for(int i=0;i<goodss.length;i++){if(goodss[i].equals("건강제품")){%>checked<%}}%>>건강제품
<input type="checkbox" name="goods" value="운동기구" <%for(int i=0;i<goodss.length;i++){if(goodss[i].equals("운동기구")){%>checked<%}}%>>운동기구
</td>
</tr>
<tr>
<td colspan="2" id="td1">
<input type="button" value="등록" onclick="check()">
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