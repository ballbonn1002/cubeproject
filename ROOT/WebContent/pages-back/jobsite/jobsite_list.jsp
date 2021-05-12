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
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<script>
  AOS.init();
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
				class="caption-subject font-red sbold "> Jobsite </span>
		</div>
		<div class="actions">
			<a class="btn green-meadow float-right" id="addTimesheet"
				onclick="job_site_list_add()"> <i class="fa fa-plus"></i>&nbsp;
				New JobSite
			</a> &emsp;&emsp; <a
				class="btn btn-circle btn-icon-only btn-default fullscreen"
				href="javascript:;" data-original-title="" title=""> </a>
		</div>

	</div>
	<div class="portlet-body" style="text-align: center;">
		<div class="row">
		<div class="col-md-3 col-xs-0"></div>
			<div class="col-md-4 col-xs-8">
				<select class="form-control select2me" name="type" id="type"
					style="padding-left: 0px !important; padding-right: 0px">
					<c:forEach var="jobsitelist" items="${jobsitelist}">
						<option value="${jobsitelist.id_sitejob}"
							id="${jobsitelist.leaveTypeId}">${jobsitelist.name_site}</option>
					</c:forEach>
				</select>
			</div>
			<div class="col-md-5 col-xs-4 text-left">
				<button type="submit" class="btn btn-sm blue-steel" id="btn_"
					value="submit">
					<i class="fa fa-check"></i>&nbsp; Submit
				</button>
			</div>
		</div>
		<br>
		<!-- --------------------------------------------------------------End search------------------------------------------------------ -->

		<!-- -----------------------------------------start add-------------------------------------------- -->
		<br>
		<div class="portlet-body" style="text-align: center;">
			<table class="table table-striped table-header-fixed" id="myTable" data-aos="fade"  data-aos-duration="2000">
				<thead>
					<tr
						style="background-color: rgb(59, 63, 81); color: white; height: 41px">
						<th class="text-center" width="50px">ID</th>
						<th class="text-center" width="150px">Name</th>
						<th class="text-center" width="150px">Name Site</th>
						<th class="text-center" width="150px">Job Site</th>
						<th class="text-center" width="75px"></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="userlist" items="${cubesoftUsers}"
						varStatus="Count">
						<tr>

							<td><span class="btn red-thunderbird btn-outline" style="width: 150px"><i
									class="fa fa-user"></i> ${userlist.id}</span></td>
							<td><span class="btn purple-seance btn-outline" style="width: 300px"><i
									class="fa fa-user"></i> ${userlist.name}</span></td>
						  <c:set var = "site" scope = "session" value = "${userlist.id_sitejob}"/>
							<c:choose>
								<c:when test="${site == null}">
									<td></td>
								</c:when>
								<c:otherwise>
        							<td><span class="btn blue-chambray btn-outline"
								style="width: 150px">${userlist.name_site}</span></td>
							</c:otherwise>
							</c:choose>
						
							<td class="text-center"><div class="md-checkbox-list test text-center">
									<div>
										<div class="md-checkbox" style="margin-left: 32%;">
											<input type="checkbox" id="${userlist.id}" class="md-check"
												value="${userlist.id}" name="aum"
												onclick="clickcheck('${userlist.id}')"> <label
												for="${userlist.id}"> <span></span><span
												class="check"></span> <span class="box"></span>
											</label>
										</div>
									</div>
								</div></td>
								  <c:set var = "site" scope = "session" value = "${userlist.id_sitejob}"/>
							<c:choose>
								<c:when test="${site == null}">
									<td></td>
								</c:when>
								<c:otherwise>
        						<td><a onclick="delsitejob('${userlist.id}')"><span class="btn red btn-circle" style="width: 85px"><i
									class="fa fa-trash"></i> Delete</span></a></td>
							</c:otherwise>
							</c:choose>							
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<!-- -----------------------------------------End add-------------------------------------------- -->

	</div>
	<script>
		$(document).ready(function() {
			$('#myTable').DataTable();
			console.log("asd");
		});
	</script>

	<script>
		var checkbox_value = [];
		var checkbox_value2 = "";
		function clickcheck(user) {

			console.log(checkbox_value);

			const index = checkbox_value.indexOf(user);
			if (index > -1) {
				checkbox_value.splice(index, 1);
			} else {
				checkbox_value.push(user);
			}

			console.log(checkbox_value);

		};
	</script>





	<script>
		$("#btn_").on('click', function() {
			var ns = document.getElementById('type').value;
			console.log(ns)

			for (var i = 0; i < checkbox_value.length; i++) {
				checkbox_value2 += checkbox_value[i] + ",";
			}
			console.log(checkbox_value2);
			$.ajax({
				url : "add_jobsite",
				method : "POST",
				type : "JSON",
				data : {
					"userid" : checkbox_value2,
					"namesite" : ns,

				},
				success : function(data) {
					swal({
						title : "Pass",
						text : "Saved Succcess",
						type : "success"
					}, function() {
						window.location.href = "job_site_list";
					});
				}

			})
		});
	</script>
	<script>
		function job_site_list_add() {
			location.href = 'job_site_list_add';
		};
		function delsitejob(id) {
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
			 				    url : "delete_jobsite.action",
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
	<script>
		function submit() {
			var namesite = document.getElementById('type').value;

			console.log(namesite)

		}
	</script>
	<script
		src="../assets/global/plugins/counterup/jquery.waypoints.min.js"
		type="text/javascript"></script>
	<script
		src="../assets/global/plugins/counterup/jquery.counterup.min.js"
		type="text/javascript"></script>