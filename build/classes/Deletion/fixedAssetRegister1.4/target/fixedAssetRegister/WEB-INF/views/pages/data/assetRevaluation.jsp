<%--
  Created by IntelliJ IDEA.
  User: MsD
  Date: 9/28/2017
  Time: 4:17 AM
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
    <form name="assetRevaluationForm"
          action="${root}/data/saveAssetRevaluation" method="post">
        <div class="row" style="margin: 0">
            <legend>Asset Revaluation</legend>
        </div>
        <div class="row">
            <div class="col-md-6">
                <div class="row">
                    <div class="col-md-4">Location Code</div>
                    <div class="col-md-8">
                        <select required id="locCodeId" style="width: 100%" onchange="loadAsset()" name="locationId">
                            <option value="">---SELECT---</option>
                            <c:forEach var="location" items="${locations}">
                                <option value="${location.locId}">${location.locCode}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="row">
                    <div class="col-md-3"></div>
                    <div class="col-md-2">Date</div>
                    <div class="col-md-7">
                        <div class='input-group date' style="width: 100%">
                            <input type='text' onchange="loadExistingVerifications()" required class="form-control"
                                   name="date"/>
                            <span class="input-group-addon">
                                        <span class="glyphicon glyphicon-calendar"></span>
                                    </span>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-2">Asset Code</div>
            <div class="col-md-4">
                <select id="assetId" style="width: 100%" onclick="loadAssetTable()" name="">
                    <option value="">---SELECT---</option>
                </select>
            </div>
            <div class="col-md-6"></div>
        </div>

        <div class="row" style="padding-left: 10px;padding-right: 10px">
            <table id="tblVerification" style="overflow-y: auto" class="responstable" width="100%"
                   cellspacing="0">
                <thead>
                <tr>
                    <th style="width: 130px">Asset Code</th>
                    <th>Description</th>
                    <th style="width: 90px">Computer Balance</th>
                    <th style="width: 100px">Revalue Value</th>
                    <th style="width: 90px">Currency type</th>
                    <th>Remove</th>

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
                        <button type="button" onclick="runAssetRevaluationReport()" class="btn btn-primary"
                                style="width: 100%">Print
                        </button>
                    </div>
                    <div class="col-md-4" style="margin-top: 2px">
                        <a class="btn btn-primary" style="width: 100%" href="${root}/data/assetRevaluation">New</a>
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

<form action="${root}/report/genarateAssetRevaluation" id="formAssetRevaluation" target="_blank" method="post">
    <input type="hidden" id="locationId" name="locationId2"/>
    <input type="hidden" id="locationName" name="locationName"/>
</form>

<script type="text/javascript">

    $(function () {
        $('.date').datepicker({
            format: 'mm/dd/yyyy',
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

    $(document).ready(function () {
        $('#dataTable').DataTable({
            "scrollY": "300px",
            "scrollCollapse": true,
            "paging": false
        });
    });

    function runAssetRevaluationReport() {

        var locCodeId = $("#locCodeId").find("option:selected").val();
        var locCode = $("#locCodeId").find("option:selected").text();
        if (locCodeId != "") {
            $("#locationId").val(locCodeId);
            $("#locationName").val(locCode);
            $("#formAssetRevaluation").submit();
        } else {
            swal({
                title: 'Warning',
                text: 'Please select Location Code !!',
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
                window.location.href = "./assetRevaluation";
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

    function loadAsset() {
        $("#tblVerification").find("tr:not(:first)").remove();
        var locCodeId = $("#locCodeId").find("option:selected").val();
        if (locCodeId > 0) {
            $.ajax({
                url: '${root}/data/getAssetByLocation/' + locCodeId,
                success: function (data) {
                    for (var i = 0; i < data.length; i++) {
                        $("#assetId").append(
                            "<option value = '" + data[i][0] + "'>" + data[i][1]
                            + "</option>");
                    }
                }
            });
        }
    }

    function loadAssetTable() {
        var detaiCatId = $("#assetId").find("option:selected").val();
        var detaiCat = $("#assetId").find("option:selected").text();
        var noOfUnit = $("#assetId").find("option:selected").val();

        var date = $("input[name=date]").val();
        if (date != "") {
            if (detaiCatId > 0) {
                $.ajax({
                    url: '${root}/data/getAssetDetailCat/' + detaiCatId,
                    success: function (data) {
                        var markup = "<tr><td><input type='hidden' name='detailId' value='" + detaiCatId + "'/> <input type='text' readonly style='width: 99%' value='" + detaiCat + "' name='detailCode'></td><td><input type='text' readonly style='width: 99%' value='" + data + "' name='description'></td><td><input type='text' style='width: 99%' name='detailBalance' value='" + noOfUnit + "'></td><td><input type='text' style='width: 99%'  name='detailrevalue' ></td><td><input type='text' style='width: 99%'  name='revalue' ></td><td style='padding-left: 20px'><a onclick=deleteRow('tblVerification',this)><i  class=\"fa fa-trash-o fa-3x\"></i></a></td></tr>";                        $("table tbody").append(markup);
                        $("#assetId option[value='" + detaiCatId + "']").remove();
                    }
                });
            }
        } else {
            $("input[name=date]").focus();
            swal({
                title: 'Warning',
                text: 'Please select Date !!',
                type: 'warning',
                timer: 3000
            })
        }
    }


    function deleteRow(tblName, link) {
        var tbl = document.getElementById(tblName);
        var tableRow = link.parentElement.parentElement;
        tbl.deleteRow(tableRow.rowIndex);
    }

    function loadExistingVerifications() {
        $("#tblVerification").find("tr:not(:first)").remove();
        var date = $("input[name=date]").val();
        var today = formatDate(date);
        $.ajax({
            url: '${root}/data/loadExitsRevaluation/' + today,
            success: function (data) {
                for (var i = 0; i < data.length; i++) {
                    var markup = "<tr><td><input type='hidden' name='detailId' value='" + data[i].detaiCatId + "'/> <input type='text' readonly style='width: 99%' value='" + data[i].detailCode + "' name='detailCode'></td><td><input type='text' readonly style='width: 99%' value='" +  data[i].description + "' name='description'></td><td><input type='text' style='width: 99%' value='"+data[i].balance+"' name='detailBalance'></td><td><input type='text' style='width: 99%' value='"+data[i].revalue+"' name='detailrevalue'></td><td><input type='text' readonly style='width: 99%' value='' name='detailCode'></td><td style='padding-left: 20px'><a onclick=deleteRow('tblVerification',this)><i  class=\"fa fa-trash-o fa-3x\"></i></a></td></tr>";
                    $("table tbody").append(markup);
                }
            }
        });
    }


    //    $('#gridview1 tr:last').find('td:first').html()
    //
    //    function createRow(detaiCat) {
    //        var check = true;
    //      // var table = document.getElementById('tblVerification');
    //        var table = $("#tblVerification table tbody");
    //        table.find('tr').each(function (i, el) {
    //            var tds = $(this).find('td').text();
    //            var productId = tds.eq(0).text();
    //            alert(productId);
    ////            if(productId == detaiCat) {
    ////                check = false;
    ////            }
    //        });
    //        return check;
    //    }


</script>