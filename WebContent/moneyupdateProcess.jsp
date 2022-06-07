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
try{
	String sql="update money0607 set saleno=?,pcost=?,amount=?,price=?,pcode=?,sdate=? where custno=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(7, request.getParameter("custno"));
			pstmt.setString(1, request.getParameter("saleno"));
			pstmt.setString(2, request.getParameter("pcost"));
			pstmt.setString(3, request.getParameter("amount"));
			pstmt.setString(4, request.getParameter("price"));
			pstmt.setString(5, request.getParameter("pcode"));
			pstmt.setString(6, request.getParameter("sdate"));
			
				pstmt.executeUpdate();
				System.out.println("저장성공");
			
}catch(SQLException e){
	e.printStackTrace();
	System.out.println("저장실패");
}
%>
</body>
</html>