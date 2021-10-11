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
<link rel="stylesheet" href="../assets/global/plugins/jquery-multi-select/css/multi-select.css" type="text/css" />
<script src="../assets/global/plugins/jquery-multi-select/js/jquery.multi-select.js"  type="text/javascript"></script>
<c:set var="now" value="<%=new java.util.Date()%>" />
<style>

.portlet-body{
background-color: #E9EDEF;
}

#chartCompare {
  width: 100%;
  height: 400px;
}
#chartEm1 {
  width: 85%;
  height: 500px;
}
#chartEm2 {
  width: 85%;
  height: 500px;
}

</style>

<!-- Resources -->
<script src="https://cdn.amcharts.com/lib/4/core.js"></script>
<script src="https://cdn.amcharts.com/lib/4/charts.js"></script>
<script src="https://cdn.amcharts.com/lib/4/themes/kelly.js"></script>
<script src="https://cdn.amcharts.com/lib/4/themes/dataviz.js"></script>
<script src="https://cdn.amcharts.com/lib/4/themes/animated.js"></script>

<div class="portlet light bordered">

	<div class="portlet-title">

		<div class="caption">
			<i class="fa fa-calendar-check-o font-red"></i> 
			<span class="caption-subject font-red sbold uppercase">Status Leave Employee Report</span>
			
		</div>
		<div class="actions">
			<a class="btn btn-circle btn-icon-only btn-default fullscreen"
				href="javascript:;" data-original-title="" title=""> </a>
		</div>
	</div>
	
	<div class="portlet-body">
	
			<div class="row">
			<div class="col-lg-3">
				<label class="caption-subject font-red sbold ">Employee 1</label> <select
					class="selectpicker" id="selectEm1" style="width: 100%">
					<option selected>Don't select</option>
				</select>
			</div>

			<div class="col-lg-6">
					<div id="chartCompare"></div>
				</div>

			<div class="col-lg-3">
				<label class="caption-subject font-red sbold ">Employee 2</label> <select
					class="selectpicker" id="selectEm2" style="width: 100%">
					<option selected>Don't select</option>
				</select>
			</div>
		</div>
			
		<div class="row">
		<div class="col-lg-6">
			<div id="chartEm1"></div>
		</div>
	
			<div class="col-lg-6">
			<div id="chartEm2"></div>
			</div>
		</div>
	</div>
</div>
<script>
$(document).ready(function(){
	<c:forEach var="EM" items="${listUser}">
		 var data = {
			    id:'${EM.user_id}',
			    text:'${EM.user_id}'+" : "+"${EM.department_id}"
			};
			var newOption = new Option(data.text, data.id, false, false);
			var newOption2 = new Option(data.text, data.id, false, false);
			$('#selectEm1').append(newOption).trigger('change');
			$('#selectEm2').append(newOption2).trigger('change');
	 </c:forEach> 
	$('#selectEm1').select2().on('change',function(){
		var s1 =  $('#selectEm1').val();
		var s2 =  $('#selectEm2').val();
		if(s1!="Don't select"){
		if( s2!="Don't select"){
		  setdata();
		  chartCompare();
			chartEm1();
			chartEm2();
		}
		}
	  });
	  $('#selectEm2').select2().on('change',function(){
		  var s1 =  $('#selectEm1').val();
		  var s2 =  $('#selectEm2').val();
		  if(s2!="Don't select"){
			if( s1!="Don't select"){
			  setdata();
			  chartCompare();
				chartEm1();
				chartEm2();
			}
		  }
	  });
	
});
</script>
<script>
var EM1A=0,EM1B=0,EM1C=0,EM1D=0,EM1E=0,EM1F=0,EM1G=0;
var EM2A=0,EM2B=0,EM2C=0,EM2D=0,EM2E=0,EM2F=0,EM2G=0;
function setdata(){
	EM1A=0;EM1B=0;EM1C=0;EM1D=0;EM1E=0;EM1F=0;EM1G=0;
	EM2A=0;EM2B=0;EM2C=0;EM2D=0;EM2E=0;EM2F=0;EM2G=0;
	var se1=$('#selectEm1').val();
	var se2=$('#selectEm2').val();
	if(se1!=="Don't select" && se2!=="Don't select"){
		<c:forEach var="list" items="${listLeave}">
		if(se1=="${list.userId}"){
			if('${list.leaveTypeId}'==1){
				EM1A++;
			}
			if('${list.leaveTypeId}'==2){
				EM1B++;
			}
			if('${list.leaveTypeId}'==3){
				EM1C++;
			}
			if('${list.leaveTypeId}'==4){
				EM1D++;
			}
			if('${list.leaveTypeId}'==5){
				EM1E++;
			}
			if('${list.leaveTypeId}'==9){
				EM1F++;
			}
			if('${list.leaveTypeId}'==6){
				EM1G++;
			}
		}
		if(se2=="${list.userId}"){
			if('${list.leaveTypeId}'==1){
				EM2A++;
			}
			if('${list.leaveTypeId}'==2){
				EM2B++;
			}
			if('${list.leaveTypeId}'==3){
				EM2C++;
			}
			if('${list.leaveTypeId}'==4){
				EM2D++;
			}
			if('${list.leaveTypeId}'==5){
				EM2E++;
			}
			if('${list.leaveTypeId}'==9){
				EM2F++;
			}
			if('${list.leaveTypeId}'==6){
				EM2G++;
			}
		}
		</c:forEach>
	}
	
}
function setTheme(x){
	
	if(x=="k"){
		am4core.useTheme(am4themes_kelly);
	}
	if(x=="d"){
		am4core.useTheme(am4themes_dataviz);
	}
	am4core.useTheme(am4themes_animated);
}
function chartCompare(){
	setTheme("k");
	 var chartCompare = am4core.create("chartCompare", am4charts.RadarChart);
	chartCompare.data = [{
		  "country": "ลากิจ/ลาพักร้อน",
		  "EM1": EM1A,
		  "EM2": EM2A
		}, {
		  "country": "ลาอื่นๆ",
		  "EM1": EM1B,
		  "EM2": EM2B
		}, {
		  "country": "ลาป่วย",
		  "EM1": EM1C,
		  "EM2": EM2C
		}, {
		  "country": "ขาดงาน",
		  "EM1": EM1D,
		  "EM2": EM2D
		}
		, {
			  "country": "ลาโดยไม่รับค่าจ้าง",
			  "EM1": EM1E,
			  "EM2": EM2E
			}, {
				  "country": "อื่นๆ",
				  "EM1": EM1F,
				  "EM2": EM2F
				}, {
					  "country": "ลาพักร้อนที่เหลือจากปีที่แล้ว",
					  "EM1": EM1G,
					  "EM2": EM2G
					}];
	var categoryAxis = chartCompare.xAxes.push(new am4charts.CategoryAxis());
	categoryAxis.dataFields.category = "country";
	
	var valueAxis = chartCompare.yAxes.push(new am4charts.ValueAxis());
	valueAxis.renderer.axisFills.template.fill = chartCompare.colors.getIndex(2);
	valueAxis.renderer.axisFills.template.fillOpacity = 0.05;

	/* Create and configure series */
	var EM1 = chartCompare.series.push(new am4charts.RadarSeries());
	EM1.dataFields.valueY = "EM1";
	EM1.dataFields.categoryX = "country";
	EM1.name = "Sales";
	EM1.strokeWidth = 3;
	var EM2 = chartCompare.series.push(new am4charts.RadarSeries());
	EM2.dataFields.valueY = "EM2";
	EM2.dataFields.categoryX = "country";
	EM2.name = "Sales";
	EM2.strokeWidth = 4
}
function chartEm1() {

// Themes begin
setTheme("k");
// Themes end

/* Create chart instance */

var iconPath = "M53.5,476c0,14,6.833,21,20.5,21s20.5-7,20.5-21V287h21v189c0,14,6.834,21,20.5,21 c13.667,0,20.5-7,20.5-21V154h10v116c0,7.334,2.5,12.667,7.5,16s10.167,3.333,15.5,0s8-8.667,8-16V145c0-13.334-4.5-23.667-13.5-31 s-21.5-11-37.5-11h-82c-15.333,0-27.833,3.333-37.5,10s-14.5,17-14.5,31v133c0,6,2.667,10.333,8,13s10.5,2.667,15.5,0s7.5-7,7.5-13 V154h10V476 M61.5,42.5c0,11.667,4.167,21.667,12.5,30S92.333,85,104,85s21.667-4.167,30-12.5S146.5,54,146.5,42 c0-11.335-4.167-21.168-12.5-29.5C125.667,4.167,115.667,0,104,0S82.333,4.167,74,12.5S61.5,30.833,61.5,42.5z"
var chartEm1 = am4core.create("chartEm1", am4charts.SlicedChart);
chartEm1.hiddenState.properties.opacity = 0; // this makes initial fade in effect
chartEm1.data = [{
    "name": "ลากิจ/ลาพักร้อน",
    "value": EM1A
}, {
    "name": "ลาอื่นๆ",
    "value": EM1B
}, {
    "name": "ลาป่วย",
    "value": EM1C
}, {
    "name": "ขาดงาน",
    "value": EM1D
}, {
    "name": "ลาโดยไม่รับค่าจ้าง",
    "value": EM1E
}, {
    "name": "อื่นๆ",
    "value": EM1F
}, {
    "name": "ลาพักร้อนที่เหลือจากปีก่อน",
    "value": EM1G
}];
var series1 = chartEm1.series.push(new am4charts.PictorialStackedSeries());
series1.dataFields.value = "value";
series1.dataFields.category = "name";
series1.alignLabels = true;

series1.maskSprite.path = iconPath;
series1.ticks.template.locationX = 0.5;
series1.ticks.template.locationY = 0.5;
series1.labelsContainer.width = 150;

chartEm1.legend = new am4charts.Legend();
chartEm1.legend.position = "left";
chartEm1.legend.valign = "top";
}
function chartEm2(){
	setTheme("d");
	var iconPath = "M53.5,476c0,14,6.833,21,20.5,21s20.5-7,20.5-21V287h21v189c0,14,6.834,21,20.5,21 c13.667,0,20.5-7,20.5-21V154h10v116c0,7.334,2.5,12.667,7.5,16s10.167,3.333,15.5,0s8-8.667,8-16V145c0-13.334-4.5-23.667-13.5-31 s-21.5-11-37.5-11h-82c-15.333,0-27.833,3.333-37.5,10s-14.5,17-14.5,31v133c0,6,2.667,10.333,8,13s10.5,2.667,15.5,0s7.5-7,7.5-13 V154h10V476 M61.5,42.5c0,11.667,4.167,21.667,12.5,30S92.333,85,104,85s21.667-4.167,30-12.5S146.5,54,146.5,42 c0-11.335-4.167-21.168-12.5-29.5C125.667,4.167,115.667,0,104,0S82.333,4.167,74,12.5S61.5,30.833,61.5,42.5z"
	var chartEm2 = am4core.create("chartEm2", am4charts.SlicedChart);
	chartEm2.hiddenState.properties.opacity = 0; // this makes initial fade in effect
	chartEm2.data = [{
	    "name": "ลากิจ/ลาพักร้อน",
	    "value": EM2A
	}, {
	    "name": "ลาอื่นๆ",
	    "value": EM2B
	}, {
	    "name": "ลาป่วย",
	    "value": EM2C
	}, {
	    "name": "ขาดงาน",
	    "value": EM2D
	}, {
	    "name": "ลาโดยไม่รับค่าจ้าง",
	    "value": EM2E
	}, {
	    "name": "อื่นๆ",
	    "value": EM2F
	}, {
	    "name": "ลาพักร้อนที่เหลือจากปีก่อน",
	    "value": EM2G
	}];
	
	var series2 = chartEm2.series.push(new am4charts.PictorialStackedSeries());
	series2.dataFields.value = "value";
	series2.dataFields.category = "name";
	series2.alignLabels = true;

	series2.maskSprite.path = iconPath;
	series2.ticks.template.locationX = 0.5;
	series2.ticks.template.locationY = 0.5;

	series2.labelsContainer.width = 150;

	chartEm2.legend = new am4charts.Legend();
	chartEm2.legend.position = "left";
	chartEm2.legend.valign = "top";
}
</script>