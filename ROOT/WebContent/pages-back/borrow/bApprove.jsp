<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<div class="portlet light ">
    <div class="portlet-title">
        <div class="caption">
            <i class="fa fa-list font-red"></i> <span class="caption-subject font-red sbold uppercase">Borrow Wait for
                Approve
            </span>
        </div>
        <div class="actions">
        	<a class="btn btn-circle btn-icon-only btn-default fullscreen"
				href="javascript:;" data-original-title="" title=""> </a>
        </div>
    </div>
    <div class="portlet-body">
        <div class="table-scrollable">
            <table class="table table-striped">
                <thead>
                    <tr class = "text-center" style="background-color:rgb(59, 63, 81);color:white">
                        <th height="41"><center> Borrow Id </center></th>
                        <th height="41"><center> Item NO </center></th>
                        <th height="41"><center> Equipment </center></th>
                        <th height="41"><center> Borrower </center></th>
                        <th height="41"><center> Date Start </center></th>
                        <th height="41"><center> Date End </center></th>
                        <th height="41"><center> Remark </center></th>
                        <th height="41"><center> Approve </center></th>
                        <th height="41"><center> Cancel </center></th>
                    </tr>
                </thead>
                <tbody id="tbody">
                </tbody>
            </table>
        </div>
    </div>
</div>
<script>
				
				$("tr:not(:first)").each(function (index ) {
					   $(this).css('animation-delay',index *0.01 +'s');
					}); 
								
				</script>
<script src="../assets/global/plugins/jquery.min.js" type="text/javascript"></script>
<link href="../assets/global/plugins/bootstrap-toastr/toastr.min.css" rel="stylesheet" type="text/css" />
<script src="../assets/global/plugins/bootstrap-toastr/toastr.min.js" type="text/javascript"></script>
<script src="../assets/global/plugins/sweetalert/sweetalert.min.js"></script>

<script>
    $(() => {
        var borrows = [];
        borrows = JSON.parse('${borrows}');
        var equipments = [];
        equipments = JSON.parse('${equipments}');

        borrows.forEach((b) => {
            let eId = b.equipmentId;
            let equipment = {};
            b['equipment'] = {};
            equipments.forEach((e) => {
                if (e.equipmentId == eId) { equipment = e; }
            });
            b['equipment'] = equipment;
        });

        var formatDate = (date) => {
            let result = "";
            if (date != undefined) {
                result = new Date(date).toLocaleDateString("en-GB", { "month": "short", "year": "numeric", "day": "numeric" });
            }
            return result;
        }

        var getSame = (eId) => {
            let array = [];
            borrows.forEach((b) => {
                if (b.equipmentId == eId) {
                    array.push(b);
                }
            });
            return array;
        }

        borrows.forEach((b) => {
            let row = "";
            row += "<tr id='" + b.borrowId + "' >";
            row += "<td class='text-center'>" + b.borrowId + "</td>";
            row += "<td>" + b.equipment.itemNo + "</td>";
            row += "<td>" + b.equipment.name + "</td>";
            row += "<td>" + b.userBorrowid + "</td>";
            row += "<td>" + formatDate(b.dateStart) + "</td>";
            row += "<td>" + formatDate(b.dateEnd) + "</td>";
            row += "<td><input id='r_" + b.borrowId + "' type='text' class='form-control'></td>";
            row += "<td class='text-center'><button class='btn circle btn-outline btn-sm yellow-lemon' name='approve' id='" + b.borrowId + "' ><i class='fa fa-check'></i></button></td>";
            row += "<td class='text-center'><button class='btn circle btn-outline btn-sm red-intense' name='cancel' id='" + b.borrowId + "' ><i class='fa fa-remove'></i></button></td>";
            row += "</tr>";
            $('#tbody').append(row);
        });

        $('button[name=approve]').click(function () {
            let id = this.id;
            let borrow = {};

            borrows.forEach((b) => {
                if (b.borrowId == id) {
                    borrow = b;
                }
            });

            $.ajax({
                data: { "id": id, "eId": borrow.equipmentId },
                url: "eCheckBorrow"
            }).done((response) => {
                if (response.length > 0) {
                    let swalBody = document.createElement("div");
                    response.forEach((b) => {
                        let item = document.createElement("div");
                        item.setAttribute("style", "display:block");
                        let link = document.createElement("a");
                        link.setAttribute("href", "eBorrowEdit?id=" + b.borrowId);
                        let text = document.createTextNode(b.userBorrowid);
                        let desc = document.createTextNode(" is borrowing this equipment");
                        link.appendChild(text);
                        item.appendChild(link);
                        item.appendChild(desc);
                        swalBody.appendChild(item);
                    });

                    swal({
                        title: "You can't approve this!",
                        content: swalBody,
                        icon: "warning"
                    })
                } else {
                    swal({
                        title: "Are you sure!",
                        text: "Will you approve request : " + id,
                        icon: "info",
                        buttons: true
                    }).then((selected) => {
                        if (selected) {
                            $.ajax({
                                data: {
                                    "id": id,
                                    "remark": $('#r_' + id).val()
                                },
                                url: "approveBorrow"
                            }).done((response) => {
                                if (response.message == "success") {
                                    toastr.success("Approve borrow request id : " + id + " success!");
                                    $('tr#' + id).remove();
                                }
                                else {
                                    toastr.error(response.message);
                                }
                            });
                        }
                    });
                }
            });

        });

        $('button[name=cancel]').click(function () {
            
            let id = this.id;
            let borrow = {};

            borrows.forEach((b) => {
                if (b.borrowId == id) {
                    borrow = b;
                }
            });

            swal({
                title: "Are you sure!",
                text: "Will you cancel request : " + id,
                icon: "info",
                buttons: true
            }).then((selected) => {
                if (selected) {
                    $.ajax({
                        data: {
                            "id": id,
                            "remark": $('#r_' + id).val()
                        },
                        url: "cancelBorrow"
                    }).done((response) => {
                        if (response.message == "success") {
                            toastr.success("Cancel borrow request id : " + id + " success!");
                            $('tr#' + id).remove();
                        }
                        else {
                            toastr.error(response.message);
                        }
                    });
                }
            });
        });
    });
</script>