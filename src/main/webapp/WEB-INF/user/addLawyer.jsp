<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>




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
	
		<form:form modelAttribute="lawyer" method="post" enctype="multipart/form-data">
			<br />
			<br />
			<table border='1'>
				<tr>
					<td colspan="2" style="text-align: right;"><b>welcome new
							lawyer registration</b></td>
				</tr>
				<td><form:hidden  path="enabled" value="${true}" /></td>
			<tr>
					<td>Username:</td>
					<td><form:input path="userName" size="35" /></td>

				</tr>

				<tr>
					<td>Email:</td>
					<td><form:input path="email" size="35" /></td>

				</tr>
				<tr>
					<td>Password:</td>
					<td><form:input path="password" size="35" /></td>
				</tr>
				<tr>
					<td>First Name:</td>
					<td><form:input path="firstName" size="35" /></td>
				</tr>
				<tr>
					<td>Last Name:</td>
					<td><form:input path="lastName" size="35" /></td>
				</tr>
				<tr>
					<td>Street Address:</td>
					<td><form:input path="streetAddress" size="35" /></td>
				</tr>
				<tr>
					<td>City:</td>
					<td><form:input path="city" size="35" /></td>
				</tr>
				<tr>

					<td>State:</td>
					<td><form:input path="state" size="35" /></td>
				</tr>

				<tr>
					<td>ZipCode:</td>
					<td><form:input path="zipCode" size="35" /></td>

				<tr>
				<tr>
					<td>Area Expertise:</td>
					<td><form:radiobutton path="areaExpertise" value="Business Law"/>Business Law 
					<br><form:radiobutton path="areaExpertise" value="Criminal Law"/>Criminal Law 
					<br><form:radiobutton path="areaExpertise" value="Family Law"/>Family Law 
					<br><form:radiobutton path="areaExpertise" value="Immigration Law"/>Immigration Law 
					</td>
				<tr>
					<tr>
					<td>Year started:</td>
					<td><form:input path="yearStarted" size="35" /></td>

				<tr>
				<!-- Upload profile image -->
					<tr>
					<td> 
				Upload Image: 
					</td>
					<td>
					<input type="file" name="file"  /> <br />
					</td>
				</tr>
				
					<td colspan="2" style="text-align: right;"><input
						type="submit" name="add" value="Add" />
						
				</tr>
			</table>
		</form:form>

		<br> <a href="../index.jsp">searchLawyers</a>${comment}


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
