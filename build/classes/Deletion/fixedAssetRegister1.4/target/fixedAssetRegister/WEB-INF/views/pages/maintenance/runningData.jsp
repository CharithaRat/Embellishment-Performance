<%--
  Created by IntelliJ IDEA.
  User: Dilusha Kumari
  Date: 01/25/2019
  Time: 8.40 AM
  To change this template use File | Settings | File Templates.
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%--CSS & JS Files of timepicker--%>

<link rel="stylesheet" href="${root}/resources/css/jquery.timepicker.min.css">
<link rel="stylesheet" href="${root}/resources/css/jquery.timepicker.css">

<script src="${root}/resources/js/jquery.timepicker.min.js"></script>
<script src="${root}/resources/js/jquery.timepicker.js"></script>


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

    .bootstrap-timepicker-widget.dropdown-menu {
        z-index: 1050 !important;
    }


</style>

<!-- Paste this code after body tag -->
<div class="se-pre-con"></div>
<!-- Ends -->
<div class="col-md-12 page">
    <div class="row" style="margin: 0">
        <legend>Running Data</legend>
    </div>
    <div class="row">&nbsp&nbsp</div>
    <div class="row">
        <div class="col-md-12">
            <form name="runningDataForm" action="${root}/maintenance/saveRunningData" method="post">
                <div class="row">
                    <div class="col-md-6">
                        <div class="row">
                            <div class="col-md-3"> Asset Code</div>
                            <div class="col-md-7">
                                <select class="chosen" id="assetId" required
                                        name="assetId" style="width: 100%"
                                        onchange="refreshTable(),loadTransactionNoList()">
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
                                <select id="transactionSelectId" style="width: 100%"
                                        onchange="loadRunningData()"
                                        name="transactionSelect">
                                    <option value="0">---SELECT---</option>
                                </select>
                            </div>

                        </div>
                    </div>
                </div>


                <div class="row" style="padding-left: 10px;padding-right: 10px">
                    <table id="tblRunning" style="overflow-y: auto" class="responstable" width="100%"
                           cellspacing="0">
                        <thead>
                        <tr class="tdCenter">
                            <th width="15%">Date</th>
                            <th width="15%">Time</th>
                            <th width="15%">Meter From</th>
                            <th width="15%">Meter To</th>
                            <th width="15%">Cost</th>
                            <th width="15%">Comments</th>
                            <th width="10%" style="text-align: center"><a onclick=addRow('tblRunning')><i
                                    class="fa fa-plus fa-3x"></i></a></th>
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
                                   href="${root}/maintenance/runningData">New</a>
                            </div>
                            <div class="col-md-6">
                                <button type="submit" class="btn btn-primary" style="width: 100%">Save</button>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4"></div>
                </div>
                <input type="hidden" name="runningId" id="runningId" value="0">
                <input type="hidden" name="transactionNo" id="transactionNo" value="${transactionNo}">
            </form>
        </div>
    </div>
</div>


<input type="hidden" id="pageType" value="${pageType}"/>
<input type="hidden" id="status" value="${status}"/>


<script type="text/javascript">

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
        var message = "";

        if (transactionNo != "") {
            message = "success!!! Transaction No : ";
        } else {
            message = "Update success!!! ";
        }

        if (pageType == 1) {
            if (status == 'true') {
                swal({
                    title: message + transactionNo,
                    type: 'success',

                }).then(function () {
                    window.location.href = "./runningData";
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


    function deleteRow(tblName, link) {
        var tbl = document.getElementById(tblName);
        var tableRow = link.parentElement.parentElement;
        tbl.deleteRow(tableRow.rowIndex);
        isDelete = 1;
    }


    function applyDatePicker() {
        $('.date').datepicker({
            format: 'mm/dd/yyyy',
            autoclose: true,
            endDate: '+0d'
        });

    }

    var isDelete = 0;

    function applyTimePicker(link) {

        var tableRow = link.parentElement.parentElement;
        myRow = document.getElementsByTagName("tr")[tableRow.rowIndex];
        mycol = myRow.getElementsByTagName("td")[1];
        myInputField = mycol.getElementsByTagName("input")[0];

        if (isDelete == 0) {
            myInputField.id = "time" + tableRow.rowIndex;
            var tempId = "#time" + tableRow.rowIndex;
        } else {

            myInputField.id = "time" + tableRow.rowIndex + "new";
            var tempId = "#time" + tableRow.rowIndex + "new";
            isDelete = 0;
        }
        $(tempId).find("option:not(:first)").remove();

        $(tempId).timepicker({
            'step': function (i) {
                return (i % 2) ? 15 : 45;
            }
        });

    }

    function addRow(tableID) {

        var assetId = $("#assetId").find("option:selected").val();
        if (assetId > 0) {
            var markup = "<tr >" +
                "<td  class='input-group date' style='width:10%' ><input type='text' id='date' name='date' class='form-control' style='width: 90%' /></td>" +
                "<td> <input type='text' name='time'  style='width: 90%' onfocus='applyTimePicker(this)' class='form-control'/></td>" +
                "<td ><input type='text' style='width:90%' maxlength='14' class='form-control'maxlength='14' name='detailMetFroNo' id='detailMetFroNoId'  onkeypress=' return isNumberOnly(event)'/></td>" +
                "<td><input type='text' class='form-control' required style='width: 90%' maxlength='14' name='detailMetToNo' id='detailmetToNoId' onkeypress=' return isNumberOnly(event)'/></td>" +
                "<td><input type='text' style='width: 90%' class='form-control' maxlength='14' name='detailCost' id='detailCostId' onkeypress=' return isNumberOnly(event)'/></td>" +
                "<td><input type='text' style='width: 90%' class='form-control' name='remark' id='remarkId' /></td>" +
                "<td style='text-align: center'><a onclick=deleteRow('tblRunning',this)><i  class=\"fa fa-trash-o fa-3x\"></i></a><input style='width: 90%'type='hidden' name='runningId' value='" + 0 + "'  /></td>" +
                "</tr>";
            $("table tbody").append(markup);

            applyDatePicker();
        } else {
            $("input[name=assetId]").focus();
            swal({
                title: 'Warning',
                text: 'Please select AssetId !!',
                type: 'warning',
                timer: 3000
            })
        }
    }

    function refreshTable() {
        $("#tblRunning").find("tr:not(:first)").remove();
    }


    function loadTransactionNoList() {

        var assetId = $("#assetId").find("option:selected").val();


        $("#transactionSelectId").find("option:not(:first)").remove();
        $.ajax({
            url: '${root}/maintenance/loadRunningDataNoList/' + assetId,
            success: function (data) {
                for (var i = 0; i < data.length; i++) {
                    $("#transactionSelectId").append(
                        "<option value = '" + data.runningId + "'>" + data[i]
                        + "</option>");
                }
            }
        });
    }


    function loadRunningData() {
        var transactionNo = $("#transactionSelectId").find("option:selected").text();


        $("#transactionSelectId").find("option:not(:first)").remove();
        $.ajax({
            url: '${root}/maintenance/loadRunningDataByTno/' + transactionNo,
            success: function (data) {

                for (var i = 0; i < data.length; i++) {

                    var markup = "<tr >" +
                        " <td  class='input-group date' style='width:10%' > <input type='text' id='date' name='date' class='form-control' style='width: 90%'  value='" + data[i].date + "'/></td>" +
                        " <td> <input class='form-control' type='text' style='width: 90%' name='time'  value='" + data[i].time + "'> </td>" +
                        " <td class='class='form-control''><input type='text'  style='width: 90%' name='detailMetFroNo'  value='" + data[i].metFroNo + "'></td>" +
                        "<td><select required  style='width: 90%'  name='detailMetToNo'  ><option value='" + data[i].metToNo + "'>" + data[i].metToNo + "</option></select></td>" +
                        "<td><input type='text' style='width: 90%'class='form-control' name='detailCost' value='" + data[i].cost + "'></td>" +
                        "<td><input type='text' style='width: 90%' class='form-control' name='remark' value='" + data[i].remark + "'></td>" +
                        "<td style='text-align: center'><input style='width: 90%'type='hidden' name='runningId'  value='" + data[i].runningId + "'/></td>" +
                        "</tr>";
                    $("table tbody").append(markup);

                    // $("input[name=maintenanceDataId]").val(data.maintenanceDataId);
                }
            }
        });
    }


</script>