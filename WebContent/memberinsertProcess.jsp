<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="DBConn.jsp" %>
<%
request.setCharacterEncoding("utf-8");
PreparedStatement pstmt=null;
String goods[]=request.getParameterValues("goods");
String goodssum="";
try{
	String sql="insert into member0607 values(?,?,?,?,?,?,?,?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, request.getParameter("custno"));
			pstmt.setString(2, request.getParameter("custname"));
			pstmt.setString(3, request.getParameter("phone"));
			pstmt.setString(4, request.getParameter("address"));
			pstmt.setString(5, request.getParameter("joindate"));
			pstmt.setString(6, request.getParameter("grade"));
			pstmt.setString(7, request.getParameter("city"));
			for(int i=0;i<goods.length;i++){
				if(i==0){
					goodssum=goods[i];
				}else{
					goodssum+=","+goods[i];
				}
			}
				pstmt.setString(8, goodssum);
				pstmt.executeUpdate();
				System.out.println("저장성공");
			
}catch(SQLException e){
	e.printStackTrace();
	System.out.println("저장실패");
}
%>
</body>
</html>