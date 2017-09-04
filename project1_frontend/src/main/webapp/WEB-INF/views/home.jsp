<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>UniverCell</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
	
<style type="text/css">
p{
font-family: "Lucida Sans Unicode", "Lucida Grande", "sans-serif";
}
li{
font-family: "Lucida Sans Unicode", "Lucida Grande", "sans-serif";
}

.bg1 {
	background-color: #2f2f2f;
	color: #ffffff;
	height: 700px;
}

h3, p {
	font-family: Raleway;
	margin: 0 auto;
	padding: 0.8em 2em;
}
</style>
</head>
<body bgcolor="#ffffcc">
<%@include file="header.jsp" %>
<br>
<br>
<div id="myCarousel" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    <li data-target="#myCarousel" data-slide-to="1"></li>
    <li data-target="#myCarousel" data-slide-to="2"></li>
    <li data-target="#myCarousel" data-slide-to="3"></li>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox">
    <div class="item active">
      <img class="img-responsive center-block" src="images/imgaug2.png" alt="first" id="img">

    </div>

    <div class="item">
      <img class="img-responsive center-block" src="images/imgaug14.png" alt="second" id="img">

    </div>

    <div class="item">
      <img class="img-responsive center-block" src="images/imgaug1.png" alt="third" id="img">
      
    </div>

    <div class="item">
      <img class="img-responsive center-block" src="images/imgaug10.png" alt="fourth" id="img">
      
    </div>
    
  </div>

  <!-- Left and right controls -->
  <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
<br>

<div id="coming-soon">
    <p align="center" style="font-size: 37px; color: purple;font-family:Kaushan Script; ">At UniverCell we have:</p><br>
    <div class="row">
        <div class="col-md-4">
            <div class="thumbnail">
                <img src="images/smarttablet1.jpg">
            </div>
        </div>
        <div class="col-md-4">
            <div class="thumbnail">
                <img src="images/smartphone1.jpg">
            </div>
        </div>
        <div class="col-md-4">
            <div class="thumbnail">
                <img src="images/best.jpg">
            </div>
        </div>
        
    </div>
</div>

	<div class="container">
		<div class="jumbotron">
			<div class="row">
<p align="center" style="font-size: 37px; font-family:Kaushan Script;">Welcome to get latest technology and products here</p><br><br>

<h3><u>Why Online shopping ?</u></h3>
<p>It's no longer just the privilege of a metro city or an urban area to shop online for their favorite products. 
UniverCell is one online shopping site that has made it possible for consumers even in the remote areas of India to avail products from the best brands at low prices online.
Considering the present lifestyle of people, it's no surprise that they prefer to buy online most of the products that they need on a daily basis like  electronics, mobiles, home appliances.
The ultimate convenience of having to simply browse through their favorite online shopping website and place orders from the comfort of their home, and get it delivered in the shortest time possible at their doorstep is a service that is unbeatable.
  </p>
 <br>
 <h3><u>The perks of shopping at UniverCell.</u></h3>

  <p>UniverCell has partnered with several global marquee investors and individuals such as SoftBank, BlackRock, Temasek, Foxconn, Alibaba, eBay Inc., Premji Invest, Intel Capital, Bessemer Venture Partners, Mr. Ratan Tata, among others</p>
  <p>Apart from delivering your products on time we firmly believe in providing quality and service.
  If due to some error in the delivering process you receive a sub-standard or a different product,we have the easy and user-friendly return policies and a competent servicing personnel </p>
<p>Buying an electronic item or any other product with a lot specifications to follow might not always be an easy task. We care for our customers and hence, we have prepared simple, easy-to-follow buying guides for many products. 
Guides like 'How to buy a smart phone online', 'How to buy any accessory online?',and many more are designed using videos as well as transcripts
 so that the customer makes an easy purchase, avoiding all complexities involved.</p>
</div>
</div>
</div>


</body>
</html>
<%@include file="footer.jsp" %>
