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
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script
	src="${pageContext.request.contextPath}/assets/global/plugins/fancybox/lib/jquery-1.10.1.min.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/global/plugins/jquery-ui/jquery-ui.min.js"></script>

<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript"
	src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
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
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<script>
	AOS.init();
</script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>

<fmt:formatDate pattern="yyyy" value="${dateTimeNow}" var="year_now" />
<fmt:formatDate pattern="MM" value="${dateTimeNow}" var="month_now" />
<fmt:formatDate pattern="dd" value="${dateTimeNow}" var="day_now" />
<fmt:formatDate pattern="dd-MM-yyyy" value="${dateTimeNow}"
	var="dateNow" />
<fmt:formatDate pattern="HH:mm" value="${dateTimeNow}" var="timeNow" />


<h1>Add My Training</h1>
<div class="container">
	<div class="row n_user">
		<div class="col-2 head">
			<label for="exampleDataList" class="form-label">name :</label>
		</div>
		<div class="col-8">
			<select class="form-select" aria-label="Disabled select example"
				disabled>
				<option selected>ชื่อของผู้ใช้</option>
			</select>
		</div>
	</div>
	<br>
	<div class="row">
		<div class="col-2 head">
			<label for="exampleFormControlInput1" class="form-label">Lecturer:
			</label>

		</div>
		<div class="col-8">
			<input type="text" class="form-control" placeholder=" ">
		</div>
	</div>
	<br>
	<div class="row">
		<div class="col-2 head">
			<label for="exampleFormControlInput1" class="form-label">Training
				Title: </label>

		</div>
		<div class="col-8">
			<input type="text" class="form-control" placeholder=" ">
		</div>

	</div>
	<br>
	<div class="row">
		<div class="col-2 head">Duration:</div>
		<div class="col-6">
			<div class="input-group input-large date-picker input-daterange"
				data-date-format="dd-mm-yyyy">
				<input name="from" type="text" class="form-control cannot"
					id="date_from" aria-required="true" value="${date_now}" required>
				<span class="input-group-addon"> To :</span> <input type="text"
					name="to" id="date_to" required value="${date_now}"
					class="form-control cannot" class="required" aria-required="true">
				<span class="input-group-addon"> Hour Training : </span> <input
					type="text" name="to" id="date_to" required value="${date_now}"
					class="form-control cannot" class="required" aria-required="true">
			</div>
		</div>
	</div>
	<br>
	<div class="row">
		<div class="col-2 head">
			<label for="exampleFormControlInput1" class="form-label">Location:
			</label>

		</div>
		<div class="col-8">
			<input type="text" class="form-control" placeholder=" ">
		</div>

	</div>

	<div class="row">
		<div class="col-2 head">
			<label for="exampleFormControlInput1" class="form-label">Description:
			</label>

		</div>
		<div class="col-8">
			<textarea class="form-control" placeholder="" id="floatingTextarea2"
				style="height: 300px"></textarea>
		</div>

	</div>

	<div class="col-md-12 button-position">
		<button type="button" class="btn btn-primary btn-submit">Sumbit</button>
		<button type="button" class="btn btn-danger btn-cancle">Cancle</button>
	</div>
</div>





<style>
.container {
	margin-top: 50px;
}

.head {
	display: flex;
	justify-content: flex-end;
}

.size_width {
	width: 70%;
}

.con-center {
	display: flex;
	justify-content: center;
}

.button-position {
	display: flex;
	justify-content: center;
}

.button-position>.btn-submit {
	margin: 10px;
}

.button-position>.btn-cancle {
	margin: 10px;
}
</style>
<script>
	$(document).ready(function() {
		$('#myTable').DataTable();
		console.log("asd");
	});
</script>

<script>
	var checkbox_value = [];
	var checkbox_value2 = "";
	function clickcheck(user) {

		console.log(checkbox_value);

		const index = checkbox_value.indexOf(user);
		if (index > -1) {
			checkbox_value.splice(index, 1);
		} else {
			checkbox_value.push(user);
		}

		console.log(checkbox_value);

	};
</script>





<script>
	$("#btn_").on('click', function() {
		var ns = document.getElementById('type').value;
		console.log(ns)

		for (var i = 0; i < checkbox_value.length; i++) {
			checkbox_value2 += checkbox_value[i] + ",";
		}
		console.log(checkbox_value2);
		$.ajax({
			url : "add_jobsite",
			method : "POST",
			type : "JSON",
			data : {
				"userid" : checkbox_value2,
				"namesite" : ns,

			},
			success : function(data) {
				swal({
					title : "Pass",
					text : "Saved Succcess",
					type : "success"
				}, function() {
					window.location.href = "job_site_list";
				});
			}

		})
	});
</script>
<script>
	function job_site_list_add() {
		location.href = 'job_site_list_add';
	};
	function delsitejob(id) {
		swal({
			title : "Are you sure!",
			text : "You will be deleting this id!",
			type : "warning",
			showCancelButton : true,
			confirmButtonClass : 'btn-danger',
			confirmButtonText : 'OK'
		}, function(inputValue) {
			if (inputValue == false) {
				//console.log("canceled");
				return false;
			}
			if (inputValue == true) {
				$.ajax({
					url : "delete_jobsite.action",
					data : "id=" + id,
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
	function submit() {
		var namesite = document.getElementById('type').value;

		console.log(namesite)

	}
</script>
<script src="../assets/global/plugins/counterup/jquery.waypoints.min.js"
	type="text/javascript"></script>
<script src="../assets/global/plugins/counterup/jquery.counterup.min.js"
	type="text/javascript"></script>