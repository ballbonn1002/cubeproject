<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="/WEB-INF/tlds/permission.tld" prefix="perm"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/global/plugins/fancybox/lib/jquery-1.10.1.min.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/global/plugins/jquery-ui/jquery-ui.min.js"></script>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<%-- <script
	src="${pageContext.request.contextPath}/assets/global/plugins/bootstrap/js/bootstrap.js"></script> --%>
<style>
/*
tr{    
  opacity: 0;
  animation-name: fadeIn;
  animation-duration: 2s;
  animation-iteration-count: 1;
  animation-fill-mode: forwards;
}
/@keyframes fadeIn {
  from {
    opacity: 0;
  }
  
  to {
    opacity: 1;
  }
}*/

</style>


<fmt:formatDate pattern="yyyy" value="${dateTimeNow}" var="year_now" />
<fmt:formatDate pattern="MM" value="${dateTimeNow}" var="month_now" />
<fmt:formatDate pattern="dd" value="${dateTimeNow}" var="day_now" />
<fmt:formatDate pattern="dd-MM-yyyy" value="${dateTimeNow}"
	var="dateNow" />

<style>
		tr{    
		  opacity: 0;
		  animation-name: fadeIn;
		  animation-duration: 2s;
		  animation-iteration-count: 1;
		  animation-fill-mode: forwards;
		}
		@keyframes fadeIn {
		  from {
		    opacity: 0;
		  }
		  
		  to {
		    opacity: 1;
		  }
		}
		
		</style>
				<script>
				
				$("tr:not(:first)").each(function (index ) {
					   $(this).css('animation-delay',index *0.01 +'s');
					}); 
								
				</script>

<div class="portlet light bordered">
	<div class="portlet-title">
		<div class="caption">
		<i class="fa fa-pie-chart font-red"></i>
			<span class="caption-subject font-red sbold uppercase">&nbsp;Work_Hours
			</span>
		</div>
		<div class="actions">
			<a class="btn btn-circle btn-icon-only btn-default fullscreen"
				href="javascript:;" data-original-title="" title=""> </a>
		</div>
	</div>

	<!-- HTML -->


	<div class="portlet-body flip-scroll text-center">
	<form class="form-inline margin-bottom-40"
			action="Work_Hoursesheetsearch" style="margin-left: 5%;">

			<perm:permission object="timesheet.edit">
					<div class="form-group form-md-line-input">
					<label class="control-label" for="form_control_1">Staff : </label>
				
					<select class="form-control  " name="name"  id=name style="width:200px" >
						<option value="All" id="All" >All</option>
					
						<optgroup label="Enable">
							<c:forEach var="user" items="${cubeUser}">

								<c:if test="${user.enable == 1 }">
									<c:if test="${logonUser == nulll }">
										<option value="${user.id}" id="${user.id}"
											<c:if test="${fn:containsIgnoreCase(user.id,onlineUser.id)}"><c:out value="selected=selected"/></c:if>>${user.department_id}
											- ${user.name}</option>
									</c:if>
									<c:if test="${logonUser != nulll }">
										<option value="${user.id}" id="${user.id}"
											<c:if test="${fn:containsIgnoreCase(user.id,logonUser)}"><c:out value="selected=selected"/></c:if>>${user.department_id}
											- ${user.name}</option>
									</c:if>
								</c:if>
							</c:forEach>
						</optgroup>
						<optgroup label="Disable">
							<c:forEach var="user" items="${cubeUser}">

								<c:if test="${user.enable == 0 }">
									<c:if test="${logonUser == nulll }">
										<option value="${user.id}" id="${user.id}"
											<c:if test="${fn:containsIgnoreCase(user.id,onlineUser.id)}"><c:out value="selected=selected"/></c:if>>${user.department_id}
											- ${user.name}</option>
									</c:if>
									<c:if test="${logonUser != nulll }">
										<option value="${user.id}" id="${user.id}"
											<c:if test="${fn:containsIgnoreCase(user.id,logonUser)}"><c:out value="selected=selected"/></c:if>>${user.department_id}
											- ${user.name}</option>
									</c:if>
								</c:if>
							</c:forEach>
						</optgroup>
					</select>
				
				</div>
			</perm:permission>

			<div class="form-group form-md-line-input ">
				<label class="control-label" for="form_control_1">Month : </label> <select
					class="form-control  col-md-2" name="month" id="month"style="width:100px">
					<option value='13' id='All'
						<c:if test="${monthSearch == 13 }"><c:out value="selected=selected"/></c:if>>All</option>
					<option value='01' id='01'
						<c:if test="${monthSearch == 01 }"><c:out value="selected=selected"/> </c:if>>Janaury</option>
					<option value='02' id='02'
						<c:if test="${monthSearch == 02 }"><c:out value="selected=selected"/> </c:if>>February</option>
					<option value='03' id='03'
						<c:if test="${monthSearch == 03 }"><c:out value="selected=selected"/> </c:if>>March</option>
					<option value='04' id='04'
						<c:if test="${monthSearch == 04 }"><c:out value="selected=selected"/> </c:if>>April</option>
					<option value='05' id='05'
						<c:if test="${monthSearch == 05 }"><c:out value="selected=selected"/> </c:if>>May</option>
					<option value='06' id='06'
						<c:if test="${monthSearch == 06 }"><c:out value="selected=selected"/> </c:if>>June</option>
					<option value='07' id='07'
						<c:if test="${monthSearch == 07 }"><c:out value="selected=selected"/> </c:if>>July</option>
					<option value='08' id='08'
						<c:if test="${monthSearch == 08 }"><c:out value="selected=selected"/> </c:if>>August</option>
					<option value='09' id='09'
						<c:if test="${monthSearch == 09 }"><c:out value="selected=selected"/> </c:if>>September</option>
					<option value='10' id='10'
						<c:if test="${monthSearch == 10 }"><c:out value="selected=selected"/> </c:if>>October</option>
					<option value='11' id='11'
						<c:if test="${monthSearch == 11 }"><c:out value="selected=selected"/> </c:if>>November</option>
					<option value='12' id='12'
						<c:if test="${monthSearch == 12 }"><c:out value="selected=selected"/> </c:if>>December</option>
				</select>
			</div>


			<div class="form-group form-md-line-input ">
				<label class="control-label" for="form_control_1">Year : </label> <select
					class="form-control " name="yearSearch" id=yearSearch  style="width:100px">
					<c:choose>
						<c:when test="${yearSearch != null}">
							<c:forEach begin="0" end="4" var="i">
								<option value="${year_now - i}" id="${year_now - i}"
									<c:if test="${yearSearch == (year_now - i)}"><c:out value="selected=selected"/></c:if>>${year_now - i}</option>
							</c:forEach>
						</c:when>

						<c:otherwise>
							<c:forEach begin="0" end="4" var="i">
								<option value="${year_now - i}" id="${year_now - i}">${year_now - i}</option>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</select>
			</div>


			<button type="submit" class="btn sbold blue-steel"  >
				<i class="fa fa-search"></i> Search
			</button>

			<a class="btn btn-sm sbold green"
				href="WorkhourReportExcelExport?year=${year}&month=${month}&user=${name}" id="exportexcel" 
				title="Print" style="color: white;display: none;"><i class="fa fa-print"></i>&nbsp;Excel</a>
		</form>

		<div class="portlet-body" style="text-align: center;">
			<table class="table table-striped table-condensed table-hover" id="table_id">
				<thead>
					<tr  style="background-color: rgb(59, 63, 81); color: white; height: 41px">

						<th class="text-center" width="350px" style="padding-left: 2%">User</th>
						<th class="text-center" width="300px"
							style="background-color: #3B3F51; color: white; padding-left: 2%;">Work_Days</th>
						<!-- <th class="text-center " width="200px"
							style="background-color: #3B3F51; color: white;">Function</th> -->
						<th class="text-center" width="350px"
							style="background-color: #3B3F51; color: white; padding-left: 2%;">Work_Hourse</th>
						<th class="text-center" width="450px"
							style="background-color: #3B3F51; color: white; padding-left: 2%;">AVG</th>
					</tr>

				</thead>
				<tbody>
					<%-- 	<tr>
						<td class="text-center">
							<div class=" blue-hoki default">
								${logonUser}
							</div>
						</td>
						<td class="text-center">
							<div class=" blue-hoki default">
								${sumUserWork}
							</div>
						</td>
					</tr> --%>

					<c:forEach var="lts" items="${list}" varStatus="Count">
						<tr>
							<td class="text-center">
								<div class="blue-hoki default text-center">
									${lts.logonUser}</div>
							</td>
							<td class="text-center">
								<div class="blue-hoki default">
									<fmt:formatNumber type="number" minFractionDigits="2"
										value="${lts.sumUserWork}" />

								</div>
							</td>
							<td class="text-center">
								<div class=" blue-hoki default">
									<fmt:formatNumber type="number" pattern="#.##" minFractionDigits="2"
										value="${lts.sumTime}" />
								</div>
							</td>
							<td class="text-center">
								<div class=" blue-hoki default">
									<fmt:formatNumber type="number" pattern="#.##" minFractionDigits="2"
										value="${lts.avgTime}" />
								</div>
							</td>
						</tr>
					</c:forEach>

				</tbody>
			</table>

		</div>

	</div>
</div>

<!-- Styles -->
<style>
#chart_div {
	width: 100%;
	height: 1000px;
}
</style>
<script>
	$(document).ready(function() {
		$('#table_id').DataTable({
			"aLengthMenu" : [ [ 25, 50, 75, -1 ], [ 25, 50, 75, "All" ] ],
			"iDisplayLength" : 20,

		});
	});
</script>


<!-- ////////////////////////////////////////start ajax///////////////////////////////////////////////// -->
<!-- ////////////////////////////////////////end ajax///////////////////////////////////////////////// -->


<script>
	function add() {
		document.location = "testAder";
	}
</script>



<!-- BEGIN PAGE LEVEL PLUGINS -->

<script src="../assets/global/plugins/amcharts/amcharts/amcharts.js"
	type="text/javascript"></script>
<script src="../assets/global/plugins/amcharts/amcharts/serial.js"
	type="text/javascript"></script>
<script src="../assets/global/plugins/amcharts/amcharts/pie.js"
	type="text/javascript"></script>
<script src="../assets/global/plugins/amcharts/amcharts/radar.js"
	type="text/javascript"></script>
<script src="../assets/global/plugins/amcharts/amcharts/themes/light.js"
	type="text/javascript"></script>
<script
	src="../assets/global/plugins/amcharts/amcharts/themes/patterns.js"
	type="text/javascript"></script>
<script src="../assets/global/plugins/amcharts/amcharts/themes/chalk.js"
	type="text/javascript"></script>
<script src="../assets/global/plugins/amcharts/ammap/ammap.js"
	type="text/javascript"></script>
<script
	src="../assets/global/plugins/amcharts/ammap/maps/js/worldLow.js"
	type="text/javascript"></script>
<script src="../assets/global/plugins/amcharts/amstockcharts/amstock.js"
	type="text/javascript"></script>
<script src="../assets/global/plugins/amcharts/amcharts/xy.js"
	type="text/javascript"></script>
<script src="../assets/global/plugins/counterup/jquery.waypoints.min.js"
	type="text/javascript"></script>
<script src="../assets/global/plugins/counterup/jquery.counterup.min.js"
	type="text/javascript"></script>
<script>

	 $(document).ready(function() {
		var value = "${flag}";
		if (value == "1") {
		
			var month = "${month1}";
			var year = "${year1}";
			var enable = '${statusEnable}';
		
			document.getElementById(year).selected = "true";
			document.getElementById(month).selected = "true";
			document.getElementById(enable).selected = "true";
		} else {
			$('#select2').select2({ width: 'resolve' })f;
		}
	}); 
</script>
<script>
$(document).ready(function() { 
    $("#name").select2({ width: 'resolve' });           
});
</script>
<script>
$(document).ready(function() { 
    $("#month").select2({ width: 'resolve' });           
});
</script>
<script>
$(document).ready(function() { 
    $("#yearSearch").select2({ width: 'resolve' });           
});
</script>
<script>
$(document).ready(function() { 

	  $("#exportexcel").hide();
	if(${name} == "all"){
    $("#exportexcel").hide();
    }  
	else{
		 $("#exportexcel").show(); 
	}
});
</script>
	<!-- <script>
				
				$("tr:not(:first)").each(function (index ) {
					   $(this).css('animation-delay',index *0.01 +'s');
					}); 
								
				</script> -->
<!-- END PAGE LEVEL PLUGINS -->