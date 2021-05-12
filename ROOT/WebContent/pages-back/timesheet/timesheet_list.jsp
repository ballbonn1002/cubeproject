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

<fmt:formatDate pattern="yyyy" value="${dateTimeNow}" var="year_now" />
<fmt:formatDate pattern="MM" value="${dateTimeNow}" var="month_now" />
<fmt:formatDate pattern="dd" value="${dateTimeNow}" var="day_now" />
<fmt:formatDate pattern="dd-MM-yyyy" value="${dateTimeNow}"
	var="dateNow" />
<fmt:formatDate pattern="HH:mm" value="${dateTimeNow}" var="timeNow" />

<div class="portlet light bordered">
	<div class="portlet-title">

		<div class="caption">
			<i class="fa fa-edit font-red"></i> <span
				class="caption-subject font-red sbold "> Timesheet </span>
		</div>
		<div class="actions">
			<button type="button" class="btn green-meadow float-right"
				id="addTimesheet" onclick="addTimesheetPage()">

				<i class="fa fa-plus"></i>&nbsp; New Timesheet
			</button>
			&emsp;&emsp; <a
				class="btn btn-circle btn-icon-only btn-default fullscreen"
				href="javascript:;" data-original-title="" title=""> </a>
		</div>

	</div>
	<div class="portlet-body" style="text-align: center;">

		<form class="form-inline margin-bottom-40" action="searchTimesheet"
			method="POST">
			<!-- --------------------------------------------------------------Start search------------------------------------------------------ -->
			<input type="hidden" id="tempuser" name="tempuser"
				class="form-control" />


			<perm:permission object="timesheet.edit">
				<div class="form-group form-md-line-input ">
					<label class="control-label" for="form_control_1">Staff : </label>
					<select class="form-control select2me" name="name" id=name>
						<optgroup label="Enable">
							<c:forEach var="user" items="${userseq}">

								<c:if test="${user.enable == 1 }">
									<c:if test="${logonUser == null }">
										<option value="${user.id}" id="${user.id}"
											<c:if test="${fn:containsIgnoreCase(user.id,onlineUser.id)}"><c:out value="selected=selected"/></c:if>>${user.department_id}
											- ${user.name}</option>
									</c:if>
									<c:if test="${logonUser != null }">
										<option value="${user.id}" id="${user.id}"
											<c:if test="${fn:containsIgnoreCase(user.id,logonUser)}"><c:out value="selected=selected"/></c:if>>${user.department_id}
											- ${user.name}</option>
									</c:if>
								</c:if>
							</c:forEach>
						</optgroup>
						<optgroup label="Disable">
							<c:forEach var="user" items="${userseq}">

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
			<button type="submit" class="btn btn-sm blue-steel" onclick="ddd()">
				<i class="fa fa-search"></i> Search
			</button>
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
		<!-- --------------------------------------------------------------End search------------------------------------------------------ -->

		<!-- -----------------------------------------start add-------------------------------------------- -->
		<br>
		<div class="portlet-body" style="text-align: center;">
			<table class="table table-striped table-header-fixed" id="table_id">
				<thead>
					<tr
						style="background-color: rgb(59, 63, 81); color: white; height: 41px">
						<th class="text-center" width="50px"></th>
						<th class="text-center" width="200px">Date</th>
						<th class="text-center " width="300px"
							style="background-color: #3B3F51; color: white;">Project</th>
						<!-- <th class="text-center " width="200px"
							style="background-color: #3B3F51; color: white;">Function</th> -->
						<th class="text-center " width="450px"
							style="background-color: #3B3F51; color: white;">Detail</th>
						<th class="text-center " width="250px"
							style="background-color: #3B3F51; color: white;">Team</th>
						<th class="text-center " width="250px"
							style="background-color: #3B3F51; color: white;">Period of
							Time</th>
						<th class="text-center " width="75px"
							style="background-color: #3B3F51; color: white;"></th>
						<th class="text-center " width="75px"
							style="background-color: #3B3F51; color: white;"></th>
						<th class="text-center " width="100px"
							style="background-color: #3B3F51; color: white;"></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="lts" items="${listtime}" varStatus="Count">
						<tr>
							<fmt:formatDate var="test" value="${lts.time_check_in}"
								pattern="E" />
							<c:set var="val" value="5" />
							<c:choose>
								<c:when test="${test=='Sun'}">
									<td class="text-center"><a href="javascript:;"
										class="btn btn-md btn-circle red easy-pie-chart-reload"><i
											class="fa fa-calendar"></i></a></td>
								</c:when>
								<c:when test="${test=='Mon'}">
									<td class="text-center"><a href="javascript:;"
										class="btn btn-md btn-circle yellow-lemon easy-pie-chart-reload"><i
											class="fa fa-calendar"></i></a></td>
								</c:when>
								<c:when test="${test=='Tue'}">
									<td class="text-center"><a href="javascript:;"
										class="btn btn-md btn-circle red-pink easy-pie-chart-reload"><i
											class="fa fa-calendar"></i></a></td>
								</c:when>
								<c:when test="${test=='Wed'}">
									<td class="text-center"><a href="javascript:;"
										class="btn btn-md btn-circle green-jungle easy-pie-chart-reload"><i
											class="fa fa-calendar"></i></a></td>
								</c:when>
								<c:when test="${test=='Thu'}">
									<td class="text-center"><a href="javascript:;"
										class="btn btn-md btn-circle yellow-gold easy-pie-chart-reload"><i
											class="fa fa-calendar"></i></a></td>
								</c:when>
								<c:when test="${test=='Fri'}">
									<td class="text-center"><a href="javascript:;"
										class="btn btn-md btn-circle green easy-pie-chart-reload"><i
											class="fa fa-calendar"></i></a></td>
								</c:when>
								<c:when test="${test=='Sat'}">
									<td class="text-center"><a href="javascript:;"
										class="btn btn-md btn-circle blue easy-pie-chart-reload"><i
											class="fa fa-calendar"></i></a></td>
								</c:when>
								<c:otherwise>
        						error.
							</c:otherwise>
							</c:choose>
							<td><fmt:formatDate value="${lts.time_check_in}"
									pattern="EE dd-MM-yyyy" /></td>
							<td class="text-left">${lts.project_name}</td>
							<%-- <td class="text-center">${lts.function_name}</td> --%>
							<td class="text-left">${lts.description}</td>
							<td class="text-center">${lts.team}</td>
							<td class="text-center"><div>
									<i class="fa fa-sun-o" style="color: orange;"></i>&nbsp;
									<fmt:formatDate value="${lts.time_check_in}" pattern="HH:mm" />
									-
									<fmt:formatDate value="${lts.time_check_out}" pattern="HH:mm" />
								</div> <fmt:formatDate var="tt" value="${lts.OT_time_start}"
									pattern="E" /> <c:set var="val" value="5" /> <c:choose>
									<c:when test="${tt==Null}">

									</c:when>
									<c:otherwise>
										<div>
											<i class="fa fa-moon-o" style="color: blue;"></i>&nbsp;
											<fmt:formatDate value="${lts.OT_time_start}" pattern="HH:mm" />
											-
											<fmt:formatDate value="${lts.OT_time_end}" pattern="HH:mm" />
										</div>
									</c:otherwise>
								</c:choose></td>
							<td><c:if test="${lts.status.toString() == 'W'}">
									<button type="button" class="btn circle btn-outline blue float-right" id=""
										onclick="editTimesheet(${lts.id})">
										<i class="fa fa-pencil-square-o"></i>
									</button>
								</c:if></td>
							<td>

								<button type="button" class="btn circle btn-outline red-intense float-left" id=""
									onclick="delTimesheet(${lts.id})">
									<i class="fa fa-trash"></i>
								</button>

							</td>
							<td><c:if test="${lts.status.toString() == 'W'}">
									<perm:permission object="timesheet.edit">
										<a class="btn yellow-lemon" onclick="ajaxLoad(${lts.id})">
											<i class="fa fa-check-square-o"></i>&nbsp; Approve
										</a>
									</perm:permission>
								</c:if></td>
						</tr>

					</c:forEach>
				</tbody>
			</table>
			<perm:permission object="timesheet.edit">
				<button type="button" id="demo" class="btn blue-soft bg-font-green"
					onclick="approveall()">
					<i class="fa fa-files-o"></i>&nbsp;Approve ALL
				</button>
			</perm:permission>
		</div>
		<input type="hidden" id="userap" name="userap"
			value="${onlineUser.id}" class="form-control" />

		<!-- -----------------------------------------End add-------------------------------------------- -->
		<!--  </div>
	<div class="caption">
		<i class="icon-layers font-blue-madison"></i> <span
			class="caption-subject font-blue-madison sbold uppercase">timesheet
			Report</span>
	</div>
	<br> <br>
	<form action="timesheetReport" method="post">

		<button class="btn paddinglg sbold blue" type="submit">Print
			PDF</button>
	</form> -->
	</div>
	<script type="text/javascript">

jQuery(document).ready( function ($) {
	$.extend( true, $.fn.dataTable.defaults, {
	    "searching": true,
	    "ordering": false
	} );
  var table =  $('#table_id').DataTable({ 
      "order": false,
      "info": false,
      "paging": false, // รวมไว้หน้าเดียว
    	 dom: 'Bfrtip',
    	 buttons: [
    		 'copyHtml5',
             'excelHtml5',
             'csvHtml5',
             'pdfHtml5'
    	    ]  ,
    	    pageLength: 25,
    }); 
});

</script>
	<script>
function approveall() {
	var names = document.getElementById('name').value;
	var months = document.getElementById('monthSearch').value;
	var years = document.getElementById('yearSearch').value;

	
	console.log(names + " " + months+ " " +years);

 $.ajax({
	 url : "addapproveAll",
		method : "POST",
		type : "JSON",
		data : {
			"name" : names,
			"month" : months,
			"year" : years
		},
		success : function(data){
			 location.reload();
     }
 	});
}</script>
	<script>
function ajaxLoad(boo) {
	leaveId=boo;
 $.ajax({
     url: '${pageContext.request.contextPath}/addapprove',
     type: 'POST',
     data : {
    	"id" : leaveId
     }, 
     success: function(html){
         location.reload();
     }
 }).done(function(data) {
	 $('.wait-'+boo).hide();
	 $('.app-'+boo).show();
	 swal("Success!","timesheet ID "+boo+" was approved")
	 
	}).fail(function() {
		swal("Fail to approve ID : "+boo)
	});
}</script>
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

	<script type="text/javascript">
	function ajaxCall(day, month, year) {
		//alert(day);
		var discription = $('#discription' + day).val();
		var timeIn = $('#timeIn' + day).val();
		var timeOut = $('#timeOut' + day).val();
		var date = $('#date' + day).val();
		var time = $('#time' + day).val();
		var id = $('#id' + day).val();
		var projectf = $('#projectf' + day).val();
		var functionf = $('#functionf' + day).val();

		swal({
			title : "Are you sure?",
			text : "You will save this row.",
			type : "info",
			showCancelButton : true,
			confirmButtonClass : "btn-info",
			confirmButtonText : "Yes, save it!",
			cancelButtonText : "No, cancel please!",
			closeOnConfirm : false,
			closeOnCancel : false
		}, function(isConfirm) {
			if (isConfirm) {
				if (discription != "" && timeIn != "" && timeOut != ""
						&& timeIn != "0:00" && timeOut != "0:00") {
					$.ajax({
						url : "addTimesheet",
						method : "POST",
						type : "JSON",
						data : {
							"discription" : discription,
							"time_in" : timeIn,
							"time_out" : timeOut,
							"date_now" : date,
							"time_now" : time,
							"dateInOut" : day,
							"monthInOut" : month,
							"yearInOut" : year,
							"id" : id,
							"projectf" : projectf,
							"functionf" : functionf
						},
						success : function(data) {
							console.log(data);
							console.log($('.timesheetTable').html(data));
							swal("Done!", "Your timesheet has been save.",
									"success");
							setTimeout(location.reload.bind(location), 800);
						}
					})
				} else {
					swal('Please!',
							'Input your discription,time check,time check out',
							'error');
				}

			} else {
				swal("Cancelled", "Your timesheet did not save :)", "error");
			}
		});

	};
</script>
	<script type="text/javascript">
	function ajaxCalldel(day, month, year) {

		var discription = $('#discription' + day).val();
		var timeIn = $('#timeIn' + day).val();
		var timeOut = $('#timeOut' + day).val();
		var date = $('#date' + day).val();
		var time = $('#time' + day).val();
		var id = $('#id' + day).val();
		var projectf = $('#projectf' + day).val();
		var functionf = $('#functionf' + day).val();
		if (discription != "" && timeIn != "" && timeOut != ""
				&& timeIn != "0:00" && timeOut != "0:00") {
			$.ajax({
				url : "delTimesheet",
				method : "POST",
				type : "JSON",
				data : {
					"discription" : discription,
					"time_in" : timeIn,
					"time_out" : timeOut,
					"date_now" : date,
					"time_now" : time,
					"dateInOut" : day,
					"monthInOut" : month,
					"yearInOut" : year,
					"id" : id,
					"projectf" : projectf,
					"functionf" : functionf
				},
				success : function(data) {
					console.log(data);
					console.log($('.timesheetTable').html(data));
					swal('Delete!', 'Success!', 'warning');
				}
			})
		} else {
			swal('Please!', 'Input your discription,time check,time check out',
					'error');
		}

	};
</script>
	<script>
	document.querySelector('.sweet-${status.count}').onclick = function() {
		swal({
			title : "Are you sure!",
			text : "You will be deleting this id!",
			type : "info",
			showCancelButton : true,
			confirmButtonClass : 'btn-primary',
			confirmButtonText : 'OK'
		}, function(inputValue) {
			if (inputValue === false)
				return false;
			if (inputValue === "") {
				return false
			}
			document.location = "delTimesheet?id=${timesheet.id}";
		});
	};
</script>

	<script type="text/javascript">
	function ajaxSaveAll(endDay, month, year) {
		var day;
		swal({
			title : "Are you sure?",
			text : "Your will not be able to recover this imaginary file!",
			type : "info",
			showCancelButton : true,
			confirmButtonClass : "btn-success",
			confirmButtonText : "Yes, Save it!",
			closeOnConfirm : false
		}, function() {
			for (day = 1; day <= endDay; day++) {
				var discription = $('#discription' + day).val();
				var timeIn = $('#timeIn' + day).val();
				var timeOut = $('#timeOut' + day).val();
				var date = $('#date' + day).val();
				var time = $('#time' + day).val();
				var id = $('#id' + day).val();
				var projectf = $('#projectf' + day).val();
				var functionf = $('#functionf' + day).val();
				if (discription != "" && timeIn != "" && timeOut != ""
						&& timeIn != "0:00" && timeOut != "0:00") {

					$.ajax({
						url : "addTimesheet",
						method : "POST",
						type : "JSON",
						data : {
							"discription" : discription,
							"time_in" : timeIn,
							"time_out" : timeOut,
							"date_now" : date,
							"time_now" : time,
							"dateInOut" : day,
							"monthInOut" : month,
							"yearInOut" : year,
							"id" : id,
							"projectf" : projectf,
							"functionf" : functionf
						},
						success : function(data) {

						}
					})
				}
			}
			swal("Done!", "", "success");
		});

	};
</script>

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
	function addTimesheetPage() {
		location.href='addTimesheetPage';
	};
</script>
	<script type="text/javascript">
	function showTimeIn(day) {
		var timeInHidden = $('#timeInHidden' + day).val();
		$('#timeIn' + day).val(timeInHidden);
		document.getElementById("timeIn" + day).className = "font-black form-control timepicker timepicker-24";
	}
	function showTimeOut(day) {
		var timeOutHidden = $('#timeOutHidden' + day).val();
		$('#timeOut' + day).val(timeOutHidden);
		document.getElementById("timeOut" + day).className = "font-black form-control timepicker timepicker-24";
	}
</script>
	<script>
	function myFunction() {
		var input, filter, table, tr, td, i;
		input = document.getElementById("myInput");
		filter = input.value.toUpperCase();
		table = document.getElementById("myTable");
		tr = table.getElementsByTagName("tr");
		for (i = 0; i < tr.length; i++) {
			td = tr[i].getElementsByTagName("td")[0];
			td1 = tr[i].getElementsByTagName("td")[1];
			td2 = tr[i].getElementsByTagName("td")[2];
			td3 = tr[i].getElementsByTagName("td")[3];
			td4 = tr[i].getElementsByTagName("td")[4];
			if (td) {
				if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
					tr[i].style.display = "";
				} else {
					tr[i].style.display = "none";
					if (td1.innerHTML.toUpperCase().indexOf(filter) > -1) {
						tr[i].style.display = "";
					} else {
						tr[i].style.display = "none";
						if (td2.innerHTML.toUpperCase().indexOf(filter) > -1) {
							tr[i].style.display = "";
						} else {
							tr[i].style.display = "none";
							if (td3.innerHTML.toUpperCase().indexOf(filter) > -1) {
								tr[i].style.display = "";
							} else {
								tr[i].style.display = "none";
								if (td4.innerHTML.toUpperCase().indexOf(filter) > -1) {
									tr[i].style.display = "";
								}
							}
						}
					}
				}
			}
		}
	}
</script>

	<script>
	function getProjectFunction(idProj, idFunc) {
		var amphureObject = $(idProj);
		var districtObject = $(idFunc);
		// on change amphure

		var amphureId = $(amphureObject).val();

		$.getJSON('time_list?id=' + amphureId, function(result) {
			districtObject.empty();
			$.each(result, function(index, item) {
				districtObject.append($('<option></option>').val(
						item.function_id).html(item.function_name));
			});
		});

	};
</script>
	<script>
				function editTimesheet(id) {
					location.href='timesheet_edit?id=' + id;
				};
				
				function delTimesheet(id) {
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
					 				    url : "delTimesheet.action",
					 					data : "id="+ id,
					 					type : "POST",
					 					success : function(response) {
					 						window.location.reload(true);
					 					}
					 			 });
					          return false
					        }
					      });
				}
</script>





	<script
		src="../assets/global/plugins/counterup/jquery.waypoints.min.js"
		type="text/javascript"></script>
	<script
		src="../assets/global/plugins/counterup/jquery.counterup.min.js"
		type="text/javascript"></script>