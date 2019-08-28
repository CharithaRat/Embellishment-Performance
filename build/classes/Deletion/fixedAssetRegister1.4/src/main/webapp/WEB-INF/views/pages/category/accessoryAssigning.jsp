<%--
  Created by IntelliJ IDEA.
  User: Dilusha Kumari
  Date: 2019/02/06
  Time: 8.15AM
  To change this template use File | Settings | File Templates.
--%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>

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
<div class="col-md-9 page">
    <form name="accessoryAssigningForm" action="${root}/category/saveAccessoryAssigning" method="POST">
        <div class="row" style="margin: 0">
            <legend>Accessories Assigning</legend>
        </div>
        <div class="row">
            <div class="col-md-6">
                <div class="row">
                    <div class="col-md-4">Asset Code</div>
                    <div class="col-md-8">
                        <select class="chosen" id="assetCode" required
                                name="assetId" style="width: 100%" onchange="loadExistingAccessories(),loadAllAccessories()">
                            <option value="0">---SELECT---</option>
                            <c:forEach var="asset" items="${assets}">
                                <option value="${asset.asId}">${asset.asCode} - ${asset.asDes}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
            </div>
            <div class="col-md-6"></div>
        </div>

        <div class="row">
            <div class="col-md-2">Accessory</div>
            <div class="col-md-4">
                <select type="text" name="accessoryId" id="accessoryCode" required style="width: 100%"
                        onchange="loadAccessoryTable()">
                    <option value="0">---SELECT---</option>

                </select>
            </div>
            <div class="col-md-6"></div>
        </div>

        <div class="row" style="padding-left: 10px;padding-right: 10px">
            <table id="accessoryTable" style="overflow-y: auto" class="responstable" width="100%"
                   cellspacing="0">
                <thead>
                <tr>
                    <th style="width:30%">Accessory Code</th>
                    <th style='width:60%'>Accessory Name</th>
                    <th>Delete</th>
                </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>


        <div class="row" style="margin-top: 20px">
            <div class="col-md-2"></div>
            <div class="col-md-7">
                <div class="row" style="padding-top: 10px">
                    <div class="col-md-4">
                        <button type="button" onclick="runAccessoryAssigningReport()" class="btn btn-primary"
                                style="width: 100%">Print
                        </button>
                    </div>
                    <div class="col-md-4" style="margin-top: 2px">
                        <a class="btn btn-primary" style="width: 100%"
                           href="${root}/category/accessoryAssigning">New</a>
                    </div>
                    <div class="col-md-4">
                        <button type="submit" class="btn btn-primary" style="width: 100%">Save</button>
                    </div>
                </div>
            </div>
            <div class="col-md-3"></div>
        </div>
    </form>
</div>

<input type="hidden" id="pageType" value="${pageType}"/>
<input type="hidden" id="status" value="${status}"/>

<form action="${root}/report/genarateAccessoryAssigning" id="formAccessoryAssigning" target="_blank" method="post">
    <input type="hidden" id="assetId" name="assetId"/>
    <input type="hidden" id="assetDesc" name="assetDesc"/>
</form>

<script type="text/javascript">



    $(function () {
        $('.date').datepicker({
            format: 'dd/mm/yyyy',
            autoclose: true,
            endDate: '+0d'
        });
    });

    $(window).load(function () {
        // Animate loader off screen
        $(".se-pre-con").fadeOut("slow");
    });

    $('.btnSubmit').click(function () {
        $(".se-pre-con").show();
    });

    function runAccessoryAssigningReport() {

        var assetId = $("#assetCode").find("option:selected").val();
        var assetDesc = $("#assetCode").find("option:selected").text();

        if (assetId != "") {
            $("#assetId").val(assetId);
            $("#assetDesc").val(assetDesc);
            $("#formAccessoryAssigning").submit();
        } else {
            swal({
                title: 'Warning',
                text: 'Please select Asset Code !!',
                type: 'warning',
                timer: 3000
            })
        }
    }

    $(function () {
        var status = $("#status").val();
        var pageType = $("#pageType").val();
        if (pageType == 1) {
            if (status == 'true') {
                window.location.href = "./accessoryAssigning";
                swal({
                    title: 'success!',
                    type: 'success',
                    timer: 2000
                })
            } else {
                swal({
                    title: 'Error',
                    text: 'Please try again !!',
                    type: 'error',
                    timer: 2000
                })
            }
        }
    });

    function loadExistingAccessories() {

        $("#accessoryTable").find("tr:not(:first)").remove();
        var assetId = $("#assetCode").find("option:selected").val();

        if (assetId > 0) {
            $.ajax({

                url: '${root}/category/getAccessory/' + assetId,
                success: function (data) {
                    for (var i = 0; i < data.length; i++) {

                        var markup = "<tr >" +
                            " <td><input type='hidden' style='width: 90%' value='" + data[i].accerId + "'>  <input type='text' style='width: 90%' value='" + data[i].accerCode + "'> </td>" +
                            " <td><input type='text'  style='width: 90%' value='" + data[i].accerName + "'></td>" +
                            "<td></td>" +
                            "</tr>";
                        $("table tbody").append(markup);
                    }


                }
            });
        }
        else {
            $("input[name=assetId]").focus();
            swal({
                title: 'Warning',
                text: 'Please select AssetId !!',
                type: 'warning',
                timer: 3000
            })
        }
    }

    function loadAllAccessories() {
        $("#accessoryCode").find("option:not(:first)").remove();
        var assetId = $("#assetCode").find("option:selected").val();
        $.ajax({
            url: '${root}/category/getAllAccessories/'+ assetId,
            success: function (data) {
                for (var i = 0; i < data.length; i++) {
                    $("#accessoryCode").append(
                        "<option value = '" + data[i].accerId + "'>" + data[i].accerCode + "--" + data[i].accerName
                        + "</option>");
                }
            }
        });
    }

    function loadAccessoryTable() {
        var accerId = $("#accessoryCode").find("option:selected").val();
        var accerCode = $("#accessoryCode").find("option:selected").text();
        var array = accerCode.split("--");

        var markup = "<tr><td><input style='width: 90%'type='hidden' name='detailAccessoryId'  value='" + accerId + "'/> <input style='width: 90%'type='text'  value='" + array[0] + "'/> </td><td><input type='text'  style='width: 90%' value='" + array[1] + "'></td><td><a onclick=deleteRow('accessoryTable',this)><i  class=\"fa fa-trash-o fa-3x\"></i></a></td></tr>";
        $("table tbody").append(markup);

        // ********* If I uncomment one of following lines then Save function is not working******
       // $("#accessoryCode").find("option:selected").remove();
       // $("#accessoryCode option[value='" + accerId + "']").remove();

    }

    function deleteRow(tblName, link) {
        var tbl = document.getElementById(tblName);
        var tableRow = link.parentElement.parentElement;
        tbl.deleteRow(tableRow.rowIndex);
    }


</script>