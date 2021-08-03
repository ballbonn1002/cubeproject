<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
			<span class="caption-subject font-red sbold uppercase">My Training</span>
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

		<form action="searchfromto" method="POST">
			<div class="portlet-body">
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-8">
						<div class="col-md-2">
							<label class="control-label">Date :</label>
						</div>
						<div class="col-md-6 col-xs-6">
							<div class="form-group">
								<div class="input-group input-large date-picker input-daterange"
									data-date-format="dd-mm-yyyy">
									<input type="text" class="form-control" name="startdate"
										<c:choose>
                                            <c:when test="${startdate == null}">
                                                value="<fmt:formatDate type="date" value="${now}" pattern="01-01-yyyy"/>"
                                            </c:when>
                                            <c:when test="${startdate != null}">
                                                    value="<fmt:formatDate type="date" value="${startdate}" pattern="dd-MM-yyyy"/>"
                                            </c:when>
                                        </c:choose>>
									<span class="input-group-addon"> to </span> <input type="text"
										class="form-control" name="enddate"
										<c:choose>
                                            <c:when test="${enddate == null}">
                                                value="<fmt:formatDate type="date" value="${now}" pattern="dd-MM-yyyy"/>"
                                            </c:when>
                                            <c:when test="${enddate != null}">
                                                value="<fmt:formatDate type="date" value="${enddate}" pattern="dd-MM-yyyy"/>"
                                            </c:when>
                                        </c:choose>>
								</div>
							</div>
						</div>
						<div class="col-md-4 col-xs-12" style="text-align: center">
							<button id="search" type="submit" class="btn btn-sm blue-steel">
								<i class="fa fa-search"></i> Search
							</button>
						</div>
					</div>
					<div class="col-md-2"></div>
				</div>



			<div class="portlet-body flip-scroll" style="text-align: center;">
				<table class="table table-striped table-condensed flip-content table-hover">
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
					
						<form action="mytraining_list" method="POST">
						<c:forEach var="train" items="${Traininglist}" varStatus="status">
							<tr>
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
									</a>															<!-- icon edit -->
									<a class="btn circle btn-outline btn-sm sbold red"
										<%-- href="TrainDelete?id=${train.id}" --%>
										onclick="del(${train.trainingid});"
										title="delete training" >
										<i class="fa fa-trash"></i>
									</a>															<!-- icon delete -->
								</td>
							</tr>
						</c:forEach>
						</form>
				</table>
			</div>
			</div>
<script>
	function add() {
		document.location = "Training_Add";
	}
</script>
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
<script>
	$('.cannot').keydown(function(e) {
		// trap the return key being pressed
		if (e.keyCode === 13 || e.keyCode === 8) {
			return false;
		}
	});
</script>
	<script
		src="../assets/global/plugins/counterup/jquery.waypoints.min.js"
		type="text/javascript"></script>
	<script
		src="../assets/global/plugins/counterup/jquery.counterup.min.js"
		type="text/javascript"></script>