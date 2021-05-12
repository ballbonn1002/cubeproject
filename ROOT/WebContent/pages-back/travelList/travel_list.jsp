<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="/WEB-INF/tlds/permission.tld" prefix="perm"%>
<script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
<c:set var="now" value="<%=new java.util.Date()%>" />
<!-- คำสั่งเช็คว่าข้อมูลเข้าไหม ${travelList} -->
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
<div class="portlet light bordered">
	<div class="portlet-title" style="margin-left: 2%;">
		<div class="caption">
			<i class="fa fa-list font-red"></i> <span
				class="caption-subject font-red sbold uppercase">Travel list</span>
			<span class="caption-helper font-red"> <%-- ${role.name} --%>
			</span>
		</div>
		<div class="actions right">
			<button type="button" class="btn green-meadow" onclick="add()">
				<i class="fa fa-plus"></i>&nbsp;Add Travel list
			</button>
			<a class="btn btn-circle btn-icon-only btn-default fullscreen"
				href="javascript:;" data-original-title="" title=""></a>
		</div>

	</div>

	<div class="portlet box white">
		<!-- <div class="portlet-title"> -->
		<div class="caption"></div>
		<div class="tools">
			<a href="javascript:;" class="collapse" data-original-title=""
				title=""> </a> <a href="#portlet-config" data-toggle="modal"
				class="config" data-original-title="" title=""> </a> <a
				href="javascript:;" class="reload" data-original-title="" title="">
			</a> <a href="javascript:;" class="remove" data-original-title=""
				title=""> </a>
		</div>
		<!-- </div> -->
		<div class="portlet-body">
			<div class="table-responsive">
				<table
					class="table table-striped table-condensed flip-content table-hover ">
					<thead>
						<tr class = "text-center" style="background-color:rgb(59, 63, 81);color:white">
							<th height="41" style="width: 5%;"><center>No.</center></th>
							<th height="41" style="width: 25%;"><center>Vehicle</center></th>
							<th height="41" style="width: 25%;"><center>Description</center></th>
							<th height="41" style="text-align: center; width: 10%;">User Create</th>
							<th height="41" style="text-align: center; width: 10%;">User Update</th>
							<th height="41" style="width: 10%;"><center>Time Create</center></th>
							<th height="41" style="width: 10%;"><center>Time Update</center></th>
							<th height="41" style="width: 10%;"><center>Edit</center></th>
							<th height="41" style="width: 10%;"><center>Delete</center></th>

						</tr>
					</thead>
					<tbody>
						<c:forEach var="travel" items="${travelList}" varStatus="status">
							<!--  travelList มาจาก TravelAction -->
							<tr class = "text-center">
								<!-- <td style="padding-top:10px;">${test.exp_travel_type_id}</td> -->
								<td style="padding-top: 0.1px;">${status.count}</td>
								<td style="padding-top: 5px;">${travel.name}</td>
								<td style="padding-top: 5px;text-align:left;">${travel.description}</td>
								<td style="padding-top: 5px;">${travel.user_create}</td>
								<td style="padding-top: 5px;">${travel.user_update}</td>
								<td style="padding-top: 5px;"><fmt:formatDate value="${travel.time_create}" pattern="dd MMM yyyy " /></td>
								<td style="padding-top: 5px;"><fmt:formatDate value="${travel.time_update}" pattern="dd MMM yyyy " /></td>

								<td style="padding-top: 10px;">
									<div align="center">
										<a class="btn btn-circle btn-outline btn-sm blue" title="Edit"
											href="travel_edit?id=${travel.exp_travel_type_id}"><i
											class="fa fa-pencil"></i></a>
								</td>

								<td style="text-align: center; padding-top: 10px;"><button
										class="btn btn-circle btn-outline btn-sm red-intense DeleTravel${travel.exp_travel_type_id}" title="Delete"
										onclick="_gaq.push(['_trackEvent', 'example, 'try', 'Primary']);">
										<i class="fa fa-trash"></i>
									</button></td>

								<script>
								document.querySelector('.DeleTravel${travel.exp_travel_type_id}').onclick = function(){  // . คือ class นะจ๊ะ
								    swal({
								      title: "Are you sure!",
								      text: "You will be deleting this id!",
								      type: "warning",
								      showCancelButton: true,
								      confirmButtonClass: 'btn-danger',
								      confirmButtonText: 'OK'
								    }, function (inputValue) {
								        if (inputValue === false) return false;
								        if (inputValue === "") {
								          return false
								        }
								        document.location = "travel_delete?id=${travel.exp_travel_type_id}";
								      });
								    }; 
								    function detail(){
								    	document.location = "travel_edit?id=${travel.exp_travel_type_id}";   //?id คือ parameter
		   	
								    }
									</script>

							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>

	<!-- END FORM-->
</div>
<script>
				
				$("tr:not(:first)").each(function (index ) {
					   $(this).css('animation-delay',index *0.01 +'s');
					}); 
								
				</script>
				

<script>
	function add() {
	document.location = "travel_add";
	}	
</script>



<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>


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
