<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<%@ include file="/inc/asset.jsp" %>
<style>
	#chart1 { width: 1200px; height: 600px; }
</style>
<script src="/myhome/asset/js/highcharts.js"></script>
<script src="/myhome/asset/js/series-label.js"></script>
<script>

	$(function() {
		
	});
	
</script>
</head>
<body>
	<!-- chart.jsp -->
	<div class="container">
		<h1>차트</h1>
		
		<div id="chart1"></div>
		
		<hr>
		
		<table id="tbl1" class="table table-bordered">
			<tr>
				<th>입사월</th>
				<c:forEach items="${list}" var="dto">
				<td style="text-align: right;">${dto.mon}월</td><!-- x 12개 -->
				</c:forEach>
			</tr>
			<tr>
				<th>인원수</th>
				<c:forEach items="${list}" var="dto">
				<td style="text-align: right;">${dto.cnt}명</td><!-- 12개 -->
				</c:forEach>
			</tr>
		</table>
		
		
	</div>
	
	
	
	
	<script type="text/javascript">
		
		<%--
		Highcharts.chart('chart1', {
		
		    title: {
		        text: '입사월별 사원수'
		    },
		
		    yAxis: {
		        title: {
		            text: '사원수'
		        }
		    },
		    legend: {
		        layout: 'vertical',
		        align: 'right',
		        verticalAlign: 'middle'
		    },
		
		    plotOptions: {
		        series: {
		            label: {
		                connectorAllowed: false
		            },
		            pointStart: 1
		        }
		    },
		
		    series: [
		    	{
			        name: '모든 부서',
			        data: [
			        	<c:forEach items="${list}" var="dto" varStatus="status">
			        	${dto.cnt}
			        	<c:if test="${status.index < list.size() - 1}">
			        	,
			        	</c:if>
			        	</c:forEach>
			        ]
		    	} //모든 부서 객체
		    	
		    	/* 부서별 루프 */
		    	<c:forEach items="${listAll}" var="slist">
		    	,
		    	{
		    		name: "${slist.get(0).buseo}",
		    		data: [
		    			<c:forEach items="${slist}" var="sdto" varStatus="sstatus">
		    			${sdto.cnt}
		    			<c:if test="${sstatus.index < slist.size() - 1}">
			        	,
			        	</c:if>
		    			</c:forEach>
		    		]
		    	}
		    	</c:forEach>
		    	
		    ],
		
		    responsive: {
		        rules: [{
		            condition: {
		                maxWidth: 500
		            },
		            chartOptions: {
		                legend: {
		                    layout: 'horizontal',
		                    align: 'center',
		                    verticalAlign: 'bottom'
		                }
		            }
		        }]
		    }
		
		}); 
		
		--%>
		
		Highcharts.chart('chart1', {
		    chart: {
		        type: 'spline',
		        scrollablePlotArea: {
		            minWidth: 600,
		            scrollPositionX: 1
		        }
		    },
		    title: {
		        text: '월별 입사 사원수',
		        align: 'left'
		    },
		    xAxis: {
		        type: 'number',
		        labels: {
		            overflow: 'justify'
		        }
		    },
		    yAxis: {
		        title: {
		            text: '명'
		        },
		        minorGridLineWidth: 0,
		        gridLineWidth: 0,
		        alternateGridColor: null,
		        plotBands: [{ // Light air
		            from: 0,
		            to: 2,
		            color: 'rgba(68, 170, 213, 0.1)',
		            label: {
		                text: '적음',
		                style: {
		                    color: '#606060'
		                }
		            }
		        }, { // Light breeze
		            from: 3,
		            to: 5,
		            color: 'rgba(0, 0, 0, 0)',
		            label: {
		                text: '중간',
		                style: {
		                    color: '#606060'
		                }
		            }
		        }, { // Gentle breeze
		            from: 6,
		            to: 30,
		            color: 'rgba(68, 170, 213, 0.1)',
		            label: {
		                text: '많음',
		                style: {
		                    color: '#606060'
		                }
		            }
		        }]
		    },
		    plotOptions: {
		        spline: {
		            lineWidth: 4,
		            states: {
		                hover: {
		                    lineWidth: 5
		                }
		            },
		            marker: {
		                enabled: false
		            },
		            pointInterval: 1
		        }
		    },
		    series: [
		    	{
		    		name: '모든 부서',
			        data: [
			        	<c:forEach items="${list}" var="dto" varStatus="status">
			        	${dto.cnt}
			        	<c:if test="${status.index < list.size() - 1}">
			        	,
			        	</c:if>
			        	</c:forEach>
			        ]

		    }
		    
		    	/* 부서별 루프 */
		    	<c:forEach items="${listAll}" var="slist">
		    	,
		    	{
		    		name: "${slist.get(0).buseo}",
		    		data: [
		    			<c:forEach items="${slist}" var="sdto" varStatus="sstatus">
		    			${sdto.cnt}
		    			<c:if test="${sstatus.index < slist.size() - 1}">
			        	,
			        	</c:if>
		    			</c:forEach>
		    		]
		    	}
		    	</c:forEach>
		    	
		    ],
		    navigation: {
		        menuItemStyle: {
		            fontSize: '10px'
		        }
		    }
		});
	</script>
	
	
</body>
</html>










