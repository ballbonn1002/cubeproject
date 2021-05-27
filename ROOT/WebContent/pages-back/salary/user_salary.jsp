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

<button id="testvar" type="button" class="btn btn-warning" >Warning</button>
<div class="portlet light bordered">
	<div class="portlet-title">

		<div class="caption">
			<i class="fa fa-users font-red"></i> <span
				class="caption-subject font-red sbold "> User Salary </span>
		</div>
		<div class="actions">
			<a class="btn green-meadow float-right" href="user-salary-crud"> <i
				class="fa fa-pencil-square-o"></i>User Salary
			</a> 
			&emsp;&emsp; <a
				class="btn btn-circle btn-icon-only btn-default fullscreen"
				href="javascript:;" data-original-title="" title=""> </a>
		</div>
	</div>
	<div class="portlet-body" style="text-align: center;">

		<form class="form-inline margin-bottom-40" action="user-salary-search"
			method="POST">
			<!-- --------------------------------------------------------------Start search------------------------------------------------------ -->
			<input type="hidden" id="tempuser" name="tempuser"
				class="form-control" />


			

				<div class="form-group form-md-line-input ">
					<label class="control-label" for="form_control_1">Month : </label>
					<select class="form-control select2me" name="monthSearch"
						id=monthSearch>
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
				<button type="submit" class="btn btn-sm sbold blue-steel"
					onclick="ddd()">
					<i class="fa fa-search"></i> Search
				</button>


				<a class="btn btn-sm sbold green-dark" id="exportexcel"
					href="PalmReportExcelExport?year=${yearSearch}&month1=${monthSearch}&user=${uselogin}"
					title="Print" style="color: white;"><i class="fa fa-print"></i>&nbsp;Excel</a>

			
			<script>
				function ddd() {
					var x = $('select[name=name]').val();
					var y = "${onlineUser.id}";
					if (x == y && x != null) {
						document.getElementById("tempuser").value = y;
					} else if (x == "" || x == null) {
						document.getElementById("tempuser").value = y;
					} else {
						document.getElementById("tempuser").value = x;
					}
				}
			</script>

		</form>
		<!-- -----------------------------------------end search-------------------------------------------- -->
		<!-- -----------------------------------------start add-------------------------------------------- -->

		<div class="portlet-body" style="text-align: center;">
			<%-- <table class="table table-striped table-condensed table-hover"
				id="table_id">
				<thead>
					<tr
						style="background-color: rgb(59, 63, 81); color: white; height: 41px">

						<th class="text-center" width="200px">Name</th>
						<th class="text-center " width="200px"
							style="background-color: #3B3F51; color: white;">Present</th>
						<!-- <th class="text-center " width="200px"
							style="background-color: #3B3F51; color: white;">Function</th> -->
						<th class="text-center " width="550px"
							style="background-color: #3B3F51; color: white;">Leave</th>
						<th class="text-center " width="250px"
							style="background-color: #3B3F51; color: white;">Absent</th>
						<th class="text-center " width="250px"
							style="background-color: #3B3F51; color: white;">Late</th>
						<th class="text-center " width="250px"
							style="background-color: #3B3F51; color: white;">Salary</th>
							<th class="text-center " width="250px"
							style="background-color: #3B3F51; color: white;">Sum Salary</th>
						<th class="text-center " width="250px"
							style="background-color: #3B3F51; color: white;">Edit/Delete</th>
					</tr>
				</thead>
				<tbody>					
					<c:forEach var="listsalary" items="${uslist}" varStatus="Count">
					<tr>
						<td class="text-center">${listsalary.user}</td>
						<td class="text-center"><input type="text" class="form-control text-center" value="18"></td>
						<td class="text-center"><input type="text" class="form-control text-center" value="2"></td>
						<td class="text-center"><input type="text" class="form-control text-center" value="1"></td>
						<td class="text-center"><input type="text" class="form-control text-center" value="1"></td>
						<td class="text-center">${listsalary.salary}</td>
						<td class="text-center">${listsalary.sumsalary}</td>
						<td class="text-center">
							<button type="button"
								class="btn circle btn-outline blue float-right" id=""
								onclick="editTimesheet(${listsalary.id_salary_user})">
								<i class="fa fa-save"></i>
							</button>
							<button type="button"
								class="btn circle btn-outline red-intense float-left" id=""
								onclick="delTimesheet(${listsalary.id_salary_user})">
								<i class="fa fa-trash"></i>
							</button>
						</td>
					</tr>	
					</c:forEach>
				</tbody>
			</table> --%>
		<table class="table table-striped table-condensed table-hover"  id="table_id">
				<thead>
					<tr style="background-color: rgb(59, 63, 81); color: white; height: 41px">
						
						<th class="text-center" width="200px">Name</th>
						<th class="text-center " width="200px"
							style="background-color: #3B3F51; color: white;">Present</th>
						<!-- <th class="text-center " width="200px"
							style="background-color: #3B3F51; color: white;">Function</th> -->
						<th class="text-center " width="550px"
							style="background-color: #3B3F51; color: white;">Leave</th>
						<th class="text-center " width="250px"
							style="background-color: #3B3F51; color: white;">Absent</th>
						<th class="text-center " width="250px"
							style="background-color: #3B3F51; color: white;">Late</th>
						<th class="text-center " width="250px"
							style="background-color: #3B3F51; color: white;">Salary</th>
						<th class="text-center " width="250px"
							style="background-color: #3B3F51; color: white;">Sum Salary</th>
						<th class="text-center " width="250px"
							style="background-color: #3B3F51; color: white;">Edit/Delete</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="lts" items="${spalm}" varStatus="Count">
						<tr>						
							<td class="text-center">${lts.user_create}</td>						
							<td class="text-center"><input type="text" class="form-control text-center" value="${lts.time_check_in - (lts.hour1 + lts.hour2 + lts.hour3 + lts.hour4 + lts.hour5 + lts.hour6 + lts.hour7)}">
							</td>
							<td class="text-center"><input type="text" class="form-control text-center" value="<fmt:formatNumber type="number" pattern="#.###" value="${lts.no_day}" />">		 
							</td>
					<c:choose>
								<c:when test="${lts.miss>=0}">
									<td class="text-center"> 
										<input type="text" class="form-control text-center" value="<fmt:formatNumber type="number" pattern="#.##" value="${lts.miss}" />">
							</td>
								</c:when>
								<c:otherwise>
								<td class="text-center"> 
								<input type="text" class="form-control text-center" value="0">
        							</td>
							</c:otherwise>
							</c:choose>		
							<td class="text-center"> <input type="text" class="form-control text-center" value="<fmt:formatNumber type="number" pattern="#.##" value="${lts.lateday}" />">
							</td>
							<td class="text-center">${lts.salary}</td>
							<td class="text-center">${lts.sumsalary}</td>
							<td class="text-center">
							<button type="button"
								class="btn circle btn-outline blue float-right" id=""
								onclick="editTimesheet(${listsalary.id_salary_user})">
								<i class="fa fa-save"></i>
							</button>
							<button type="button"
								class="btn circle btn-outline red-intense float-left" id=""
								onclick="delTimesheet(${listsalary.id_salary_user})">
								<i class="fa fa-trash"></i>
							</button>
						</td>
						</tr>

					</c:forEach>
				</tbody>
			</table>
		</div>

		<!--
		<input type="hidden" id="userap" name="userap"
			value="${onlineUser.id}" class="form-control" />
			-->


		<!-- -----------------------------------------End add-------------------------------------------- -->


	</div>
</div>

<script>
	$("button").click(function(){
		  $.ajax({url: "user-salary", success: function(){
			  alert("success"); 
		  }});
		});
</script>

<!-- ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss -->

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
