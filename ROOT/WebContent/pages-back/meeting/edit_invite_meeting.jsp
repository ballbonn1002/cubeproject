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

<div class="portlet light bordered">
	<div class="portlet-title">

		<div class="caption">
			<i class="icon-layers font-red"></i> <span id="ss"
				class="caption-subject font-red sbold uppercase">Edit and
				Invite Room ${Mlist[0].date} </span>
			<c:set var="s" value="<%=new java.util.Date()%>" />
			<fmt:formatDate var="a" pattern="HH:mm" value="${s}" />
		</div>

		<div class="actions">

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





		<div class="portlet-body flip-scroll">


			<fmt:formatDate type="date" value="${Mlist[0].time_start}"
				pattern="HH:mm" var="time_start" />
			<fmt:formatDate type="date" value="${Mlist[0].time_end}"
				pattern="HH:mm" var="time_end" />
			<div style="text-align: center;">
				<label>Change Time:</label> <input type="text" id="time_start"
					name="time_start" value="${time_start}" style="text-align: center;"
					readonly /> To <input style="text-align: center;" type="text"
					id="time_end" name="time_end" value="${time_end}" readonly />


			</div>
			<hr>
			<div>
				<div class="center card">


					<table class="table">
						<thead>

							<tr style="background-color: rgb(59, 63, 81); color: white">
								<th scope="col">Room No. ${roomid.idroom}
									${roomid.room_name}</th>

							</tr>
						</thead>
						<tbody>
							<c:forEach var="list" items="${AllMeetperDay}">
								<fmt:formatDate type="date" value="${list.time_end}"
									pattern="HH:mm" var="end" />
								<fmt:formatDate type="date" value="${list.time_start}"
									pattern="HH:mm" var="start" />
								<c:if test="${list.idroom==roomid.idroom}">
									<tr>
										<td id="count">${start}น.-${end}น.</td>

									</tr>
								</c:if>
							</c:forEach>
						</tbody>
					</table>
					<button  type="button" class="btn btn-primary"
					onClick="inviting()">Invite</button>
				</div>
			</div>




			
			<%-- <select id='custom-headers' multiple='multiple' id="inviting"
				name="inviting[]">
				<c:forEach var="user" items="${userseq}">
					<option value='${user.id }'>${user.id }</option>

				</c:forEach>
			</select> --%>
			
			<select class="bs-select form-control select2me  " id="user"
								name="inviting" id="inviting" onchange="s(this);">
								<optgroup label="Enable">
									<c:forEach var="user" items="${userseq}">

										<c:if test="${user.enable == 1 }">
											<c:if test="${userSelect == nulll }">
												<option value="${user.id}"
													<c:if test="${user.id eq onlineUser.id}"><c:out value="selected=selected"/></c:if>>${user.department_id}
													- ${user.name}</option>
											</c:if>
											<c:if test="${userSelect != nulll }">
												<option value="${userSelect}"
													<c:if test="${user.id eq userSelect}"><c:out value="selected=selected"/></c:if>>${user.department_id}
													- ${user.name}</option>
											</c:if>
										</c:if>
									</c:forEach>
								</optgroup>
								</select>



			<hr>
			<div class="footer">
				<button id="cancel" type="button" class="btn btn-secondary"
					data-dismiss="modal" onClick="Cancel()">Close</button>
				<button id="btnReserve" type="button" class="btn btn-primary"
					onClick="Edit()">Save</button>
			</div>
		</div>

	</div>





</div>
<script>

$(document).ready(function () {
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
			   document.getElementById("btnReserve").disabled = true;
		  } 
		   else{
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


</script>

<script>


		
		var count = $("tr #count").length; //5
		
		/* $("tr #count").each(function(){
			alert("in");
			
		})  */
		var time_end;
		var time_start;
		var id=[];
		var s=[];
		var e=[];
		var roomSelect=${roomid.idroom};
		/* alert(roomSelect) */
		var idmeeting;

		
		<c:forEach var="room" items="${checkRoomToday}">
		  id.push(${room.idroom});
		  var start='${room.time_start}'.substring(0,5);
		  s.push(start);
		  var end='${room.time_end}'.substring(0,5);
		  e.push(end);
		</c:forEach>
		
//////////////////////////////////////////////
		function check(){
		 var y=0;
		 var check;
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
		
</script>




<!-- multiselect style-->
<style>
.search-input {
	margin-bottom: 10px;
}
</style>

<!-- multiselect -->
<script>

$('#custom-headers').multiSelect({
	  selectableHeader: "<input type='text' class='search-input' autocomplete='off' placeholder='ค้นหาชื่อที่ต้องการเชิญ'>",
	  selectionHeader: "<input type='text' class='search-input' autocomplete='off' placeholder='ค้นหาชื่อคนที่เชิญแล้ว'>",
	  afterInit: function(ms){
	    var that = this,
	        $selectableSearch = that.$selectableUl.prev(),
	        $selectionSearch = that.$selectionUl.prev(),
	        selectableSearchString = '#'+that.$container.attr('id')+' .ms-elem-selectable:not(.ms-selected)',
	        selectionSearchString = '#'+that.$container.attr('id')+' .ms-elem-selection.ms-selected';

	    that.qs1 = $selectableSearch.quicksearch(selectableSearchString)
	    .on('keydown', function(e){
	      if (e.which === 40){
	        that.$selectableUl.focus();
	        return false;
	      }
	    });

	    that.qs2 = $selectionSearch.quicksearch(selectionSearchString)
	    .on('keydown', function(e){
	      if (e.which == 40){
	        that.$selectionUl.focus();
	        return false;
	      }
	    });
	  },
	  afterSelect: function(){
	    this.qs1.cache();
	    this.qs2.cache();
	  },
	  afterDeselect: function(){
	    this.qs1.cache();
	    this.qs2.cache();
	  },
	  /* แสดงค่า */
	  /* afterSelect: function(values){
		   
		    $('#inviting option[value="'+value+'"]').remove();
	        $('#inviting').append($("<option></option>").attr("value",value).attr('ms-selected', 'ms-selected'));
		  } */
	  
	});
	

</script>

<script>
function Edit() {
	
	var  time_start=$("input[name=time_start]").val();
	var  time_end=$("input[name=time_end]").val();
	var idmeeting= ${Mlist[0].idmeeting};
	/* alert(time_start)
	alert(time_end)
	alert(idmeeting) */
	
	document.getElementById("cancel").click();
	
	 $.ajax({
		 	type : "POST",
		    url : "Edit_Invite_Room",
			data : {
				"time_start":  time_start,
				"time_end":  time_end,
				/* "dateData":"${date}", */
				"meetingid":idmeeting,
				
				},
				success : function(data) {
					
					swal(
							{
								title : "Pass",
								text : "Saved Succcess",
								type : "success"
							},
							function(){
								window.location=document.referrer;
								} );
				}
			})
	 }
	 

	function inviting(){
		alert("in")
		var member = $("select[name=inviting]").val();
		
		/* var member=[]; 
		 $('select[name="inviting[]"] option:selected').each(function() {
			 member.push($(this).val());
		 }); */
		 alert(member)
		 $.ajax({
			type : "JSON",
			method : "POST",
		    url : "Invite_member",
			data : {
				"member":  member,
				},
				success : function(data) {
					
					swal(
							{
								title : "Pass",
								text : "Invited Succcess",
								type : "success"
							}
							);
				}
			})
		
	}
	


	 
	 

</script>

