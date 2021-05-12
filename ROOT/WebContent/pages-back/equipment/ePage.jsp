<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tlds/permission.tld" prefix="perm"%>
<script
	src="../assets/global/plugins/fancybox/lib/jquery-1.10.1.min.js"></script>

<script
	src="../assets/global/plugins/bootstrap/js/bootstrap.js"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
		<script src="../assets/global/plugins/moment.min.js"
		type="text/javascript"></script>
		

<script src="sweetalert2.all.min.js"></script>
<!-- Optional: include a polyfill for ES6 Promises for IE11 -->
<script src="https://cdn.jsdelivr.net/npm/promise-polyfill"></script>
<script src="sweetalert2.min.js"></script>
<link rel="stylesheet" href="sweetalert2.min.css">
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
<div class="portlet light bordered">
	<div class="portlet-title">
		<div class="caption">
			<span class="caption-subject font-red sbold uppercase"> <i
				class="fa fa-folder-open"></i> Equipment
			</span>
		</div>
		<div class="actions">
			<a class="btn btn-circle btn-icon-only btn-default fullscreen"
				href="javascript:;" data-original-title="" title=""> </a>
		</div>
	</div>
	<div class="portlet-body form">
		<form action="newE" class="form-horizontal" name="form" id="form"
			method="post" enctype="multipart/form-data">
			<div class="form-body">

				<div class="row text-center">
					<div class="fileinput fileinput-new" data-provides="fileinput">
						<div class="fileinput-new thumbnail"
							style="width: 200px; height: 150px;">
							<img id="img"
								src="http://www.placehold.it/200x150/EFEFEF/AAAAAA&amp;text=no+image"
								alt="" />
						</div>
						<div class="fileinput-preview fileinput-exists thumbnail"
							style="max-width: 200px; max-height: 150px;"></div>
						<div>
							<span class="btn default btn-file"> <span
								class="fileinput-new"><i class="fa fa-picture-o"></i>
									Select image </span> <span class="fileinput-exists"> Change </span> <input
								type="file" name="image">
							</span> <a href="javascript:;" class="btn red fileinput-exists"
								data-dismiss="fileinput"> Remove </a>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-md-6">
						<div class="form-group form-lg-line-input col-md-12">
							<label class="control-label col-md-3" id="itemnolabel">Item
								NO : </label>
							<div class="col-md-8">
								<input type="text" name="itemNo" class="form-control" onkeyup='check_char(this)'
									id="itemNo" maxlength="13">
								<div class="form-control-focus"></div>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group form-lg-line-input col-md-12">
							<label class="control-label col-md-3" id="typeLabel">Type
								: </label>
							<div class="col-md-8">
								<select name="type" id="type" class="form-control"></select>
								<div class="form-control-focus"></div>
							</div>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-md-6">
						<div class="form-group form-lg-line-input col-md-12">
							<label class="control-label col-md-3" id="namelabel">Name
								: </label>
							<div class="col-md-8">
								<input type="text" name="name" class="form-control" id="name" onkeyup='check_char(this)'
									maxlength="240">
								<div class="form-control-focus"></div>
							</div>
						</div>
					</div>

					<div class="col-md-6">
						<div class="form-group form-lg-line-input col-md-12">
							<label class="control-label col-md-3" id="serialnolabel">Serial
								NO : </label>
							<div class="col-md-8">
								<input type="text" name="serialNo" class="form-control" onkeyup='check_char(this)'
									id="serialNo" maxlength="60">
								<div class="form-control-focus"></div>
							</div>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-md-6">
						<div class="form-group form-lg-line-input col-md-12">
							<label class="control-label col-md-3" id="amountLabel">Amount
								: </label>
							<div class="col-md-8">
								<input type="number" name="amount" class="form-control"
									id="amount" maxlength="10" value=1>
								<div class="form-control-focus"></div>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group form-lg-line-input col-md-12">
							<label class="control-label col-md-3" id="locationLabel">Date of purchase
								: </label>
							<div class="col-md-8">
								<input type="text" name="location" class="form-control date-picker" onkeyup='check_char(this)'
									id="location" maxlength="250">
								<div class="form-control-focus"></div>
							</div>
						</div>
					</div>
					<!-- <div class="col-md-6">
						<div class="form-group form-lg-line-input col-md-12">
							<label class="control-label col-md-3" id="locationLabel">location
								: </label>
							<div class="col-md-8">
								<input type="text" name="location" class="form-control" onkeyup='check_char(this)'
									id="location" maxlength="250">
								<div class="form-control-focus"></div>
							</div>
						</div>
					</div> -->
				</div>

				<hr class="computer">

				<div class="row computer">
					<div class="col-md-6">
						<div class="form-group form-lg-line-input col-md-12">
							<label class="control-label col-md-3" id="windowsLabel">Windows
								: </label>
							<div class="col-md-8">
								<input type="text" name="windows" class="form-control" onkeyup='check_char(this)'
									id="windows" maxlength="60">
								<div class="form-control-focus"></div>
							</div>
						</div>
					</div>

					<div class="col-md-6">
						<div class="form-group form-lg-line-input col-md-12">
							<label class="control-label col-md-3" id="processLabel">CPU
								: </label>
							<div class="col-md-8">
								<input type="text" name="process" class="form-control" onkeyup='check_char(this)'
									id="process" maxlength="120">
								<div class="form-control-focus"></div>
							</div>
						</div>
					</div>
				</div>

				<div class="row computer">
					<div class="col-md-6">
						<div class="form-group form-lg-line-input col-md-12">
							<label class="control-label col-md-3" id="ramLabel">Ram :
							</label>
							<div class="col-md-8">
								<input type="text" name="ram" class="form-control" id="ram" onkeyup='check_char(this)'
									maxlength="120">
								<div class="form-control-focus"></div>
							</div>
						</div>
					</div>

					<div class="col-md-6">
						<div class="form-group form-lg-line-input col-md-12">
							<label class="control-label col-md-3" id="hddLabel">Storage :
							</label>
							<div class="col-md-8">
								<input type="text" name="hdd" class="form-control" id="hdd" onkeyup='check_char(this)'
									maxlength="120">
								<div class="form-control-focus"></div>
							</div>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-md-6">
						<div class="form-group form-lg-line-input col-md-12">
							<label class="control-label col-md-3" id="batteryLabel">Battery
								: </label>
							<div class="col-md-8">
								<input type="text" name="battery" class="form-control" onkeyup='check_char(this)'
									id="battery" maxlength="120">
								<div class="form-control-focus"></div>
							</div>
						</div>
					</div>
						<div class="col-md-6">
						<div class="form-group form-lg-line-input col-md-12">
							<label class="control-label col-md-3" id="batteryLabel">Wifi Address
								: </label>
							<div class="col-md-8">
								<input type="text" name="wifiaddress" class="form-control" onkeyup='check_char(this)'
									id="wifiaddress" maxlength="120">
								<div class="form-control-focus"></div>
							</div>
						</div>
					</div>
				</div>
				
				<div class="row">
				<div class="col-md-6">
						<div class="form-group form-lg-line-input col-md-12">
							<label class="control-label col-md-3" id="batteryLabel">Display
								: </label>
							<div class="col-md-8">
								<input type="text" name="display" class="form-control" onkeyup='check_char(this)'
									id="display" maxlength="120">
								<div class="form-control-focus"></div>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group form-lg-line-input col-md-12">
							<label class="control-label col-md-3" id="batteryLabel">Lan Address
								: </label>
							<div class="col-md-8">
								<input type="text" name="lanaddress" class="form-control" onkeyup='check_char(this)'
									id="lanaddress" maxlength="120">
								<div class="form-control-focus"></div>
							</div>
						</div>
					</div>
				</div>
				
			
				<hr>

				<div class="row">
					 <div class="col-md-6">
						<div class="form-group form-lg-line-input col-md-12">
							<label class="control-label col-md-3" id="detailLabel">Detail
								: </label>
							<div class="col-md-8">
								<input type="text" name="detail" class="form-control" onkeyup='check_char(this)'
									id="detail" maxlength="1000">
								<div class="form-control-focus"></div>
							</div>
						</div>
					</div> 
					<!-- <div class="col-md-6">
						<div class="form-group form-lg-line-input col-md-12">
							<label class="control-label col-md-3" id="detailLabel">Detail
								: </label>
							<div class="col-md-8">
							<textarea class="form-control" onkeyup='check_char(this)'
									id="detail" name="detail" rows="5"></textarea>
								<div class="form-control-focus"></div>
							</div>
						</div>
					</div> -->

					<perm:permission object="borrowlist.searchall">
						<div class="col-md-6">
							<div class="form-group form-lg-line-input col-md-12">
								<label class="control-label col-md-3" id="statusLabel">Status
									: </label>
								<div class="col-md-8">
									<select name="status" id="status" class="form-control"></select>
									<div class="form-control-focus"></div>
								</div>
							</div>
						</div>
					</perm:permission>
				</div>
			</div>
			<div class="form-actions">
				<div class="row ">
					<div class="col-md-12 text-center">
						<button type="submit" class="btn btn-sm blue-soft">
							<i class="fa fa-save"></i> Save
						</button>
						<button onclick="goBack()" class="btn btn-sm red-intense">
							<i class="fa fa-close"></i> Cancel
						</button>
					</div>
				</div>
			</div>
		</form>
	</div>
</div>

<!-- History Equipment Table -->
<c:if test="${not empty borrowlist}">
	<div class="portlet light">
		<div class="portlet-title">
			<div class="caption">
				<i class="fa fa-history font-blue"></i> <span id="title"
					class="caption-subject font-red sbold uppercase">Equipment
					History</span>
			</div>
			<div class="portlet-body flip-scroll" style="text-align: center;">
				<table id="table"
					class="table table-bordered table-striped table-condensed flip-content table-hover">
					<thead class="flip-content">
						<tr>
							<th width="10%"><center>ID Borrow</center></th>
							<th height="44"><center>ITEM NO.</center></th>
							<th height="44"><center>ITEM Name</center></th>
							<th height="44"><center>ITEM Type</center></th>
							<th width="10%"><center>Borrow By</center></th>
							<th height="44"><center>From</center></th>
							<th height="44"><center>To</center></th>
							<th height="44"><center>Location</center></th>
							<th height="44"><center>Status</center></th>


						</tr>
					</thead>

					<c:forEach var="borrow" items="${borrowlist}">
						<tr>
							<td align='center'>${borrow.borrowId}</td>
							<td align='center'>${equipmentbyId.itemNo}</td>
							<td align='center'>${equipmentbyId.name}</td>
							<c:if test="${equipmentbyId.type.toString() == 'c'}">
								<td align='center'>Computer</td>
							</c:if>
							<c:if test="${equipmentbyId.type.toString() == 'o'}">
								<td align='center'>Other</td>
							</c:if>
							<td align='center'>${borrow.userBorrowid}</td>
							<td align='center'><fmt:formatDate
									value="${borrow.dateStart}" pattern="dd-MM-yyyy"></fmt:formatDate></td>
							<!-- <td align='center' data-order='${borrow.dateStart}'><fmt:formatDate value="${borrow.dateStart}" pattern=" dd-MMM-yyyy" /></td> -->
							<td align='center'><fmt:formatDate value="${borrow.dateEnd}"
									pattern="dd-MM-yyyy"></fmt:formatDate></td>
							<!-- <td align='center' data-order='${borrow.dateEnd}'><fmt:formatDate value="${borrow.dateEnd}" pattern=" dd-MMM-yyyy" /></td> -->
							<td align='center'>${borrow.location}</td>
							<c:if test="${borrow.status.toString() == 'W'}">
								<td style="text-align: center;"><span
									class="label label-sm label-info">Waiting for Approved </span></td>
							</c:if>
							<c:if test="${borrow.status.toString() == 'B'}">
								<td style="text-align: center;"><span
									class="label label-sm label-warning">Borrowing </span></td>
							</c:if>
							<c:if test="${borrow.status.toString() == 'C'}">
								<td style="text-align: center;"><span
									class="label label-sm label-danger"> Cancel </span></td>
							</c:if>
							<c:if test="${borrow.status.toString() == 'R'}">
								<td style="text-align: center;"><span
									class="label label-sm label-default"> Request for Return
								</span></td>
							</c:if>
							<c:if test="${borrow.status.toString() == 'F'}">
								<td style="text-align: center;"><span
									class="label label-sm label-primary"> Finish </span></td>
							</c:if>
							<c:if
								test="${borrow.status.toString() == 'U' || borrow.status.toString() == 'S'}">
								<td style="text-align: center;"><span
									class="label label-sm label-danger"> Unapproved </span></td>
							</c:if>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
</c:if>
<!-- End History Equipment Table -->
<script>
function check_char(elm){
	
	if(elm.value.match(/['"]/) && elm.value.length>0){
		swal(
				{
					title : "ERROR",
					text : "ห้ามใส่อักขระพิเศษ",
					type : "error"
				});
	
	}
}
</script>
<script src="../assets/global/plugins/jquery.min.js"
	type="text/javascript"></script>
<link
	href="../assets/global/plugins/bootstrap-fileinput/bootstrap-fileinput.css"
	rel="stylesheet" type="text/css" />
<script
	src="../assets/global/plugins/bootstrap-fileinput/bootstrap-fileinput.js"
	type="text/javascript"></script>

<script>
    var goBack = () => {
        window.history.back();
    }
    var s_list = [];
    s_list = JSON.parse('${status}');
    var t_list = [];
    t_list = JSON.parse('${type}');
</script>

<script>
    $(()=>{
        s_list.forEach((s)=>{
        	console.log("sId: " + s.statusId + " || s.des: " + s.description);
            $('#status').append("<option value='"+s.statusId+"'>"+s.description+"</option>")
        });
        t_list.forEach((t)=>{
            $('#type').append("<option value='"+t.TypeID+"'>"+t.description+"</option>")
        });

        $('#type').change(function(){
            if(this.value != "c"){
                $(".computer").css("display","none");
            } else {
                $(".computer").css("display","block");
            }
        });

        $('#itemNo').change(function(){
            let val = this.value;
            $.ajax({
                    url: "eCheckItemNo",
                    data: {
                        "itemNo": val
                    }
                }).done(function (r) {
                    if(r.message == "used"){
                        swal("Warning!", "ItemNo is already used by "+r.name, "warning");
                    }
                });
        });
    });
</script>

<!-- Edit Equipment -->
<c:if test="${equipment!=null}">
	<script>
        var e = {};
        e = JSON.parse('${equipment}');
        console.log('eStatus: '+e);
        $(()=>{
            $('#form').prop("action","updateE");

            $('#itemNo').val(e.itemNo);
            $('#type').val(e.type);
            $('#name').val(e.name);
            $('#serialNo').val(e.serialNo);
            $('#amount').val(e.amount);
            $('#location').val(e.location);
            $('#windows').val(e.windows);
            $('#process').val(e.process);
            $('#ram').val(e.ram);
            $('#hdd').val(e.hdd);
            $('#battery').val(e.battery);
            $('#detail').val(e.detail);
            $('#status').val(e.status);
            $('#note').val(e.note);
            $('#wifiaddress').val(e.wifiaddress);
            $('#lanaddress').val(e.lanaddress);
            $('#display').val(e.display);
            if(e.image != null){
                $("#img").prop("src",e.image);
            }

            if(e.status == "B"){
                $('#status').click(()=>{
                    $.ajax({
                        url: "eCheckBorrow",
                        data: {
                            "eId": e.equipmentId
                        }
                    }).done(function (borrowing) {
                        if(borrowing.length>0){

                            let body = document.createElement("div");

                            let head = document.createElement("p");
                            let text = document.createTextNode("Please change this borrow status before change this equipment status!");
                            head.appendChild(text); 
                            body.appendChild(head);

                            borrowing.forEach((b) => {
                                let item = document.createElement("a");
                                item.setAttribute("href","eBorrowEdit?id="+b.borrowId);
                                item.setAttribute("style","display:block");
                                let text = document.createTextNode(b.userBorrowid);
                                item.appendChild(text);
                                body.appendChild(item);
                            });
                            swal({
                                title: "You shouldn't do this!",
                                content: body,
                                icon: "warning"
                            });
                        }
                    });

                });

            }
        });
    </script>
</c:if>
<!-- End Edit Equipment -->