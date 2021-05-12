<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<link rel="shortcut icon" href="favicon.ico" />
<script
	src="${pageContext.request.contextPath}/assets/global/plugins/fancybox/lib/jquery-1.10.1.min.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/global/plugins/jquery-ui/jquery-ui.min.js"></script>
<%-- <script
	src="${pageContext.request.contextPath}/assets/global/plugins/bootstrap/js/bootstrap.js"></script> --%>
<link
	href="https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css"
	rel="stylesheet" type="text/css" />
<link
	href="https://cdn.datatables.net/buttons/1.3.1/css/buttons.dataTables.min.css"
	rel="stylesheet" type="text/css" />

<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript"
	src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>
<script type="text/javascript"
	src="https://cdn.datatables.net/buttons/1.3.1/js/dataTables.buttons.min.js"></script>
<script type="text/javascript"
	src="https://cdn.datatables.net/buttons/1.3.1/js/buttons.flash.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script type="text/javascript"
	src="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.27/build/pdfmake.min.js"></script>
<script type="text/javascript"
	src="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.27/build/vfs_fonts.js"></script>
<script type="text/javascript"
	src="https://cdn.datatables.net/buttons/1.3.1/js/buttons.html5.min.js"></script>
<script type="text/javascript"
	src="https://cdn.datatables.net/buttons/1.3.1/js/buttons.print.min.js"></script>
<script type="text/javascript"
	src="https://cdn.datatables.net/responsive/2.2.6/js/dataTables.responsive.min.js"></script>
<c:set var="now" value="<%=new java.util.Date()%>" />
<fmt:formatDate pattern="yyyy" value="${now}" var="year_now" />
<fmt:formatDate pattern="MM" value="${now}" var="month_now" />
<style>
@media only screen and (min-width: 800px) {
  .bar1 {
   margin-left:30%;
     margin-bottom:5%;
}

@media only screen and (max-width: 800px) {
  .bar1 {
   margin-left: 0%;
  }
}
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
<div class="portlet light  " >
	<div class="portlet-title">

		<div class="caption">
			<i class="icon-bar-chart font-red"></i> <span
				class="caption-subject font-red sbold uppercase">&nbsp; Expense Report  </span>
		</div>
		<div class="actions">
			<a class="btn btn-circle btn-icon-only btn-default fullscreen"
				href="javascript:;" data-original-title="" title=""> </a>
		</div>
	</div>
	
	<div class="portlet-body" style=" text-align: center;">
	
		<form action="searchExpense " >
				<div class="form-group ">
					<div class="row " >
						<div class="col-md-12 bar1" style=" text-align: center;">
							<div class="form-group  " >
								<label class="col-md-1 control-label">Year :</label>
								<div class="col-md-2">
									<select class="form-control select2me" name="year">
										<c:forEach begin="0" end="4" var="i">
											<option value="${year_now - i}"<c:if test="${year == (year_now - i) }">
											<c:out value="selected=selected"/> </c:if>>${year_now - i}</option>
										</c:forEach>
									</select>
								</div>
								<label></label>
								<div class="col-md-2 text-center">
									<button type="submit" class="btn sbold blue-steel">
										<i class="fa fa-search"></i>&nbsp;Search
									</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			
		</form>

		<div class="portlet-body" style="text-align: center;">
			<div class="">
				<table class="table table-striped table-condensed table-hover" id="table_id">
					<thead class="flip-content">
						<tr class="" style="background-color:rgb(59, 63, 81);color:white;height:41">
							<th height="41"><center>Username</center></th>
							<th height="41"><center>Jan</center></th>
							<th height="41"><center>Feb</center></th>
							<th height="41"><center>Mar</center></th>
							<th height="41"><center>Apr</center></th>
							<th height="41"><center>May</center></th>
							<th height="41"><center>Jun</center></th>
							<th height="41"><center>Jul</center></th>
							<th height="41"><center>Aug</center></th>
							<th height="41"><center>Sep</center></th>
							<th height="41"><center>Oct</center></th>
							<th height="41"><center>Nov</center></th>
							<th height="41"><center>Dec</center></th>
							<th height="41"><center>Total(Paid)</center></th>
						</tr>
					</thead>
					<tbody style="vertical-align: middle;">
<c:set var="alphabet" value='<%=new String[]{"#EAF4F4", "#FFFFFF"} %>'/>
<c:set var="totalall" value="0" />
						<c:forEach var="first" items="${leavesArraylist}"
							varStatus="status">
							<tr style="background-color:${alphabet[status.count % 2]};">
								<td style="text-align: left;">${expense[status.index].name}</td>
				      			<c:set var="total" value="${0}" />
				      				<c:set var="test" value="${leavesArraylist2[status.index]}" />
				      				<c:set var="test2" value="${leavesArraylist3[status.index]}" />
				   
								<c:forEach var="second" items="${first}" varStatus="Status1">
									<c:choose>
										<c:when test="${second.sum > 0.0 }">
										      <c:set var = "string1" value = "${leave[status.index].user_id}"/>
										 <c:set var = "length" value = "${fn:length(string1)}"/>
										 <c:set var = "string2" value = "${fn:substring(string1,0, length-3)}" />
											<td class="${string2}${Status1.count} ${string2}" style="text-align: right;"><span class="badge badge-info"> <fmt:formatNumber type = "number" 
         minFractionDigits = "2" maxFractionDigits = "2" value = "${second.sum}" /> </span><br>
											<c:if test="${test[Status1.index].sum > 0.0 }">
											 <span class="badge badge-danger"> <fmt:formatNumber type = "number" 
         minFractionDigits = "2" maxFractionDigits = "2"  value = " ${test[Status1.index].sum}" /> </span><br>
											 </c:if>
											 	<c:if test="${test2[Status1.index].sum > 0.0 }">
											 <span class="badge badge-default"> <fmt:formatNumber type = "number" 
         minFractionDigits = "2" maxFractionDigits = "2"  value = " ${test2[Status1.index].sum}" /> </span>
											 </c:if>
											</td>

										</c:when>
										<c:otherwise>
											<td style="text-align: right;">		<c:if test="${test[Status1.index].sum > 0.0 }">
											 <span class="badge badge-danger"> <fmt:formatNumber type = "number" 
         minFractionDigits = "2" maxFractionDigits = "2"  value = " ${test[Status1.index].sum}" /> </span><br>
											 </c:if>
											 	<c:if test="${test2[Status1.index].sum > 0.0 }">
											 <span class="badge badge-default"> <fmt:formatNumber type = "number" 
         minFractionDigits = "2" maxFractionDigits = "2"  value = " ${test2[Status1.index].sum}" /> </span>
											 </c:if></td>
										</c:otherwise>
									</c:choose>
									<c:set var="total" value="${second.sum + total}" />
									
								</c:forEach> 
								
								<td style="text-align: right;"><span class="badge badge-success"> <fmt:formatNumber type = "number" 
     minFractionDigits = "2"     maxFractionDigits = "2" value = "${total}" />  </span></td>
							</tr>
<c:set var="totalall"  value="${totalall + total}" />
						</c:forEach>
						<tr>
<td><b>รวมทั้งหมด</b></td>
<c:forEach var="totalPermonth" items="${totalallMonth}">
<td>	<c:if test="${totalPermonth > 0.0 }"><fmt:formatNumber type = "number" 
     minFractionDigits = "2"     maxFractionDigits = "2" value = "${totalPermonth}" /></c:if></td>
</c:forEach>
<td><fmt:formatNumber type = "number" 
     minFractionDigits = "2"     maxFractionDigits = "2" value = "${totalall}" /> </td>
</tr>
						
					</tbody>
				</table>
			</div>
		</div>
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

	<!-- END PAGE LEVEL PLUGINS -->
	<!-- BEGIN PAGE LEVEL SCRIPTS -->
	<!-- <script src="../assets/pages/scripts/charts-amcharts.min.js"
	type="text/javascript"></script> -->
	<!-- END PAGE LEVEL SCRIPTS -->