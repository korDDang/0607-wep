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
	var cnt =0;
	var chk =document.getElementsByName("chk");
	for(var i =0; i<chk.length; i++){
		if(chk[i].checked==true){
			cnt++;
			break;
		}
	}
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
	}else if(cnt==0){
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
<h2>홈쇼핑 회원 등록화면</h2>
<hr>
<%
int ma=0;
PreparedStatement pstmt=null;
ResultSet rs=null;
try{
	String sql="select max(custno) from member0607";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	if(rs.next()){
		ma=rs.getInt(1)+1;
	}else{
		ma=1;
	}
}catch(SQLException e){
	e.printStackTrace();
}
%>
<form name="form" method="post" action="memberinsertProcess.jsp">
<table border="1" id="tab1">
<tr>
<th>회원번호(자동생성)</th>
<td>
<input type="text" name="custno" value="<%=ma%>"></td>
</tr>
<tr>
<th>회원성명</th>
<td>
<input type="text" name="custname"></td>
</tr>
<tr>
<th>회원전화</th>
<td>
<input type="text" name="phone"></td>
</tr>
<tr>
<th>회원주소</th>
<td>
<input type="text" name="address"></td>
</tr>
<tr>
<th>가입일자</th>
<td>
<input type="text" name="joindate"></td>
</tr>
<tr>
<th>고객등급</th>
<td>
<select name="grade">
<option value="0">선택하세요</option>
<option value="A">A:VIP</option>
<option value="B">B:일반</option>
<option value="C">C:직원</option>
</select></td>
</tr>
<tr>
<th>도시코드</th>
<td>
<select name="city">
<option value="0">선택하세요</option>
<option value="01">01:서울</option>
<option value="02">02:경기</option>
<option value="10">10:대전</option>
<option value="20">20:부산</option>
<option value="30">30:광주</option>
<option value="40">40:울산</option>
<option value="50">50:대구</option>
<option value="60">60:강원</option>
<option value="70">70:경상</option>
<option value="80">80:충청</option>
<option value="90">90:제주</option>
</select></td>
</tr>
<tr>
<th>관심상품</th>
<td>
<input type="checkbox" name="goods" value="의류">의류
<input type="checkbox" name="goods" value="식료품">식료품
<input type="checkbox" name="goods" value="컴퓨터">컴퓨터
<input type="checkbox" name="goods" value="공산품">공산품
<input type="checkbox" name="goods" value="관광">관광
<input type="checkbox" name="goods" value="전자제품">전자제품
<input type="checkbox" name="goods" value="건강제품">건강제품
<input type="checkbox" name="goods" value="운동기구">운동기구
</td>
</tr>
<tr>
<td colspan="2" id="td1">
<input type="button" value="등록" onclick="check()">
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