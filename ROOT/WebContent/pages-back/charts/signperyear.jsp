<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/tlds/permission.tld" prefix="perm"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<script src="../assets/global/plugins/jquery.min.js" type="text/javascript"></script>	
<script src="../assets/global/plugins/moment.min.js" type="text/javascript"></script>
<link rel="shortcut icon" href="favicon.ico" />
<link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/2.0.1/css/toastr.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/2.0.1/js/toastr.js"></script>
<script src="../assets/global/plugins/jquery-ui/jquery-ui.min.js"></script>
<link rel="stylesheet" href="../assets/global/plugins/select2/css/select2.min.css" type="text/css" />
<script src="../assets/global/plugins/select2/js/select2.min.js" type="text/javascript"></script>
<script src="../assets/global/plugins/select2/js/select2.full.min.js" type="text/javascript"></script>
<script src="http://underscorejs.org/underscore-min.js"></script>
<c:set var="now" value="<%=new java.util.Date()%>" />
<fmt:formatDate var="year" pattern = "yyyy"  value = "${now}" />
<style>
#chartdiv {
  width: 100%;
  height: 500px;
}
#selectDP option{
color:red;
}
</style>
<script src="https://cdn.amcharts.com/lib/4/core.js"></script>
<script src="https://cdn.amcharts.com/lib/4/charts.js"></script>
<script src="https://cdn.amcharts.com/lib/4/themes/dark.js"></script>
<script src="https://cdn.amcharts.com/lib/4/themes/animated.js"></script>

<div class="portlet light bordered">

	<div class="portlet-title">

		<div class="caption">
			<i class="fa fa-calendar-check-o font-red"></i> 
			<span class="caption-subject font-red sbold uppercase">Sign and Resign Per Year Report</span>
				
		</div>
		<div class="actions">
			<a class="btn btn-circle btn-icon-only btn-default fullscreen"
				href="javascript:;" data-original-title="" title=""> </a>
		</div>
	</div>
	
	<div class="portlet-body">
	
			
			
		<div class="row" style="background-color: #30303d; color: #fff;">
		
			<div id="chartdiv"></div>
			
		</div>
	</div>
</div>
<script>
var data=[];
var y=[];
var value1=[];
var value2=[];
$('document').ready(function(){
 	
	create();
});
function setdata(){
	
	
	var year=[];
	
	var sumA=0;
	var sumB=0;
	var i=0;
	<c:forEach var="list" items="${listUser}">
	<fmt:formatDate var="year" pattern = "yyyy"  value = "${list.startDate}" />
	if(y.indexOf('${year}')===-1 && '${year}'!==""){
	y.push('${year}');
	}
	
	</c:forEach>
	y=_.uniq(y.sort());
	console.log(y);
	while(i<y.length){
		var a=0;
	<c:forEach var="list" items="${listUser}">
	<fmt:formatDate var="year" pattern = "yyyy"  value = "${list.startDate}" />
	
	if('${year}'==y[i]){
		if("${list.startDate}"!=""){
			a++;
		}
	}
	value1[y[i]]=a;
	</c:forEach>
	i++;
	}
	i=0;
	while(i<y.length){
		var b=0;
	<c:forEach var="list" items="${listUser}">
	<fmt:formatDate var="year" pattern = "yyyy"  value = "${list.endDate}" />
	
	if('${year}'==y[i]){
		if("${list.endDate}"!=""){
			b++;
		}
	}
	value2[y[i]]=b;
	</c:forEach>
	i++;
	}
	
}
</script>
<script>
function create(){

// Themes begin
am4core.useTheme(am4themes_dark);
am4core.useTheme(am4themes_animated);
// Themes end

// Create chart instance
var chart = am4core.create("chartdiv", am4charts.XYChart);

// Add data
setdata();

  var loop=0;
  
<c:forEach var="numyear" items="${countYear}">

				chart.data=[
					<c:forEach var="loop" begin="0" end="${numyear}" step="1">
						{
					date:y['${loop}']+" ",
					value1:value1[y['${loop}']],
					value2:value2[y['${loop}']]
				},
				</c:forEach>
				];
	
				</c:forEach>

// Create axes
var dateAxis = chart.xAxes.push(new am4charts.DateAxis());
dateAxis.renderer.minGridDistance = 50;

var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());

// Create series
var series = chart.series.push(new am4charts.LineSeries());
series.dataFields.valueY = "value1";
series.dataFields.dateX = "date";
series.strokeWidth = 2;
series.minBulletDistance = 10;
series.tooltipText = "[bold]Sign:[/] [bold]{value1}\n[bold]Resign:[/] [bold]{value2}";
series.tooltip.pointerOrientation = "vertical";

// Create series
var series2 = chart.series.push(new am4charts.LineSeries());
series2.dataFields.valueY = "value2";
series2.dataFields.dateX = "date";
series2.strokeWidth = 2;
series2.strokeDasharray = "3,4";
series2.stroke = series.stroke;

// Add cursor
chart.cursor = new am4charts.XYCursor();
chart.cursor.xAxis = dateAxis;

} // end am4core.ready()
</script>