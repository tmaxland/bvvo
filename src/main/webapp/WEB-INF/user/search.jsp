
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<head>
<meta charset="utf-8">
<title>Bvvo</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<!-- Le styles -->
<link href="../assets/css/bootstrap.css" rel="stylesheet">
<style>
body {
	padding-top: 60px;
	/* 60px to make the container go all the way to the bottom of the topbar */
}
</style>
<link href="../assets/css/bootstrap-responsive.css" rel="stylesheet">

<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
      <script src="./assets/js/html5shiv.js"></script>
    <![endif]-->

<!-- Fav and touch icons -->
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="./assets/ico/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="./assets/ico/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="./assets/ico/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed"
	href="./assets/ico/apple-touch-icon-57-precomposed.png">
<link rel="shortcut icon" href="./assets/ico/favicon.png">
</head>

<body>

	<div class="container">
		<center>
			<br>
			<table border='0'>
				<tr>
						<td>
						<a href= "../" ><img alt="logo" src="../assets/img/bvvologosmall.png" /></a>
						</td>
						<td colspan="2" style="text-align: right;">
			
							<sec:authorize access="hasRole('ROLE_ADMIN') or hasRole('ROLE_USER') or hasRole('ROLE_LAWYER')">
							<a> <%= request.getUserPrincipal().getName() %> |</a>
							<a href="../">home</a>
						 	<a href="../j_spring_security_logout">logout</a>
							</sec:authorize>
					
							<sec:authorize access="hasRole('ROLE_ANONYMOUS')">
							<a href="../">home</a>
					 		<a href="../spring_security_login">login</a>
					
							</sec:authorize>
						</td>		
					</tr>

				<form:form modelAttribute="user" method="post">
					<tr>
						<td colspan="2" style="text-align: right;"><h4>Find a
								Lawyer</h4></td>
						<br>
						<br>
						<br>
					</tr>

					<tr>
						<td style="text-align: right;">Name</td>
						<td><input type="text" name="searchByName" size="40"></td> 
					<%-- 	<form:input path="firstName" size="35" /> --%>
					</tr>
					<tr>
						<td style="text-align: right;">City, State</td>
						<td><input type="text" name="searchByCityState" size="40"></td>
					</tr>
					<tr>
						<td style="text-align: right;">Zip Code</td>
						<td><input type="text" name="searchByZipCode" size="40"></td>
					</tr>

					<tr>
						<td style="text-align: right;">Area of expertise</td>
						<td><input type="text" name="searchByExpertise" size="40"></td>
					</tr>

					<tr>
						<td style="text-align: right;">Search by Review</td>
						<td><input type="text" name="searchByReview" size="40"></td>
					</tr>
 
					<tr>
						<td colspan="2" style="text-align: right;"><input
							type="submit" name="submit" value="Search Lawyer"></td>
					</tr>
			</table>
			</form:form>

			<br> <a href="lawyers.html">View</a> Lawyers in our Database <br>
		</center>
	</div>
	<!-- /container -->

	<!-- Le javascript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="./assets/js/jquery.js"></script>
	<script src="./assets/js/bootstrap-transition.js"></script>
	<script src="./assets/js/bootstrap-alert.js"></script>
	<script src="./assets/js/bootstrap-modal.js"></script>
	<script src="./assets/js/bootstrap-dropdown.js"></script>
	<script src="./assets/js/bootstrap-scrollspy.js"></script>
	<script src="./assets/js/bootstrap-tab.js"></script>
	<script src="./assets/js/bootstrap-tooltip.js"></script>
	<script src="./assets/js/bootstrap-popover.js"></script>
	<script src="./assets/js/bootstrap-button.js"></script>
	<script src="./assets/js/bootstrap-collapse.js"></script>
	<script src="./assets/js/bootstrap-carousel.js"></script>
	<script src="./assets/js/bootstrap-typeahead.js"></script>

</body>
</html>
