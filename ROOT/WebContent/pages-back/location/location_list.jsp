<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="/WEB-INF/tlds/permission.tld" prefix="perm"%>
<script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
<c:set var="now" value="<%=new java.util.Date()%>" />
<script>
	
</script>
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
<!-- คำสั่งเช็คว่าข้อมูลเข้าไหม ${locationList} -->
<div class="portlet light bordered">
	<div class="portlet-title" style="margin-left: 2%;">
		<div class="caption">
			<i class="fa fa-list font-red"></i> <span
				class="caption-subject font-red sbold uppercase">Location
				List</span> <span class="caption-helper font-red"> <%-- ${role.name} --%>
			</span>
		</div>
		<div class="actions right">
			<a href="location_add" class="btn green-jungle"
				style="margin-right: 13px; padding: 8px;"> <i class="fa fa-plus"></i>&nbsp;Add
				Location
			</a> <a class="btn btn-circle btn-icon-only btn-default fullscreen"
				href="javascript:;" data-original-title="" title=""></a>
		</div>
	</div>
	<div class="portlet box white">
		<!-- <div class="portlet-title"> -->
		<div class="caption"></div>
		<div class="tools">
			<a href="javascript:;" class="collapse" data-original-title=""
				title=""> </a> <a href="#portlet-config" data-toggle="modal"
				class="config" data-original-title="" title=""> </a> <a
				href="javascript:;" class="reload" data-original-title="" title="">
			</a> <a href="javascript:;" class="remove" data-original-title=""
				title=""> </a>
		</div>
		<!-- </div> -->
		<div class="portlet-body" style="text-align: center;">
			<div class="table-responsive">
				<table id="example"
					class="table table-bordered table-striped table-condensed flip-content table-hover table-responsive ">
					<thead>
						<tr>
							<th style="width: 5%;"><center>No.</center></th>
							<th style="width: 25%;"><center>Location Name</center></th>
							<th style="width: 10%;"><center>Latitude</center></th>
							<th style="width: 10%;"><center>Longtitude</center></th>
							<th style="width: 5%;"><center>Edit</center></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="location" items="${locationList}"
							varStatus="status">
							<!--  locationList มาจาก locationAction -->
							<tr>
								<!-- <td style="padding-top:10px;">${test.exp_travel_type_id}</td> -->
								<td style="padding-top: 0.1px;">${location.locationId}</td>
								<td style="padding-top: 5px;">${location.locationName}</td>
								<td style="padding-top: 5px;">${location.lat}</td>
								<td style="padding-top: 5px;">${location.lng}</td>
								<td style="padding-top: 10px;">
									<div align="center">
										<a class="btn btn-circle btn-sm sbold blue" id="id"
											title="Edit"
											href="location_edit?locationId=${location.locationId}"><i
											class="fa fa-pencil"></i> Edit</a>
									</div>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div id="map"></div>
			</div>
		</div>
	</div>
	<!-- END FORM-->
</div>

<script>
	function add() {
		document.location = "location_add";
	}
	var id = document.getElementById('id').value;
</script>

<script>
	$(document).ready(function() {
		$('#example').DataTable();
	});
</script>

<script>
	var i;
	var data = [];
	function getDataLocation() {
		data = [
				<c:forEach var="location" items="${locationList}">[
						<c:out value="${location.lat}" />,
						<c:out value="${location.lng}" />,
						'<c:out value="${location.locationName}" />',
						<c:out value="${location.locationId}" />], </c:forEach> ];
	}

	var list = [];
	function initMap() {
		getDataLocation();
		var infowindow = new google.maps.InfoWindow();
		var image = 'https://covidtracker.5lab.co/images/unspecified_location.svg';
		for (i = 0; i < data.length; i++) {

			var subList = {
				lat : Number(data[i][0]),
				lng : Number(data[i][1])
			}
			list.push(subList);
			console.log(list);
			var map = new google.maps.Map(document.getElementById('map'), {
				zoom : 10,
				center : new google.maps.LatLng(13.727233, 100.5209055),
				gestureHandling : 'greedy'
			});

			// Create an array of alphabetical characters used to label the markers.
			var marker;
			var markers = locations.map(function(location, i) {
				marker = new google.maps.Marker({
					position : location,
					animation : google.maps.Animation.DROP,
					icon : image,
					map : map
				});
				google.maps.event.addListener(marker, 'click',
						(function(marker, i) {
							return function() {
								infowindow.setContent(data[i][2]);
								infowindow.open(map, marker);
							}
						})(marker, i));
				return marker;
			});
			

			// Add a marker clusterer to manage the markers.
			var markerCluster = new MarkerClusterer(
					map,
					markers,
					{
						imagePath : 'https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/m'
					});
		}
	}
	var locations = list;

	function locateLoop() {
		getDataLocation();
		for (i = 0; i < data.length; i++) {

			var subList = {
				lat : Number(data[i][0]),
				lng : Number(data[i][1])
			}
			list.push(subList);
		}
		console.log(list);
		return list
	}

	/* 	var map, infowindow, image, marker, i;
	 var list = [];
	 function initMap() {
	 getDataLocation();
	 map = new google.maps.Map(document.getElementById('map'), {
	 zoom : 10,
	 center : new google.maps.LatLng(13.727233, 100.5209055),
	 gestureHandling : 'greedy'
	 });
	 infowindow = new google.maps.InfoWindow();
	 image = 'https://covidtracker.5lab.co/images/unspecified_location.svg';
	 for (i = 0; i < data.length; i++) {
	 marker = new google.maps.Marker({
	 position : new google.maps.LatLng(data[i][0], data[i][1]),
	 animation : google.maps.Animation.DROP,
	 icon : image,
	 map : map
	 });
	 google.maps.event.addListener(marker, 'click',
	 (function(marker, i) {
	 return function() {
	 infowindow.setContent(data[i][2]);
	 infowindow.open(map, marker);
	 }
	 })(marker, i));
	
	 }
	 const imagePath = "https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/m";
	 const markerClusterer = new MarkerClusterer(map, marker, {
	 imagePath : imagePath
	 });
	 } */
</script>

<script
	src="https://unpkg.com/@google/markerclustererplus@4.0.1/dist/markerclustererplus.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://cdn.datatables.net/1.10.13/js/jquery.dataTables.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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