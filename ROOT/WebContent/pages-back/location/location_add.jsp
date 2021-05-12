<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="/WEB-INF/tlds/permission.tld" prefix="perm"%>
<script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
<c:set var="now" value="<%=new java.util.Date()%>" />
<fmt:formatDate value="${bean.date}" pattern="dd-MM-yyyy" />
<style>
#map {
	height: 400px;
}

html, body {
	height: 100%;
	margin: 0;
	padding: 0;
}
</style>

<div class="portlet light bordered">
	<div class="portlet-title" style="margin-left: 2%;">
		<div class="caption">
			<i class="fa fa-list font-red"></i> <span
				class="caption-subject font-red sbold uppercase">Add Location</span>
		</div>

	</div>
	<div class="portlet-body">
		<!-- BEGIN FORM-->
		<div class="panel-body">

			<!-- 				<div class="form-group">
					<label for="recipient-name" class="control-label">ID:</label> <input
						type="text" name="ID" required class="form-control">
				</div> -->
			<!-- 			<form action="saveLocation" method="POST"> -->
			<!-- Lat: -->
			<input type="hidden" id="lat"> <br>
			<!-- Lng: -->
			<input type="hidden" id="lng">
			<div id="map"></div>
			<div class="form-group">
				<label for="recipient-name" class="control-label">location
					Name:</label> <input id="newLocation" type="text" name="name" required
					class="form-control">
			</div>
			<input type="hidden" name="logonUser" value="${logonUser}">

			<!-- กำหนดวันที่ Time Create -->
			<div>
				<input type="hidden" name="time" id="time"
					class="form-control input-lg timepicker timepicker-24 test"
					value="${time}" data-time-format=" HH:mm" style="width: 200px;"
					onclick="timechenge()" onkeypress='return false'>
			</div>

			<div class="form-group form-md-line-input">

				<div class="col-md-2">
					<input name="date" id="date"
						value="<fmt:formatDate value="${now}"  type = "both" 
        timeStyle = "medium" pattern="dd-MM-yyyy "/>"
						onchange="datechenge()"
						class="form-control input-lg form-control-inline input-medium date-picker test"
						size="9" type="hidden" onkeypress='return false'>
				</div>
				<!-- End Time Create -->

			</div>
			<div class="modal-footer">
				<button type="submit" class="btn btn-success"
					onclick="saveLocation();">
					<i class="fa fa-save"></i> Save
				</button>
				<button type="reset" class="btn btn-info">
					<i class="fa fa-refresh"></i> Reset
				</button>
			</div>
			<!-- </form> -->
		</div>
	</div>
</div>

<script>
	$(document).ready(function() {

		var value = "${flag}";
		if (value == 1) {

			swal('Please!', 'Check Department ID Duplicate', 'warning');
		}
	});
</script>

<script>
	var lat, lng, x, y, marker, newLat, newLng, lastLat, lastLng;
	function initMap() {
		lastLat = 13.745891;
		lastLng = 100.534121;
		var map = new google.maps.Map(document.getElementById('map'), {
			zoom : 15,
			center : new google.maps.LatLng(lastLat, lastLng),
		});
		marker = new google.maps.Marker({
			position : new google.maps.LatLng(lastLat, lastLng),
			animation : google.maps.Animation.DROP,
			draggable : true,
			map : map
		});

		marker.setMap(map);
		google.maps.event.addListener(marker, 'dragend', function(event) {
			document.getElementById('lat').value = event.latLng.lat();
			document.getElementById('lng').value = event.latLng.lng();
			x = event.latLng.lat();
			y = event.latLng.lng();
			console.log(x);
			console.log(y);
		});
	}
</script>

<script>
	function saveLocation() {
		/* debugger; */
		var newLocation = document.getElementById('newLocation').value;
		var curLocationLat = document.getElementById('lat').value;
		var curLocationLng = document.getElementById('lng').value;
		/* var dateCreate = document.getElementByName('date').value; */
		debugger;
		if (newLocation != "") {
			$.ajax({
				type : 'POST',
				url : "${pageContext.request.contextPath}/saveLocation",
				data : {
					"locationName" : newLocation,
					"lat" : curLocationLat,
					"lng" : curLocationLng
				},
			}).done(function(data) {
				console.log(data);
				swal({
					title : "SUCCESS",
					type : "success",
					showConfirmButton : true
				}, function(isConfirm) {
					if (isConfirm) {
						document.location = "location_list";
					}
				})

			}).fail(
					function() {
						swal('Location already exist,',
								'Please select or change your location!',
								'error');
					});
		} else {
			swal('Please!', 'Input your location', 'warning');
		}

	}
</script>

<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAahaoRphKATakHFuXS70EGQROI3VPiPBc&callback=initMap"
	async defer></script>
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
