<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="DBConn.jsp" %>
<% 
PreparedStatement pstmt=null;
String custno=request.getParameter("custno");
ResultSet rs=null;
try{
	String sql="delete from member0607 where custno=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, custno);
	pstmt.executeUpdate();
}catch(SQLException e){
	e.printStackTrace();
}
%> 
</body>
</html>