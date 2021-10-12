<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/tlds/permission.tld" prefix="perm"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<script src="../assets/global/plugins/jquery.min.js" type="text/javascript"></script>	
<script src="../assets/global/plugins/moment.min.js" type="text/javascript"></script>
<link rel="shortcut icon" href="favicon.ico" />
<link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/2.0.1/css/toastr.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/2.0.1/js/toastr.js"></script>
<script src="${pageContext.request.contextPath}/assets/global/plugins/fancybox/lib/jquery-1.10.1.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/global/plugins/jquery-ui/jquery-ui.min.js"></script>
<c:set var="now" value="<%=new java.util.Date()%>" />

<style>
#chartdiv {
  width: 100%;
  height: 500px;
}
​
</style>
<script src="https://cdn.amcharts.com/lib/4/core.js"></script>
<script src="https://cdn.amcharts.com/lib/4/charts.js"></script>
<script src="https://cdn.amcharts.com/lib/4/themes/animated.js"></script>
<script src="https://cdn.amcharts.com/lib/4/themes/dataviz.js"></script>
<script src="https://cdn.amcharts.com/lib/4/themes/dark.js"></script>

<div class="portlet light bordered">
	<div class="portlet-title">

		<div class="caption">
			<i class="fa fa-calendar-check-o font-red"></i> 
			<span class="caption-subject font-red sbold uppercase">Sign & Resign Report</span>
				<fmt:formatDate var="year" pattern = "yyyy"  value = "${now}" />
		</div>
		<div class="actions">
			<a class="btn btn-circle btn-icon-only btn-default fullscreen"
				href="javascript:;" data-original-title="" title=""> </a>
		</div>
	</div>
	<div class="portlet-body">
	<div class="row">
	<div class="col-lg-4">
	<i class="fa fa-arrow-circle-o-up" aria-hidden="true" style="color:rgb(40,50,80);"></i>
	<span id="rateS" class="caption-subject font-black sbold uppercase">RateS :</span><br>
	<i class="fa fa-arrow-circle-o-up" aria-hidden="true" style="color:#902c2d;"></i>
	<span id="rateR" class="caption-subject font-black sbold uppercase">RateR :</span>
	</div>
	<div class="col-lg-3 font-red">
	<span class="caption-subject sbold uppercase">Year :</span>
	<input class="sbold" type="text" style="text-align:center;width:200px;" id="select_Y" value="${year}" readonly />
	</div>
	<div class="col-lg-2">
	<i class="fa fa-square" aria-hidden="true"style="color:rgb(40,50,80);"></i>
<span id="tS" class="caption-subject font-black sbold uppercase">Sign :</span>
<i class="fa fa-user" aria-hidden="true"></i>
<br>
<i class="fa fa-square" aria-hidden="true"style="color:#902c2d;"></i>
<span id="tR" class="caption-subject font-black sbold uppercase">Resign :</span>
<i class="fa fa-user" aria-hidden="true"></i>
</div>
<div class="col-lg-3">
	<i class="fa fa-users" aria-hidden="true" style="color:rgb(40,50,80);"></i>
	<span id="AllEm" class="caption-subject font-black sbold uppercase"></span><br>
	<i class="fa fa-arrow-circle-o-up" aria-hidden="true" style="color:rgb(40,50,80);"></i>
	<span id="rateEm" class="caption-subject font-black sbold uppercase"></span><br>
	</div>
	</div>
	<script>
	var result=null;
	var year;
	var chart;
	 
	$(document).ready(function () {
		var opt={
			    format: 'yyyy',
			    minYear: '2009',
			    autoclose: true,
			    viewMode: "years", 
			     minViewMode: "years"
			    };
		 $('#select_Y').datepicker(opt).on('change', function(){
			 if($("#select_Y").val()>${year}){
				 $("#select_Y").val('');
				 $('#select_Y').datetimepicker('update');
				 toast();
			 }
			 createChart();
			 
		    });
		 
		createChart();
	});
	</script>
	<div class="row" >
<div id="chartdiv" ></div>
</div>
		</div>
	</div>
<!-- Chart code -->
<script>
function calAll(year,allS){
	var people=0,peopleR=0;
	<c:forEach var="data" items="${list2}">
  if('${data.startDate}'!=""){
  if('${data.startDate}'< (year+1)+'-01-01'&&'${data.startDate}'>'2008-12-31'){
  people++;
  }
  }
  if('${data.endDate}'!=""){
	  if('${data.endDate}'<(year+1)+'-01-01'&&'${data.endDate}'>'2008-12-31'){
	  	peopleR++;
	  }
	  
}
 </c:forEach> 
 var Allpeople=people-peopleR;
 
 document.getElementById("AllEm").innerHTML = "All Employee in this year : "+Allpeople+"+"+allS;
 document.getElementById("rateEm").innerHTML = "Employee rate up : "+((allS*100)/Allpeople).toFixed(2)+"%";
}
</script>
<script>
 function setData(){
	 var count=0;
	 var allS=0,allR=0;rateS=0;rateR=0;
	 
 /////-----SET DATA
 year=$("#select_Y").val();
 ////---==LOOP DATA
 while(count<2){
	 var jan=0,feb=0,mar=0,apr=0,may=0,june=0,july=0,aug=0,sep=0,oct=0,nov=0,dec=0;
	 var janR=0,febR=0,marR=0,aprR=0,mayR=0,juneR=0,julyR=0,augR=0,sepR=0,octR=0,novR=0,decR=0;
	 year=year-count;
  <c:forEach var="data" items="${list2}">
////------SET Sign Data
  if('${data.startDate}'!=""){
  if('${data.startDate}'< year+'-02-01'&&'${data.startDate}'>((year-1)+'-12-31')){
  	console.log('J : ${data.startDate}');
  jan++;
  }
  else if('${data.startDate}'<year+'-03-01'&&'${data.startDate}'>=year+'-02-01'){
	  console.log('F : ${data.startDate}');
	  feb++;
  }
  else if('${data.startDate}'<year+'-04-01'&&'${data.startDate}'>=year+'-03-01'){
	  console.log('Mar : ${data.startDate}');
	  mar++;
  }
  else if('${data.startDate}'<year+'-05-01'&&'${data.startDate}'>=year+'-04-01'){
	  console.log('Apr : ${data.startDate}');
	  apr++;
  }
  else if('${data.startDate}'<year+'-06-01'&&'${data.startDate}'>=year+'-05-01'){
	  console.log('May : ${data.startDate}');
	  may++;
  }
  else if('${data.startDate}'<year+'-07-01'&&'${data.startDate}'>=year+'-06-01'){
	  console.log('June : ${data.startDate}');
	  june++;
  }
  else if('${data.startDate}'<year+'-08-01'&&'${data.startDate}'>=year+'-07-01'){
	  console.log('July : ${data.startDate}');
	  july++;
  }
  else if('${data.startDate}'<year+'-09-01'&&'${data.startDate}'>=year+'-08-01'){
	  console.log('Aug : ${data.startDate}');
	  aug++;
  }
  else if('${data.startDate}'<year+'-10-01'&&'${data.startDate}'>=year+'-09-01'){
	  console.log('Sep : ${data.startDate}');
	  sep++;
  }
  else if('${data.startDate}'<year+'-11-01'&&'${data.startDate}'>=year+'-10-01'){
	  console.log('Oct : ${data.startDate}');
	  oct++;
  }
  else if('${data.startDate}'<year+'-12-01'&&'${data.startDate}'>=year+'-11-01'){
	  console.log('Nov : ${data.startDate}');
	  nov++;
  }
  else if('${data.startDate}'<((year+1)+'-01-01')&&'${data.startDate}'>=year+'-12-01'){
	  console.log('Dec : ${data.startDate}');
	  dec++;
  }
  }
////------END Sign Data------/////////////////////////////////////////////////////////////
////------SET Resign Data
  if('${data.endDate}'!=""){
	  if('${data.endDate}'<year+'-02-01'&&'${data.endDate}'>(year-1)+'-12-31'){
	  	console.log('J r: ${data.endDate}');
	  janR++;
	  }
	  else if('${data.endDate}'<year+'-03-01'&&'${data.endDate}'>=year+'-02-01'){
		  console.log('F r : ${data.endDate}');
		  febR++;
	  }
	  else if('${data.endDate}'<year+'-04-01'&&'${data.endDate}'>=year+'-03-01'){
		  console.log('Mar r : ${data.endDate}');
		  marR++;
	  }
	  else if('${data.endDate}'<year+'-05-01'&&'${data.endDate}'>=year+'-04-01'){
		  console.log('Apr r : ${data.endDate}');
		  aprR++;
	  }
	  else if('${data.endDate}'<year+'-06-01'&&'${data.endDate}'>=year+'-05-01'){
		  console.log('May r : ${data.endDate}');
		  mayR++;
	  }
	  else if('${data.endDate}'<year+'-07-01'&&'${data.endDate}'>=year+'-06-01'){
		  console.log('June r : ${data.endDate}');
		  juneR++;
	  }
	  else if('${data.endDate}'<year+'-08-01'&&'${data.endDate}'>=year+'-07-01'){
		  console.log('July r : ${data.endDate}');
		  julyR++;
	  }
	  else if('${data.endDate}'<year+'-09-01'&&'${data.endDate}'>=year+'-08-01'){
		  console.log('Aug r : ${data.endDate}');
		  augR++;
	  }
	  else if('${data.endDate}'<year+'-10-01'&&'${data.endDate}'>=year+'-09-01'){
		  console.log('Sep r : ${data.endDate}');
		  sepR++;
	  }
	  else if('${data.endDate}'<year+'-11-01'&&'${data.endDate}'>=year+'-10-01'){
		  console.log('Oct r : ${data.endDate}');
		  octR++;
	  }
	  else if('${data.endDate}'<year+'-12-01'&&'${data.endDate}'>=year+'-11-01'){
		  console.log('Nov r : ${data.endDate}');
		  novR++;
	  }
	  else if('${data.endDate}'<((year+1)+'-01-01')&&'${data.endDate}'>=year+'-12-01'){
		  console.log('Dec r : ${data.endDate}');
		  decR++;
	  }
	  }
////------END Resign Data------/////////////////////////////////////////////////////////////
 </c:forEach> 
 if(count<1){
	 allS=jan+feb+mar+apr+may+june+july+aug+sep+oct+nov+dec;
	 allR=janR+febR+marR+aprR+mayR+juneR+julyR+augR+sepR+octR+novR+decR;
 console.log("You select ${year}");
 console.log("Sign : "+jan+" "+feb+" "+mar+" "+apr+" "+may+" "+june+" "+july+" "+aug+" "+sep+" "+oct+" "+nov+" "+dec);
 console.log("Resign : "+janR+" "+febR+" "+marR+" "+aprR+" "+mayR+" "+juneR+" "+julyR+" "+augR+" "+sepR+" "+octR+" "+novR+" "+decR);
 console.log("All Sign: "+allS);
 console.log("All Resign: "+allR);
 //(janR+febR+marR+aprR+mayR+juneR+julyR+augR+sepR+octR+novR+decR)//(jan+feb+mar+apr+may+june+july+aug+sep+oct+nov+dec)
 document.getElementById("tS").innerHTML = "Sign : "+allS+" ";
 document.getElementById("tR").innerHTML = "Resign : "+allR+" ";
  result=[{
	    "month": "January",
	    "sign": jan,
	    "resign": janR
	}, {
		"month": "February",
	    "sign": feb,
	    "resign": febR
	}, {
		"month": "March",
	    "sign": mar,
	    "resign": marR
	}, {
		"month": "April",
	    "sign": apr,
	    "resign": aprR
	}, {
		"month": "May",
	    "sign": may,
	    "resign": mayR
	}, {
		"month": "June",
	    "sign": june,
	    "resign": juneR
	},
	{
		"month": "July",
	    "sign": july,
	    "resign": julyR
	},
	{
		"month": "August",
	    "sign": aug,
	    "resign": augR
	},
	{
		"month": "September",
	    "sign": sep,
	    "resign": sepR
		},
		{
			"month": "October",
		    "sign": oct,
		    "resign": octR
		},
		{
			"month": "November",
		    "sign": nov,
		    "resign": novR
		},
		{
			"month": "December",
		    "sign": dec,
		    "resign": decR
		}];
 }else{
	 var lastYR=0;lastYS=0;
	 lastYR=(janR+febR+marR+aprR+mayR+juneR+julyR+augR+sepR+octR+novR+decR);
	 lastYS=(jan+feb+mar+apr+may+june+july+aug+sep+oct+nov+dec);
	 if(lastYS != 0){
	 rateS=((allS-(jan+feb+mar+apr+may+june+july+aug+sep+oct+nov+dec))*100)/lastYS;
	 document.getElementById("rateS").innerHTML = "Rate Sign : "+rateS.toFixed(2)+"% ~ "+rateS.toFixed()+"% form last year";
	 }
	 else{
		 document.getElementById("rateS").innerHTML = "Rate Sign : No one sign form last year";
	 }
	 if(lastYR!= 0){
	 rateR=((allR-(janR+febR+marR+aprR+mayR+juneR+julyR+augR+sepR+octR+novR+decR))*100)/lastYR;
	 document.getElementById("rateR").innerHTML = "Rate Resign : "+rateR.toFixed(2)+"% ~ "+rateR.toFixed()+"% form last year";
	 
	 }
	 else{
		 document.getElementById("rateR").innerHTML = "Rate Resign : No one resign form last year";
	 }
	 break;
 }
  count++;
 }
 calAll(year,allS);
  return result;
 }
</script>
 <script>
 
function createChart() {

// Themes begin
am4core.useTheme(am4themes_dataviz);
am4core.useTheme(am4themes_animated);
// Themes end

// Create chart instance
 chart = am4core.create("chartdiv", am4charts.XYChart);


// Add data
chart.data = setData();

// Create axes
var categoryAxis = chart.xAxes.push(new am4charts.CategoryAxis());
categoryAxis.dataFields.category = "month";
categoryAxis.renderer.grid.template.location = 0;
categoryAxis.renderer.minGridDistance = 30;

var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
valueAxis.title.text = "Value of People";
valueAxis.title.fontWeight = 800;

// Create series
var series = chart.series.push(new am4charts.ColumnSeries());
series.dataFields.valueY = "sign";
series.dataFields.categoryX = "month";
series.clustered = false;
series.tooltipText = "Sign in {categoryX}: [bold]{valueY}[/] people";

var series2 = chart.series.push(new am4charts.ColumnSeries());
series2.dataFields.valueY = "resign";
series2.dataFields.categoryX = "month";
series2.clustered = false;
series2.columns.template.width = am4core.percent(50);
series2.tooltipText = "Resign in {categoryX}: [bold]{valueY}[/] people";

chart.cursor = new am4charts.XYCursor();
chart.cursor.lineX.disabled = true;
chart.cursor.lineY.disabled = false;

} // end am4core.ready()
function toast(){
		Command: toastr["warning"]("Sorry,This year is wrong!", "Warning")

		toastr.options = {
		  "closeButton": false,
		  "debug": false,
		  "newestOnTop": false,
		  "progressBar": true,
		  "positionClass": "toast-top-right",
		  "preventDuplicates": false,
		  "onclick": null,
		  "showDuration": "300",
		  "hideDuration": "1000",
		  "timeOut": "3000",
		  "extendedTimeOut": "1000",
		  "showEasing": "swing",
		  "hideEasing": "linear",
		  "showMethod": "fadeIn",
		  "hideMethod": "fadeOut"
		}
}
</script> 

	<link href="../assets/global/plugins/bootstrap-fileinput/bootstrap-fileinput.css" rel="stylesheet" type="text/css" />
	<script src="../assets/global/plugins/jquery.min.js"
		type="text/javascript"></script>
	<script
		src="../assets/global/plugins/bootstrap-fileinput/bootstrap-fileinput.js"
		type="text/javascript"></script>
	<script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>

				
		
	   		
		