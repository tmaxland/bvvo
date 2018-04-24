<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<

<head>
<meta charset="utf-8">
<title>Bvvo</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
   <!-- headers for 5 star -->
   <link rel="stylesheet" href="../star/jquery.rating.css">
        <script src="../star/jquery.js"></script>
        <script src="../star/jquery.rating.js"></script>
        
<!-- Le styles -->
<link href="../assets/css/bootstrap.css" rel="stylesheet">
<link href="../assets/css/style.css" rel="stylesheet">
<link href='http://fonts.googleapis.com/css?family=Roboto' rel='stylesheet' type='text/css'>
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
		 <div class="span12"> 
		<div class="span2"></div>
		<div class="span8">
		<table class="table" border='1'>
			<br>
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
			<!-- check for profile image  -->				
				
				<c:choose>			
				<c:when test = "${empty lawyer.image}">
				<tr>
					<td colspan="2"> <img src ="http://www.thereportersacademy.com/sites/default/files/imagecache/profile-picture/imagefield_default_images/default_profile.jpg"></img></td>
				<tr>
				</c:when>
				
				<c:otherwise>				
				<tr>
					<td colspan="2"> <img src ="/bvvo/user/getImage.html?id=${lawyer.id}"></img></td>
				<tr>
				</c:otherwise>
				</c:choose>
				
				
				 <%-- <td> <img src ="/bvvo/user/getImage2.html?id=${lawyer.id}"></img></td> --%> 
			</tr>
				</tr>
						<td>First Name:</td>
						<td>${lawyer.firstName}</td>
			</tr>
			<tr>
				<td>Last Name:</td>
				<td>${lawyer.lastName}</td>
			</tr>
			<tr>
				<td>Email:</td>
				<td>${lawyer.email}</td>
			</tr>
			<tr>
				<td>Address:</td>
				<td>${lawyer.streetAddress} ${lawyer.city} ${lawyer.state}
					${lawyer.zipCode}</td>
			</tr>

			<tr>
				<td>Area of Expertise</td>
				<td>${lawyer.areaExpertise}</td>
			</tr>
			<tr>
				<td>Year Started:</td>
				<td>${lawyer.yearStarted}</td>
			</tr>
			<tr>
				<!-- this should only be available to users and not lawyers -->
				 <security:authorize access="hasRole('ROLE_USER') "> 
				<td colspan="2"><a href="addReview.html?lawyerId=${lawyer.id}">Add Review</href></td>
				</security:authorize> 
			</tr>

		</table>
		

		<br> <b><a>Reviews of lawyer</b></a> <br>
		
<!-- <input name="star2" type="radio" class="star"/>
<input name="star2" type="radio" class="star"/>
<input name="star2" type="radio" class="star" checked="checked"/>
<input name="star2" type="radio" class="star"/>
<input name="star2" type="radio" class="star"/>
 -->		
		<table class="table" border="1">
			<c:forEach items="${reviews}" var="input">
				<tr>
					<td style="vertical-align: top;"><b> ${input.title}</b></a><br>${input.reviewDescription}</td>
					<td>
						<b> Ratings</b> 
						<br>Knowledge
						<br>
						<c:forEach begin = "1" end ="${input.ratingKnowledge }">
						<img src="../star/redStar.png" alt="noimage" />
						</c:forEach>
						
						<%-- <br><input type="radio" class="star" value ="${input.ratingKnowledge}"/> --%>
						<%-- ${input.ratingKnowledge} --%>
						
						<br>Service 
						<%-- <br><input type="radio" class="star" checked="${input.ratingService}"/> --%>
						<br>
						<c:forEach begin = "1" end ="${input.ratingService }">
						<img src="../star/redStar.png" alt="noimage" />
						</c:forEach>
						<%-- ${input.ratingService} --%>
						
								
						<br>Overall
						<%-- <br><input type="radio" class="star" checked="${input.ratingOverall}"/> --%>
						<br>
						<c:forEach begin = "1" end ="${input.ratingOverall }">
						<img src="../star/redStar.png" alt="noimage" />
						</c:forEach>

						<%-- ${input.ratingOverall} --%>
					</td>
						
						<!-- this should be only visible if logged in user = review user id -->
						<!--ie if current logged in username(id) is ${input.user.userName} then show edit-->
						
						<sec:authorize access="((isAuthenticated() and principal.username == '${input.user.userName}') or hasRole('ROLE_ADMIN')) ">
						 	<td><a href="editReview.html?reviewId=${input.id}">edit</a></td>
							</sec:authorize>
				</tr>
						<td colspan="3"> review by  ${input.user.userName}</td>
						
				</tr>
				
			</c:forEach>

		</table>
	
		</div>
		<div class="span2"></div>
		</div>
		
		<br> <br />back to search <a href="../user/search.html">searchLawyers</a>
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
