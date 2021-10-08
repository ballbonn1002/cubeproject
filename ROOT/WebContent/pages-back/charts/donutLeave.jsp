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
<script src="https://cdn.amcharts.com/lib/4/themes/kelly.js"></script>
<script src="https://cdn.amcharts.com/lib/4/themes/animated.js"></script>

<div class="portlet light bordered">

	<div class="portlet-title">

		<div class="caption">
			<i class="fa fa-calendar-check-o font-red"></i> 
			<span class="caption-subject font-red sbold uppercase">Donut Leave Report</span>
				
		</div>
		<div class="actions">
			<a class="btn btn-circle btn-icon-only btn-default fullscreen"
				href="javascript:;" data-original-title="" title=""> </a>
		</div>
	</div>
	
	<div class="portlet-body">
	
			<div class="row">
			<div class="col-lg-2"></div>
			
			<div class="col-lg-2">
			
    <label class="caption-subject font-red sbold " >Department</label>
  <select class="selectpicker" id="selectDP">
    <option selected>All</option>
    <c:forEach var="DP" items="${listDepart}">
  	<option value="${DP.id}"> ${DP.id}  :  ${DP.name}</option>
    </c:forEach>
  </select>
  
  </div>
  <div class="col-lg-4">
  
  <label class="caption-subject font-red sbold " >Employee</label>
  <select class="selectpicker" id="selectEM" style="width: 100%">
    <option selected>All</option>
  </select>
  
  </div>
  <div class="col-lg-2">
  
  <label class="caption-subject font-red sbold " >Year</label><br>
  <select class="selectpicker" id="selectY" style="width: 100%">
    <option selected>All</option>
  </select>
  
  </div>
  <div class="col-lg-2"></div>
  
  <script>
 
  $('#selectDP').select2().on('change',function(){
	  $("#selectEM").html("<option selected>All</option>");
	  testselect();
  });
  $('#selectEM').select2().on('change',function(){
	  testselect();
  });
  $('#selectY').select2().on('change',function(){
	  testselect();
  });
    </script>
			</div>
			<hr>
		<div class="row">
		
			<div id="chartdiv"></div>
			
		</div>
	</div>
</div>
<script>
$(document).ready(function () {
	testselect();
	yeardata();
});
function testselect(){
	
	var ip=$('#selectDP').val();
	var count=0;
	if(ip==="All"){
		 $('#selectEM').prop('disabled', true);
		 createChart(ip);
	 }
	 else{
		 $('#selectEM').prop('disabled',false);
	 <c:forEach var="EM" items="${listUser}">
	if(ip==='${EM.departmentId}'){
		count++;
		console.log(ip+" vs "+'${EM.name}');
		 var data = {
			    id:'${EM.id}',
			    text:'${EM.name}'
			};

			var newOption = new Option(data.text, data.id, false, false);
			$('#selectEM').append(newOption).trigger('change');
		}
	 </c:forEach> 
	 if(count==0){
		 $("#selectEM").html("<option selected>No Employee in this Department</option>");
		 $('#selectEM').prop('disabled', true);
		 
	 }
	 else{
		 createChart(ip);
	 }
	 }
}
function yeardata(){
	var select=[];
	<c:forEach var="res" items="${listLeave}">
	<fmt:formatDate var="year" pattern = "yyyy"  value = "${res.startDate}" />
	select.push('${year}');
	</c:forEach>
	select = _.uniq(select.sort());
	console.log(select);
	var run=0;
	while(run<select.length){
		 var data = {
				    id:select[run],
				    text:select[run]
				};

				var newOption = new Option(data.text, data.id, false, false);
				$('#selectY').append(newOption).trigger('change');
				run++;
	}
}
</script>
<script>
function setData(ip){
	
	var A=0,B=0,C=0,D=0,E=0,F=0,G=0;
	
	if(ip==="All"){///// ถ้า Department เป็น All
		if($('#selectY').val()!='All'){////ถ้าปีเป็นไม่เป็น All ( เลือกปี )
			var selectY=$('#selectY').val();
			<c:forEach var="res" items="${listLeave}">
			<fmt:formatDate var="year" pattern = "yyyy"  value = "${res.startDate}" />
			if('${year}' == selectY){//// คัดตัวที่มีปีเท่ากับตัวที่เลือก
				if('${res.leaveTypeId}'==1){ A+=${res.noDay}; }
				if('${res.leaveTypeId}'==2){ B+=${res.noDay}; }
				if('${res.leaveTypeId}'==3){ C+=${res.noDay}; }
				if('${res.leaveTypeId}'==4){ D+=${res.noDay}; }
				if('${res.leaveTypeId}'==5){ E+=${res.noDay}; }
				if('${res.leaveTypeId}'==6){ F+=${res.noDay}; }
				if('${res.leaveTypeId}'==9){ G+=${res.noDay}; }
			}
			</c:forEach>
			console.log(A+" "+B+" "+C+" "+D+" "+E+" "+F+" "+G+" ");
		}/// จบเงื่อนไข เลือกปี หรือ ปีไม่เป็น All
		else{//// ถ้าปีเป็น All
		<c:forEach var="res" items="${listLeave}">
		
		if('${res.leaveTypeId}'==1){ A+=${res.noDay}; }
		if('${res.leaveTypeId}'==2){ B+=${res.noDay}; }
		if('${res.leaveTypeId}'==3){ C+=${res.noDay}; }
		if('${res.leaveTypeId}'==4){ D+=${res.noDay}; }
		if('${res.leaveTypeId}'==5){ E+=${res.noDay}; }
		if('${res.leaveTypeId}'==6){ F+=${res.noDay}; }
		if('${res.leaveTypeId}'==9){ G+=${res.noDay}; }
		</c:forEach>
		console.log(A+" "+B+" "+C+" "+D+" "+E+" "+F+" "+G+" ");
		}
		
	}/// จบเงื่อไขถ้าDepartment เป็น All
	else{/////ถ้า Deapartment ไม่เป็น All ( เลือกแผนก )
		var department = $('#selectDP').val();
		var employee = $('#selectEM').val();
		var selectY=$('#selectY').val();
		
		if(employee!='All'){
			if($('#selectY').val()!='All'){
				<c:forEach var="res" items="${listLeave}">
				<fmt:formatDate var="year" pattern = "yyyy"  value = "${res.startDate}" />
					if('${year}' == selectY){
						if(employee=='${res.userId}'){
						if('${res.leaveTypeId}'==1){ A+=${res.noDay}; }
						if('${res.leaveTypeId}'==2){ B+=${res.noDay}; }
						if('${res.leaveTypeId}'==3){ C+=${res.noDay}; }
						if('${res.leaveTypeId}'==4){ D+=${res.noDay}; }
						if('${res.leaveTypeId}'==5){ E+=${res.noDay}; }
						if('${res.leaveTypeId}'==6){ F+=${res.noDay}; }
						if('${res.leaveTypeId}'==9){ G+=${res.noDay}; }
						}
					}
				</c:forEach>
				console.log(A+" "+B+" "+C+" "+D+" "+E+" "+F+" "+G+" ");
			}
			else{
				<c:forEach var="res" items="${listLeave}">
				
					if(employee=='${res.userId}'){
							
						if('${res.leaveTypeId}'==1){ A+=${res.noDay}; }
						if('${res.leaveTypeId}'==2){ B+=${res.noDay}; }
						if('${res.leaveTypeId}'==3){ C+=${res.noDay}; }
						if('${res.leaveTypeId}'==4){ D+=${res.noDay}; }
						if('${res.leaveTypeId}'==5){ E+=${res.noDay}; }
						if('${res.leaveTypeId}'==6){ F+=${res.noDay}; }
						if('${res.leaveTypeId}'==9){ G+=${res.noDay}; }
						
					}
				</c:forEach>
				console.log(A+" "+B+" "+C+" "+D+" "+E+" "+F+" "+G+" ");
			}
		}
		else{
			var emDP =[];
			if($('#selectY').val()!='All'){
				<c:forEach var='peopleDP' items='${listUser}'>
					if('${peopleDP.departmentId}'===department){
						emDP.push('${peopleDP.id}');
					}
				</c:forEach>
				var i=0;
				while(i<emDP.length){
				<c:forEach var='res' items='${listLeave}'>
				<fmt:formatDate var="year" pattern = "yyyy"  value = "${res.startDate}" />
					if('${res.userId}'==emDP[i]){
						if(selectY=='${year}'){
							if('${res.leaveTypeId}'==1){ A+=${res.noDay}; }
							if('${res.leaveTypeId}'==2){ B+=${res.noDay}; }
							if('${res.leaveTypeId}'==3){ C+=${res.noDay}; }
							if('${res.leaveTypeId}'==4){ D+=${res.noDay}; }
							if('${res.leaveTypeId}'==5){ E+=${res.noDay}; }
							if('${res.leaveTypeId}'==6){ F+=${res.noDay}; }
							if('${res.leaveTypeId}'==9){ G+=${res.noDay}; }
						}
					}
				</c:forEach>
				i++;
				}
				console.log(A+" "+B+" "+C+" "+D+" "+E+" "+F+" "+G+" ");
			}
			else{
				<c:forEach var='peopleDP' items='${listUser}'>
				if('${peopleDP.departmentId}'===department){
					emDP.push('${peopleDP.id}');
				}
			</c:forEach>
			var i=0;
			while(i<emDP.length){
			<c:forEach var='res' items='${listLeave}'>
			
				if('${res.userId}'==emDP[i]){
					
						if('${res.leaveTypeId}'==1){ A+=${res.noDay}; }
						if('${res.leaveTypeId}'==2){ B+=${res.noDay}; }
						if('${res.leaveTypeId}'==3){ C+=${res.noDay}; }
						if('${res.leaveTypeId}'==4){ D+=${res.noDay}; }
						if('${res.leaveTypeId}'==5){ E+=${res.noDay}; }
						if('${res.leaveTypeId}'==6){ F+=${res.noDay}; }
						if('${res.leaveTypeId}'==9){ G+=${res.noDay}; }
					
				}
			</c:forEach>
			i++;
			}
			console.log(A+" "+B+" "+C+" "+D+" "+E+" "+F+" "+G+" ");
			}
		}
		
	}
	var data=[ {
	    leavetype: "ลากิจ/ลาพักร้อน",
	    day: A
	  },
	  {
		  leavetype: "ลาอื่นๆ",
	    day: B
	  },
	  {
		  leavetype: "ลาป่วย",
		  day: C
	  },
	  {
		  leavetype: "ขาดงาน",
		  day: D
	  },
	  {
		  leavetype: "ลาโดยไม่รับค่าจ้าง",
		  day: E
	  },
	  {
		  leavetype: "อื่นๆ",
		  day: F
	  },
	  {
		  leavetype: "ลาพักร้อนที่เหลือจากปีที่แล้ว",
		  day: G
	  }
	];
return data;
}

</script>
<script>

function createChart(ip) {

// Themes begin
am4core.useTheme(am4themes_kelly);
am4core.useTheme(am4themes_animated);
// Themes end

var chart = am4core.create("chartdiv", am4charts.PieChart3D);
chart.hiddenState.properties.opacity = 0; // this creates initial fade-in

chart.legend = new am4charts.Legend();

chart.data = setData(ip);

chart.innerRadius = 100;

var series = chart.series.push(new am4charts.PieSeries3D());
series.dataFields.value = "day";
series.dataFields.category = "leavetype";

} // end am4core.ready()
</script>