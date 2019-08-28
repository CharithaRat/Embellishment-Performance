<%--
  Created by IntelliJ IDEA.
  User: Dilusha Kumari
  Date: 01/18/2019
  Time: 4:42 PM
  To change this template use File | Settings | File Templates.
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<style>
    .no-js #loader {
        display: none;
    }

    .js #loader {
        display: block;
        position: absolute;
        left: 100px;
        top: 0;
    }

    .se-pre-con {
        position: fixed;
        left: 0px;
        top: 0px;
        width: 100%;
        height: 100%;
        z-index: 9999;
        background: url(${root}/resources/images/Preloader_3.gif) center no-repeat #fff;
        opacity: .8;
    }


</style>

<!-- Paste this code after body tag -->
<div class="se-pre-con"></div>
<!-- Ends -->
<div class="col-md-12 page">
    <div class="row" style="margin: 0">
        <legend>Maintenance Data</legend>
    </div>
<div class="row">&nbsp</div>
    <div class="row">
        <div class="col-md-12">
            <form name="maintenanceDataForm" action="${root}/maintenance/saveMaintenanceData" method="post">
                <div class="row">
                    <div class="col-md-6">
                        <div class="row">

                            <div class="col-md-3"> Asset Code</div>
                            <div class="col-md-7">
                                <select class="chosen" id="assetId" required onchange="refreshTable(),loadTransactionNoList()"
                                        name="assetId" style="width: 100%">
                                    <option value="">---SELECT---</option>
                                    <c:forEach var="asset" items="${assets}">
                                        <option value="${asset.asId}">${asset.asCode} - ${asset.asDes}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="col-md-2"></div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="row">
                            <div class="col-md-2"></div>
                            <div class="col-md-3"> Transaction No.</div>
                            <div class="col-md-7">
                                <select  id="transactionSelectId" class="chosen" style="width: 100%"
                                         onchange="loadMaintenanceData()"
                                         name="transactionSelect">
                                    <option value="0">---SELECT---</option>
                                </select>
                            </div>

                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <div class="row">

                            <div class="col-md-3">Entry Date </div>
                            <div class="col-md-7">
                                <input type="text" name="maintEntryDa" required id="maintEntryDaId" style="width: 100%"
                                       readonly="TRUE">
                            </div>
                            <div class="col-md-2"></div>
                        </div>
                    </div>
                    <div class="col-md-6">

                    </div>
                </div>



                <div class="row" style="padding-left: 10px;padding-right: 10px">
                    <table id="tblMaintenance" style="overflow-y: auto" class="responstable" width="100%"
                           cellspacing="0">
                        <thead>
                        <tr>
                            <th width="20%">Modified Date</th>
                            <th width="20%">Work Done</th>
                            <th width="20%">Meter Reading</th>
                            <th width="15%">Master File<br>(Spare Parts)</th>
                            <th width="10%">Cost</th>
                            <th width="10%">A/C Code</th>
                            <th width="5%"><a onclick=addRow('tblMaintenance')><i class="fa fa-plus fa-3x"></i></a></th>
                        </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </div>


                <div class="row" style="margin-top: 20px">
                    <div class="col-md-4"></div>
                    <div class="col-md-4">
                        <div class="row" style="padding-top: 10px">
                                <div class="col-md-6" style="margin-top: 2px">
                                <a class="btn btn-primary" style="width: 100%"
                                   href="${root}/maintenance/maintenanceData">New</a>
                            </div>
                            <div class="col-md-6">
                                <button type="submit" class="btn btn-primary" style="width: 100%">Save</button>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3"></div>
                </div>
                <input type="hidden" name="maintenanceDataId" id="maintenanceDataId" value="${maintenanceData.maintenanceDataId}">
                <input type="hidden" name="transactionNo" id="transactionNo" value="${transactionNo}">
            </form>
        </div>
    </div>
</div>

<input type="hidden" id="pageType" value="${pageType}"/>
<input type="hidden" id="status" value="${status}"/>





<script type="text/javascript">

    getDate();

    $(window).load(function () {
        // Animate loader off screen
        $(".se-pre-con").fadeOut("slow");
    });

    $('.btnSubmit').click(function () {
        $(".se-pre-con").show();
    });

    $(document).ready(function () {
        $('#dataTable').DataTable({
            "scrollY": "300px",
            "scrollCollapse": true,
            "paging": false
        });
    });

    $(function () {
        var status = $("#status").val();
        var pageType = $("#pageType").val();
        var transactionNo = $("#transactionNo").val();
        var message="";

        if (transactionNo != "") {
            message="success!!! Transaction No : ";
        } else {
            message="Update success!!! ";
        }

        if (pageType == 1) {
            if (status == 'true') {
                swal({
                    title: message + transactionNo,
                    type: 'success',

                }).then(function () {
                    window.location.href = "./maintenanceData";
                })
            } else {
                swal({
                    title: 'Error',
                    text: 'Please try again !!',
                    type: 'error',

                })
            }
        }
    });

    // Load relevant Accessories Names into combo box when selected an asset number

    var isDelete =0;
    function loadAccessories(link) {

        var assetId = $("#assetId").find("option:selected").val();
        var tableRow = link.parentElement.parentElement;
        myRow = document.getElementsByTagName("tr")[tableRow.rowIndex];
        mycol = myRow.getElementsByTagName("td")[3];
        myInputField = mycol.getElementsByTagName("select")[0];

        if(isDelete==0) {
            myInputField.id = "maintMasterId" + tableRow.rowIndex;
            var tempId = "#maintMasterId" + tableRow.rowIndex;
        }else{

            myInputField.id = "maintMasterId" + tableRow.rowIndex+"new";
            var tempId = "#maintMasterId" + tableRow.rowIndex+"new";
            isDelete=0;
        }
        $(tempId).find("option:not(:first)").remove();

                    $.ajax({
                url: '${root}/maintenance/getAccessoryByAssetId/' + assetId,
                success: function (data) {
                    for (var i = 0; i < data.length; i++) {

                        $(tempId).append(
                            "<option value = '" + data[i] + "'>" + data[i]
                            + "</option>");
                    }
                    $(tempId).append("<option value ='Other'>" + "Other" + "</option>");
                }
            });


    }

    function deleteRow(tblName, link) {
        var tbl = document.getElementById(tblName);
        var tableRow = link.parentElement.parentElement;
        tbl.deleteRow(tableRow.rowIndex);
        isDelete=1;
    }

    // Getting Current Date for "Entry Date" Field
    function getDate() {
        var date = new Date();
        document.getElementById("maintEntryDaId").value = date.getDate() + '/' + (date.getMonth() + 1) + '/' +  date.getFullYear();
    }


    function applyDatePicker() {
        $('.date').datepicker({
            format: 'dd/mm/yyyy',
            autoclose: true,
            endDate: '+0d'
        });

    }

    function addRow(tableID) {
        var assetId = $("#assetId").find("option:selected").val();

        if(assetId>0){
        var markup = "<tr >" +
            " <td  class='input-group date' style='width:10%' ><input type='text' id='date' name='maintDa' class='form-control' style='width: 90%' /></td>" +
            " <td> <input class='form-control' type='text' style='width: 90%' name='maintWork' > </td>" +
            " <td class='class='form-control''><input required type='text'  style='width: 90%'class='form-control' name='detailMaintMeter' onkeypress=\"return isNumberOnly(event)\" ></td>" +
            "<td><select required  style='width: 90%'  required name='maintMaster' id='maintMasterId' onfocus='  loadAccessories(this)'><option>SELECT</option></select></td>" +
            "<td><input type='text' style='width: 90%'class='form-control' required name='detailMaintCost'onkeypress=\"return isNumberOnly(event)\"></td>" +
            "<td><input type='text' style='width: 90%' class='form-control'required  name='maintAcCode' ></td>" +
            "<td style='text-align: center'><a onclick=deleteRow('tblMaintenance',this)><i  class=\"fa fa-trash-o fa-3x\"></i></a><input style='width: 90%'type='hidden' name='maintenanceDataId' value='"+0+"'  /></td>" +
            "</tr>";
        $("table tbody").append(markup);

        applyDatePicker();}else{
            $("input[name=assetId]").focus();
            swal({
                title: 'Warning',
                text: 'Please select AssetId !!',
                type: 'warning',
                timer: 3000
            })
        }
    }

    function refreshTable(){
        $("#tblMaintenance").find("tr:not(:first)").remove();
    }


    function loadTransactionNoList() {

        var assetId = $("#assetId").find("option:selected").val();

        $("#transactionSelectId").find("option:not(:first)").remove();
        $.ajax({
            url: '${root}/maintenance/loadMaintenanceDataNoList/' + assetId,
            success: function (data) {
                for (var i = 0; i < data.length; i++) {
                    $("#transactionSelectId").append(
                        "<option value = '" + data.maintenanceDataId + "'>" + data[i]
                        + "</option>");
                }
            }
        });
    }


    function loadMaintenanceData() {
        var transactionNo = $("#transactionSelectId").find("option:selected").text();

        $("#transactionSelectId").find("option:not(:first)").remove();
        $.ajax({
            url: '${root}/maintenance/loadMaintenanceDataByTno/' + transactionNo,
            success: function (data) {
                for (var i = 0; i < data.length; i++) {

                 var markup = "<tr >" +
                        " <td  class='input-group date' style='width:10%' > <input type='text' id='date' name='maintDa' class='form-control' style='width: 90%'  value='" + data[i].maintDa + "'/></td>" +
                        " <td> <input class='form-control' type='text' style='width: 90%' name='maintWork'  value='"+data[i].maintWork+"'> </td>" +
                        " <td class='class='form-control''><input type='text'  style='width: 90%' name='detailMaintMeter'  onkeypress=\"return isNumberOnly(event)\"  value='"+data[i].maintMeter+"'></td>" +
                        "<td><select required  style='width: 90%'  name='maintMaster' id='maintMasterId' ><option value='"+data[i].maintMaster+"'>"+data[i].maintMaster+" </option></select></td>" +
                        "<td><input type='text' style='width: 90%'class='form-control' name='detailMaintCost'  onkeypress=\"return isNumberOnly(event)\" value='"+data[i].maintCost+"'></td>" +
                        "<td><input type='text' style='width: 90%' class='form-control' name='maintAcCode' value='"+data[i].maintAcCode+"'></td>" +
                        "<td style='text-align: center'><input style='width: 90%'type='hidden' name='maintenanceDataId'  value='"+data[i].maintenanceDataId+"'/></td>" +
                        "</tr>";
                    $("table tbody").append(markup);

                    // $("input[name=maintenanceDataId]").val(data.maintenanceDataId);
                }
            }
        });
    }

</script>