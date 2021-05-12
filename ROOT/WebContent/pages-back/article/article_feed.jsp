<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<script>

	function pageload() {
		document.getElementById("hidden").style.display = "none";
		document.getElementById("hidden_d").style.display = "none";
	}
	window.onload = pageload;
</script>
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
<!-- End of Alert Script -->
<div class="portlet light bordered">
	<div class="portlet-title">
		<div class="caption">
			<span class="caption-subject font-red sbold uppercase"> <i
				class="fa fa-file"></i>&nbsp;Article Feed
			</span>
		</div>
		<div class="actions">
			<a class="btn  btn-icon-only btn-default fullscreen" href="javascript:;" data-original-title="" title=""> </a>
		</div>
		<div class="actions right">
			<button type="button" class="btn green-meadow" id="addArticle"
				onclick="newArticle()">
				<i class="fa fa-plus"></i>&nbsp;New Aricle
			</button>
		</div>
		
	</div>
	<div class="portlet-body">
		<div class="table-responsive">
			<table
				class="table table-striped table-hover table-header-fixed"
				width="100%" id="table">
				<thead>
					<tr height="41" class = "text-center" style="background-color:rgb(59, 63, 81);color:white">
						<th class="text-center">No.</th>
						<th class="text-center">Type</th>
						<th class="text-center">Topic</th>
						<th class="text-center">Author</th>
						<th class="text-center">User create</th>
						<th class="text-center">Time create</th>
						<th class="text-center">Edit</th>
						<th class="text-center">Delete</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="article" items="${articleList}" varStatus="Count">
						<tr>
							<td class="text-center">${Count.count}</td>
							<c:forEach var="arList" items="${articleType}" varStatus="Count">
								<c:if
									test="${article.article_type_id == arList.article_type_id}">
									<td>${arList.name}</td>
								</c:if>
							</c:forEach>
							<td>${article.topic}</td>
							<td class="text-center">${article.user_id}</td>
							<td class="text-center">${article.user_create}</td>
							<td class="text-center"><fmt:formatDate
									value="${article.time_create}" pattern="dd-MM-yyyy HH:mm" /></td>
							<td style="text-align: center;"><a
								class="btn btn-outline btn-circle btn-sm sbold blue" title="Edit"
								href="article_edit?articleId=${article.article_id}">
								<i class="fa fa-pencil"></i></a></td>
							<td style="text-align: center;"><a
								class="btn btn-outline btn-circle btn-sm sbold red-intense" title="Delete"
								onclick="Delete(${article.article_id})" ><i
									class="fa fa-trash"></i></a></td>
						</tr>
					</c:forEach>
				</tbody>

			</table>
		</div>
	</div>

</div>

<script>
function Delete(id){
	//console.log(id);
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
	 				    url : "article_delete?id=" + id,
	 					type : "POST",
	 					success : function(response) {
	 						location.href = "article-feed";
	 					}
	 			 });
	          return false
	        }
	      });

}

function newArticle(){
	location.href='article-new';
}


</script>
