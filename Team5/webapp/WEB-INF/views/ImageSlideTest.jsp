<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>ImageSliderTest</title>
  <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/lib/w3.css">
<body>

<div class="w3-content" style="max-width:800px;position:relative">

<div class="w3-display-container mySlides">
  <img src="/img/Aha.jpg" style="width:100%">
  <div class="w3-display-bottomleft w3-large w3-container w3-padding-hor-16 w3-black">
    Trolltunga, Norway
  </div>
</div>

<div class="w3-display-container mySlides">
  <img src="/img/bank.jpg" style="width:100%">
  <div class="w3-display-bottomright w3-large w3-container w3-padding-hor-16 w3-black">
    Northern Lights, Norway
  </div>
</div>

<div class="w3-display-container mySlides">
  <img src="/img/ready.jpg" style="width:100%">
  <div class="w3-display-topleft w3-large w3-container w3-padding-hor-16 w3-black">
    Beautiful Mountains
  </div>
</div>

<div class="w3-display-container mySlides">
  <img src="/img/PosterReady.jpg" style="width:100%">
  <div class="w3-display-topright w3-large w3-container w3-padding-hor-16 w3-black">
    The Rain Forest
  </div>
</div>

<div class="w3-display-container mySlides">
  <img src="/img/User.jpg" style="width:100%">
  <div class="w3-display-middle w3-large w3-container w3-padding-hor-16 w3-black">
    Mountains!
  </div>
</div>

<a class="w3-btn-floating w3-hover-dark-grey" style="position:absolute;top:52%;left:0;" onclick="plusDivs(-1)"><img src="/img/leftBtn.jpg" alt="leftBtn" style="width:50px; height:50px;"/></a>
<a class="w3-btn-floating w3-hover-dark-grey" style="position:absolute;top:52%;right:0;" onclick="plusDivs(1)"><img src="/img/leftBtn.jpg" alt="righttBtn" style="width:50px; height:50px; transform:scaleX(-1);"/></a>

</div>

<script>
var slideIndex = 1;
showDivs(slideIndex);

function plusDivs(n) {
  showDivs(slideIndex += n);
}

function showDivs(n) {
  var i;
  var x = $(".mySlides");
  if (n > x.length) {slideIndex = 1}    
  if (n < 1) {slideIndex = x.length} ;
  for (i = 0; i < x.length; i++) {
     x[i].style.display = "none";  
  }
  x[slideIndex-1].style.display = "block";  
}
</script>

</body>
</body>
</html>