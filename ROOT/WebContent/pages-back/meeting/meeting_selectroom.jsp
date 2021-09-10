<%@page import="org.apache.velocity.runtime.directive.Foreach"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="now" value="<%=new java.util.Date()%>" />
<fmt:formatDate type="date" value="${now}" pattern="dd-MM-yyyy"
	var="date_now" />
<fmt:formatDate type="date" value="${now}" pattern="31-03-yyyy"
	var="lastday" />
<script src="../assets/global/plugins/fancybox/lib/jquery-1.10.1.min.js"></script>

<script src="../assets/global/plugins/bootstrap/js/bootstrap.js"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="../assets/global/plugins/moment.min.js"
	type="text/javascript"></script>


<script src="sweetalert2.all.min.js"></script>
<!-- Optional: include a polyfill for ES6 Promises for IE11 -->
<script src="https://cdn.jsdelivr.net/npm/promise-polyfill"></script>
<script src="sweetalert2.min.js"></script>
<link rel="stylesheet" href="sweetalert2.min.css">
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



<div class="portlet light">
	<div class="portlet-title">
		<div class="caption">

			<i class="fa fa-paperclip font-red"></i> <span id="title"
				class="caption-subject font-red sbold uppercase">Select Room</span>
			<div style="padding-top: 5px;">
				<i class="fa fa-calendar"></i></i> Date :
			</div>
			<input type="hidden" name="actionpage" id="actionpage"
				value="${action}">

		</div>
		<div class="actions">
			<a class="btn  btn-icon-only btn-default fullscreen"
				href="javascript:;" data-original-title="" title=""> </a>
		</div>
	</div>

	<div class="portlet-body">

		<div class="row ">

			<div class="card-content" style="display: none;">
				<c:forEach var="room" items="${amountRoom}" varStatus="status">
					<fmt:formatDate type="date" value="${room.time_create}"
						pattern="HH:mm" var="time_create" />
					<fmt:formatDate type="date" value="${room.time_create}"
						pattern="dd-MM-yyyy" var="date" />
					<div class="col-lg-3">
						<div class="card" id="card"
							style="transform-style: preserve-3d; height: 200px; margin-top: 20px; box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);">
							<ul class="nav nav-pills mb-3" role="tablist">
								<li class="nav-item"><a
									class="nav-link text-uppercase active" data-toggle="tab"
									href="#tab${room.idroom}" role="tab">Meeting Room
										${room.idroom}</a></li>
								<li class="nav-item ml-auto"><a
									class="nav-link text-uppercase" data-toggle="tab"
									href="#tab-list${room.idroom}" role="tab">ตารางจองห้อง</a></li>


							</ul>

							<div class="tab-content py-3 padding-title">
								<div class="tab-pane active" id="tab${room.idroom}"
									role="tabpanel">
									<h4 class="card-title">
										<span class="head_name">Name:</span> ${room.room_name}
									</h4>
									<div class="c-body">สร้างเมื่อวันที่: ${date}</div>
									<div class="c-body">เวลา: ${time_create} น.</div>
									<div class="c-body">
										คนสร้าง: <span>${room.user_create}</span>
									</div>





								</div>
								<div class="tab-pane " id="tab-list${room.idroom}"
									role="tabpanel">
									<!-- <h4 class="card-title head_name">ตารางจองห้อง</h4> -->
									<div class="scroll" >
										<table class="table table-bordered ">
											<thead>
												<tr style="background-color: rgb(59, 63, 81); color: white">
													<th hidden></th>

												</tr>
											</thead>
											<tbody>
												<c:forEach var="time" items="${AllMeetperDay}">
													<fmt:formatDate type="date" value="${time.time_start}"
														pattern="HH:mm" var="time_start" />
													<fmt:formatDate type="date" value="${time.time_end}"
														pattern="HH:mm" var="time_end" />
													<tr>

														<td data-toggle="modal"
															data-target="#exampleModal${time.idinvite}">${time_start}
															- ${time_end}</td>




													</tr>

												</c:forEach>
												<!-- <tr>
										<td>test1 </td>
										</tr> -->

											</tbody>
										</table>

									</div>

								</div>

							</div>
						</div>
					</div>
				</c:forEach>



			</div>
		</div>
	</div>

	<!-- Modal -->
	<c:forEach var="time" items="${AllMeetperDay}">
		<fmt:formatDate type="date" value="${time.time_start}" pattern="HH:mm"
			var="time_start" />
		<fmt:formatDate type="date" value="${time.time_end}" pattern="HH:mm"
			var="time_end" />
		<div class="modal fade" id="exampleModal${time.idinvite}"
			tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
			aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">MEMBER INVITED</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<table
							class="table table-striped table-condensed table-hover order-column compact"
							data-toggle="table" data-search="true" id="myTable">
							<thead>
								<tr style="background-color: rgb(59, 63, 81); color: white">
									<th height="41"><center>${time_start}-${time_end}</center></th>

								</tr>
							</thead>
							<tbody>


								<tr style="color: black">
									<td style="vertical-align: middle;">${time.member}</td>


								</tr>

							</tbody>
						</table>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>

					</div>
				</div>
			</div>
		</div>
	</c:forEach>



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
	/* var z = $(".card-content .col-sm-3").length;
	alert(z); */
</script>

<style>
.card-title {
	align-items: flex-start;
}

.no-gutters {
	padding-left: 0px;
	padding-right: 0px;
}

.padding-title {
	align-items: flex-start;
	padding-left: 15px;
	padding-right: 15px;
	padding-left: 15px;
}

.head_name {
	font-weight: 600;
}

.c-body {
	padding: 5px;
	font-weight: 400;
}


.scroll:hover {
	overflow: auto;
}

.scroll {
	overflow: hidden;
	height: 150px;
}

.border {
	border: 1px solid #E0DADA;
	border-radius: 5%;
	margin: 10px;
	height: 200px;
	align-items: flex-start;
	justify-content: flex-start;
	box-shadow: 5px 5px 5px #E0DADA;
}

.table>tbody>tr>td, .table>tbody>tr>th, .table>tfoot>tr>td, .table>tfoot>tr>th,
	.table>thead>tr>td, .table>thead>tr>th {
	text-align: center;
	height: 25px;
	padding: 0px;
	height: 25px;
}

td {
	cursor: pointer;
}

td:hover {
	background-color: #337ab7;
	color: white;
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
  var limitPerPage = 12; //How many card items visible per a page
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
alert("test");
var time = ${time_start};

alert(time);
</script>
