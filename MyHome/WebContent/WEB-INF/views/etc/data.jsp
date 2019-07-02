<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Home</title>
<%@ include file="/inc/asset.jsp" %>
<script src="/myhome/asset/js/highcharts.js"></script>
<style>

</style>
<script>

	$(function() {
		
	});
	
	
	function getData() {
		var id = event.srcElement.value;
		//alert(id);
		
		$.ajax({
			type: "GET",
			url: "/myhome/etc/dataok.do",
			dataType: "json",
			data: "id=" + id,
			success: function(result) {
				/*
				result = {
						"cnt1": "126",
						"cnt2": "0"
						}
				*/
				
				//alert(result.cnt1);
				//alert(result.cnt2);
				
				
				Highcharts.chart('chart2', {
				    chart: {
				        plotBackgroundColor: null,
				        plotBorderWidth: null,
				        plotShadow: false,
				        type: 'pie'
				    },
				    title: {
				        text: ''
				    },
				    tooltip: {
				        pointFormat: '{series.name}: <b>{point.y}개</b>'
				    },
				    plotOptions: {
				        pie: {
				            allowPointSelect: true,
				            cursor: 'pointer',
				            dataLabels: {
				                enabled: true,
				                format: '<b>{point.name}</b>: {point.y}개',
				                style: {
				                    color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
				                }
				            }
				        }
				    },
				    series: [{
				        name: '게시물 수',
				        colorByPoint: true,
				        data: [
				        
				        {
				            name: '게시물 수',
				            y: parseInt(result.cnt1)
				        },
				        
				        {
				            name: '댓글 수',
				            y: parseInt(result.cnt2)
				        }
				        
				        ]
				    }]
				});
				
				
				
				
			},
			error: function(a,b,c) {
				console.log(a,b,c);
			}
		});
		
	}
	
</script>
</head>
<body>
	<!-- views > etc > data.jsp -->
	<div id="main">
		<jsp:include page="/inc/header.jsp"></jsp:include>
		<section id="detail">
			
			<h2 class="page-header">유저별 등록 게시물 수</h2>
			
			<div id="chart1"></div>
			
			
			
			<h2 class="page-header">특정 회원 등록 게시물/댓글 수</h2>
			
			<select name="sel2" id="sel2" class="form-control" style="width: 150px; margin-left: 50px;" onchange="getData();">
				<c:forEach items="${mlist}" var="mdto">
				<option value="${mdto.id}">${mdto.name}(${mdto.id})</option>
				</c:forEach>
			</select>
			
			<div id="chart2"></div>
			
		</section>
	</div>

	
	<script type="text/javascript">
		Highcharts.chart('chart1', {
		    chart: {
		        plotBackgroundColor: null,
		        plotBorderWidth: null,
		        plotShadow: false,
		        type: 'pie'
		    },
		    title: {
		        text: ''
		    },
		    tooltip: {
		        pointFormat: '{series.name}: <b>{point.y}개</b>'
		    },
		    plotOptions: {
		        pie: {
		            allowPointSelect: true,
		            cursor: 'pointer',
		            dataLabels: {
		                enabled: true,
		                format: '<b>{point.name}</b>: {point.y}개',
		                style: {
		                    color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
		                }
		            }
		        }
		    },
		    series: [{
		        name: '게시물 수',
		        colorByPoint: true,
		        data: [
		        
		        <c:forEach items="${list1}" var="dto1">
		        {
		            name: '${dto1.name}',
		            y: ${dto1.cnt}
		        }
		        ,
		        </c:forEach>
		        
		        ]
		    }]
		});
		
		
		Highcharts.chart('chart2', {
		    chart: {
		        plotBackgroundColor: null,
		        plotBorderWidth: null,
		        plotShadow: false,
		        type: 'pie'
		    },
		    title: {
		        text: ''
		    },
		    tooltip: {
		        pointFormat: '{series.name}: <b>{point.y}개</b>'
		    },
		    plotOptions: {
		        pie: {
		            allowPointSelect: true,
		            cursor: 'pointer',
		            dataLabels: {
		                enabled: true,
		                format: '<b>{point.name}</b>: {point.y}개',
		                style: {
		                    color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
		                }
		            }
		        }
		    },
		    series: [{
		        name: '게시물 수',
		        colorByPoint: true,
		        data: [
		        
		        {
		            name: '게시물 수',
		            y: ${list2.get(0).cnt1}
		        },
		        
		        {
		            name: '댓글 수',
		            y: ${list2.get(0).cnt2}
		        }
		        
		        ]
		    }]
		});
	</script>
	
</body>
</html>











