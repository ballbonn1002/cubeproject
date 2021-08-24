<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script src="../assets/ajax/jquery-1.10.2.js" type="text/javascript"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<c:set var="now" value="<%=new java.util.Date()%>" />
<style>
@media only screen and (max-width: 1200px) {
    #search {
        margin-top: 15px;
    }
}
</style>
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

<div class="portlet light bordered">
	<div class="portlet-title">
		<div class="caption">
			<i class="icon-layers font-red"></i> <span
				class="caption-subject font-red sbold uppercase">Leave
				application for ME</span>
		</div>
		<div class="actions">
            <button type="button" class="btn btn-sm green-meadow" id="addLeave"
				onclick="add()">
				<i class="fa fa-plus"></i>&nbsp;Add leave
			</button>
			<a class="btn  btn-icon-only btn-default fullscreen"
				href="javascript:;" data-original-title="" title=""> </a>
		</div>
	</div>
	<div class="portlet-body">
		<div class="tools">
			<a href="javascript:;" class="collapse" data-original-title=""
				title=""> </a> <a href="#portlet-config" data-toggle="modal"
				class="config" data-original-title="" title=""> </a> <a
				href="javascript:;" class="reload" data-original-title="" title="">
			</a> <a href="javascript:;" class="remove" data-original-title=""
				title=""> </a>
		</div>

		<form action="searchfromto" method="POST">
			<div class="portlet-body">
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-8">
						<div class="col-md-2">
							<label class="control-label">Date :</label>
						</div>
						<div class="col-md-6 col-xs-6">
							<div class="form-group">
								<div class="input-group input-large date-picker input-daterange"
									data-date-format="dd-mm-yyyy">
									<input type="text" class="form-control" name="startdate" id="startdate"
										<c:choose>
                                            <c:when test="${startdate == null}">
                                                value="<fmt:formatDate type="date" value="${now}" pattern="01-01-yyyy"/>"
                                            </c:when>
                                            <c:when test="${startdate != null}">
                                                    value="<fmt:formatDate type="date" value="${startdate}" pattern="dd-MM-yyyy"/>"
                                            </c:when>
                                        </c:choose>>
									<span class="input-group-addon"> to </span> 
									<input type="text"class="form-control" id="enddate" name="enddate"
										<c:choose>
                                            <c:when test="${enddate == null}">
                                                value="<fmt:formatDate type="date" value="${now}" pattern="dd-MM-yyyy"/>"
                                            </c:when>
                                            <c:when test="${enddate != null}">
                                                value="<fmt:formatDate type="date" value="${enddate}" pattern="dd-MM-yyyy"/>"
                                            </c:when>
                                        </c:choose>>
								</div>
							</div>
						</div>
						<div class="col-md-4 col-xs-12" style="text-align: center">
							<button id="search" type="submit" class="btn btn-sm blue-steel">
								<i class="fa fa-search"></i> Search
							</button>
						</div>
					</div>
					<script>
							$(document).ready( function(){
							
							sessionStorage.removeItem("start");
							sessionStorage.removeItem("end");
							////////
							$( "#startdate" ).change(function() {
								var x =$(this).datepicker( 'getDate');
								$( '#enddate' ).datepicker( 'setDate', x );
								console.log($( '#startdate' ).val());
								console.log($( '#enddate' ).val())
								}
							);
							$("#search").click(function() {
								
								var start = $("#startdate").val();
								var end = $("#enddate").val();
								sessionStorage.setItem("start", start);
								sessionStorage.setItem("end", end);
							}
							
							);
							});
							</script>
					<div class="col-md-2"></div>
				</div>
</div>
</form>
				<div class="row" style="padding-bottom: 15px; padding-top: 15px;">
				<div class="col-md-1 col-lg-1"></div>
					<div class="col-xs-12 col-sm-12 col-md-2 col-lg-2">
						<a class="dashboard-stat dashboard-stat-v2 blue-steel">	
							<div class="visual">		
								<i class="fa fa-photo"></i>
							</div>
							<div class="details">
								<form action="myleave_list" method="POST">
									<div class="number">
										<c:choose>
											<c:when test="${leave_1 != null}">
												<span data-counter="counterup" data-value="">${leave_1}/${quotaThisYear}</span>
												<div class="desc">${type_1}</div>
											</c:when>
											<c:when test="${leave_1 == null}">
												<span data-counter="counterup" data-value="">0 /
													${quotaThisYear}</span>
												<div class="desc">${type_1}</div>
											</c:when>
										</c:choose>
									</div>
								</form>
							</div>
						</a>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-2 col-lg-2">
						<a class="dashboard-stat dashboard-stat-v2 yellow-gold">
							<div class="visual">
								<i class="fa fa-suitcase"></i>
							</div>
							<div class="details">
								<form action="myleave_list" method="POST">
									<div class="number">
										<c:if test="${tnow >= tend}">  <!-- if now over april -->
										${leave_6}/${quotaLastYear}
											<%-- <c:if test="${leave_6l < 0}">
												<span data-counter="counterup" data-value="">${leave_6l}</span>
											</c:if>
											<c:if test="${leave_6l >= 0}">
												<span data-counter="counterup" data-value="">0</span>
											</c:if> --%>
											<div class="desc" style="font-size: 13px;">${type_6}</div>
										</c:if>
										<c:if test="${tnow < tend}">
											<span data-count="${quotaLastYear - leave_6}" class="counter">${quotaLastYear - leave_6}</span>
											<div class="desc" style="font-size: 13px;">${type_6} 
												คงเหลือ
											</div>
										</c:if>
									</div>
								</form>
							</div>
						</a>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-2 col-lg-2">
						<a class="dashboard-stat dashboard-stat-v2 red">
							<div class="visual">
								<i class="fa fa-ambulance"></i>
							</div>
							<div class="details">
								<form action="myleave_list" method="POST">
									<div class="number">
										<c:choose>
											<c:when test="${leave_3 != null}">
												<span data-counter="counterup" data-value="">${leave_3}</span>
												<div class="desc">${type_3}</div>
											</c:when>
											<c:when test="${leave_3 == null}">
												<span data-counter="counterup" data-value="">0</span>
												<div class="desc">${type_3}</div>
											</c:when>
										</c:choose>
									</div>
								</form>
							</div>
						</a>
					</div>
					
					<div class="col-xs-12 col-sm-12 col-md-2 col-lg-2">
						<a class="dashboard-stat dashboard-stat-v2 green-jungle">
							<div class="visual">
								<i class="fa fa-newspaper-o"></i>
							</div>
							<div class="details">
								<form action="myleave_list" method="POST">
									<div class="number">
										<c:choose>
											<c:when test="${leave_2 != null}">
												<span data-counter="counterup" data-value="">${leave_2}</span>
												<div class="desc">${type_2}</div>
											</c:when>
											<c:when test="${leave_2 == null}">
												<span data-counter="counterup" data-value="">0</span>
												<div class="desc">${type_2}</div>
											</c:when>
										</c:choose>
									</div>
								</form>
							</div>
						</a>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-2 col-lg-2">
						<a class="dashboard-stat dashboard-stat-v2 green">
							<div class="visual">
								<i class="fa fa-battery-quarter"></i>
							</div>
							<div class="details">
								<form action="myleave_list" method="POST">
									<div class="number">
										<c:choose>
											<c:when test="${leave_5 != null}">
												<span data-counter="counterup" data-value="">${leave_5}</span>
												<div class="desc">${type_5}</div>
											</c:when>
											<c:when test="${leave_5 == null}">
												<span data-counter="counterup" data-value="">0</span>
												<div class="desc">${type_5}</div>
											</c:when>
										</c:choose>
									</div>
								</form>
							</div>
						</a>
					<div class="col-md-2"></div>
				</div>
			</div>

			<div class="portlet-body flip-scroll" style="text-align: center;">
				<table class="table table-striped table-condensed flip-content table-hover">
					<thead>
						<tr style="background-color:rgb(59, 63, 81);color:white">
							<th height="41"><center>Leave ID</center></th>
							<th height="41"><center>Submit date</center></th>
							<th height="41"><center>The applicant</center></th>
							<th height="41"><center>Type of leave</center></th>
							<th height="41"><center>Start date (Since)</center></th>
							<th height="41"><center>End date (Until)</center></th>
							<th height="41"><center>Amount the day</center></th>
							<th height="41"><center>Status</center></th>
							<th height="41"><center>Leave application form</center></th>
						</tr>
					</thead>
					
						<form action="myleave_list" method="POST">
						<c:forEach var="leave" items="${leavelist}" varStatus="status">
							<tr>
								<td style="vertical-align: middle;">${leave.leave_id}</td>
								<td style="vertical-align: middle;"><fmt:formatDate value="${leave.time_create}"
										pattern="dd-MM-yyyy HH:mm"></fmt:formatDate></td>
								<td>${leave.user_id}</td>
								<c:choose>
									<c:when test="${leave.leave_type_id.toString() == '1'}">
										<td>${type_1}</td>
									</c:when>
									<c:when test="${leave.leave_type_id.toString() == '2'}">
										<td>${type_2}</td>
									</c:when>
									<c:when test="${leave.leave_type_id.toString() == '3'}">
										<td>${type_3}</td>
									</c:when>
									<c:when test="${leave.leave_type_id.toString() == '5'}">
										<td>${type_5}</td>
									</c:when>
									<c:when test="${leave.leave_type_id.toString() == '6'}">
										<td>${type_6}</td>
									</c:when>

								</c:choose>
								<td style="vertical-align: middle;"><fmt:formatDate value="${leave.start_date}"
										pattern="dd-MM-yyyy"></fmt:formatDate></td>
								<td style="vertical-align: middle;"><fmt:formatDate value="${leave.end_date}"
										pattern="dd-MM-yyyy"></fmt:formatDate></td>
								<td style="vertical-align: middle;">${leave.no_day}</td>
								<td style="vertical-align: middle;"><c:if test="${leave.leave_status_id.toString() == '0'}">
										<span class="label label-warning">Waiting for
											approve</span>
									</c:if> <c:if test="${leave.leave_status_id.toString() == '1'}">
										<span class="label label-success">Approved</span>
									</c:if> <c:if test="${leave.leave_status_id.toString() == '2'}">
										<span class="label label-danger">Reject</span>
									</c:if></td>
								<td style="vertical-align: middle;"><a class="btn circle btn-outline btn-sm sbold blue"
									href="LeaveEdit?id=${leave.leave_id}"
									title="information of leave"><i
										class="fa fa-clipboard"></i></a></td>
							</tr>
						</c:forEach>
						</form>
				</table>
			</div>
			</div></div>
<script>
	function add() {
		document.location = "LeaveAdd";
	}
</script>
<script>
	$('.cannot').keydown(function(e) {
		// trap the return key being pressed
		if (e.keyCode === 13 || e.keyCode === 8) {
			return false;
		}
	});
</script>