<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>
  $(function () {
	  
	  var docIdVal = '${docId}';
	  
	  $.ajax({
			url : '/Chart/Age',
			type: 'GET',
			data: {'docId' : docIdVal},
			datatype: 'json',
			success : function(datas) {
					
				var labelData = [];
				var grdData = [];
				
				
					$.each(datas, function(index, item){
						
						labelData.push(item.str);
						grdData.push(item.cntGrdScore);

					    //-------------
					    //- DONUT CHART -
					    //-------------
					    // Get context with jQuery - using jQuery's .get() method.
					    
					});
					
					var donutChartCanvas = $('#donutChart').get(0).getContext('2d')
				    var donutData        = {
				      labels: 
				    	  labelData
				      ,
				      datasets: [
				        {
				          data: grdData,
				          backgroundColor : ['#f56954', '#00a65a', '#f39c12', '#00c0ef', '#3c8dbc', 'red'],
				        }
				      ]
				    }
				    var donutOptions     = {
				      maintainAspectRatio : false,
				      responsive : true,
				    }
				    //Create pie or douhnut chart
				    // You can switch between pie and douhnut using the method below.
				    var donutChart = new Chart(donutChartCanvas, {
				      type: 'doughnut',
				      data: donutData,
				      options: donutOptions      
				    })
			}, 
				error : function(xhr) {
					alert('차트데이터'+ xhr.status + '' + xhr.textStatus);
				}
			});
	  
   
  });
</script>