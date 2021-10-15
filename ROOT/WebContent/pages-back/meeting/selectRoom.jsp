<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/tlds/permission.tld" prefix="perm"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<script src="https://unpkg.com/@popperjs/core@2"></script>
<script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="../assets/global/plugins/bootstrap-sweetalert/sweetalert.min.js"
	type="text/javascript"></script>
<link
	href="../assets/global/plugins/bootstrap-sweetalert/sweetalert.css"
	rel="stylesheet" type="text/css" />
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/2.0.1/css/toastr.css"
	rel="stylesheet" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/2.0.1/js/toastr.js"></script>

<link rel="shortcut icon" href="favicon.ico" />
<script
	src="${pageContext.request.contextPath}/assets/global/plugins/fancybox/lib/jquery-1.10.1.min.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/global/plugins/jquery-ui/jquery-ui.min.js"></script>

<script type="text/javascript"
	src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
<script type="text/javascript"
	src="https://cdn.datatables.net/buttons/1.3.1/js/dataTables.buttons.min.js"></script>
<script type="text/javascript"
	src="https://cdn.datatables.net/buttons/1.3.1/js/buttons.flash.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<!-- <script type="text/javascript"
	src="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.27/build/pdfmake.min.js"></script> -->
<!-- <script type="text/javascript"
	src="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.27/build/vfs_fonts.js"></script> -->
<script type="text/javascript"
	src="https://cdn.datatables.net/buttons/1.3.1/js/buttons.html5.min.js"></script>
<script type="text/javascript"
	src="https://cdn.datatables.net/buttons/1.3.1/js/buttons.print.min.js"></script>
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>

<!-- multi-select -->
<script
	src="../assets/global/plugins/jquery-multi-select/js/jquery.multi-select.js"
	type="text/javascript"></script>
<script
	src="../assets/global/plugins/jquery-multi-select/js/jquery.quicksearch.js"
	type="text/javascript"></script>

<link
	href="../assets/global/plugins/jquery-multi-select/css/multi-select.css"
	rel="stylesheet" type="text/css" />

<script>
  AOS.init();
</script>

<style>
@media only screen and (max-width: 1200px) {
	#search {
		margin-top: 15px;
	}
}
</style>
<style>
.center{
	text-align:center;
}
.dropup {
	align-items: center;
}

.name-room {
	text-align: center;
}

#owner:hover {
	color: #2596be;
	cursor: pointer;
}

#icon {
	color: white;
}

#icon:hover {
	color: salmon;
}

.timepicker {
	position: absolute;
	z-index: 1000;
	float: left;
	width: 160px;
	padding-bottom: 5px;
	margin: 2px 0 0 0;
	list-style: none;
	font-size: 14px;
	text-align: center;
	background-color: #fff;
	border: 1px solid #ccc;
	border: 1px solid rgba(0, 0, 0, 0.15);
	border-radius: 4px;
	-webkit-box-shadow: 0 6px 12px rgba(0, 0, 0, 0.175);
	box-shadow: 0 6px 12px rgba(0, 0, 0, 0.175);
	background-clip: padding-box;
}
</style>
<!-- pagination -->
<style>
.paginationx {
	text-align: center;
	margin: 30px 30px 60px;
	user-select: none;
}

.paginationx li {
	display: inline-block;
	margin: 5px;
	box-shadow: 0 5px 25px rgb(1 1 1/ 10%);
}

.paginationx li a {
	color: #fff;
	text-decoration: none;
	font-size: 1.2em;
	line-height: 45px;
}

.previous-page, .next-page {
	background: #0AB1CE;
	width: 80px;
	border-radius: 45px;
	cursor: pointer;
	transition: 0.3s ease;
}

.previous-page:hover {
	transform: translateX(-5px);
}

.next-page:hover {
	transform: translateX(5px);
}

.current-page, .dots {
	background: #ccc;
	width: 45px;
	border-radius: 50%;
	cursor: pointer;
}

.activex {
	background: #0AB1CE;
}

.disablex {
	background: #ccc;
}
</style>
<!-- pagination -->
<script>
				
				$("tr:not(:first)").each(function (index ) {
					   $(this).css('animation-delay',index *0.01 +'s');
					}); 
								
				</script>

<div class="portlet light bordered">
	<div class="portlet-title">

		<div class="caption">
			<i class="icon-layers font-red"></i> <span id="ss"
				class="caption-subject font-red sbold uppercase">Room ${date_cal} </span>
			<c:set var="s" value="<%=new java.util.Date()%>" />
			<fmt:formatDate var="a" pattern="HH:mm" value="${s}" />
			<fmt:formatDate var="datetoday" pattern="yyyy-MM-dd" value="${s}" />
		</div>

		<div class="actions">
			<button type="button" class="btn btn-sm green-meadow" id="addLeave"
				data-toggle="modal" data-target="#addRoom" data-backdrop="static"
				data-keyboard="false">
				<i class="fa fa-key"></i> <b>CREATE ROOM </b>
			</button>
			<a class="btn  btn-icon-only btn-default fullscreen"
				href="javascript:;" data-original-title="" title=""> </a>
		</div>


	</div>
	<div class="portlet-body">
		<div class="tools">
			<a href="javascript:;" class="collapse" data-original-title=""
				title=""> </a> <a href="#portlet-config" data-toggle="modal"
				class="config" data-original-title="" title=""> </a> <a
				href="javascript:;" class="reload" data-original-title="" title="">
			</a> <a href="javascript:;" class="remove" data-original-title=""
				title=""> </a>
		</div>
		<div class="portlet-body"></div>




		<div class="portlet-body flip-scroll" style="text-align: center;">



			<div class="row ">
				<div class="card-content" style="display: none;">
					<c:forEach var="amount" items="${amountRoom}">

						<div class="col-xs-12 col-lg-3 col-xl-3">
							<div class="card" id="card"
								style=" height: 67vh; margin-top: 20px; box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);">

								<table id="${amount.idroom}">
									<thead>

										<tr style="background-color: rgb(59, 63, 81); color: white">
											<th style="width:100px" class="center" >Name</th>
											<th height="41"><center>Room No.
													${amount.idroom} ${amount.room_name}</center></th>
											<c:if test="${date_cal>=datetoday}">
												<th style="width: 37px;"><c:if test="${date_cal>=datetoday}">
												<a id="icon"
													class="btn btn-light" data-toggle="modal"
													data-target="#Reserve" data-backdrop="static"
													data-keyboard="false" onClick="Reserve(${amount.idroom})">


														<i class="fa fa-plus"></i>

												</a></c:if></th>
											</c:if>
											
											<c:if test="${date_cal<datetoday}">
												<th style="width: 37px;"></th>
											</c:if>
										</tr>
									</thead>
									<c:forEach var="list" items="${AllMeetperDay}">
									<!-- อดีต -->
									<c:if test="${list.date<datetoday}">
										<c:if test="${list.idroom==amount.idroom}">
											

												<tr height="41">

													<c:if test="${list.user_reserve==onlineUser.id}">
														<td ><i class="fa fa-user"
															aria-hidden="true"></i> ${list.user_reserve}</td>
													</c:if>
													<c:if test="${list.user_reserve!=onlineUser.id}">
														<td ></td>
													</c:if>

													<td><i class="fa fa-clock-o" aria-hidden="true"></i> <b><fmt:formatDate
																type="date" value="${list.time_start}" pattern="HH:mm" />
															น. - <fmt:formatDate type="date" value="${list.time_end}"
																pattern="HH:mm" /> น.</b></td>


													<td style="width: 25px"><i class="fa fa-check"
														aria-hidden="true"></i></td>


												</tr>
											
										</c:if>
										</c:if>
									
									<!-- ปัจจุบัน -->
										<c:if test="${list.date==datetoday}">
										<c:if test="${list.idroom==amount.idroom}">
											<c:if test="${list.time_start>a}">
												<tr class="bg-success owner" height="41">

													<c:if test="${list.user_reserve==onlineUser.id}">
														<td class="center" ><i class="fa fa-user"
															aria-hidden="true"></i> ${list.user_reserve}</td>
													</c:if>
													<c:if test="${list.user_reserve!=onlineUser.id}">
														<td ></td>
													</c:if>

													<td><i class="fa fa-clock-o" aria-hidden="true"></i> <b><fmt:formatDate
																type="date" value="${list.time_start}" pattern="HH:mm" />
															น. - <fmt:formatDate type="date" value="${list.time_end}"
																pattern="HH:mm" /> น.</b></td>

													<c:if test="${list.user_reserve==onlineUser.id}">
														<td >

															<div class="dropdown">
																<div class="dropdown-toggle"
																	id="dropdownMenu${list.idroom}" data-toggle="dropdown"
																	aria-haspopup="true" aria-expanded="false">
																	<i class="fa fa-ellipsis-v "> </i>
																</div>
																<ul class="dropdown-menu  pull-right  "
																	aria-labelledby="dropdownMenu${list.idroom}">
																	<li><a
																		href="Edit_Meeting?meetingid=${list.idmeeting}&roomid=${amount.idroom}&date_cal=${date_cal}">Edit
																			and Invite</a></li>
																	 
																	<%-- <li><a data-toggle="modal"
																		data-target="#Inviting-room${amount.idroom}-idmeeting"
																		data-backdrop="static" data-keyboard="false"
																		onClick="inviting(${amount.idroom},${list.idmeeting},'${time_start}','${time_end}')">Invite</a></li> --%> 
																	<li><a onclick="del(${list.idmeeting});">Delete</a></li>
																	

																</ul>
															</div>


														</td>
													</c:if>
													<c:if test="${list.user_reserve!=onlineUser.id}">
														<td></td>
													</c:if>

												</tr>
											</c:if>
											<c:if test="${list.time_start<=a && list.time_end>=a}">
												<tr class="bg-warning" height="41">

													<c:if test="${list.user_reserve==onlineUser.id}">
														<td ><i class="fa fa-user"
															aria-hidden="true"></i> ${list.user_reserve}</td>
													</c:if>
													<c:if test="${list.user_reserve!=onlineUser.id}">
														<td ></td>
													</c:if>

													<td><i class="fa fa-clock-o" aria-hidden="true"></i> <b>
															<fmt:formatDate type="date" value="${list.time_start}"
																pattern="HH:mm" /> น. - <fmt:formatDate type="date"
																value="${list.time_end}" pattern="HH:mm" /> น.
													</b></td>



													<td style="width: 25px"><i class="fa fa-hourglass-end"
														aria-hidden="true"></i></td>


												</tr>
											</c:if>

											<c:if test="${list.time_end<a}">
												<tr height="41">

													<c:if test="${list.user_reserve==onlineUser.id}">
														<td ><i class="fa fa-user"
															aria-hidden="true"></i> ${list.user_reserve}</td>
													</c:if>
													<c:if test="${list.user_reserve!=onlineUser.id}">
														<td ></td>
													</c:if>

													<td><i class="fa fa-clock-o" aria-hidden="true"></i> <b><fmt:formatDate
																type="date" value="${list.time_start}" pattern="HH:mm" />
															น. - <fmt:formatDate type="date" value="${list.time_end}"
																pattern="HH:mm" /> น.</b></td>


													<td style="width: 25px"><i class="fa fa-check"
														aria-hidden="true"></i></td>


												</tr>
											</c:if>
										</c:if>
										</c:if>
										
										
										<!-- ยังไม่ถึง -->
										<c:if test="${list.date>datetoday}">
										<c:if test="${list.idroom==amount.idroom}">
											
												<tr class="bg-success owner" height="41">

													<c:if test="${list.user_reserve==onlineUser.id}">
														<td class="center" ><i class="fa fa-user"
															aria-hidden="true"></i> ${list.user_reserve}</td>
													</c:if>
													<c:if test="${list.user_reserve!=onlineUser.id}">
														<td ></td>
													</c:if>

													<td><i class="fa fa-clock-o" aria-hidden="true"></i> <b><fmt:formatDate
																type="date" value="${list.time_start}" pattern="HH:mm" />
															น. - <fmt:formatDate type="date" value="${list.time_end}"
																pattern="HH:mm" /> น.</b></td>

													<c:if test="${list.user_reserve==onlineUser.id}">
														<td >

															<div class="dropdown">
																<div class="dropdown-toggle"
																	id="dropdownMenu${list.idroom}" data-toggle="dropdown"
																	aria-haspopup="true" aria-expanded="false">
																	<i class="fa fa-ellipsis-v "> </i>
																</div>
																<ul class="dropdown-menu  pull-right  "
																	aria-labelledby="dropdownMenu${list.idroom}">
																	<li><a
																		href="Edit_Meeting?meetingid=${list.idmeeting}&roomid=${amount.idroom}&date_cal=${date_cal}">Edit
																			and Invite</a></li>
																	 
																	
																	<li><a onclick="del(${list.idmeeting},);">Delete</a></li>
																	

																</ul>
															</div>


														</td>
													</c:if>
													<c:if test="${list.user_reserve!=onlineUser.id}">
														<td></td>
													</c:if>

												</tr>
											</c:if>
											
										</c:if>
										
									
									</c:forEach>
								</table>
							</div>
						</div>

					</c:forEach>
				</div>

			</div>

			<!--Reserve Room Modal -->
			<div class="modal fade" id="Reserve" tabindex="-1" role="dialog"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel"
								style="font-size: 20px">
								<b>Reserve Room</b>
							</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close" onClick="Cancel()">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">

							<input type="text" id="time_start" name="time_start"
								style="text-align: center;" readonly /> To <input type="text"
								id="time_end" name="time_end" style="text-align: center;"
								readonly />
							<button type="button" class="btn btn-warning" onClick="Reset()">Reset</button>
						
						<c:if test="${onlineUser.roleId=='HR' || onlineUser.roleId=='admin'}">
							<div style="margin-top:20px;">
							<label><b>Reserve By</b></label>
								<select class="bs-select form-control select2me" id="user">
									
									 <c:forEach var="user" items="${userseq}">
									 <option  value="${user.id}"
									<c:if test="${fn:toLowerCase(user.id) == onlineUser.id}">
									 selected</c:if>
									>${user.department_id} - ${user.name}
									
									</option>
									</c:forEach> 

								</select>
							</div>
							</c:if>
							
							<hr>
						</div>
						<div class="modal-footer">
							<button id="cancel" type="button" class="btn btn-secondary"
								data-dismiss="modal" onClick="Cancel()">Close</button>
							<button id="btnReserve" type="button" class="btn btn-primary"
								onClick="confirm()">Reserve</button>
						</div>
					</div>
				</div>
			</div>

			<!--Add Room Modal -->
			<div class="modal fade" id="addRoom" tabindex="-1" role="dialog"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel"
								style="font-size: 20px">
								<b>Create Room</b>
							</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<label><b>Room Name</b></label> <input id="roomName"
								class="form-control" aria-describedby="roomHelp"
								placeholder="Put Your Room Name"
								style="text-align: center; text-transform: capitalize;">
							<small id="roomHelp" class="form-text text-muted">Your
								name will show on title room.</small>
						</div>
						<div class="modal-footer">
							<button id="cancelRoom" type="button" class="btn btn-secondary"
								data-dismiss="modal">Close</button>
							<button id="btnCreate" type="button" class="btn btn-primary"
								onclick="CreateRoom()">Create</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="paginationx">
		<!-- <li class="page-item previous-page disablex li"><a
			class="page-link" href="#">Prev</a></li>
		<li class="page-item current-page activex li"><a
			class="page-link" href="#">1</a></li>
		<li class="page-item dots li"><a class="page-link" href="#">...</a></li>
		<li class="page-item current-page li"><a class="page-link"
			href="#">5</a></li>
		<li class="page-item current-page li"><a class="page-link"
			href="#">6</a></li>
		<li class="page-item dots li"><a class="page-link" href="#">...</a></li>
		<li class="page-item current-page li"><a class="page-link"
			href="#">10</a></li>
		<li class="page-item next-page li"><a class="page-link" href="#">Next</a></li> -->
	</div>
</div>



<script> 
			$(document).ready(function () {
				///////////////POPOVER//////////////
				
				///////////////POPOVER//////////////
				var opt={
						pickDate: false,
					    minuteStep: 15,
					    pickerPosition: 'bottom-right',
					    format: 'hh:ii',
					    autoclose: true,
					    showMeridian: false,
					    startView: 1,
					    pick12HourFormat: false
					    };
				  $('#time_start').datetimepicker(opt).on('change', function(){
					  
					  if($('#time_end').val()==""){
				        time_start=$('#time_start').val();
				        console.log(time_start);
					  }
					    else if($('#time_start').val()>=$('#time_end').val()){
						   $('#time_start').val("");
						   $('#time_start').datetimepicker('update');
						   toast2();
						   document.getElementById("btnReserve").disabled = true;
					  } 
					   else{
						   time_start=$('#time_start').val();
						   time_end=$('#time_end').val();
						   console.log(time_start);
						   check();
					   } 
					  
					  
				    });
				  $('#time_end').datetimepicker(opt).on('change', function(){
					  if($('#time_start').val()==""){
				        time_end=$('#time_end').val();
				        console.log(time_end);
					  }
					    else if($('#time_end').val()<=$('#time_start').val()){
						   $('#time_end').val("");
						   time_end=$('#time_end').val();
						   $('#time_end').datetimepicker('update');
						   toast2();
						  /*  document.getElementById("btnReserve").disabled = tru */e;
					  } 
					   else{
						   time_start=$('#time_start').val();
						   time_end=$('#time_end').val();
						   console.log(time_end);
						   check();
						   
					   } 
				    });
				  $(".datetimepicker").find('thead th').remove();
				  $(".datetimepicker").find('thead').append($('<th class="switch">').text('Select Your Time'));
				   $('.switch').css('width','190px'); 
				   $(".datetimepicker").find('thead th').onclick=false;
				  
			});
</script>

<script>

		var time_end;
		var time_start;
		var id=[];
		var s=[];
		var e=[];
		var roomSelect;
//////////////////////////////////////////////
	function Reserve(x){
	
		  roomSelect=x;
	 	  document.getElementById("btnReserve").disabled = true;
		<c:forEach var="room" items="${checkRoomToday}">
		  id.push(${room.idroom});
		  var start='${room.time_start}'.substring(0,5);
		  s.push(start);
		  var end='${room.time_end}'.substring(0,5);
		  e.push(end);
		</c:forEach>
		 console.log(s,e);
		/*Open Modal Reserve  */
		 $("#"+x).clone().appendTo('.modal-body');
		$(".modal-body").find("#icon").remove().end().find("#owner").remove();
		$(".modal-body").find(".dropdown").remove();
			}
//////////////////////////////////////////////
	function check(){
	 var y=0;
	 var check= true;
	 console.log(id.length-1);
	while(y<=id.length-1){
		check=true;
		 if(id[y]==roomSelect){
			if(time_start<s[y]&&time_end<=s[y]){
				check=true;
				console.log("IF Up "+s[y]);
			}
			else if(time_start>=e[y]&&time_end>e[y]){
				check=true;
				console.log("IF Down "+e[y]);
				console.log("tstart ="+time_start);
				console.log("tend ="+time_end);
			}
			else{
				check=false;
				console.log("คุณไม่สามารถจองห้องในเวลานี้ได้");
				toast();
				console.log("Time is"+time_start+"   "+time_end);
				console.log("Time Check"+s[y]+" ,  "+e[y]);
				break;
			}
			console.log("เจอห้องครั้งที่  :"+y);
			} 
		 else{console.log("ไม่เจอห้องครั้งที่ :"+y);}
		 console.log("Y ทั้งหมด :"+y);
			y++;
		}
	if(check==true){
		document.getElementById("btnReserve").disabled = false;
		toast3();
	}
	else{
		 document.getElementById("btnReserve").disabled = true; 
	}
	
		
}
//////////////////////////////////////////////
	function Cancel(){
		$(".modal-body ").find('table').remove();
		$('#time_end').val("");
		   time_end=$('#time_end').val();
		   $('#time_end').datetimepicker('update');
		   $('#time_start').val("");
		   time_end=$('#time_start').val();
		   $('#time_start').datetimepicker('update');
	}
//////////////////////////////////////////////
	function CreateRoom(){
		var name=$('#roomName').val();
		var c=1;
		 document.getElementById("cancelRoom").click(); 
		 swal({
		      title: "Are you sure!",
		      text: "You will be create this room!",
		      type: "warning",
		      showCancelButton: true,
		      confirmButtonClass: 'btn-primary',
		      confirmButtonText: 'Create'
		    } , function (inputValue) {
		        if (inputValue == false){
		        	console.log("canceled");
		        	}
		        else {
		        	  $.ajax({
		        		 	type : "POST",
		 				    url : "Create_Room",
		 					data : {
		 						"user_create":"${onlineUser.id}",
		 						"room_name":name
		 					}
		 			 }
		        	 ),complete(c);
		        } 
		      } ); 
	}
//////////////////////////////////////////////
	function toast(){
		Command: toastr["warning"]("Sorry,This time has already been spent!", "Warning")

		toastr.options = {
		  "closeButton": false,
		  "debug": false,
		  "newestOnTop": false,
		  "progressBar": true,
		  "positionClass": "toast-top-right",
		  "preventDuplicates": false,
		  "onclick": null,
		  "showDuration": "300",
		  "hideDuration": "1000",
		  "timeOut": "3000",
		  "extendedTimeOut": "1000",
		  "showEasing": "swing",
		  "hideEasing": "linear",
		  "showMethod": "fadeIn",
		  "hideMethod": "fadeOut"
		}
}
	function toast2(){
		Command: toastr["error"]("Your Time is Wrong!", "Error")

		toastr.options = {
		  "closeButton": false,
		  "debug": false,
		  "newestOnTop": false,
		  "progressBar": true,
		  "positionClass": "toast-top-right",
		  "preventDuplicates": false,
		  "onclick": null,
		  "showDuration": "300",
		  "hideDuration": "1000",
		  "timeOut": "3000",
		  "extendedTimeOut": "1000",
		  "showEasing": "swing",
		  "hideEasing": "linear",
		  "showMethod": "fadeIn",
		  "hideMethod": "fadeOut"
		}
}
	function toast3(){
		Command: toastr["success"]("You can use this time.", "Good time")

		toastr.options = {
		  "closeButton": false,
		  "debug": false,
		  "newestOnTop": false,
		  "progressBar": true,
		  "positionClass": "toast-top-right",
		  "preventDuplicates": false,
		  "onclick": null,
		  "showDuration": "300",
		  "hideDuration": "1000",
		  "timeOut": "3000",
		  "extendedTimeOut": "1000",
		  "showEasing": "swing",
		  "hideEasing": "linear",
		  "showMethod": "fadeIn",
		  "hideMethod": "fadeOut"
		}
}
//////////////////////////////////////////////
	function Reset() {
		$('#time_end').val("");
		   time_end=$('#time_end').val();
		   $('#time_end').datetimepicker('update');
		   $('#time_start').val("");
		   time_end=$('#time_start').val();
		   $('#time_start').datetimepicker('update');
		   document.getElementById("btnReserve").disabled = true; 
	}
//////////////////////////////////////////////
	$('body').on('click', function (e) {
    $('[data-toggle=popover]').each(function () {
        // hide any open popovers when the anywhere else in the body is clicked
        if (!$(this).is(e.target) && $(this).has(e.target).length === 0 && $('.popover').has(e.target).length === 0) {
            $(this).popover('hide');
        }
    });
});
//////////////////////////////////////////////
function invite(f){
	console.log(f);
	console.log('sss');
}
</script>

<script src="../assets/global/plugins/counterup/jquery.waypoints.min.js"
	type="text/javascript"></script>
<script src="../assets/global/plugins/counterup/jquery.counterup.min.js"
	type="text/javascript"></script>
<script src="/path/to/cdn/jquery.slim.min.js"></script>



<script>
function confirm() {
	var userReserve='${onlineUser.id}';
	<c:if test="${onlineUser.roleId=='HR' || onlineUser.roleId=='admin'}">
	if($('#user').val()!=null){
		userReserve=$('#user').val();
	}
	else{
		userReserve='${onlineUser.id}';
	}
	</c:if>
	var a = time_start;
	var b = time_end;
	var c=0;
	document.getElementById("cancel").click();
	console.log(a+" "+b);
	console.log(userReserve);
	swal({
	      title: "Are you sure!",
	      text: "You will be reserve this room!",
	      type: "warning",
	      showCancelButton: true,
	      confirmButtonClass: 'btn-primary',
	      confirmButtonText: 'Confirm'
	    }, function (inputValue) {
	        if (inputValue == false){
	        	console.log("canceled");
	        	}
	        if (inputValue == true) {
	        	 $.ajax({
	        		 	type : "POST",
	 				    url : "Reserve_Room",
	 					data : {
	 						"time_start": a,
	 						"time_end": b,
	 						"dateData":"${date_cal}",
	 						"user_reserve":userReserve,
	 						"idroom":roomSelect
	 					}
	 			 }
	        	 ),complete(c); 
	        }
	      });
}
function complete(c){ setInterval(function(){
	if(c===0){
	swal(
		{
			title : "Reserved",
			text : "This room is reserved",
			type : "success"
		},
		 function() {
			  location.reload();
			} );
		}
	else if(c===1){
		$('#roomName').val("");
		swal(
				{
					title : "Created Room",
					text : "This room is created",
					type : "success"
				},
				 function() {
					  location.reload();
					} );
	}
    
},300);}

function del(idmeeting) {
	console.log(idmeeting);
	swal({
	      title: "Are you sure!",
	      text: "You will be deleting this meeting!",
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
	 				    url : "Delete_Meeting",
	 					data : "idmeeting="+ idmeeting,
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
<!-- เปลี่ยนหน้า -->
<script>

function getPageList(totalPages, page, maxLength){
  function range(start, end){
    return Array.from(Array(end - start + 1), (_, i) => i + start);
  }

  var sideWidth = maxLength < 9 ? 1 : 2;
  var leftWidth = (maxLength - sideWidth * 2 - 3) >> 1;
  var rightWidth = (maxLength - sideWidth * 2 - 3) >> 1;

  if(totalPages <= maxLength){
    return range(1, totalPages);
  }

  if(page <= maxLength - sideWidth - 1 - rightWidth){
    return range(1, maxLength - sideWidth - 1).concat(0, range(totalPages - sideWidth + 1, totalPages));
  }

  if(page >= totalPages - sideWidth - 1 - rightWidth){
    return range(1, sideWidth).concat(0, range(totalPages- sideWidth - 1 - rightWidth - leftWidth, totalPages));
  }

  return range(1, sideWidth).concat(0, range(page - leftWidth, page + rightWidth), 0, range(totalPages - sideWidth + 1, totalPages));
}

$(function(){
  var numberOfItems = $(".card-content .card").length;
  var limitPerPage = 4; //How many card items visible per a page
  var totalPages = Math.ceil(numberOfItems / limitPerPage);
  var paginationSize = 7; //How many page elements visible in the pagination
  var currentPage;

  function showPage(whichPage){
    if(whichPage < 1 || whichPage > totalPages) return false;

    currentPage = whichPage;

    $(".card-content .card").hide().slice((currentPage - 1) * limitPerPage, currentPage * limitPerPage).show();

    $(".paginationx li").slice(1, -1).remove();

    getPageList(totalPages, currentPage, paginationSize).forEach(item => {
      $("<li>").addClass("page-item").addClass(item ? "current-page" : "dots")
      .toggleClass("activex", item === currentPage).append($("<a>").addClass("page-link")
      .attr({href: "javascript:void(0)"}).text(item || "...")).insertBefore(".next-page");
    });

    $(".previous-page").toggleClass("disablex", currentPage === 1);
    $(".next-page").toggleClass("disablex", currentPage === totalPages);
    return true;
  }

  $(".paginationx").append(
    $("<li>").addClass("page-item").addClass("previous-page").append($("<a>").addClass("page-link").attr({href: "javascript:void(0)"}).text("Prev")),
    $("<li>").addClass("page-item").addClass("next-page").append($("<a>").addClass("page-link").attr({href: "javascript:void(0)"}).text("Next"))
  );

  $(".card-content").show();
  showPage(1);

  $(document).on("click", ".paginationx li.current-page:not(.activex)", function(){
    return showPage(+$(this).text());
  });

  $(".next-page").on("click", function(){
    return showPage(currentPage + 1);
  });

  $(".previous-page").on("click", function(){
    return showPage(currentPage - 1);
  });
});
</script>
<script>
var search = new URLSearchParams(window.location.search);
 var date_cal = search.get('date_cal'); 


</script>