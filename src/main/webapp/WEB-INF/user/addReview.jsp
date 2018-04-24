
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<head>
<meta charset="utf-8">
<title>Add Review</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

        <link rel="stylesheet" href="../star/jquery.rating.css">
        <script src="../star/jquery.js"></script>
        <script src="../star/jquery.rating.js"></script>

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
		<br /> <br />
		<table border="1">
		<form:form modelAttribute="review" >
			<%-- <img src ="/bvvo/user/getImage.html?id=${lawyer.id}"></img> --%>
			
		 	<td><form:hidden  path="user.id"  value="${userId}" /> </td>  
		 	<td><form:hidden  path="lawyer.id" value="${param.lawyerId}" /></td>
			<td><form:hidden  path="enabled" value="${true}" /></td>
  
			<tr>
				<td colspan="2" style="text-align: right;"><b>add a review
				</b></td>
			</tr>
			<tr>

				<td>Enter a title for your Review</td>
				<td> <form:input path ="title" size="40" /> </td>
			</tr>
			<tr>
				<td style="vertical-align: top">Enter your Review</td>
				 <td> <form:textarea path ="reviewDescription"  rows="5" cols ="30"  /> </td> 
			</tr>
			<tr>
				<td colspan="2" style="text-align: left;">Add your ratings</td>
			</tr>
			<tr>
				<td>Knowledge</td>
				
				<td>			
				<br><form:radiobutton path="ratingKnowledge" name="rating" value="1" class="star" />
				<form:radiobutton path="ratingKnowledge" name="rating" value="2" class="star" />
				<form:radiobutton path="ratingKnowledge" name="rating" value="3" class="star" />
				<form:radiobutton path="ratingKnowledge" name="rating" value="4" class="star" />
				<form:radiobutton path="ratingKnowledge" name="rating" value="5" class="star" />
				</td>
<%-- 				<td>
					1 <form:radiobutton path="ratingKnowledge" value="1"/>
					2<form:radiobutton path="ratingKnowledge" value="2"/>
					3<form:radiobutton path="ratingKnowledge" value="3"/>
					4<form:radiobutton path="ratingKnowledge" value="4"/>
					5<form:radiobutton path="ratingKnowledge" value="5"/>
				</td>
 --%>				
				<tr>
				<td>Service</td>
				
				<td>			
				<br><form:radiobutton path="ratingService" name="rating" value="1" class="star" />
				<form:radiobutton path="ratingService" name="rating" value="2" class="star" />
				<form:radiobutton path="ratingService" name="rating" value="3" class="star" />
				<form:radiobutton path="ratingService" name="rating" value="4" class="star" />
				<form:radiobutton path="ratingService" name="rating" value="5" class="star" />
				</td>
				
			<%-- 	<td>
					1 <form:radiobutton path="ratingService" value="1"/>
					2<form:radiobutton path="ratingService" value="2"/>
					3<form:radiobutton path="ratingService" value="3"/>
					4<form:radiobutton path="ratingService" value="4"/>
					5<form:radiobutton path="ratingService" value="5"/>
				</td>
			 --%>	</tr>
				<tr>
				<td>Overall</td>
				<td>			
				<br><form:radiobutton path="ratingOverall" name="rating" value="1" class="star" />
				<form:radiobutton path="ratingOverall" name="rating" value="2" class="star" />
				<form:radiobutton path="ratingOverall" name="rating" value="3" class="star" />
				<form:radiobutton path="ratingOverall" name="rating" value="4" class="star" />
				<form:radiobutton path="ratingOverall" name="rating" value="5" class="star" />
				</td>
				<%-- <td>
					1 <form:radiobutton path="ratingOverall" value="1"/>
					2<form:radiobutton path="ratingOverall" value="2"/>
					3<form:radiobutton path="ratingOverall" value="3"/>
					4<form:radiobutton path="ratingOverall" value="4"/>
					5<form:radiobutton path="ratingOverall" value="5"/>
				</td> --%>
				</tr>
				
			<tr>
				<td colspan="2" style="text-align: right;"><input type="submit"
					name="finish" value="finish"></td>
			</tr>

		</form:form>
			</table>

		<br />back to view<a href="lawyers.html"> Lawyers</a> <br /> <a
			href="search.html">searchLawyers</a>


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
