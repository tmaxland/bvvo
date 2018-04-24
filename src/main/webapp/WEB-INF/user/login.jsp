<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Login Page</title>
</head>
<body>
	<center>
		<br />
		<br />
		<br />
		<br />
		<table border=0>
			<tr>
				<td colspan="2" style="text-align: right;"><a href="../index.jsp">home</a>&nbsp&nbsp<a href="register.html">register </a></td>
			</tr>
			<tr>
				<td colspan=2><a><b>Kindly Enter your Login Details</b></a></td>
			</tr>
			<form:form modelAttribute="user" method="post">
				<tr>
					<td><a>Email: </td>
					<td><input type="text" name="email" size="30" /></a></td>
				</tr>
				<tr>
					<td><a>Password: </td>
					<td><input type="password" name="password" size="30" /></td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: right;"><input
						type="submit" value="login" name="login" /></td>
				</tr>

			</form:form>
		</table>
		${comment}
		<br />
		<br /> <a href="../index.jsp">searchLawyers</a>

	</center>



</body>
</html>