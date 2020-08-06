<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
  src="https://code.jquery.com/jquery-3.5.1.min.js"
  integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
  crossorigin="anonymous"></script>
<style>
   .box {  border:1px solid black;
       margin:5px;
   }
</style>
<script>

var keywordGet = '<%= (String)request.getParameter("keyword")%>'
//alert(keywordGet);

$(function(){
	
    $.ajax({
    		url : '/search',
    		type : 'get',
    		dataType : "json",
    		data : { keyword: keywordGet },
			  success : function(data) {
				  console.log(data.items);
				  var v1 = data.items[0].title; //강철비정상회담 제목나옴
				  //alert(JSON.stringify(v1));
				  
				  var list = data.items;
				  //alert(JSON.stringify(list));
				  //var dataList = JSON.stringify(data);
				  //console.log(dataList);
				  //var list = JSON.parse(dataList);
				  //console.log(list);
				  //alert(list);
				  var html     = '';
				  $.each(list, function(index, item) {
					 	html += '<div>';
						html += '<a href="#"><img src="' + item.image + '"/></a>';
		               	html += '<p>제목 : ' + item.title + '</p>';
		                html += '<p>감독 : ' + item.director + '</p>';
		                html += '<p>배우 : ' + item.actor + '</p>';
		                html += '</div><hr>';
		                
					}); 
				  $('#div1').html(html);
			  },
			  error    : function(xhr) {
				  alert(xhr.status + '' + xhr.textStatus);
			  }
		  });
	  });
</script>
</head>
<body>
	<div id=div1>
	</div>
</body>
</html>