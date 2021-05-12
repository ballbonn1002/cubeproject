<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/WEB-INF/tlds/permission.tld" prefix="perm"%>
<script
	src="../assets/global/plugins/bootstrap-sweetalert/sweetalert.min.js"
	type="text/javascript"></script>
<script src="../assets/pages/scripts/ui-sweetalert.min.js"
	type="text/javascript"></script>
<link
	href="../assets/global/plugins/bootstrap-sweetalert/sweetalert.css"
	rel="stylesheet" type="text/css" />

<link rel="shortcut icon" href="favicon.ico" />
<script
	src="${pageContext.request.contextPath}/assets/global/plugins/fancybox/lib/jquery-1.10.1.min.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/global/plugins/jquery-ui/jquery-ui.min.js"></script>

<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript"
	src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
<script type="text/javascript"
	src="https://cdn.datatables.net/buttons/1.3.1/js/dataTables.buttons.min.js"></script>
<script type="text/javascript"
	src="https://cdn.datatables.net/buttons/1.3.1/js/buttons.flash.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script type="text/javascript"
	src="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.27/build/pdfmake.min.js"></script>
<script type="text/javascript"
	src="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.27/build/vfs_fonts.js"></script>
<script type="text/javascript"
	src="https://cdn.datatables.net/buttons/1.3.1/js/buttons.html5.min.js"></script>
<script type="text/javascript"
	src="https://cdn.datatables.net/buttons/1.3.1/js/buttons.print.min.js"></script>


<fmt:formatDate pattern="yyyy" value="${dateTimeNow}" var="year_now" />
<fmt:formatDate pattern="MM" value="${dateTimeNow}" var="month_now" />
<fmt:formatDate pattern="dd" value="${dateTimeNow}" var="day_now" />
<fmt:formatDate pattern="dd-MM-yyyy" value="${dateTimeNow}"
	var="dateNow" />
<fmt:formatDate pattern="HH:mm" value="${dateTimeNow}" var="timeNow" />
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
		<script>
		
</script>
<div class="portlet light bordered">
	<div class="portlet-title">

		<div class="caption">
			<i class="icon-user font-red"></i> <span
				class="caption-subject font-red sbold "> USER SALARY</span>
		</div>
		<div class="actions">

			&emsp;&emsp; <a
				class="btn btn-circle btn-icon-only btn-default fullscreen"
				href="javascript:;" data-original-title="" title=""> </a>
		</div>

	</div>
	<div class="portlet-body" style="text-align: center;">

		<form class="form-inline margin-bottom-40" action="searchPalm"
			method="POST">
			<!-- --------------------------------------------------------------Start search------------------------------------------------------ -->


			<perm:permission object="timesheet.edit">
			
			<div class="form-group form-md-line-input ">
				<label class="control-label" for="form_control_1">Month : </label> <select
					class="form-control select2me" name="monthSearch" id=monthSearch>
					<!-- qwerqwerqw -->
					<c:choose>
						<c:when test="${monthSearch != null}">
							<option value='01' id='01'
								<c:if test="${monthSearch == 01 }"><c:out value="selected=selected"/> </c:if>>January</option>
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
						</c:when>

						<c:otherwise>
							<option value='01' id='01'
								<c:if test="${month_now == 01 }"><c:out value="selected=selected"/> </c:if>>January</option>
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
						</c:otherwise>
					</c:choose>

				</select>
			</div>

			<div class="form-group form-md-line-input ">
				<label class="control-label" for="form_control_1">Year : </label> <select
					class="form-control select2me" name="yearSearch" id=yearSearch>				
						<option>2021</option>
						<option>2020</option>
						<option>2019</option>
						<option>2018</option>
				</select>
			</div>
			<button type="submit" class="btn btn-sm sbold blue-steel" onclick="ddd()">
				<i class="fa fa-search"></i> Search
			</button>
				
								
										<a class="btn btn-sm sbold green-dark" id="exportexcel" 
						title="Print" style="color: white;"><i class="fa fa-print"></i>&nbsp;Excel</a>
			

							
		</perm:permission>
		</form>
		<!-- -----------------------------------------end search-------------------------------------------- -->
		<!-- -----------------------------------------start add-------------------------------------------- -->

		<div class="portlet-body" style="text-align: center;">
			<table class="table table-striped table-condensed table-hover"  id="table_id">
				<thead>
					<tr style="background-color: rgb(59, 63, 81); color: white; height: 41px">
						
						<th class="text-center" width="550px">Name</th>
						<th class="text-center " width="250px"
							style="background-color: #3B3F51; color: white;">Base salary</th>
						<th class="text-center " width="250px"
							style="background-color: #3B3F51; color: white;">Work Day</th>
						<th class="text-center " width="250px"
							style="background-color: #3B3F51; color: white;">Leave</th>
						<th class="text-center " width="250px"
							style="background-color: #3B3F51; color: white;">Absent</th>
						<th class="text-center " width="250px"
							style="background-color: #3B3F51; color: white;">Late</th>
						<th class="text-center " width="250px"
							style="background-color: #3B3F51; color: white;">Salary summary</th>
						<th class="text-center " width="250px"
							style="background-color: #3B3F51; color: white;">Edit</th>
						
					</tr>
				</thead>
				<tbody>
						<tr>
							<td class="text-center">Nonpawich Seubpun</td>
							<td class="text-center" >18000</td>
							<td class="text-center">25</td>
							<td class="text-center">2</td>
							<td class="text-center">4</td>
							<td class="text-center">3</td>
							<td class="text-center" id="salary1"></td>
							<td class="text-center"><a class="btn btn-circle btn-sm sbold blue" style="color: white;"><i class="fa fa-pencil"></i></a></td>
						</tr>
						
						<tr>
							<td class="text-center">Rungtrakul Rungfaworakul</td>
							<td class="text-center">20000</td>
							<td class="text-center">25</td>
							<td class="text-center">1</td>
							<td class="text-center">3</td>
							<td class="text-center">0</td>
							<td class="text-center" id="salary2"></td>
							<td class="text-center"><a class="btn btn-circle btn-sm sbold blue" style="color: white;"><i class="fa fa-pencil"></i></a></td>
						</tr>
				</tbody>
			</table>
		</div>
	
		<!-- -----------------------------------------End add-------------------------------------------- -->
		
		
		
	</div>
</div>
<script>
	var work_month = 25; 
	// before_update_salary
	var before_base_salary1 = 15000;
	var before_base_salary2 = 18000;
	var before_day_work1 = 10
	var before_day_work2 = 5
	var before_absent1 = 1;
	var before_absent2 = 1;
	
	var before_sum_salary1 = (before_base_salary1/work_month)*(before_day_work1-before_absent1);
	var before_sum_salary2 = (before_base_salary2/work_month)*(before_day_work2-before_absent2);
	
	// after_update_salary
	var base_salary1 = 18000;
	var base_salary2 = 20000;
	var after_day_work1 = 15;
	var after_day_work2 = 20;
	var after_absent1 = 3;
	var after_absent2 = 2;
	
	var after_sum_salary1 = (base_salary1/work_month)*(after_day_work1-after_absent1);
	var after_sum_salary2 = (base_salary2/work_month)*(after_day_work2-after_absent1);
	
	var sum_salary1 = before_sum_salary1 + after_sum_salary1
	var sum_salary2 = before_sum_salary2 + after_sum_salary2
		
	document.getElementById("salary1").innerHTML = sum_salary1;
	document.getElementById("salary2").innerHTML = sum_salary2;

</script>

<script>
	$(document).ready(function() {
		$('#table_id').DataTable({
			"aLengthMenu" : [ [ 25, 50, 75, -1 ], [ 25, 50, 75, "All" ] ],
			"iDisplayLength" : 50,
			

		});
	});
</script>

<!-- BEGIN PAGE LEVEL PLUGINS -->
<script>
	function datechenge() {
		var fulldate = "${fulldate}".trim();
		var Userdate = $("#mydate").val();
		if (fulldate != Userdate) {
			$("#detail").show();
			$("#labeldetail").show();
		} else {
			$("#detail").hide();
			$("#labeldetail").hide();
		}
	}

	for (i = 1; i <= 6; i++) {
		!function(i) {
			$.post("ajax.php", {
				param : i
			}, function(response) {
			});
		}(i);
	}
</script>

<!-- ////////////////////////////////////////start ajax///////////////////////////////////////////////// -->



<!-- ////////////////////////////////////////end ajax///////////////////////////////////////////////// -->





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

<script>
$(document).ready(function() { 
    $("#name").select2({ width: 'resolve' });           
});
</script>








<script src="../assets/global/plugins/counterup/jquery.waypoints.min.js"
	type="text/javascript"></script>
<script src="../assets/global/plugins/counterup/jquery.counterup.min.js"
	type="text/javascript"></script>
