<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
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

				<div class="row" style="padding-bottom: 15px; padding-top: 15px;">
				<div class="col-md-1 col-lg-1" style="width: 0;"></div>
					<div class="col-xs-12 col-sm-12 col-md-2 col-lg-2" style="width: 19%; padding: 5px;">
						<a class="dashboard-stat dashboard-stat-v2 blue">	
							<div class="visual">		
								<i class="fa fa-car"></i>
							</div>
							<div class="details">
								<form action="myleave_list" method="POST">
									<div class="number">
										<c:choose>
											<c:when test="${quotaThisYear != 0 }">
												<c:set var="amoutLeaveDay" value="${fn:substringBefore(leave_1,'.')}" /> 
												<c:set var="amoutLeaveHour" value="${(leave_1 % 1) * 8}" />
												<c:set var="amoutLeaveHalfHour" value="${(amoutLeaveHour % 1) * 60}" />
												<c:set var="amoutquotaThisYearDay" value="${fn:substringBefore(quotaThisYear,'.')}" /> 
												<c:set var="amoutquotaThisYearHour" value="${(quotaThisYear % 1) * 8}" />
												<c:set var="amoutquotaThisYearHalfHour" value="${(amoutquotaThisYearHour % 1) * 60}" />
												<span data-counter="counterup" data-value="">
												<!--
													<fmt:formatNumber type="number" pattern="#.#" value="${amoutLeaveDay}" /> d 
													<fmt:formatNumber type="number" pattern="#.##" value="${amoutLeaveHour}" /> h
												-->
													<c:if test="${amoutLeaveDay != 0  && amoutLeaveHour != 0}">
															<fmt:formatNumber type="number" pattern="#" value="${amoutLeaveDay}"/>d
															<c:if test="${amoutLeaveHalfHour == 0}">
																<fmt:formatNumber type="number" pattern="#" value="${amoutLeaveHour}"/>h/
															</c:if>
															<c:if test="${amoutLeaveHalfHour != 0}">
																<fmt:formatNumber type="number" pattern="#" value="${amoutLeaveHour}"/>:<fmt:formatNumber type="number" pattern="#" value="${amoutLeaveHalfHour}"/>h/
															</c:if>
													</c:if><!-- show day and hours -->
													
													<c:if test="${amoutLeaveDay != 0  && amoutLeaveHour == 0}">
															<fmt:formatNumber type="number" pattern="#" value="${amoutLeaveDay}"/>d/
													</c:if> <!-- show day only -->
													
													<c:if test="${amoutLeaveDay == 0 && amoutLeaveHour != 0}">
															<c:if test="${amoutLeaveHalfHour == 0}">
																<fmt:formatNumber type="number" pattern="#" value="${amoutLeaveHour}"/>h/
															</c:if>
															<c:if test="${amoutLeaveHalfHour != 0}">
																<fmt:formatNumber type="number" pattern="#" value="${amoutLeaveHour}"/>:<fmt:formatNumber type="number" pattern="#" value="${amoutLeaveHalfHour}"/>h/
															</c:if>
													</c:if> <!-- show hours -->
													
													<c:if test="${amoutLeaveDay == 0 && amoutLeaveHour == 0}">
															<fmt:formatNumber type="number" pattern="#" value="${amoutLeaveDay}"/>d/
													</c:if> <!-- no leave -->
													
													<!-- show quota -->
													<c:if test="${amoutquotaThisYearDay != 0  && amoutquotaThisYearHour != 0}">
														<c:if test="${amoutquotaThisYearHalfHour == 0}">
															<fmt:formatNumber type="number" pattern="#" value="${amoutquotaThisYearDay}"/>d
															<fmt:formatNumber type="number" pattern="#" value="${amoutquotaThisYearHour}"/>h
														</c:if>
														<c:if test="${amoutquotaThisYearHalfHour != 0}">
															<fmt:formatNumber type="number" pattern="#" value="${amoutquotaThisYearDay}"/>d
															<fmt:formatNumber type="number" pattern="#" value="${amoutquotaThisYearHour}"/>:<fmt:formatNumber type="number" pattern="#" value="${amoutquotaThisYearHalfHour}"/>h
														</c:if>
													</c:if>
													
													<c:if test="${amoutquotaThisYearDay != 0  && amoutquotaThisYearHour == 0}">
														<fmt:formatNumber type="number" pattern="#" value="${amoutquotaThisYearDay}"/>d
													</c:if>
													
													<c:if test="${amoutquotaThisYearDay == 0 && amoutquotaThisYearHour != 0}">
														<c:if test="${amoutquotaThisYearHalfHour == 0}">
															<fmt:formatNumber type="number" pattern="#" value="${amoutquotaThisYearHour}"/>h
														</c:if>
														<c:if test="${amoutquotaThisYearHalfHour != 0}">
															<fmt:formatNumber type="number" pattern="#" value="${amoutquotaThisYearHour}"/>:<fmt:formatNumber type="number" pattern="#" value="${amoutquotaThisYearHalfHour}"/>h
														</c:if>
													</c:if>
													
													<c:if test="${amoutquotaThisDay == 0 && amoutquotaThisHour == 0}">
															<fmt:formatNumber type="number" pattern="#" value="${amoutquotaThisDay}"/>d
													</c:if>
												</span>
												<div class="desc">${type_1}</div>
											</c:when>
											<c:when test="${quotaThisYear == 0 }">
												<span data-counter="counterup" data-value="">
												0d</span>
												<div class="desc">${type_1}</div>
											</c:when>
										</c:choose>
									</div>
								</form>
							</div>
						</a>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-2 col-lg-2" style="width: 19%; padding: 5px;">
						<a class="dashboard-stat dashboard-stat-v2 yellow-gold">
							<div class="visual">
								<i class="fa fa-suitcase"></i>
							</div>
							<div class="details">
								<form action="myleave_list" method="POST">
									<div class="number">
										<c:choose>
											<c:when test="${quotaLastYear != 0 }">
												<c:set var="amoutLeaveDay" value="${fn:substringBefore(Leave_6,'.')}" /> 
												<c:set var="amoutLeaveHour" value="${(Leave_6 % 1) * 8}" />
												<c:set var="amoutLeaveHalfHour" value="${(amoutLeaveHour % 1) * 60}" />
												<c:set var="amoutquotaLastYearDay" value="${fn:substringBefore(quotaLastYear,'.')}" /> 
												<c:set var="amoutquotaLastYearHour" value="${(quotaLastYear % 1) * 8}" />
												<c:set var="amoutquotaLastYearHalfHour" value="${(amoutquotaLastYearHour % 1) * 60}" />
												<span data-counter="counterup" data-value="">
												<!--
													<fmt:formatNumber type="number" pattern="#.#" value="${amoutLeaveDay}" /> d 
													<fmt:formatNumber type="number" pattern="#.##" value="${amoutLeaveHour}" /> h
												-->
													<c:if test="${amoutLeaveDay != 0  && amoutLeaveHour != 0}">
														<fmt:formatNumber type="number" pattern="#" value="${amoutLeaveDay}"/>d
														<c:if test="${amoutLeaveHalfHour == 0}">
															<fmt:formatNumber type="number" pattern="#" value="${amoutLeaveHour}"/>h/
														</c:if>
														<c:if test="${amoutLeaveHalfHour != 0}">
															<fmt:formatNumber type="number" pattern="#" value="${amoutLeaveHour}"/>:<fmt:formatNumber type="number" pattern="#" value="${amoutLeaveHalfHour}"/>h/
														</c:if>
													</c:if> <!-- show day and hours -->
															
													<c:if test="${amoutLeaveDay != 0  && amoutLeaveHour == 0}">
														<fmt:formatNumber type="number" pattern="#" value="${amoutLeaveDay}"/>d/
													</c:if> <!-- show day only -->
															
													<c:if test="${amoutLeaveDay == 0 && amoutLeaveHour != 0}">
														<c:if test="${amoutLeaveHalfHour == 0}">
															<fmt:formatNumber type="number" pattern="#" value="${amoutLeaveHour}"/>h/
														</c:if>
														<c:if test="${amoutLeaveHalfHour != 0}">
															<fmt:formatNumber type="number" pattern="#" value="${amoutLeaveHour}"/>:<fmt:formatNumber type="number" pattern="#" value="${amoutLeaveHalfHour}"/>h/
														</c:if>
													</c:if> <!-- show hours -->
															
													<c:if test="${amoutLeaveDay == 0 && amoutLeaveHour == 0}">
														0d/
													</c:if> <!-- no leave -->
													
													<!-- show quota -->
													<c:if test="${amoutquotaLastYearDay != 0  && amoutquotaLastYearHour != 0}">
														<c:if test="${amoutquotaLastYearHalfHour == 0}">
															<fmt:formatNumber type="number" pattern="#" value="${amoutquotaLastYearDay}"/>d
															<fmt:formatNumber type="number" pattern="#" value="${amoutquotaLastYearHour}"/>h
														</c:if>
														<c:if test="${amoutquotaLastYearHalfHour != 0}">
															<fmt:formatNumber type="number" pattern="#" value="${amoutquotaLastYearDay}"/>d
															<fmt:formatNumber type="number" pattern="#" value="${amoutquotaLastYearHour}"/>:<fmt:formatNumber type="number" pattern="#" value="${amoutquotaLastYearHalfHour}"/>h
														</c:if>
													</c:if>
													
													<c:if test="${amoutquotaLastYearDay != 0  && amoutquotaLastYearHour == 0}">
														<fmt:formatNumber type="number" pattern="#" value="${amoutquotaLastYearDay}"/>d
													</c:if>
													
													<c:if test="${amoutquotaLastYearDay == 0 && amoutquotaLastYearHour != 0}">
														<c:if test="${amoutquotaLastYearHalfHour == 0}">
															<fmt:formatNumber type="number" pattern="#" value="${amoutquotaLastYearHour}"/>h
														</c:if>
														<c:if test="${amoutquotaYearHalfHour != 0}">
															<fmt:formatNumber type="number" pattern="#" value="${amoutquotaLastYearHour}"/>:<fmt:formatNumber type="number" pattern="#" value="${amoutquotaThisLastHalfHour}"/>h
														</c:if>
													</c:if>
													
													<c:if test="${amoutquotaLastYearDay == 0 && amoutquotaLastYearHour == 0}">
															0d
													</c:if>
												</span>
												<div class="desc" style="font-size: 13px;">${type_6}</div>
												</c:when>
												<c:when test="${LastYear == 0 }">
													<span data-counter="counterup" data-value="">
													0d</span>
													<div class="desc">${type_6}</div>
												</c:when>
										</c:choose>
									</div>
								</form>
							</div>
						</a>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-2 col-lg-2" style="width: 19%; padding: 5px;">
						<a class="dashboard-stat dashboard-stat-v2 red">
							<div class="visual">
								<i class="fa fa-ambulance"></i>
							</div>
							<div class="details">
								<form action="myleave_list" method="POST">
									<div class="number">
										<c:choose>
											<c:when test="${leave_3 != 0}">
												<c:set var="amoutLeaveDay" value="${fn:substringBefore(leave_3,'.')}" /> 
												<c:set var="amoutLeaveHour" value="${(leave_3 % 1) * 8}" />
												<c:set var="amoutLeaveHalfHour" value="${(amoutLeaveHour % 1) * 60}" />
												<span data-counter="counterup" data-value="">
												<!--
													<fmt:formatNumber type="number" pattern="#.#" value="${amoutLeaveDay}" /> d 
													<fmt:formatNumber type="number" pattern="#.##" value="${amoutLeaveHour}" /> h
												-->
													<c:if test="${amoutLeaveDay != 0  && amoutLeaveHour != 0}">
														<fmt:formatNumber type="number" pattern="#" value="${amoutLeaveDay}"/>d
														<c:if test="${amoutLeaveHalfHour == 0}">
															<fmt:formatNumber type="number" pattern="#" value="${amoutLeaveHour}"/>h
														</c:if>
														<c:if test="${amoutLeaveHalfHour != 0}">
															<fmt:formatNumber type="number" pattern="#" value="${amoutLeaveHour}"/>:<fmt:formatNumber type="number" pattern="#" value="${amoutLeaveHalfHour}"/>h
														</c:if>
													</c:if> <!-- show day and hours -->
															
													<c:if test="${amoutLeaveDay != 0  && amoutLeaveHour == 0}">
														<fmt:formatNumber type="number" pattern="#" value="${amoutLeaveDay}"/>d
													</c:if> <!-- show day only -->
															
													<c:if test="${amoutLeaveDay == 0 && amoutLeaveHour != 0}">
														<c:if test="${amoutLeaveHalfHour == 0}">
															<fmt:formatNumber type="number" pattern="#" value="${amoutLeaveHour}"/>h
														</c:if>
														<c:if test="${amoutLeaveHalfHour != 0}">
															<fmt:formatNumber type="number" pattern="#" value="${amoutLeaveHour}"/>:<fmt:formatNumber type="number" pattern="#" value="${amoutLeaveHalfHour}"/>h
														</c:if>
													</c:if> <!-- show hours -->
															
													<c:if test="${amoutLeaveDay == 0 && amoutLeaveHour == 0}">
														<fmt:formatNumber type="number" pattern="#" value="${amoutLeaveDay}"/>d
													</c:if> <!-- no leave -->
												</span>
												<div class="desc">${type_3}</div>
											</c:when>
											<c:when test="${leave_3 == 0}">
												<span data-counter="counterup" data-value="">0d</span>
												<div class="desc">${type_3}</div>
											</c:when>
										</c:choose>
									</div>
								</form>
							</div>
						</a>
					</div>
					
					<div class="col-xs-12 col-sm-12 col-md-2 col-lg-2" style="width: 19%; padding: 5px;">
						<a class="dashboard-stat dashboard-stat-v2 green-jungle">
							<div class="visual">
								<i class="fa fa-calendar"></i>
							</div>
							<div class="details">
								<form action="myleave_list" method="POST">
									<div class="number">
										<c:choose>
											<c:when test="${leave_2 != 0}">
												<c:set var="amoutLeaveDay" value="${fn:substringBefore(leave_2,'.')}" /> 
												<c:set var="amoutLeaveHour" value="${(leave_2 % 1) * 8}" />
												<c:set var="amoutLeaveHalfHour" value="${(amoutLeaveHour % 1) * 60}" />
												<span data-counter="counterup" data-value="">
												<!--
													<fmt:formatNumber type="number" pattern="#.#" value="${amoutLeaveDay}" /> d 
													<fmt:formatNumber type="number" pattern="#.##" value="${amoutLeaveHour}" /> h
												-->
													<c:if test="${amoutLeaveDay != 0  && amoutLeaveHour != 0}">
														<fmt:formatNumber type="number" pattern="#" value="${amoutLeaveDay}"/>d
														<c:if test="${amoutLeaveHalfHour == 0}">
															<fmt:formatNumber type="number" pattern="#" value="${amoutLeaveHour}"/>h
														</c:if>
														<c:if test="${amoutLeaveHalfHour != 0}">
															<fmt:formatNumber type="number" pattern="#" value="${amoutLeaveHour}"/>:<fmt:formatNumber type="number" pattern="#" value="${amoutLeaveHalfHour}"/>h
														</c:if>
													</c:if> <!-- show day and hours -->
															
													<c:if test="${amoutLeaveDay != 0  && amoutLeaveHour == 0}">
														<fmt:formatNumber type="number" pattern="#" value="${amoutLeaveDay}"/>d
													</c:if> <!-- show day only -->
															
													<c:if test="${amoutLeaveDay == 0 && amoutLeaveHour != 0}">
														<c:if test="${amoutLeaveHalfHour == 0}">
															<fmt:formatNumber type="number" pattern="#" value="${amoutLeaveHour}"/>h
														</c:if>
														<c:if test="${amoutLeaveHalfHour != 0}">
															<fmt:formatNumber type="number" pattern="#" value="${amoutLeaveHour}"/>:<fmt:formatNumber type="number" pattern="#" value="${amoutLeaveHalfHour}"/>h
														</c:if>
													</c:if> <!-- show hours -->
															
													<c:if test="${amoutLeaveDay == 0 && amoutLeaveHour == 0}">
														<fmt:formatNumber type="number" pattern="#" value="${amoutLeaveDay}"/>d
													</c:if> <!-- no leave -->
												</span>
												<div class="desc">${type_2}</div>
											</c:when>
											<c:when test="${leave_2 == 0}">
												<span data-counter="counterup" data-value="">0d</span>
												<div class="desc">${type_2}</div>
											</c:when>
										</c:choose>
									</div>
								</form>
							</div>
						</a>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-2 col-lg-2" style="width: 19%; padding: 5px;">
						<a class="dashboard-stat dashboard-stat-v2 green">
							<div class="visual">
								<i class="fa fa-battery-quarter"></i>
							</div>
							<div class="details">
								<form action="myleave_list" method="POST">
									<div class="number">
										<c:choose>
											<c:when test="${leave_5 != 0}">
												<c:set var="amoutLeaveDay" value="${fn:substringBefore(leave_5,'.')}" /> 
												<c:set var="amoutLeaveHour" value="${(leave_5 % 1) * 8}" />
												<c:set var="amoutLeaveHalfHour" value="${(amoutLeaveHour % 1) * 60}" />
												<span data-counter="counterup" data-value="">
												<!--
													<fmt:formatNumber type="number" pattern="#.#" value="${amoutLeaveDay}" /> d 
													<fmt:formatNumber type="number" pattern="#.##" value="${amoutLeaveHour}" /> h
												-->
													<c:if test="${amoutLeaveDay != 0  && amoutLeaveHour != 0}">
														<fmt:formatNumber type="number" pattern="#" value="${amoutLeaveDay}"/>d
														<c:if test="${amoutLeaveHalfHour == 0}">
															<fmt:formatNumber type="number" pattern="#" value="${amoutLeaveHour}"/>h
														</c:if>
														<c:if test="${amoutLeaveHalfHour != 0}">
															<fmt:formatNumber type="number" pattern="#" value="${amoutLeaveHour}"/>:<fmt:formatNumber type="number" pattern="#" value="${amoutLeaveHalfHour}"/>h
														</c:if>
													</c:if> <!-- show day and hours -->
															
													<c:if test="${amoutLeaveDay != 0  && amoutLeaveHour == 0}">
														<fmt:formatNumber type="number" pattern="#" value="${amoutLeaveDay}"/>d
													</c:if> <!-- show day only -->
															
													<c:if test="${amoutLeaveDay == 0 && amoutLeaveHour != 0}">
														<c:if test="${amoutLeaveHalfHour == 0}">
															<fmt:formatNumber type="number" pattern="#" value="${amoutLeaveHour}"/>h
														</c:if>
														<c:if test="${amoutLeaveHalfHour != 0}">
															<fmt:formatNumber type="number" pattern="#" value="${amoutLeaveHour}"/>:<fmt:formatNumber type="number" pattern="#" value="${amoutLeaveHalfHour}"/>h
														</c:if>
													</c:if> <!-- show hours -->
															
													<c:if test="${amoutLeaveDay == 0 && amoutLeaveHour == 0}">
														<fmt:formatNumber type="number" pattern="#" value="${amoutLeaveDay}"/>d
													</c:if> <!-- no leave -->
												</span>
												<div class="desc">${type_5}</div>
											</c:when>
											<c:when test="${leave_5 == 0}">
												<span data-counter="counterup" data-value="">0d</span>
												<div class="desc">${type_5}</div>
											</c:when>
										</c:choose>
									</div>
								</form>
							</div>
						</a>
				</div>
			</div>

			<form action="searchfromto" method="POST">
				<div class="portlet-body">
					<div class="row">
						<div class="col-md-4"></div>
						<div class="col-md-8">
							<div class="col-md-5"></div>
							<div class="col-md-5 col-xs-12">
								<div class="form-group">
									<div class="input-group input-large date-picker input-daterange" data-date-format="dd-mm-yyyy">
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
							<div class="col-md-2 col-xs-12" style="text-align: center">
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
					</div>
				</div>
			</form>

			<div class="portlet-body flip-scroll" style="text-align: center;">
				<table class="table table-striped table-condensed flip-content table-hover">
					<thead>
						<tr style="background-color:#eef1f5;color:#6e869d">
							<th height="41"><center>#</center></th>
							<th height="41"><center>name</center></th>
							<th height="41"><center>Type of leave</center></th>
							<th height="41"><center>Start date (Since)</center></th>
							<th height="41"><center>End date (Until)</center></th>
							<th height="41"><center>Amount the day</center></th>
							<th height="41"><center>Status</center></th>
							<th height="41"><center></center></th>
						</tr>
					</thead>
					
						<form action="myleave_list" method="POST">
						<c:forEach var="leave" items="${leavelist}" varStatus="status">
							<tr>
								<td style="vertical-align: middle; color: #3598dc;">${leave.leave_id}</td>
								<!-- <td style="vertical-align: middle;"><fmt:formatDate value="${leave.time_create}"
										pattern="dd-MM-yyyy HH:mm"></fmt:formatDate></td>
										-->
								<td>${leave.user_id}</td>
								<c:choose>
									<c:when test="${leave.leave_type_id.toString() == '1'}">
										<td style="text-align: left;">${type_1}</td>
									</c:when>
									<c:when test="${leave.leave_type_id.toString() == '2'}">
										<td style="text-align: left;">${type_2}</td>
									</c:when>
									<c:when test="${leave.leave_type_id.toString() == '3'}">
										<td style="text-align: left;">${type_3}</td>
									</c:when>
									<c:when test="${leave.leave_type_id.toString() == '5'}">
										<td style="text-align: left;">${type_5}</td>
									</c:when>
									<c:when test="${leave.leave_type_id.toString() == '6'}">
										<td style="text-align: left;">${type_6}</td>
									</c:when>
								</c:choose>
								<td style="vertical-align: middle;">
									<fmt:formatDate value="${leave.start_date}" 
										type="date"></fmt:formatDate>
									<fmt:formatDate value="${leave.start_date}" 
										type="time" pattern="HH:mm"></fmt:formatDate>
								</td>
								<td style="vertical-align: middle;"><fmt:formatDate value="${leave.end_date}" 
										type="date"></fmt:formatDate>
									<fmt:formatDate value="${leave.end_date}" 
										type="time" pattern="HH:mm"></fmt:formatDate>
								</td>
										
								<td style="vertical-align: middle;">
									<c:set var="amoutLeaveDay" value="${fn:substringBefore(leave.no_day,'.')}" /> 
									<c:set var="amoutLeaveHour" value="${(leave.no_day % 1) * 8}" />
									<c:set var="amoutLeaveHalfHour" value="${(amoutLeaveHour % 1) * 60}" />

									<c:if test="${amoutLeaveDay != 0  && amoutLeaveHour != 0}">
										<span style="color:white; width:80px; display:inline-block; border: 2px solid #3598dc; background-color: #3598dc;">
										<fmt:formatNumber type="number" pattern="#" value="${amoutLeaveDay}"/>d
										<c:if test="${amoutLeaveHalfHour == 0}">
											<fmt:formatNumber type="number" pattern="#" value="${amoutLeaveHour}"/>h
										</c:if>
										<c:if test="${amoutLeaveHalfHour != 0}">
											<fmt:formatNumber type="number" pattern="#" value="${amoutLeaveHour}"/>:<fmt:formatNumber type="number" pattern="#" value="${amoutLeaveHalfHour}"/>h
										</c:if>
										</span>
									</c:if> <!-- show day and hours -->
															
									<c:if test="${amoutLeaveDay != 0  && amoutLeaveHour == 0}">
										<span style="color:#3598dc; width:80px; display:inline-block; border: 2px solid #3598dc; background-color: #f2f6f9;">
										<fmt:formatNumber type="number" pattern="#" value="${amoutLeaveDay}"/> day
										</span>
									</c:if> <!-- show day only -->
															
									<c:if test="${amoutLeaveDay == 0 && amoutLeaveHour != 0}">
										<span style="color:white; width:80px; display:inline-block; border: 2px solid #3598dc; background-color: #3598dc;">
										<c:if test="${amoutLeaveHalfHour == 0}">
											<fmt:formatNumber type="number" pattern="#" value="${amoutLeaveHour}"/> hours
										</c:if>
										<c:if test="${amoutLeaveHalfHour != 0}">
											<fmt:formatNumber type="number" pattern="#" value="${amoutLeaveHour}"/>:<fmt:formatNumber type="number" pattern="#" value="${amoutLeaveHalfHour}"/> h
										</c:if>
										</span>
									</c:if> <!-- show hours -->					
								</td>
								
								<td style="vertical-align: middle;"><c:if test="${leave.leave_status_id.toString() == '0'}">
										<span class="label label-warning" style="background-color: #ff9800;">Waiting for approve</span>
									</c:if> <c:if test="${leave.leave_status_id.toString() == '1'}">
										<span class="label label-success" style="background-color: #04AA6D;">Approved</span>
									</c:if> <c:if test="${leave.leave_status_id.toString() == '2'}">
										<span class="label label-danger" style="background-color: #f44336;">Reject</span>
									</c:if></td>
									
								<td style="vertical-align: middle;">
								<a class="btn circle btn-outline btn-sm sbold blue"
										title="information of leave">
										<i class="fa fa-clipboard"></i></a>
								<a class="btn circle btn-outline btn-sm sbold purple"
										href="LeaveEdit?id=${leave.leave_id}"
										title="leave edit">
										<i class="fa fa-pencil"></i></a>
								<a class="btn circle btn-outline btn-sm sbold red"
										title="leave deleting">
										<i class="fa fa-trash-o"></i></a>
								</td>
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