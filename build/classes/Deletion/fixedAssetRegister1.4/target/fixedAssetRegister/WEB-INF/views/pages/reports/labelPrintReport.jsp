<%--
  Created by IntelliJ IDEA.
  User: MsD
  Date: 10/26/2017
  Time: 6:46 AM
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
<div class="row">
    <div class="col-md-12" style="width: 70%">
        <div class="page">
            <form id="lebelPrintForm" action="${root}/report/genarateLabelPrint" target="_blank" method="post">

                <div class="row" style="margin: 0">
                    <legend>Label Print</legend>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="row">
                            <div class="col-md-4">Department</div>
                            <div class="col-md-8">
                                <select style="width: 99%" id="departmentId" onchange="loadAssets()"
                                        name="depId">
                                    <option value="0">---SELECT---</option>
                                    <c:forEach var="department" items="${departments}">
                                        <option value="${department.depId}">${department.depCode}
                                            - ${department.depDes}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="row">
                            <div class="col-md-4">Detail Code</div>
                            <div class="col-md-8">
                                <select style="width: 99%" id="detailCode" onchange="loadAssets()"
                                        name="detailId">
                                    <option value="0">---SELECT---</option>
                                    <c:forEach var="detail" items="${catergoryDetails}">
                                        <option value="${detail.dcatId}">${detail.dcatCode}
                                            - ${detail.dcatDes}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <div class="row">
                            <div class="col-md-4">From Date</div>
                            <div class="col-md-8">
                                <div class='input-group date'>
                                    <input type='text' class="form-control" value=""
                                           name="fromDate"/>
                                    <span class="input-group-addon">
                                                <span class="glyphicon glyphicon-calendar"></span>
                                                </span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="row">
                            <div class="col-md-4">To Date</div>
                            <div class="col-md-8">
                                <div class='input-group date'>
                                    <input type='text' class="form-control" onchange="loadAssets()" value=""
                                           name="toDate"/>
                                    <span class="input-group-addon">
                                                <span class="glyphicon glyphicon-calendar"></span>
                                                </span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <div class="row">
                            <div class="col-md-4">Assets From</div>
                            <div class="col-md-8">
                                <select style="width: 99%" required id="fromCodeId" name="fromCode">
                                    <option value="">---SELECT---</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="row">
                            <div class="col-md-4">Assets To</div>
                            <div class="col-md-8">
                                <select style="width: 99%" required id="toCodeId" name="toCode">
                                    <option value="">---SELECT---</option>
                                </select>
                            </div>

                        </div>
                    </div>
                </div>

                <div class="row" style="padding-top: 10px">
                    <div class="col-md-6">
                        <div class="row">
                            <div class="col-md-4"></div>
                            <div class="col-md-4">
                                <button type="button" class="btn btn-primary" style="width: 100%">Help</button>
                            </div>

                            <div class="col-md-4">
                                <button type="button" onclick="submitForm()" class="btn btn-primary"
                                        style="width: 100%">
                                    Ok
                                </button>
                            </div>
                            <div class="col-md-2"></div>
                        </div>
                    </div>
                    <div class="col-md-6"></div>
                </div>

            </form>
        </div>
    </div>
</div>
</div>

<input type="hidden" id="pageType" value="${pageType}"/>
<input type="hidden" id="doPreparate" value="${doPreparate}"/>

<script type="text/javascript">
    $(window).load(function () {
        // Animate loader off screen
        $(".se-pre-con").fadeOut("slow");
    });

    $('#btnSubmit').click(function () {
        $(".se-pre-con").show();
    });

    $(function () {
        $('.date').datepicker({
            format: 'mm/dd/yyyy',
            autoclose: true
        });
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
        if (status == 'true') {
            swal({
                title: 'Warning',
                text: 'Please do the Report Preparation!',
                type: 'warning',
                timer: 5000
            })
        }

    });

    function submitForm() {
        $("#lebelPrintForm").submit();
        document.getElementById("departmentId").selectedIndex = 0;
        document.getElementById("detailCode").selectedIndex = 0;
        $("input[name=fromDate]").val("");
        $("input[name=toDate]").val("");
    }


    function loadAssets() {
        var departmentId = 0;
        var detailId = 0;
        var fromDate = "0";
        var toDate = "0";
        $("#fromCodeId").empty();
        $("#toCodeId").empty();
        if (document.getElementById("departmentId").selectedIndex > 0) {
            departmentId = $("#departmentId").find("option:selected").val();
//            document.getElementById("detailCode").selectedIndex = 0;
//            $("input[name=fromDate]").val("");
//            $("input[name=toDate]").val("");
        }
        if (document.getElementById("detailCode").selectedIndex > 0) {
            detailId = $("#detailCode").find("option:selected").val();
//            document.getElementById("departmentId").selectedIndex = 0;
//            $("input[name=fromDate]").val("");
//            $("input[name=toDate]").val("");
        }
        if ($("input[name=fromDate]").val() != '') {
            fromDate = $("input[name=fromDate]").val();
            fromDate = formatDate(fromDate);
//            document.getElementById("departmentId").selectedIndex = 0;
//            document.getElementById("detailCode").selectedIndex = 0;
        }
        if ($("input[name=toDate]").val() != '') {
            toDate = $("input[name=toDate]").val();
            toDate = formatDate(toDate);
//            document.getElementById("departmentId").selectedIndex = 0;
//            document.getElementById("detailCode").selectedIndex = 0;
        }
        $.ajax({
            url: '${root}/data/loadAssetByDepartmentId/' + departmentId + '/' + detailId + '/' + fromDate + '/' + toDate,
            success: function (data) {
                if (data.length > 0) {
                    for (var i = 0; i < data.length; i++) {
                        var sub = data[i];
                        $("#fromCodeId").append(
                            "<option value = '" + sub[0] + "'>" + sub[1] + "</option>");
                        if ((data.length - 1) == i) {
                            $("#toCodeId").append(
                                "<option selected value = '" + sub[0] + "'>" + sub[1] + "</option>");
                        } else {
                            $("#toCodeId").append(
                                "<option value = '" + sub[0] + "'>" + sub[1] + "</option>");
                        }
                    }
                } else {
                    swal({
                        title: 'Warning',
                        text: 'No Assets ! Please Select Other option!',
                        type: 'warning',
                        timer: 4000
                    })
                }
            },
            error: function () {
            }
        });
    }
</script>