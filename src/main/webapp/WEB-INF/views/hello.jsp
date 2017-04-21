<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>


	<!--  Here is where I take in the header across all pages -->
	<jsp:include page='header_footer.jsp'></jsp:include>
<html>	
	<title>Hello!</title>
<body> 
<div>
	<h2>Hello, ${nameFromController}. Welcome to Spring MVC!</h2>
    <%@ page isELIgnored="false"%>
</div>
    
    

</body>
</html>