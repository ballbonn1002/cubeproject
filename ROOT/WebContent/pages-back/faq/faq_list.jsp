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
				class="icon-wrench"></i>&nbsp;FAQ
			</span>
		</div>
		<div class="actions">
			<a class="btn  btn-icon-only btn-default fullscreen"
				href="javascript:;" data-original-title="" title=""> </a>
		</div>
		<div class="actions right">
			<button type="button" class="btn green-jungle" id="addFAQ"
				onclick="addFAQ()">
				<i class="fa fa-plus"></i>&nbsp;Add FAQ
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
						<th class="text-center">Topic</th>
						<th class="text-center">Author</th>
						<th class="text-center">Time posted</th>
						<th class="text-center">Category</th>
						<th class="text-center">Status</th>
						<th class="text-center">Edit</th>
						<th class="text-center">Delete</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="faq" items="${faqJoinList}" varStatus="Count">
						<tr>
							<td class="text-center">${Count.count}</td>
							<td>${faq.topic}</td>
							<td class="text-center">${faq.author}</td>
							<td class="text-center"><fmt:formatDate
									value="${faq.time_posted}" pattern="dd-MM-yyyy HH:mm" /></td>
							<td class="text-center">${faq.faq_cat_name}</td>
							<td class="text-center">${faq.faq_status_name}</td>

							<td style="text-align: center;"><a
								class="btn btn-circle btn-sm sbold blue" title="Edit"
								onclick="EditFAQ(${faq.faq_id})" style="color: white;"><i
									class="fa fa-pencil"></i></a></td>

							<td style="text-align: center;"><a
								class="btn btn-circle btn-sm sbold red" title="Delete"
								onclick="DeleteFAQ(${faq.faq_id})" style="color: white;"><i
									class="fa fa-trash"></i></a></td>


						</tr>
					</c:forEach>
				</tbody>

			</table>
		</div>
	</div>

</div>




<script>

	function DeleteFAQ(id){
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
		 				    url : "deleteFAQ.action",
		 					data : "faq_id="+ id,
		 					type : "POST",
		 					success : function(response) {
		 						window.location.reload(true);
		 					}
		 			 });
		          return false
		        }
		      });

	}
	
	function addFAQ(){
		location.href='addFAQ';
	}
	
	function EditFAQ(id){
		location.href='editFAQ?faq_id=' + id;
// 		$.ajax({
// 			    url : "editFAQ.action",
// 				data : "faq_id="+ id,
// 				type : "POST",
// 				success : function(response) {
// 					location.href='editFAQ?faq_id=' + id;
// 				}
// 		 });
	}
	
</script>
