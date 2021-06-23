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
<%--<button type="button" class="btn btn-warning" onclick="test()">Warning</button>--%>
<div class="portlet light bordered">
	<div class="portlet-title">

		<div class="caption">
			<i class="fa fa-users font-red"></i> <span
				class="caption-subject font-red sbold "> User Salary CRUD</span>
		</div>
		<div class="actions">
			<a class="btn green-meadow float-right" data-toggle="modal"
				data-target="#lesson-plan-modaladd"> <i class="fa fa-plus"></i>&nbsp;New
				User Salary
			</a> &emsp;&emsp; <a
				class="btn btn-circle btn-icon-only btn-default fullscreen"
				href="javascript:;" data-original-title="" title=""> </a>
		</div>

	</div>



	<%--<div class="portlet-body" style="text-align: center;">

		<form class="form-inline margin-bottom-40" action="searchPalm"
			method="POST">
			<!-- --------------------------------------------------------------Start search------------------------------------------------------ -->
			<input type="hidden" id="tempuser" name="tempuser"
				class="form-control" />


			<perm:permission object="timesheet.edit">

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

			</perm:permission>
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

		</form>--%>
		<!-- -----------------------------------------end search-------------------------------------------- -->
		<!-- -----------------------------------------start add-------------------------------------------- -->

		<div class="portlet-body" style="text-align: center;">
			<table class="table table-striped table-condensed table-hover"
				id="table_id">
				<thead>
					<tr
						style="background-color: rgb(59, 63, 81); color: white; height: 41px">

						<th class="text-center" width="200px">ID</th>
						<th class="text-center " width="200px"
							style="background-color: #3B3F51; color: white;">User</th>
						<!-- <th class="text-center " width="200px"
							style="background-color: #3B3F51; color: white;">Function</th> -->
						<th class="text-center " width="550px"
							style="background-color: #3B3F51; color: white;">Salary</th>
						<th class="text-center " width="250px"
							style="background-color: #3B3F51; color: white;">Description</th>
						<th class="text-center " width="250px"
							style="background-color: #3B3F51; color: white;">User Create</th>
						<th class="text-center " width="250px"
							style="background-color: #3B3F51; color: white;">User Update</th>
						<th class="text-center " width="250px"
							style="background-color: #3B3F51; color: white;">Edit/Delete</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="usersalarylist" items="${uslist}" varStatus="Count">
						<tr>
							<td class="text-center">${usersalarylist.id_salary_user}</td>
							<td class="text-center">${usersalarylist.user}</td>
							<td class="text-center">${usersalarylist.salary}</td>
							<td class="text-center">${usersalarylist.description}</td>
							<td class="text-center">${usersalarylist.user_create}</td>
							<td class="text-center">${usersalarylist.user_update}</td>
							<td class="text-center">
								<button type="button"
									class="btn circle btn-outline blue float-right" id=""
									onclick="getcommentold('${usersalarylist.id_salary_user}','${usersalarylist.user}','${usersalarylist.salary}','${usersalarylist.description}','${usersalarylist.start_date}','${usersalarylist.end_date}')"
									data-toggle="modal" data-target="#lesson-plan-modal">
									<i class="fa fa-pencil-square-o"></i>
								</button>
								<button type="button"
									class="btn circle btn-outline red-intense float-left" id=""
									onclick="deleteusersalary(${usersalarylist.id_salary_user})">
									<i class="fa fa-trash"></i>
								</button>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>


		<!-- -----------------------------------------End add-------------------------------------------- -->


	</div>
</div>

<div class="modal fade" id="lesson-plan-modaladd" role="dialog">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">Add User Salary</h4>
				<button type="button" class="close modal-close" data-dismiss="modal">
					<i class="fa fa-times-circle" aria-hidden="true"></i>
				</button>
			</div>
			<div class="modal-body">
				<form class="lesson-update-section" action="" method="post">
					<div class="row">
						<div class="col-md-3 text-right">User :</div>
						<div class="col-md-7">
							<select class="bs-select form-control select2me" id="nameadd">
								<optgroup label="Enable">

									<c:forEach var="user" items="${cubeUser}">
										<c:if test="${user.enable == 1 }">
											<c:if test="${logonUser == nulll }">
												<option value="${user.id}" id="${user.id}"
													<c:if test="${fn:containsIgnoreCase(user.id,onlineUser.id)}"><c:out value="selected=selected"/>
													</c:if>>${user.department_id}
													- ${user.name}</option>
											</c:if>
											<c:if test="${logonUser != nulll }">
												<option value="${user.id}" id="${user.id}"
													<c:if test="${fn:containsIgnoreCase(user.id,logonUser)}"><c:out value="selected=selected"/>
													</c:if>>${user.department_id}
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
													<c:if test="${fn:containsIgnoreCase(user.id,onlineUser.id)}"><c:out value="selected=selected"/>
													</c:if>>${user.department_id}
													- ${user.name}</option>
											</c:if>
											<c:if test="${logonUser != nulll }">
												<option value="${user.id}" id="${user.id}"
													<c:if test="${fn:containsIgnoreCase(user.id,logonUser)}"><c:out value="selected=selected"/>
													</c:if>>${user.department_id}
													- ${user.name}</option>
											</c:if>
										</c:if>
									</c:forEach>
								</optgroup>
							</select>
						</div>
					</div>
					<br>
					<div class="row">
						<div class="col-md-3 text-right">Date To :</div>
						<div class="col-md-7">
							<div class="input-group input-large date-picker input-daterange"
								data-date-format="dd-mm-yyyy">
								<input type="text" class="form-control" id="date_fromadd"
									name="from" required> <span class="input-group-addon">
									to </span> <input type="text" class="form-control" id="date_toadd"
									name="to" required>
							</div>
						</div>
					</div>
					<br>
					<div class="row">
						<div class="col-md-3 text-right">Salary :</div>
						<div class="col-md-7">
							<input type="number" class="form-control" id="salaryadd">
						</div>
					</div>
					<br>
					<div class="row">
						<div class="col-md-3 text-right">Description :</div>
						<div class="col-md-7">
							<input type="text" class="form-control" id="desadd">
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="submit" onclick="save()" data-dismiss="modal"
					id="update_lesson_plan" class="btn blue-soft"
					name="update_lesson_plan">
					<i class="fa fa-save"></i> Save
				</button>
				<button type="submit" data-dismiss="modal" id="update_lesson_plan"
					class="btn red-intense" name="update_lesson_plan">
					<i class="fa fa-close"></i> Cancel
				</button>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="lesson-plan-modal" role="dialog">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">Edit User Salary</h4>
				<button type="button" class="close modal-close" data-dismiss="modal">
					<i class="fa fa-times-circle" aria-hidden="true"></i>
				</button>
			</div>
			<div class="modal-body">
				<form class="lesson-update-section" action="" method="post">
					<input type="hidden" class="form-control" id="idedit" name="idedit"><br>
					<div class="row">
						<div class="col-md-3 text-right">Name : </div>
						<div class="col-md-7">
							<input type="text" class="form-control" id="useredit"
								name="useredit" readonly>
						</div>
					</div><br>
					<div class="row">
						<div class="col-md-3 text-right">Date To :</div>
						<div class="col-md-7">
							<div class="input-group input-large date-picker input-daterange"
								data-date-format="dd-mm-yyyy">
								<input type="text" class="form-control" id="date_fromedit"
									name="from" required> <span class="input-group-addon">
									to </span> <input type="text" class="form-control" id="date_toedit"
									name="to" required>
							</div>
						</div>
					</div>
					<br>
					<div class="row">
						<div class="col-md-3 text-right">Salary : </div>
						<div class="col-md-7">
							<input type="number" class="form-control" id="salaryedit"
								name="salaryedit">
						</div>
					</div><br>
					<div class="row">
						<div class="col-md-3 text-right">Description : </div>
						<div class="col-md-7">
							<input type="text" class="form-control" id="desedit"
								name="desedit">
						</div>
					</div>

				</form>
			</div>
			<div class="modal-footer">
				<button type="submit" onclick="edit()" data-dismiss="modal"
					id="update_lesson_plan" class="btn blue-soft"
					name="update_lesson_plan">
					<i class="fa fa-save"></i> Save
				</button>
				<button type="submit" data-dismiss="modal" id="update_lesson_plan"
					class="btn red-intense" name="update_lesson_plan">
					<i class="fa fa-close"></i> Cancel
				</button>
			</div>
		</div>
	</div>
</div>

<script>
	$(document).ready(function() {
		$('#table_id').DataTable({
			"aLengthMenu" : [ [ 25, 50, 75, -1 ], [ 25, 50, 75, "All" ] ],
			"iDisplayLength" : 50,
			

		});
	});
</script>

<script>
function getcommentold(id,user,salary,description,start_date,end_date) {
$('#idedit').val(id);	
$('#useredit').val(user);
$('#salaryedit').val(salary);	
$('#desedit').val(description);
var start_datey = start_date.substring(0, 4);
var start_datem = start_date.substring(5, 7);
var start_dated = start_date.substring(8, 10);
var start_datesum = start_dated + "-" + start_datem + "-" + start_datey;
$('#date_fromedit').val(start_datesum);	
var end_datey = end_date.substring(0, 4);
var end_datem = end_date.substring(5, 7);
var end_dated = end_date.substring(8, 10);
var end_datesum = end_dated + "-" + end_datem + "-" + end_datey;
$('#date_toedit').val(end_datesum);
	}

</script>

<script>
function edit() {
	var idedit = document.getElementById('idedit').value;
	var useredit = document.getElementById('useredit').value;
	var salaryedit = document.getElementById('salaryedit').value;
	var desedit = document.getElementById('desedit').value;
 	var from = document.getElementById('date_fromedit').value;
	var to = document.getElementById('date_toedit').value;
	
	console.log(from);
	console.log(to);
	var fromy = from.substring(6, 10);
	var fromm = from.substring(3, 5);
	var fromd = from.substring(0, 2);
	
	var fromsum = fromy + "-" + fromm + "-" + fromd + " 00:00:00";
	console.log(fromsum);
	
	var toy = to.substring(6, 10);
	var tom = to.substring(3, 5);
	var tod = to.substring(0, 2);
	
	var tosum = toy + "-" + tom + "-" + tod + " 00:00:00";
	console.log(tosum);
	if (useredit == null || useredit == "") {
		swal("Error!", "Required! Name", "error");
	}
	else {
		$
				.ajax({
					url : "user-salary-edit",
					method : "POST",
					type : "JSON",
					data : {
						"id" : idedit,
						"name" : useredit,
						"from" : fromsum,
						"to" : tosum,
						"salary" : salaryedit,
						"des" : desedit,
					},
					success : function(data) {
						swal(
								{
									title : "Pass",
									text : "Saved Succcess",
									type : "success"
								},
								function() {
									window.location.href = "user-salary-crud";
								});
					}

				})
	}
}

</script>
<script>
	function save() {
		var name = document.getElementById('nameadd').value;
		var from = document.getElementById('date_fromadd').value;
		var to = document.getElementById('date_toadd').value;
		var salary = document.getElementById('salaryadd').value;
		var des = document.getElementById('desadd').value;
		
		console.log(from);
		console.log(to);
		var fromy = from.substring(6, 10);
		var fromm = from.substring(3, 5);
		var fromd = from.substring(0, 2);
		
		var fromsum = fromy + "-" + fromm + "-" + fromd + " 00:00:00";
		console.log(fromsum);
		
		var toy = to.substring(6, 10);
		var tom = to.substring(3, 5);
		var tod = to.substring(0, 2);
		
		var tosum = toy + "-" + tom + "-" + tod + " 00:00:00";
		console.log(tosum);
		if (name == null || name == "") {
			swal("Error!", "Required! Name", "error");
		}
		else {
			$
					.ajax({
						url : "user-salary-add",
						method : "POST",
						type : "JSON",
						data : {
							"name" : name,
							"from" : fromsum,
							"to" : tosum,
							"salary" : salary,
							"des" : des,
							
						},
						success : function(data) {
							swal(
									{
										title : "Pass",
										text : "Saved Succcess",
										type : "success"
									},
									function() {
										window.location.href = "user-salary-crud";
									});
						}

					})
		}
	}
</script>

<script>
function deleteusersalary(id) {
	swal({
	      title: "Are you sure!",
	      text: "You will be deleting this id!",
	      type: "warning",
	      showCancelButton: true,
	      confirmButtonClass: 'btn-danger',
	      confirmButtonText: 'OK'
	    }, function (inputValue) {
	        if (inputValue == false){
	        	//console.log("canceled");
	        	return false;
	        	}
	        if (inputValue == true) {
	        	 $.ajax({
	 				    url : "user-salary-delete.action",
	 					data : "id="+ id,
	 					type : "POST",
	 					success : function(response) {
	 						window.location.href = "user-salary-crud";
	 					}
	 			 });
	          return false
	        }
	      });
}
</script>






<script src="../assets/global/plugins/counterup/jquery.waypoints.min.js"
	type="text/javascript"></script>
<script src="../assets/global/plugins/counterup/jquery.counterup.min.js"
	type="text/javascript"></script>
