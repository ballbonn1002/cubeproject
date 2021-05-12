<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script src="../assets/ajax/jquery-1.10.2.js" type="text/javascript"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="../assets/global/plugins/jquery.min.js"
	type="text/javascript"></script>
<script
	src="../assets/global/plugins/bootstrap-fileinput/bootstrap-fileinput.js"
	type="text/javascript"></script>
<link
	href="../assets/global/plugins/bootstrap-fileinput/bootstrap-fileinput.css"
	rel="stylesheet" type="text/css" />
<script src="../assets/global/plugins/jquery.blockui.min.js"
	type="text/javascript"></script>
<script src="../assets/layouts/global/scripts/quick-sidebar.min.js"
	type="text/javascript"></script>
<script src="../assets/layouts/global/scripts/quick-nav.min.js"
	type="text/javascript"></script>
<link href="http://code.jquery.com/ui/1.9.2/themes/base/jquery-ui.css"
	rel="stylesheet" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.9.2/jquery-ui.js"></script>
<script src="../assets/ajax/jquery-1.10.2.js" type="text/javascript"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<!-- Alert Script-->
<link
	href="../assets/global/plugins/bootstrap-fileinput/bootstrap-fileinput.css"
	rel="stylesheet" type="text/css" />
<script src="../assets/global/plugins/jquery.min.js"
	type="text/javascript"></script>
<script
	src="../assets/global/plugins/bootstrap-fileinput/bootstrap-fileinput.js"
	type="text/javascript"></script>
<script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
<script
	src="../assets/global/plugins/bootstrap-sweetalert/sweetalert.min.js"
	type="text/javascript"></script>
<script src="../assets/pages/scripts/ui-sweetalert.min.js"
	type="text/javascript"></script>
<link
	href="../assets/global/plugins/bootstrap-sweetalert/sweetalert.css"
	rel="stylesheet" type="text/css" />

<!-- End of Alert Script -->



<div class="portlet light bordered">
	<div class="portlet-title">
		<div class="caption">
			<span class="caption-subject font-red sbold uppercase"> <i
				class="icon-wrench"></i>&nbsp;Ticket
			</span>
		</div>
		<div class="actions">
			<a class="btn  btn-icon-only btn-default fullscreen"
				href="javascript:;" data-original-title="" title=""> </a>
		</div>
		<div class="actions right">
			<button type="button" class="btn green-jungle" id="addTicket"
				onclick="addTicket()">
				<i class="fa fa-plus"></i>&nbsp;Add Ticket
			</button>
		</div>
	</div>
	<div class="portlet-body">
		<div class="table-responsive">
			<table
				class="table table-striped table-bordered table-hover table-header-fixed"
				width="100%" id="table">
				<thead>
					<tr>
						<th class="text-center">No.</th>
						<th class="text-center">Name</th>
						<th class="text-center">User Assigned</th>
						<th class="text-center">Time Created</th>
						<th class="text-center">Status</th>
						<th class="text-center">Action</th>
						<th class="text-center">Close</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="ticket" items="${ticketList}" varStatus="Count">
						<tr>
							<td class="text-center">${Count.count}</td>
							<td>${ticket.ticket_name}</td>
							<td class="text-center">${ticket.user_assigned}</td>
							<td class="text-center"><fmt:formatDate
									value="${ticket.time_create}" pattern="dd-MM-yyyy HH:mm" /></td>
							<td class="text-center">${ticket.ticket_status_name}</td>

							<td style="text-align: center;"><a
								class="btn btn-circle btn-sm sbold blue" title="Edit"
								onclick="EditTicket(${ticket.ticket_id})" style="color: white;"><i
									class="fa fa-pencil"></i> </a> <a
								class="btn btn-circle btn-sm sbold red" title="Delete"
								onclick="DeleteTicket(${ticket.ticket_id})"
								style="color: white;"><i class="fa fa-trash"></i></a></td>
							<td>
								<div class="btn-group" class="text-center">

									<c:if test="${ticket.ticket_status_id.toString() == '1'}">

										<div class="open-${ticket.ticket_id}">
											<button class="btn btn-circle yellow-crusta" type="button"
												data-toggle="dropdown" data-hover="dropdown">
												Waiting for Approving<i class="fa fa-angle-down"></i>
											</button>
											<ul class="dropdown-menu pull-right" role="menu">
												<li><h4 style="color: white; text-align: center;">
														<a class="btn btn-info"
															onclick="setAssignStatus(${ticket.ticket_id})">
															Approve </a>
													</h4></li>
												<li><h4 style="color: white; text-align: center;">
														<a id="reject_leave_call01" class="btn btn-danger"
															onclick="setCloseStatus(${ticket.ticket_id});">
															Reject </a>
													</h4></li>
											</ul>
										</div>

										<div style="display: none;" class="assign-${ticket.ticket_id}">
											<button class="btn btn-circle blue" type="button"
												data-toggle="dropdown" data-hover="dropdown">
												Approved<i class="fa fa-angle-down"></i>
											</button>
											<ul class="dropdown-menu pull-right" role="menu">

												<li><h4 style="color: white; text-align: center;">
														<a class="btn btn-warning"
															onclick="setOpenStatus(${ticket.ticket_id})">Waiting
															for Approving</a>
													</h4></li>
												<li><h4 style="color: white; text-align: center;">
														<a id="reject_leave_call02" class="btn btn-danger"
															title="reject_leave_id"
															onclick="setCloseStatus(${ticket.ticket_id});">
															Reject </a>
													</h4></li>

											</ul>
										</div>

										<div style="display: none;" class="close--${ticket.ticket_id}">
											<button class="btn btn-circle red-mint" type="button"
												data-toggle="dropdown" data-hover="dropdown">
												Reject<i class="fa fa-angle-down"></i>
											</button>
											<ul class="dropdown-menu pull-right" role="menu">
												<li><h4 style="color: white; text-align: center;">
														<a class="btn btn-info"
															onclick="setAssignStatus(${ticket.ticket_id});">
															Approve </a>
													</h4></li>
												<li><h4 style="color: white; text-align: center;">
														<a class="btn btn-warning"
															onclick="setOpenStatus(${ticket.ticket_id})">Waiting
															for Approving</a>
													</h4></li>
											</ul>
										</div>

										<div style="display: none;" class="app1-${ticket.ticket_id}">
											<button class="btn btn-circle yellow-crusta" type="button"
												data-toggle="dropdown" data-hover="dropdown">
												Waiting for Approving<i class="fa fa-angle-down"></i>
											</button>
											<ul class="dropdown-menu pull-right" role="menu">
												<li><h4 style="color: white; text-align: center;">
														<button class="btn btn-danger"
															onclick="setAssignStatus(${ticket.ticket_id});">Approve</button>
													</h4></li>
												<li><h4 style="color: white; text-align: center;">
														<a id="reject_leave_call03" class="text-right"
															onclick="call_reject_popup(${ticket.ticket_id});">
															Reject </a>
													</h4></li>
											</ul>
										</div>

									</c:if>
									<c:if test="${ticket.ticket_status_id.toString() == '2'}">

										<div class="open-${ticket.ticket_id}">
											<button class="btn btn-circle blue" type="button"
												data-toggle="dropdown" data-hover="dropdown">
												Approved<i class="fa fa-angle-down"></i>
											</button>
											<ul class="dropdown-menu pull-right" role="menu">

												<li><h4 style="color: white; text-align: center;">
														<a class="btn btn-warning"
															onclick="setOpenStatus(${ticket.ticket_id})">Waiting
															for Approving</a>
													</h4></li>

												<li><h4 style="color: white; text-align: center;">
														<a class="btn btn-danger" title="reject_leave_id"
															id="reject_leave_call04"
															onclick="setCloseStatus(${ticket.ticket_id});">
															Reject </a>
													</h4></li>
												<li class="divider"></li>
											</ul>
										</div>

										<div style="display: none;" class="assign-${ticket.ticket_id}">
											<button class="btn btn-circle yellow-crusta" type="button"
												data-toggle="dropdown" data-hover="dropdown">
												Waiting for Approving<i class="fa fa-angle-down"></i>
											</button>
											<ul class="dropdown-menu pull-right" role="menu">
												<li><h4 style="color: white; text-align: center;">
														<a class="btn btn-info"
															onclick="setAssignStatus(${ticket.ticket_id})">
															Approve </a>
													</h4></li>
												<li><h4 style="color: white; text-align: center;">
														<a id="reject_leave_call01" class="btn btn-danger"
															onclick="setCloseStatus(${ticket.ticket_id});">
															Reject </a>
													</h4></li>
											</ul>
										</div>

										<div style="display: none;" class="close--${ticket.ticket_id}">
											<button class="btn btn-circle red-mint" type="button"
												data-toggle="dropdown" data-hover="dropdown">
												Reject<i class="fa fa-angle-down"></i>
											</button>
											<ul class="dropdown-menu pull-right" role="menu">
												<li><h4 style="color: white; text-align: center;">
														<a class="btn btn-info"
															onclick="setAssignStatus(${ticket.ticket_id});">
															Approve </a>
													</h4></li>
												<li><h4 style="color: white; text-align: center;">
														<a class="btn btn-warning"
															onclick="setOpenStatus(${ticket.ticket_id})">Waiting
															for Approving</a>
													</h4></li>

											</ul>
										</div>

										<div style="display: none;" class="app1-${ticket.ticket_id}">
											<button class="btn btn-circle yellow-crusta" type="button"
												data-toggle="dropdown" data-hover="dropdown">
												Waiting for Approving<i class="fa fa-angle-down"></i>
											</button>
											<ul class="dropdown-menu pull-right" role="menu">
												<li><h4 style="color: white; text-align: center;">
														<a class="btn btn-info"
															onclick="setAssignStatus(${ticket.ticket_id});">
															Approve </a>
													</h4></li>
												<li><h4 style="color: white; text-align: center;">
														<a class="btn btn-danger" title="reject_leave_id"
															id="reject_leave_call06"
															onclick="call_reject_popup(${ticket.ticket_id});">
															Reject </a>
													</h4></li>
											</ul>
										</div>

									</c:if>



									<c:if test="${ticket.ticket_status_id.toString() == '3'}">

										<div style="display: none;" class="open-${ticket.ticket_id}">
											<button class="btn btn-circle red-mint" type="button"
												data-toggle="dropdown" data-hover="dropdown">
												Reject<i class="fa fa-angle-down"></i>
											</button>
											<ul class="dropdown-menu pull-right" role="menu">
												<li><h4 style="color: white; text-align: center;">
														<a class="btn btn-info"
															onclick="setAssignStatus(${ticket.ticket_id});">
															Approve </a>
													</h4></li>
												<li><h4 style="color: white; text-align: center;">
														<a class="btn btn-warning"
															onclick="setOpenStatus(${ticket.ticket_id})">Waiting
															for Approving</a>
													</h4></li>

											</ul>
										</div>

										<div style="display: none;" class="assign-${ticket.ticket_id}">
											<button class="btn btn-circle blue" type="button"
												data-toggle="dropdown" data-hover="dropdown">
												Approved<i class="fa fa-angle-down"></i>
											</button>
											<ul class="dropdown-menu pull-right" role="menu">
												<li><h4 style="color: white; text-align: center;">
														<a class="btn btn-warning"
															onclick="setOpenStatus(${ticket.ticket_id})">Waiting
															for Approving</a>
													</h4></li>
												<li><h4 style="color: white; text-align: center;">
														<a class="btn btn-danger" title="reject_leave_id"
															id="reject_leave_call07"
															onclick="setCloseStatus(${ticket.ticket_id});"
															data-target="#reject_leave"> Reject </a>
													</h4></li>

												<li class="divider"></li>
											</ul>
										</div>

										<div class="close--${ticket.ticket_id}">
											<button class="btn btn-circle red-mint" type="button"
												data-toggle="dropdown" data-hover="dropdown">
												Reject<i class="fa fa-angle-down"></i>
											</button>
											<ul class="dropdown-menu pull-right" role="menu">
												<li><h4 style="color: white; text-align: center;">
														<a class="btn btn-info"
															onclick="setAssignStatus(${ticket.ticket_id});">
															Approve </a>
													</h4></li>
												<li><h4 style="color: white; text-align: center;">
														<a class="btn btn-warning"
															onclick="setOpenStatus(${ticket.ticket_id})">Waiting
															for Approving</a>
													</h4></li>
											</ul>
										</div>

										<div style="display: none;" class="app1-${ticket.ticket_id}">
											<button class="btn btn-circle yellow-crusta" type="button"
												data-toggle="dropdown" data-hover="dropdown">
												Waiting for Approving<i class="fa fa-angle-down"></i>
											</button>
											<ul class="dropdown-menu pull-right" role="menu">
												<li><h4 style="color: white; text-align: center;">
														<button class="btn btn-info"
															onclick="setAssignStatus(${ticket.ticket_id});">Approve</button>
													</h4></li>
												<li><h4 style="color: white; text-align: center;">
														<a class="btn btn-danger" id="reject_leave_call08"
															onclick="call_reject_popup(${ticket.ticket_id});">
															Reject </a>
													</h4></li>
											</ul>
										</div>

									</c:if>



								</div> <script>
									
										var rejectLeaveId;
										var reason;
						
										function call_reject_popup(id) {
											debugger;
											this.rejectLeaveId = id;
											console.log("callpopup-", rejectLeaveId);
											$("#reject_leave").modal();
											debugger;
										}
							
									</script>
							</td>

						</tr>
					</c:forEach>
				</tbody>

			</table>
		</div>
	</div>

</div>




<script>

	function DeleteTicket(id){
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
		 				    url : "deleteTicket.action",
		 					data : "ticket_id="+ id,
		 					type : "POST",
		 					success : function(response) {
		 						window.location.reload(true);
		 					}
		 			 });
		          return false
		        }
		      });
	}
	
	function addTicket(){
		location.href='addTicket';
	}
	
	function EditTicket(id){
		//console.log("data = " + id);
		location.href='editTicket?ticket_id=' + id;
// 		$.ajax({
// 			    url : "editFAQ.action",
// 				data : "faq_id="+ id,
// 				type : "POST",
// 				success : function(response) {
// 					location.href='editFAQ?faq_id=' + id;
// 				}
// 		 });
	}
	
	function setAssignStatus(boo) {
		ticketId=boo;
	 $.ajax({
         url: "setTicketAssignStatus.action",
         type: 'POST',
         data : {
        	"ticket_id" : ticketId
         }, 
	 }).done(function(data) {
		 $('.open-'+ticketId).hide();
		 $('.close--'+ticketId).hide();
		 $('.assign-'+ticketId).show();
		 swal("Success!","Ticket ID "+boo+" was approved")
		 
		}).fail(function() {
			swal("Fail to approve ID : "+boo)
		});
	}
	
	function setOpenStatus(boo) {
		ticketId=boo;
	 $.ajax({
         url: "setTicketOpenStatus.action",
         type: 'POST',
         data : {
        	"ticket_id" : ticketId
         }, 
	 }).done(function(data) {
		 $('.open-'+ticketId).show();
		 $('.assign-'+ticketId).hide();
		 $('.close--'+ticketId).hide();
		 swal("Success!","Ticket ID "+boo+" was opened")
		 
		}).fail(function() {
			swal("Fail to open ID : "+boo)
		});
	}
	
	function setCloseStatus(boo) {
		ticketId=boo;
	 $.ajax({
         url: "setTicketCloseStatus.action",
         type: 'POST',
         data : {
        	"ticket_id" : ticketId
         }, 
	 }).done(function(data) {
		 $('.open-'+ticketId).hide();
		 $('.assign-'+ticketId).hide();
		 $('.close--'+ticketId).show();
		 swal("Success!","Ticket ID "+boo+" was closed")
		 
		}).fail(function() {
			swal("Fail to close ID : "+boo)
		});
	}
	
</script>
