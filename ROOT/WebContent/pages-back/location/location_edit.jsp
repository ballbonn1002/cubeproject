<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="/WEB-INF/tlds/permission.tld" prefix="perm"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>

<!-- ${location} -->
<style>
#map {
	height: 350px;
}

html, body {
	height: 100%;
	margin: 0;
	padding: 0;
}
</style>

<div class="portlet light bordered">
	<div class="portlet-title">

		<div class="caption">
			<i class="fa fa-paperclip font-red"></i> <span
				class="caption-subject font-red sbold uppercase">Edit
				Location</span>
		</div>
		<div class="actions">
			<a class="btn btn-circle btn-icon-only btn-default fullscreen"
				href="javascript:;" data-original-title="" title=""> </a>
		</div>
	</div>
	<input type="hidden" id="locateId" name="name" value="${location.locationId}">
	<div class="portlet-body">
		<form action="updateLocation" method="POST">
			<!-- Lat: -->
			<input type="hidden" id="lat"> <br>
			<!-- Lng: -->
			<input type="hidden" id="lng">
			<div id="map"></div>
			</body>
			<label for="recipient-name" class="control-label">Location
				Name:</label> <input type="text" name="name" id="locate"
				value="${location.locationName}" required class="form-control">
			<div class="form-group form-md-line-input">
				<div class="modal-footer">
					<button type="button" class="btn btn-success" id="demo"
						onclick="updateLocation();">
						<i class="fa fa-save"></i> Update
					</button>
					<button type="reset" class="btn btn-info">
						<i class="fa fa-refresh"></i> Reset
					</button>
				</div>
			</div>
		</form>
	</div>

	<!-- END FORM-->

</div>

<script>
	$(document).ready(function() {
		console.log(lat)
		var value = "${flag}";
		if (value == 1) {

			swal('Please Check!', ' Leave type ID  is duplicate', 'warning');
		}
	});
</script>

<script>
	var lat, lng, x, y, marker, lastLat, lastLng;

	function initMap() {
		lastLat = ${location.lat};
		lastLng = ${location.lng};
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
	function updateLocation() {
		debugger;
		var locateId = document.getElementById("locateId").value;
		locateId.toString;
		var newLocation = document.getElementById("locate").value;
		var curLocationLat = document.getElementById('lat').value;
		var curLocationLng = document.getElementById('lng').value;
/* 		console.log(newLocation)
		console.log(curLocationLat)
		console.log(curLocationLng)  */
		//alert("user= "+user+" text= "+othor);	
		if (newLocation != "") {

			$.ajax({
				type : 'POST',
				url : "${pageContext.request.contextPath}/updateLocation",
				data : {
					"locateId" : locateId,
					"locationName" : newLocation,
					"lat" : curLocationLat,
					"lng" : curLocationLng,
				},
			}).done(function(data) {
/* 				console.log(data);
				console.log($('#locate').html(data)); */
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
	src="https://maps.googleapis.com/maps/api/js?key=${GOOGLE_API_KEY}&callback=initMap"
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
