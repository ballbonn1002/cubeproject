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
	src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript"
	src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>
<script type="text/javascript"
	src="https://cdn.datatables.net/buttons/1.6.5/js/dataTables.buttons.min.js"></script>
<script type="text/javascript"
	src="https://cdn.datatables.net/buttons/1.6.5/js/buttons.flash.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
<script type="text/javascript"
	src="https://cdn.datatables.net/buttons/1.6.5/js/buttons.html5.min.js"></script>
<script type="text/javascript"
	src="https://cdn.datatables.net/buttons/1.6.5/js/buttons.print.min.js"></script>
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<script>
  AOS.init();
</script>


<%-- <script
	src="${pageContext.request.contextPath}/assets/global/plugins/bootstrap/js/bootstrap.js"></script> --%>

<fmt:formatDate pattern="yyyy" value="${dateTimeNow}" var="year_now" />
<fmt:formatDate pattern="MM" value="${dateTimeNow}" var="month_now" />
<fmt:formatDate pattern="dd" value="${dateTimeNow}" var="day_now" />
<fmt:formatDate pattern="dd-MM-yyyy" value="${dateTimeNow}"
	var="dateNow" />
<fmt:formatDate pattern="HH:mm" value="${dateTimeNow}" var="timeNow" />


<div class="portlet light bordered">
	<div class="portlet-title">
		<div class="caption">
			<span class="caption-subject font-red sbold uppercase"> <i
				class="fa fa-pie-chart"></i>&nbsp; Report Leave Year
			</span>
		</div>
		<div class="actions">
			<a class="btn btn-circle btn-icon-only btn-default fullscreen"
				href="javascript:;" data-original-title="" title=""> </a>
		</div>
	</div>

	<!-- HTML -->


	<div class="portlet-body flip-scroll text-center">
		<form class="form-inline margin-bottom-40"
			action="searchreportleaveyear" method="POST">
			<!-- --------------------------------------------------------------Start search------------------------------------------------------ -->
			<input type="hidden" id="tempuser" name="tempuser"
				class="form-control" />

			<div class="form-group form-md-line-input ">
				<label class="control-label" for="form_control_1">Year : </label> <select
					class="form-control select2me" name="yearSearch" id=yearSearch>
					<c:choose>
						<c:when test="${yearSearch != null}">
							<c:forEach begin="0" end="4" var="i">
								<option value="${year_now - i}" id="${year_now - i}"
									<c:if test="${yearSearch == (year_now - i)}"><c:out value="selected=selected"/></c:if>>${year_now - i}</option>
							</c:forEach>
						</c:when>

						<c:otherwise>
							<c:forEach begin="0" end="4" var="i">
								<option value="${year_now - i}" id="${year_now - i}">${year_now - i}</option>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</select>
			</div>
			<button type="submit" class="btn sbold blue-steel" onclick="ddd()">
				<i class="fa fa-search"></i> Search
			</button>
			<script>
				function ddd() {
					var x = $('select[name=name]').val();
					var y = "${onlineUser.id}";
					if (x == y && x != null) {
						document.getElementById("tempuser").value = y;
					} else if (x == "" || x == null) {
						document.getElementById("tempuser").value = y;
					} else {
						document.getElementById("tempuser").value = x;
					}
				}
			</script>

		</form>

		<div class="form-group form-md-line-input ">
			<span class="btn green-jungle" style="width: 150px"><i
				class="fa fa-calendar" aria-hidden="true"></i> ${yearSearch}</span>
		</div>
		<table
			class="table table-bordered table-striped table-condensed table-hover" data-aos="fade" data-aos-duration="2000"
			id="table_id">
			<thead>
				<tr class="">
					<th class="text-center " width="200px" height="41" rowspan="2"
						style="background-color: #3B3F51; color: white; padding-bottom: 40px">ชื่อ</th>
					<th class="text-center" height="41" colspan="5"
						style="background-color: #3B3F51; color: white;">ประเภทการลา</th>
				</tr>
				<tr class="">

					<th class="text-center" width="250px" height="41"
						style="background-color: rgb(242, 242, 242);">ลากิจ /
						ลาพักร้อน</th>
					<th class="text-center " width="250px" height="41"
						style="background-color: rgb(242, 242, 242);">ลาป่วย</th>
					<th class="text-center " width="250px" height="41"
						style="background-color: rgb(242, 242, 242);">ลาพักร้อนที่เหลือจากปีที่แล้ว</th>
					<th class="text-center " width="250px" height="41"
						style="background-color: rgb(242, 242, 242);">ลาอื่น ๆ</th>
					<th class="text-center " width="250px" height="41"
						style="background-color: rgb(242, 242, 242);">ลาโดยไม่รับค่าจ้าง</th>

				</tr>
			</thead>
			<tbody>
				<c:forEach var="lts" items="${reportly}" varStatus="Count">
					<tr>
						<td class="text-center">${lts.user_id}</td>
						<td class="text-center">${lts.type1}</td>
						<td class="text-center">${lts.type3}</td>
						<td class="text-center">${lts.type6}</td>
						<td class="text-center">${lts.type2}</td>
						<td class="text-center">${lts.type5}</td>

					</tr>

				</c:forEach>
			</tbody>
		</table>
	</div>
</div>
<script type="text/javascript">
	jQuery(document).ready(function($) {
		$.extend(true, $.fn.dataTable.defaults, {
			"searching" : true,
			"ordering" : false
		});
		var table = $('#table_id').DataTable({
			"order" : false,
			"info" : false,
			"paging" : false, // รวมไว้หน้าเดียว
			dom : 'Bfrtip',
			buttons : [ 'copyHtml5', 'excelHtml5', 'csvHtml5', 'pdfHtml5' ],
			pageLength : 25,
		});
	});
</script>