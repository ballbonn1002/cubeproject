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

<c:set var="nowtime" value="<%=new java.util.Date()%>" />
<fmt:formatDate pattern="yyyy" value="${datetime}" var="year_now" />
<fmt:formatDate pattern="MM" value="${dateTimeNow}" var="month_now" />
<fmt:formatDate pattern="yyyy" value="${nowtime}" var="yearnow" />



<div class="portlet light bordered">
	<div class="portlet-title">
		<div class="caption">
			<span class="caption-subject font-red sbold uppercase"> <i
				class="fa fa-pie-chart"></i>&nbsp; Report Project
			</span>
		</div>
		<div class="actions">
			<a class="btn btn-circle btn-icon-only btn-default fullscreen"
				href="javascript:;" data-original-title="" title=""> </a>
		</div>
	</div>

	<!-- HTML -->


	<div class="portlet-body flip-scroll text-center">
		<form class="form-inline margin-bottom-40" action="search_project"
			style="margin-left: 8%;">
			<div class="form-group form-md-line-input ">

				<label class="control-label" for="form_control_1">project :
				</label> <select class="form-control select2me" name="project">
				<option value="All" id="user.project_id">All</option>
					<c:forEach var="user" items="${projectname}">
					
						<option value="${user.project_name}" id="${user.project_id}">${user.project_name}</option>
					</c:forEach>
				</select>
			</div>
			<perm:permission object="timesheet.edit">

				<div class="form-group form-md-line-input ">
					<label class="control-label" for="form_control_1">Staff : </label>
					<select class="form-control select2me" name="name" id=name>
						<option value="All" id="user.id">All</option>
						<optgroup label="Enable">
							<c:forEach var="user" items="${userseq}">

								<c:if test="${user.enable == 1 }">
									<c:if test="${userSelect == null }">
										<option value="${user.id}" id="${user.id}"
											<c:if test="${fn:containsIgnoreCase(user.id,onlineUser.id)}"><c:out value="selected=selected"/></c:if>>${user.department_id}
											- ${user.name}</option>
									</c:if>
									<c:if test="${userSelect != null }">
										<option value="${userSelect}" id="${user.id}"
											<c:if test="${fn:containsIgnoreCase(user.id,onlineUser.id)}"><c:out value="selected=selected"/></c:if>>${user.department_id}
											- ${user.name}</option>
									</c:if>
								</c:if>
							</c:forEach>
						</optgroup>
						<optgroup label="Disable">
							<c:forEach var="user" items="${userseq}">

								<c:if test="${user.enable == 0 }">
									<c:if test="${userSelect == nulll }">
										<option value="${user.id}" id="${user.id}"
											<c:if test="${fn:containsIgnoreCase(user.id,onlineUser.id)}"><c:out value="selected=selected"/></c:if>>${user.department_id}
											- ${user.name}</option>
									</c:if>
									<c:if test="${userSelect != nulll }">
										<option value="${userSelect}" id="${user.id}"
											<c:if test="${fn:containsIgnoreCase(user.id,onlineUser.id)}"><c:out value="selected=selected"/></c:if>>${user.department_id}
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
					class="form-control select2me" name="month">
					<option value='01' id='01'
						<c:if test="${month_now == 01 }"><c:out value="selected=selected"/> </c:if>>Janaury</option>
					<option value='02' id='02'
						<c:if test="${month_now == 02 }"><c:out value="selected=selected"/> </c:if>>February</option>
					<option value='03' id='03'
						<c:if test="${month_now == 03 }"><c:out value="selected=selected"/> </c:if>>March</option>
					<option value='04' id='04'
						<c:if test="${month_now == 04 }"><c:out value="selected=selected"/> </c:if>>April</option>
					<option value='05' id='05'
						<c:if test="${month_now == 05 }"><c:out value="selected=selected"/> </c:if>>May</option>
					<option value='06' id='06'
						<c:if test="${month_now == 06 }"><c:out value="selected=selected"/> </c:if>>June</option>
					<option value='07' id='07'
						<c:if test="${month_now == 07 }"><c:out value="selected=selected"/> </c:if>>July</option>
					<option value='08' id='08'
						<c:if test="${month_now == 08 }"><c:out value="selected=selected"/> </c:if>>August</option>
					<option value='09' id='09'
						<c:if test="${month_now == 09 }"><c:out value="selected=selected"/> </c:if>>September</option>
					<option value='10' id='10'
						<c:if test="${month_now == 10 }"><c:out value="selected=selected"/> </c:if>>October</option>
					<option value='11' id='11'
						<c:if test="${month_now == 11 }"><c:out value="selected=selected"/> </c:if>>November</option>
					<option value='12' id='12'
						<c:if test="${month_now == 12 }"><c:out value="selected=selected"/> </c:if>>December</option>
				</select>
			</div>

			<div class="form-group form-md-line-input ">
				<label class="control-label" for="form_control_1">Year : </label> <select
					class="form-control select2me" name="year">
					<c:forEach begin="0" end="9" var="i">
						<option value="${yearnow - i}" id="${yearnow - i}"
							<c:if test="${yearnow-i==year_now }"><c:out value="selected=selected"/> </c:if>>${yearnow - i}</option>
					</c:forEach>
				</select>
			</div>


			<button type="submit" class="btn sbold blue-steel">
				<i class="fa fa-search"></i> Search
			</button>
		</form>
		<div id="chart_div"></div>
		
	</div>
</div>

<!-- Styles -->
<style>
#chart_div {
	width: 100%;
	height: 1000px;
}
</style>


<script type="text/javascript">
	google.charts.load('current', {
		'packages' : [ 'gantt' ]
	});
	google.charts.setOnLoadCallback(drawChart);

	function daysToMilliseconds(days) {
		return days * 24 * 60 * 60 * 1000;
	}

	function drawChart() {

		var data = new google.visualization.DataTable();
		data.addColumn('string', 'Task ID');
		data.addColumn('string', 'Task Name');
		data.addColumn('string', 'Resource ID');
		data.addColumn('date', 'Start Date');
		data.addColumn('date', 'End Date');
		data.addColumn('number', 'Duration');
		data.addColumn('number', 'Percent Complete');
		data.addColumn('string', 'Dependencies');

		<c:forEach var="rp" items="${reportproject}">

		var d, y, m;
		var string = '${rp.time_check_in}';
		//2020-11-12 16:42:00.0
		d = string.substring(8, 10);
		m = string.substring(5, 7);
		y = string.substring(0, 4);
		var integerd = parseInt(d);
		var integerm = parseInt(m);
		var integery = parseInt(y);
		console.log('${rp.user_create}' + '  ' + '${rp.time_check_in}' + '  '
				+ d + '  ' + m + '  ' + y);

		data.addRows([
				[ '${rp.time_check_in}', '${rp.user_create}',
						'${rp.project_name}',
						new Date(integery, integerm - 1, integerd),
						new Date(integery, integerm - 1, integerd + 1), null,
						100, null ],

		]);

		</c:forEach>

		var options = {
			height : 1000,
			gantt: {
				labelStyle: {
				    color: '#ff0000',
				    fontName: 'Arial',
				    fontSize: 18}}

		};

		var chart = new google.visualization.Gantt(document
				.getElementById('chart_div'));

		chart.draw(data, options);
	}
</script>
<script>
	$(document).ready(function() {
		var value = "${flag}";
		if (value == "1") {
			var name = "${name}";
			var monthSearch = "${monthSearch}";
			var yearSearch = "${yearSearch}";
			document.getElementById(name).selected = "true";
			document.getElementById(monthSearch).selected = "true";
			document.getElementById(yearSearch).selected = "true";
		} else {
			$('.select2me').select2();
		}

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
			var user = "${userId}";
			var month = "${month1}";
			var year = "${year1}";
			var enable = '${statusEnable}';
			document.getElementById(user).selected = "true";
			document.getElementById(year).selected = "true";
			document.getElementById(month).selected = "true";
			document.getElementById(enable).selected = "true";
		} else {
			$('.select2me').select2();
		}
	});
</script>
<!-- END PAGE LEVEL PLUGINS -->