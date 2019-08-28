<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<html>

<head>
<title>Home</title>
<style>
.no-js #loader {
	display: none;
}

.js #loader {
	display: block;
	position: absolute;
	left: 100px;
	top: 0;
}

.se-pre-con {
	position: fixed;
	left: 0px;
	top: 0px;
	width: 100%;
	height: 100%;
	z-index: 9999;
	background: url(${root}/resources/images/Preloader_3.gif) center no-repeat #fff;
	opacity: .8;
}
</style>

</head>
<body>

	<!-- Paste this code after body tag -->
	<div class="se-pre-con"></div>
	<!-- Ends -->
	
</body>

<script type="text/javascript">
	$(window).load(function() {
		// Animate loader off screen
		$(".se-pre-con").fadeOut("slow");
	});

	$('#btnSubmit').click(function() {
		$(".se-pre-con").show();
	});
</script>
</html>
