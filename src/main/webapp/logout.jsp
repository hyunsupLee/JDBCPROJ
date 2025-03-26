<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Logout Page</title>
</head>
<body>
    <h2>로그아웃 중입니다...</h2>
    
    <%
        if (session != null) {
        	session.removeAttribute("user_id");
        	session.removeAttribute("grade");
        	session.removeAttribute("name");
        }
    
        response.sendRedirect("main.jsp");
        
        
     	// 로그인 세션 정보저장
    	//session.setAttribute("user_id", "1");
    	//session.setAttribute("grade", "admin");
    	//session.setAttribute("grade", "customer");
    	//session.setAttribute("name", "jdbcproj");
    %>
</body>
</html>