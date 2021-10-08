<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tlds/permission.tld" prefix="perm"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reports Menu</title>
</head>

<style>
#example2 {
	border: 1px solid;
	padding: 10px;
	box-shadow: 5px 10px 18px #888888;
}

div.text-overflow {
	white-space: nowrap;
	display: block;
	overflow: hidden;
	text-overflow: ellipsis;
	text-align: left;
}

@media only screen and (max-width: 992px) {
  div.text-overflow {
	white-space: nowrap;
	display: block;
	overflow: hidden;
	text-overflow: ellipsis;
	text-align: center;
}
}
</style>


<body>
	<div class="tooltip">
		Hover over me <span class="tooltiptext">Tooltip text</span>
	</div>
	<div class="portlet light bordered">
		<br>
		<div class="row">

			<div class="col-md-3">
				<div class="portlet light bordered">
					<div class="portlet-title">
						<div class="caption">
							<i class="fa fa-file-text-o font-red"></i> <span
								class="caption-subject font-red sbold"> Reports </span>
						</div>
						<div class="actions">

							<a class="btn  btn-icon-only btn-default fullscreen"
								href="javascript:;" data-original-title="" title=""> </a>
						</div>

					</div>
					<div class="portlet-body">
						<div class="tools">
							<a href="javascript:;" class="collapse" data-original-title=""
								title=""> </a> <a href="#portlet-config" data-toggle="modal"
								class="config" data-original-title="" title=""> </a> <a
								href="javascript:;" class="reload" data-original-title=""
								title=""> </a> <a href="javascript:;" class="remove"
								data-original-title="" title=""> </a>
						</div>
						

						<a href="BI">
							<button class="btn dark btn-block btn-outline" title="Report BI">
								<div class="col-md-3 ">
									<i class="fa fa-file-text-o sbold"></i>
								</div>
								<div class="col-md-9 sbold text-overflow">Report
									BI</div>

							</button>

						</a> <br> <a href="reportLeaves">
							<button class="btn blue btn-block btn-outline "
								title="Report Leaves">
								<div class="col-md-3">
									<i class="fa fa-file-text-o sbold"></i>
								</div>
								<div class="col-md-9 sbold text-overflow"
									>Report Leaves</div>

							</button>
						</a> <br> <a href="leave_charts_report">
							<button class="btn red-flamingo btn-block btn-outline "
								title="Report Leaves Chart">
								<div class="col-md-3">
									<i class="fa fa-file-text-o sbold"></i>
								</div>
								<div class="col-md-9 sbold text-overflow"
									>Report Leaves Chart</div>

							</button>
						</a><br> <a href="reportExpense">
							<button class="btn purple btn-block btn-outline "
								title="Report Expense">
								<div class="col-md-3">
									<i class="fa fa-file-text-o sbold"></i>
								</div>
								<div class="col-md-9 sbold text-overflow"
									>Report Expense</div>
							</button>
						</a><br> <a href="travel_exp_report">
							<button class="btn green-seagreen btn-block btn-outline "
								title="Report Travel Expense Chart">

								<div class="col-md-3">
									<i class="fa fa-file-text-o sbold"></i>
								</div>

								<div class="col-md-9 sbold text-overflow"
									>Report Travel Expense Chart</div>
							</button>
						</a><br> <a href="check_map">
							<button class="btn dark btn-block btn-outline "
								title="Report Check in">

								<div class="col-md-3">
									<i class="fa fa-file-text-o sbold"></i>
								</div>

								<div class="col-md-9 sbold text-overflow"
									>Report Check in</div>
							</button>
						</a><br> <a href="workhours_chart">
							<button class="btn blue btn-block btn-outline "
								title="Report Work Hours">

								<div class="col-md-3">
									<i class="fa fa-file-text-o sbold"></i>
								</div>

								<div class="col-md-9 sbold text-overflow"
									>Report Work Hours</div>
							</button>
						</a><br> <a href="user-report">
							<button class="btn red-flamingo btn-block btn-outline "
								title="Report User">

								<div class="col-md-3">
									<i class="fa fa-file-text-o sbold"></i>
								</div>

								<div class="col-md-9 sbold text-overflow"
									>Report User</div>
							</button>
						</a><br> <a href="reportProject">
							<button class="btn purple btn-block btn-outline "
								title="Report Project">

								<div class="col-md-3">
									<i class="fa fa-file-text-o sbold"></i>
								</div>

								<div class="col-md-9 sbold text-overflow"
								>Report Project</div>
							</button>
						</a><br> <a href="reportleavemonth">
							<button class="btn green-seagreen btn-block btn-outline "
								title="Report Leave Month">

								<div class="col-md-3">
									<i class="fa fa-file-text-o sbold"></i>
								</div>

								<div class="col-md-9 sbold text-overflow"
								>Report Leave Month</div>
							</button>
						</a><br> <a href="reportleaveyear">
							<button class="btn dark btn-block btn-outline "
								title="Report Leave Month">

								<div class="col-md-3">
									<i class="fa fa-file-text-o sbold"></i>
								</div>

								<div class="col-md-9 sbold text-overflow"
								>Report Leave Year</div>
							</button>
						</a>
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="portlet light bordered">
					<div class="portlet-title">
						<div class="caption">
							<i class="icon-bar-chart font-red"></i> <span
								class="caption-subject font-red sbold "> Charts </span>
						</div>
						<div class="actions">

							<a class="btn  btn-icon-only btn-default fullscreen"
								href="javascript:;" data-original-title="" title=""> </a>
						</div>

					</div>
					<div class="portlet-body">

						<div class="tools">
							<a href="javascript:;" class="collapse" data-original-title=""
								title=""> </a> <a href="#portlet-config" data-toggle="modal"
								class="config" data-original-title="" title=""> </a> <a
								href="javascript:;" class="reload" data-original-title=""
								title=""> </a> <a href="javascript:;" class="remove"
								data-original-title="" title=""> </a>
						</div>

						<a href="piecharts?userId=${onlineUser.id}">
							<button class="btn dark btn-block btn-outline " title="XY-Charts">

								<div class="col-md-3">
									<i class="fa fa-bar-chart-o sbold"></i>
								</div>

								<div class="col-md-9 sbold text-overflow"
									>XY-Charts</div>
							</button>
						</a><br>

						<perm:permission object="leave.view">
							<a href="leave_charts_all">
								<button class="btn blue btn-block btn-outline "
									title="Leave Charts all">

									<div class="col-md-3">
										<i class="fa fa-bar-chart-o sbold"></i>
									</div>

									<div class="col-md-9 sbold text-overflow"
									>Leave Charts all</div>
								</button>
							</a>
							<br>
						</perm:permission>

						<perm:permission object="expense.view">
							<a href="expense_charts">
								<button class="btn red-flamingo btn-block btn-outline "
									title="EXPENSE Charts">

									<div class="col-md-3">
										<i class="fa fa-bar-chart-o sbold"></i>
									</div>

									<div class="col-md-9 sbold text-overflow"
									>EXPENSE Charts</div>
								</button>
							</a>
							<br>
						</perm:permission>

						<perm:permission object="holidaycharts.view">
							<a href="holiday_charts">
								<button class="btn purple btn-block btn-outline "
									title="Holiday Charts">

									<div class="col-md-3">
										<i class="fa fa-bar-chart-o sbold"></i>
									</div>

									<div class="col-md-9 sbold text-overflow"
										>Holiday Charts</div>
								</button>
							</a>
							<br>
						</perm:permission>

						<perm:permission object="borrow.view">
							<a href="ePieChart">
								<button class="btn green-seagreen btn-block btn-outline "
									title="Equipments Charts">

									<div class="col-md-3">
										<i class="fa fa-bar-chart-o sbold"></i>
									</div>

									<div class="col-md-9 sbold text-overflow"
									>Equipments Charts</div>
								</button>
							</a>
							<br>
						</perm:permission>

						<a href="article_chart">
							<button class="btn dark btn-block btn-outline "
								title="Articles Charts">

								<div class="col-md-3">
									<i class="fa fa-bar-chart-o sbold"></i>
								</div>

								<div class="col-md-9 sbold text-overflow"
								>Articles Charts</div>
							</button>
						</a> <br> <a href="openOnTimeChart">
							<button class="btn blue btn-block btn-outline "
								title="Check-in On-time Charts">

								<div class="col-md-3">
									<i class="fa fa-bar-chart-o sbold"></i>
								</div>

								<div class="col-md-9 sbold text-overflow"
								>Check-in On-time Charts</div>
							</button>
						</a> <br> <a href="openLateChart">
							<button class="btn red-flamingo btn-block btn-outline "
								title="Check-in Charts">

								<div class="col-md-3">
									<i class="fa fa-bar-chart-o sbold"></i>
								</div>

								<div class="col-md-9 sbold text-overflow"
									>Check-in Charts</div>
							</button>
						</a>
					</div>


				</div>
			</div>
			<perm:permission object="report.view">
				<div class="col-md-3">
					<div class="portlet light bordered">
						<div class="portlet-title">
							<div class="caption">
								<i class="fa fa-cubes font-red"></i> <span
									class="caption-subject font-red sbold "> Summary </span>
							</div>
							<div class="actions">

								<a class="btn  btn-icon-only btn-default fullscreen"
									href="javascript:;" data-original-title="" title=""> </a>
							</div>

						</div>
						<div class="portlet-body">
							<div class="tools">
								<a href="javascript:;" class="collapse" data-original-title=""
									title=""> </a> <a href="#portlet-config" data-toggle="modal"
									class="config" data-original-title="" title=""> </a> <a
									href="javascript:;" class="reload" data-original-title=""
									title=""> </a> <a href="javascript:;" class="remove"
									data-original-title="" title=""> </a>
							</div>

							<a href="workHoursSummary">
								<button class="btn dark btn-block btn-outline "
									title="Work hours summary">

									<div class="col-md-3">
										<i class="fa fa-cubes sbold"></i>
									</div>

									<div class="col-md-9 sbold text-overflow"
										>Work hours summary</div>
								</button>
							</a> <br>

							<perm:permission object="leave.view">
								<a href="workHoursSummary1">
									<button class="btn blue btn-block btn-outline "
										title="Work hours summary1">

										<div class="col-md-3">
											<i class="fa fa-cubes sbold"></i>
										</div>

										<div class="col-md-9 sbold text-overflow"
											>Work hours summary1</div>
									</button>
								</a>
								<br>
							</perm:permission>

							<perm:permission object="expense.view">
								<a href="workHoursSummary2">
									<button class="btn red-flamingo btn-block btn-outline "
										title="Work hours summary2">

										<div class="col-md-3">
											<i class="fa fa-cubes sbold"></i>
										</div>

										<div class="col-md-9 sbold text-overflow"
											>Work hours summary2</div>
									</button>
								</a>
								<br>
							</perm:permission>

							<perm:permission object="holidaycharts.view">
								<a href="TravelSummary">
									<button class="btn purple btn-block btn-outline "
										title="YTD Travel Summary">

										<div class="col-md-3">
											<i class="fa fa-cubes sbold"></i>
										</div>

										<div class="col-md-9 sbold text-overflow"
											>YTD Travel Summary</div>
									</button>
								</a>
								<br>
							</perm:permission>

							<perm:permission object="borrow.view">
								<a href="BirthdaySummary">
									<button class="btn green-seagreen btn-block btn-outline "
										title="YTD Birthday Summary">

										<div class="col-md-3">
											<i class="fa fa-cubes sbold"></i>
										</div>

										<div class="col-md-9 sbold text-overflow"
											>YTD Birthday Summary</div>
									</button>
								</a>
								<br>
							</perm:permission>

							<a href="YtdLeaveSummary">
								<button class="btn dark btn-block btn-outline "
									title="YTD Leave Summary">

									<div class="col-md-3">
										<i class="fa fa-cubes sbold"></i>
									</div>

									<div class="col-md-9 sbold text-overflow"
										>YTD Leave Summary</div>
								</button>
							</a> <br> <a href="workHoursAnniversary">
								<button class="btn blue btn-block btn-outline "
									title="YTD Anniversary">

									<div class="col-md-3">
										<i class="fa fa-cubes sbold"></i>
									</div>

									<div class="col-md-9 sbold text-overflow"
										>YTD Anniversary</div>
								</button>
							</a> <br> <a href="workHoursSelectMonth">
								<button class="btn red-flamingo btn-block btn-outline "
									title="Work hour SelectMoth">

									<div class="col-md-3">
										<i class="fa fa-cubes sbold"></i>
									</div>

									<div class="col-md-9 sbold text-overflow"
										>Work hour SelectMoth</div>
								</button>
							</a> <br> <a href="TravelSelectMonth">
								<button class="btn purple btn-block btn-outline "
									title="Travel SelectMoth">

									<div class="col-md-3">
										<i class="fa fa-cubes sbold"></i>
									</div>

									<div class="col-md-9 sbold text-overflow"
										>Travel SelectMoth</div>
								</button>
							</a> <br> <a href="LeaveSelectMonth">
								<button class="btn green-seagreen btn-block btn-outline "
									title="Leave SelectMoth">

									<div class="col-md-3">
										<i class="fa fa-cubes sbold"></i>
									</div>

									<div class="col-md-9 sbold text-overflow"
										>Leave SelectMoth</div>
								</button>
							</a> <br> <a href="user-list2">
								<button class="btn dark btn-block btn-outline "
									title="LastCheckin & Gender">

									<div class="col-md-3">
										<i class="fa fa-cubes sbold"></i>
									</div>

									<div class="col-md-9 sbold text-overflow"
										>LastCheckin & Gender</div>
								</button>
							</a> <br> <a href="holiday_list2">
								<button class="btn blue btn-block btn-outline "
									title="Report Holiday">

									<div class="col-md-3">
										<i class="fa fa-cubes sbold"></i>
									</div>

									<div class="col-md-9 sbold text-overflow"
										>Report Holiday</div>
								</button>
							</a> <br> <a href="leave_approved_edit">
								<button class="btn red-flamingo btn-block btn-outline "
									title="Leave Approved">

									<div class="col-md-3">
										<i class="fa fa-cubes sbold"></i>
									</div>

									<div class="col-md-9 sbold text-overflow"
										>Leave Approved</div>
								</button>
							</a> <br> <a href="todayLogin">
								<button class="btn purple btn-block btn-outline "
									title="Today Login">

									<div class="col-md-3">
										<i class="fa fa-cubes sbold"></i>
									</div>

									<div class="col-md-9 sbold text-overflow"
										>Today Login</div>
								</button>
							</a> <br> <a href="tableE2">
								<button class="btn green-seagreen btn-block btn-outline "
									title="Borrower History">

									<div class="col-md-3">
										<i class="fa fa-cubes sbold"></i>
									</div>

									<div class="col-md-9 sbold text-overflow"
										>Borrower History</div>
								</button>
							</a>
						</div>
					</div>
				</div>
			</perm:permission>
			<div class="col-md-3">
				<div class="portlet light bordered">
					<div class="portlet-title">
						<div class="caption">
							<i class="fa fa-user font-red"></i> <span
								class="caption-subject font-red sbold "> Reports </span>
						</div>
						<div class="actions">

							<a class="btn  btn-icon-only btn-default fullscreen"
								href="javascript:;" data-original-title="" title=""> </a>
						</div>
					</div>
					<div class="portlet-body">

						<div class="tools">
							<a href="javascript:;" class="collapse" data-original-title=""
								title=""> </a> <a href="#portlet-config" data-toggle="modal"
								class="config" data-original-title="" title=""> </a> <a
								href="javascript:;" class="reload" data-original-title=""
								title=""> </a> <a href="javascript:;" class="remove"
								data-original-title="" title=""> </a>
						</div>
						<a href="openPalm?userseq=${onlineUser.id}">
							<button class="btn dark btn-block btn-outline " title="Palm">

								<div class="col-md-3">
									<i class="fa fa-user sbold"></i>
								</div>

								<div class="col-md-9 sbold text-overflow"
									>Palm</div>
							</button>
						</a> <br> <a href="Work_Hoursesheet">
							<button class="btn blue btn-block btn-outline "
								title="Work Hours">

								<div class="col-md-3">
									<i class="fa fa-user sbold"></i>
								</div>

								<div class="col-md-9 sbold text-overflow"
									>Work Hours</div>
							</button>
						</a> <br> <a href="openTimeinReport">
							<button class="btn red-flamingo btn-block btn-outline "
								title="TimeSheet In Report">

								<div class="col-md-3">
									<i class="fa fa-user sbold"></i>
								</div>

								<div class="col-md-9 sbold text-overflow"
									>TimeSheet In Report</div>
							</button>
						</a> <br>
						<a href="SignResign">
							<button class="btn purple btn-block btn-outline">
								<div class="col-md-3 ">
									<i class="fa fa-user sbold"></i>
								</div>
								<div class="col-md-9 sbold text-overflow">Sign & Resign Report</div>

							</button></a><br>
							<a href="SignperYear">
							<button class="btn red-flamingo btn-block btn-outline" >
								<div class="col-md-3 ">
									<i class="fa fa-user sbold"></i>
								</div>
								<div class="col-md-9 sbold text-overflow">Sign & Resign Per Year Report</div>

							</button></a><br>
							<a href="StatusEm">
							<button class="btn yellow-gold btn-block btn-outline" >
								<div class="col-md-3 ">
									<i class="fa fa-user sbold"></i>
								</div>
								<div class="col-md-9 sbold text-overflow">Status Employee Report</div>

							</button></a><br>
							<a href="DonutChartLeave">
							<button class="btn red btn-block btn-outline">
								<div class="col-md-3 ">
									<i class="fa fa-user sbold"></i>
								</div>
								<div class="col-md-9 sbold text-overflow">Donut Chart Leave Report</div>

							</button></a><br>
							<a href="powerBIleave">
							<button class="btn red btn-block btn-outline">
								<div class="col-md-3 ">
									<i class="fa fa-user sbold"></i>
								</div>
								<div class="col-md-9 sbold text-overflow">power</div>

							</button></a><br>

					</div>
				</div>
			</div>

		</div>
	</div>
</body>

</html>