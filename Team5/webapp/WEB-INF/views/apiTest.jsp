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
<script>
  $(function() {
		  alert('haha')
		  $.ajax({
			  url      : '/search',
			  data     : { keyword : $('#keyword').val() },
			  method   : 'GET',
			  datatype : 'json',
			  success : function(data) {
				  console.log(data);
				  var dataList = JSON.parse(data); 
				  alert(dataList);
				  var items    = dataList.items;
				  var html     = '';
				  $.each(items, function(index, item) {
					 	html += '<div>';
						html += '<a href="#"><img class="poster" src="' + item.image + ' /></a>';
		               	html += '<p>' + items.title + '</p>';
		                html += '<p>' + items.director + '</p>';
		                html += '<p>' + items.actor + '</p>';
		                html += '</div>';
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
	<%= request.getParameter("keyword") %>
	<div id="div1"></div>
</body>
</html>