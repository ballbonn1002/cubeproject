<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/tlds/permission.tld" prefix="perm"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<script src="../assets/global/plugins/jquery.min.js"
	type="text/javascript"></script>
<script src="../assets/global/plugins/moment.min.js"
	type="text/javascript"></script>
<link rel="shortcut icon" href="favicon.ico" />
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/2.0.1/css/toastr.css"
	rel="stylesheet" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/2.0.1/js/toastr.js"></script>
<script src="../assets/global/plugins/jquery-ui/jquery-ui.min.js"></script>
<link rel="stylesheet"
	href="../assets/global/plugins/select2/css/select2.min.css"
	type="text/css" />
<script src="../assets/global/plugins/select2/js/select2.min.js"
	type="text/javascript"></script>
<script src="../assets/global/plugins/select2/js/select2.full.min.js"
	type="text/javascript"></script>
<script src="http://underscorejs.org/underscore-min.js"></script>
<c:set var="now" value="<%=new java.util.Date()%>" />
<fmt:formatDate var="year" pattern="yyyy" value="${now}" />
<style>
</style>
<script src="https://cdn.amcharts.com/lib/4/core.js"></script>
<script src="https://cdn.amcharts.com/lib/4/charts.js"></script>
<script src="https://cdn.amcharts.com/lib/4/themes/dark.js"></script>
<script src="https://cdn.amcharts.com/lib/4/themes/animated.js"></script>

<div class="portlet light bordered">

	<div class="portlet-title">

		<div class="caption">
			<i class="fa fa-calendar-check-o font-red"></i> <span
				class="caption-subject font-red sbold uppercase">Sign and
				Resign Per Year Report</span>

		</div>
		<div class="actions">
			<a class="btn btn-circle btn-icon-only btn-default fullscreen"
				href="javascript:;" data-original-title="" title=""> </a>
		</div>
	</div>

	<div class="portlet-body">



		<div class="row" style="background-color: #30303d;">
			<div class="col-lg-12">
				<iframe width="100%" height="1000px"
					src="https://app.powerbi.com/reportEmbed?reportId=d3b78691-75aa-4c45-b6de-68c77e90b74a&autoAuth=true&ctid=0c34e2e6-8444-4ebd-8a66-0dd27f500c37&config=eyJjbHVzdGVyVXJsIjoiaHR0cHM6Ly93YWJpLXNvdXRoLWVhc3QtYXNpYS1yZWRpcmVjdC5hbmFseXNpcy53aW5kb3dzLm5ldC8ifQ%3D%3D"
					frameborder="0" allowFullScreen="true"></iframe>
			</div>
		</div>
	</div>
</div>
<script>
var url="https://api.powerbi.com/beta/0c34e2e6-8444-4ebd-8a66-0dd27f500c37/datasets/fd6ef8a8-87cb-490d-baab-f7dab12f753c/rows?redirectedFromSignup=1&key=OZuc6CdKzNFYq3wg4EozemzLeAC7gKoRzGS3vFhw5Z9t3JD%2FqurPLSl%2B1be5K2IBX2YywK517nM3GvZdZzkSRQ%3D%3D";
async function postData(url = '', data = []) {
	  // Default options are marked with *
	  const response = await fetch(url, {
	    method: 'POST', // *GET, POST, PUT, DELETE, etc.
	    mode: 'cors', // no-cors, *cors, same-origin
	    cache: 'no-cache', // *default, no-cache, reload, force-cache, only-if-cached
	    credentials: 'same-origin', // include, *same-origin, omit
	    headers: {
	      'Content-Type': 'application/json'
	      // 'Content-Type': 'application/x-www-form-urlencoded',
	    },
	    redirect: 'follow', // manual, *follow, error
	    referrerPolicy: 'no-referrer', // no-referrer, *no-referrer-when-downgrade, origin, origin-when-cross-origin, same-origin, strict-origin, strict-origin-when-cross-origin, unsafe-url
	    body: JSON.stringify(data) // body data type must match "Content-Type" header
	  });
	  return response.json(); // parses JSON response into native JavaScript objects
	}
	$(document).ready(function(){
		var type;
		<c:forEach var="list" items="${listLeave}">
		if('${list.leaveTypeId}'==1){type="ลากิจ/ลาพักร้อน";}
		if('${list.leaveTypeId}'==2){type="ลาอื่นๆ";}
		if('${list.leaveTypeId}'==3){type="ลาป่วย";}
		if('${list.leaveTypeId}'==4){type="ขาดงาน";}
		if('${list.leaveTypeId}'==5){type="ลาโดยไม่รับค่าจ้าง";}
		if('${list.leaveTypeId}'==6){type="อื่นๆ";}
		if('${list.leaveTypeId}'==9){type="ลาพักร้อนที่เหลือจากปีที่แล้ว";}
		postData(url,  [
			{
			"value" :${list.noDay},
			"name" :'${list.userId}',
			"typename" : type
			}
			] )
	.then(data => {
	  console.log(data); // JSON data parsed by `data.json()` call
	});
		</c:forEach>
	}
	
	);

</script>