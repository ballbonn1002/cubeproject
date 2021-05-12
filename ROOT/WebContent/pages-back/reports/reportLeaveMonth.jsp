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
				class="fa fa-pie-chart"></i>&nbsp; Report Leave Month
			</span>
		</div>
		<div class="actions">
			<a class="btn btn-circle btn-icon-only btn-default fullscreen"
				href="javascript:;" data-original-title="" title=""> </a>
		</div>
	</div>

	<!-- HTML -->


	<div class="portlet-body flip-scroll text-center">
		<form class="form-inline margin-bottom-40" action="searchreportleavemonth"
			method="POST">
			<!-- --------------------------------------------------------------Start search------------------------------------------------------ -->
			<input type="hidden" id="tempuser" name="tempuser"
				class="form-control" />
			<div class="form-group form-md-line-input ">
				<label class="control-label" for="form_control_1">Month : </label> <select
					class="form-control select2me" name="monthSearch" id=monthSearch>
					<!-- qwerqwerqw -->
					<c:choose>
						<c:when test="${monthSearch != null}">
							<option value='01' id='01'
								<c:if test="${monthSearch == 01 }"><c:out value="selected=selected"/> </c:if>>January</option>
							<option value='02' id='02'
								<c:if test="${monthSearch == 02 }"><c:out value="selected=selected"/> </c:if>>February</option>
							<option value='03' id='03'
								<c:if test="${monthSearch == 03 }"><c:out value="selected=selected"/> </c:if>>March</option>
							<option value='04' id='04'
								<c:if test="${monthSearch == 04 }"><c:out value="selected=selected"/> </c:if>>April</option>
							<option value='05' id='05'
								<c:if test="${monthSearch == 05 }"><c:out value="selected=selected"/> </c:if>>May</option>
							<option value='06' id='06'
								<c:if test="${monthSearch == 06 }"><c:out value="selected=selected"/> </c:if>>June</option>
							<option value='07' id='07'
								<c:if test="${monthSearch == 07 }"><c:out value="selected=selected"/> </c:if>>July</option>
							<option value='08' id='08'
								<c:if test="${monthSearch == 08 }"><c:out value="selected=selected"/> </c:if>>August</option>
							<option value='09' id='09'
								<c:if test="${monthSearch == 09 }"><c:out value="selected=selected"/> </c:if>>September</option>
							<option value='10' id='10'
								<c:if test="${monthSearch == 10 }"><c:out value="selected=selected"/> </c:if>>October</option>
							<option value='11' id='11'
								<c:if test="${monthSearch == 11 }"><c:out value="selected=selected"/> </c:if>>November</option>
							<option value='12' id='12'
								<c:if test="${monthSearch == 12 }"><c:out value="selected=selected"/> </c:if>>December</option>
						</c:when>

						<c:otherwise>
							<option value='01' id='01'
								<c:if test="${month_now == 01 }"><c:out value="selected=selected"/> </c:if>>January</option>
							<option value='02' id='02'
								<c:if test="${month_now == 02 }"><c:out value="selected=selected"/> </c:if>>February</option>
							<option value='03' id='03'
								<c:if test="${month_now == 03 }"><c:out value="selected=selected"/> </c:if>>March</option>
							<option value='04' id='04'
								<c:if test="${month_now == 04 }"><c:out value="selected=selected"/> </c:if>>April</option>
							<option value='05' id='05'
								<c:if test="${month_now == 05 }"><c:out value="selected=selected"/> </c:if>>May</option>
							<option value='06' id='06'
								<c:if test="${month_now == 06 }"><c:out value="selected=selected"/> </c:if>>June</option>
							<option value='07' id='07'
								<c:if test="${month_now == 07 }"><c:out value="selected=selected"/> </c:if>>July</option>
							<option value='08' id='08'
								<c:if test="${month_now == 08 }"><c:out value="selected=selected"/> </c:if>>August</option>
							<option value='09' id='09'
								<c:if test="${month_now == 09 }"><c:out value="selected=selected"/> </c:if>>September</option>
							<option value='10' id='10'
								<c:if test="${month_now == 10 }"><c:out value="selected=selected"/> </c:if>>October</option>
							<option value='11' id='11'
								<c:if test="${month_now == 11 }"><c:out value="selected=selected"/> </c:if>>November</option>
							<option value='12' id='12'
								<c:if test="${month_now == 12 }"><c:out value="selected=selected"/> </c:if>>December</option>
						</c:otherwise>
					</c:choose>

				</select>
			</div>

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
		
		
		<table class="table table-bordered table-striped table-condensed table-hover" id="table_id">
				<thead>
					<tr class="">
						<th class="text-center " width="200px" height="41"
							style="background-color: #3B3F51; color: white;">Name</th>
						<th class="text-center" width="200px" height="41"
						style="background-color: #3B3F51; color: white;">วันที่</th>
						<th class="text-center " width="550px" height="41"
							style="background-color: #3B3F51; color: white;">ประเภทการลา</th>
						<th class="text-center " width="250px" height="41"
							style="background-color: #3B3F51; color: white;">จำนวนวัน</th>
						
					</tr> 	
				</thead>
				<tbody>
					<c:forEach var="lts" items="${reportlm}" varStatus="Count">
						<tr>
					<td class="text-center">${lts.name}</td>
							<td><fmt:formatDate value="${lts.start_date}"
									pattern="dd/MM/yyyy" /> - <fmt:formatDate value="${lts.end_date}"
									pattern="dd/MM/yyyy" /></td>
							<td class="text-center">${lts.leave_type_name}</td>
							<td class="text-center">${lts.no_day}</td>
						
						</tr>

					</c:forEach>
				</tbody>
			</table>
	</div>
</div>
	<script type="text/javascript">

jQuery(document).ready( function ($) {
	$.extend( true, $.fn.dataTable.defaults, {
	    "searching": true,
	    "ordering": false
	} );
  var table =  $('#table_id').DataTable({ 
      "order": false,
      "info": false,
      "paging": false, // รวมไว้หน้าเดียว
    	 dom: 'Bfrtip',
    	 buttons: [
    		 'copyHtml5',
             'excelHtml5',
             'csvHtml5',
             'pdfHtml5'
    	    ]  ,
    	    pageLength: 25,
    }); 
});

</script>

		<script>
				
				$("tr:not(:first)").each(function (index ) {
					   $(this).css('animation-delay',index *0.01 +'s');
					}); 
								
				</script>