<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="/WEB-INF/tlds/permission.tld" prefix="perm"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

		<script src="https://unpkg.com/@popperjs/core@2"></script>
<script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
<!--
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.js"></script>-->
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
<script>
  AOS.init();
</script>
<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
<c:set var="now" value="<%=new java.util.Date()%>" />
<style>
@media only screen and (max-width: 1200px) {
    #search {
        margin-top: 15px;
    }
}
</style>
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
		.popover{
		 word-wrap: break-word;
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
			<i class="icon-layers font-red"></i> 
			<span id="ss" class="caption-subject font-red sbold uppercase">My Training</span>
		</div>
		
		<div class="actions">
            <button type="button" class="btn btn-sm green-meadow" id="addLeave"
				onclick="add()">
				<i class="fa fa-plus"></i>&nbsp;Add new
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
		<form action="Training_Search" method="post" >
			<div class="portlet-body">
				<div class="row">
					<div class="col-md-2"></div>
							<div class="col-md-1">
								<label class="control-label" ><b>Date :</b></label>
							</div>
							<div class="col-md-6 col-xs-6">
								<div class="form-group">
	
								<div class="col-md-5">
									<div id="sandbox" class="form-group">
										<input id="startdate" name="startdate" type="text" class="form-control">
									</div>
								</div>
								<div class="col-md-2" style="text-align: center">
									<b> TO </b>
								</div>
								<div class="col-md-5">
									<div id="sandbox" class="form-group">
										<input id="enddate" name="enddate" type="text" class="form-control">
									</div>
								</div>
							</div>
										
									
									<script>
							$(document).ready( function(){
							var date = new Date();
							var today = new Date(date.getFullYear(), date.getMonth(), date.getDate());
							var optSimple = {
									  format: 'dd-mm-yyyy',
									  todayHighlight: true,
									  orientation: 'bottom right',
									  autoclose: true,
									  container: '#sandbox'
									};
							$( '#startdate' ).datepicker( optSimple );
							$( '#enddate' ).datepicker( optSimple );
							$( '#startdate' ).datepicker( 'setDate', today );
							//Show result 
							console.log($("#startdate").val());
							console.log($("#enddate").val());
							var a = sessionStorage.getItem("start");
							var b = sessionStorage.getItem("end");
							if(a !=null && b !=null){
								$("#startdate").val(a);
								$("#enddate").val(b);
								
							}
							sessionStorage.removeItem("start");
							sessionStorage.removeItem("end");
							////////
							$( "#startdate" ).change(function() {
								var x =$(this).datepicker( 'getDate');
								$( '#enddate' ).datepicker( 'setDate', x );
								console.log($( '#startdate' ).val());
								console.log($( '#enddate' ).val())
								}
							);
							$("#search").click(function() {
								
								var start = $("#startdate").val();
								var end = $("#enddate").val();
								sessionStorage.setItem("start", start);
								sessionStorage.setItem("end", end);
							}
							
							);
							});
							</script>
									</div>
									
								
							
							<div class="col-md-1 col-xs-1" style="text-align: center">
								<button id="search" type="submit" class="btn btn-sm blue-steel" >
									<i class="fa fa-search"></i> Search
								</button>
								
							</div>
							<div class="col-md-2"></div>
						</div>
</div>
</form>
</div>
			

			<div class="portlet-body flip-scroll" style="text-align: center;">

				<table
			class="table table-striped table-condensed table-hover order-column compact"
			data-toggle="table" data-search="true" id="myTable">
			<thead>
						<tr style="background-color:rgb(59, 63, 81);color:white">
							<th height="41"><center>ID</center></th>
							<th height="41"><center>Submit Date</center></th>
							<th height="41"><center>Name</center></th>
							<th height="41"><center>Title</center></th>
							<th height="41"><center>Start Date</center></th>
							<th height="41"><center>Until Date</center></th>
							<th height="41"><center>Hour</center></th>
							<th height="41"><center>Action</center></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="train" items="${Traininglist}" varStatus="status">
							<tr data-toggle="popover" title="<b>${train.title}" data-placement="top" data-html="true" data-trigger="hover"
							data-content="<b>Location : ${train.location}<br>Lecturer : ${train.lecturer}<br>Detail : <br>${train.detail}">
								<td style="vertical-align: middle;">${train.trainingid}</td>						<!-- training history ID -->
								<td style="vertical-align: middle;"><fmt:formatDate value="${train.time_create}"
										pattern="dd-MM-yyyy HH:mm"></fmt:formatDate>							<!-- training submit date -->
								</td>
								<td style="vertical-align: middle;">${train.user_id}</td>														<!-- user id -->
								<td style="vertical-align: middle;">${train.title}</td>																		<!-- training title name -->
								<td style="vertical-align: middle;"><fmt:formatDate value="${train.start_date}"
										pattern="dd-MM-yyyy"></fmt:formatDate>									<!-- training start date -->
								</td>
								<td style="vertical-align: middle;"><fmt:formatDate value="${train.end_date}"
										pattern="dd-MM-yyyy"></fmt:formatDate></td>								<!-- training end date -->
								<td style="vertical-align: middle;">${train.hours}</td>							<!-- training hour -->
								
								<td style="vertical-align: middle;">
									<a class="btn circle btn-outline btn-sm sbold blue"
										href="Training_Edit?trainingid=${train.trainingid}"
										title="edit training">
										<i class="fa fa-edit"></i>
									</a>					<!-- icon edit -->
									<a class="btn circle btn-outline btn-sm sbold red"
										<%-- href="TrainDelete?id=${train.id}" --%>
										onclick="del(${train.trainingid});"
										title="delete training" >
										<i class="fa fa-trash"></i>
									</a>	
																							<!-- icon delete -->
								</td>
								
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			</div>
			<script> 
			
 $(function () { 
 $('[data-toggle="popover"]').popover(); 
 }); 
</script> 
			<script>
	$('.cannot').keydown(function(e) {
		// trap the return key being pressed
		if (e.keyCode === 13 || e.keyCode === 8) {
			return false;
		}
	});
</script>

	<script>

$(document).ready( function () {
    $('#myTable').DataTable(
    {
        "aLengthMenu": [[20, 40, 60, -1], [20, 40, 60, "All"]],
        "iDisplayLength": 20,
    }		
    );
} );
</script>
<script>
	

	function add() {
		document.location = "Training_Add";
	}
</script>
<script
		src="../assets/global/plugins/counterup/jquery.waypoints.min.js"
		type="text/javascript"></script>
	<script src="../assets/global/plugins/counterup/jquery.counterup.min.js"
		type="text/javascript"></script>
		<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script>
function del(trainingid) {
	console.log(trainingid);
	swal({
	      title: "Are you sure!",
	      text: "You will be deleting this training!",
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
	 				    url : "Training_Del.action",
	 					data : "trainingid="+ trainingid,
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