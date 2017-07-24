<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<title>Insert title here</title>
</head>
<body>
	<div class="container-fluid">
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
				<li data-target="#myCarousel" data-slide-to="3"></li>
			</ol>
			<div class="carousel-inner" role="listbox">
				<div class="item active">
					<img class="first-slide home-image"
						src="resources/images/0.jpg" alt="first slide" />
					<div class="container">
						<div class="carousel-caption">
							<h1>WELCOME TO THE CAR STORE</h1>
							<p>Here You Can Browse And Buy Cars. Order Now Fr Your
								Amazing New Arrivals</p>
						</div>
					</div>
				</div>

				<div class="item">
					<img class="second-slide home-image"
						src="resources/images/1.jpg" alt="second slide" />
					<div class="container">
						<div class="carousel-caption">
							<h1>THE CAR YOU LOVE</h1>
							<p>Here You Can Browse And Buy Cars. Order Now Fr Your
								Amazing New Arrivals</p>
						</div>
					</div>
				</div>

				<div class="item">
				<c:url value="/resources/images/2.jpg" var="url"></c:url>
					<img class="third-slide home-image" src="${url}" alt="third slide" />
					<div class="container">
						<div class="carousel-caption">
							<h1>THE CAR OF DREAMS</h1>
							<p>Here You Can Browse And Buy Cars. Order Now Fr Your
								Amazing New Arrivals</p>
						</div>
					</div>
				</div>

				<div class="item">
					<img class="forth-slide home-image" src="resources/images/3.jpg" alt="fourth slide" />
					<div class="container">
						<div class="carousel-caption">
							<h1>THE CAR EVERYONE WANT</h1>
							<p>Here You Can Browse And Buy Cars. Order Now Fr Your
								Amazing New Arrivals</p>
						</div>
					</div>
				</div>
			</div>
			<a class="left carousel-control" href="#myCarousel" role="button" data-slide="left">
			<span class="glyphicon glyphicon-chevron-left"></span>
			<span class="sr-only">Previous</span>
			</a>
			<a class="right carousel-control" href="#myCarousel" role="button" data-slide="right">
			<span class="glyphicon glyphicon-chevron-right"></span>
			<span class="sr-only">Next</span>
			</a>
		</div><!-- / carousel -->
	</div>
</body>
</html>
<%@ include file="footer.jsp"%>