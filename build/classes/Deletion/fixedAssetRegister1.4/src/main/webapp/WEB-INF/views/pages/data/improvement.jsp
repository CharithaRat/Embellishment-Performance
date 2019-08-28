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
<div class="row">
    <div class="col-md-6">
        <div class="page">
            <form name="improvementForm"
                  action="${root}/data/saveImprovement" method="post">

                <div class="row" style="margin: 0 ; ">
                    <legend>Asset Improvement</legend>
                </div>


                <input type="hidden" name="assetImpId" value="${imp.assetImpId}"/>
                <div class="row">

                    <div class="col-md-12">
                        <div class="row">
                            <div class="col-md-4">Asset Code</div>
                            <div class="col-md-6">
                                <select class="chosen" id="assetCodeId" required name="asset.asId" style=" width:100%; text-align:center" onchange="loadTransactionNoList()" >
                                    <option value="">---SELECT---</option>
                                    <c:forEach var="asset" items="${assets}">
                                        <c:if test="${asset.asId == imp.asset.asId}">
                                            <option selected value="${asset.asId}">${asset.asCode}</option>
                                        </c:if>
                                        <option value="${asset.asId}">${asset.asCode} - ${asset.asDes}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="col-md-2"></div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">Transaction No.</div>
                            <div class="col-md-6">
                                <select  id="transactionSelectId" style="width: 100%"
                                         onchange="loadImprovementsDetails()"
                                         name="transactionSelect">
                                    <option value="">---SELECT---</option>
                                </select>
                            </div>
                            <div class="col-md-2"></div>

                        </div>

                        <div class="row">
                            <div class="col-md-4">Description</div>
                            <div class="col-md-6">
                                <textarea type="text" required maxlength="100" name="description"
                                          style="width: 100%">${imp.description}</textarea>

                            </div>
                            <div class="col-md-2"></div>
                        </div>

                        <div class="row">
                            <div class="col-md-4" style="">Currency Type</div>
                            <div class="col-md-6"><select id="currencyId" required class="select_style"
                                                          name="currencyType" style="width: 100%">
                                <option value="0">---SELECT---</option>
                                <c:forEach items="${currencyTypes}" var="currencyType">
                                    <option value="${currencyType.currencyId}">${currencyType.currencyCode}</option>
                                </c:forEach>
                            </select>
                            </div>
                            <div class="col-md-2"></div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">Value</div>
                            <div class="col-md-6">
                                <input type="text" onkeyup="isNumber(this)" maxlength="16" value="${imp.currencyValue}" required
                                       name="currencyValue"
                                       style="width: 100%"/>
                            </div>
                            <div class="col-md-2"></div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">Date</div>
                            <div class="col-md-6">
                                <div class='input-group date'>
                                    <input type='text' onchange="checkImprovementDate()" required class="form-control"
                                           value="<fmt:formatDate pattern = "yyyy/MM/dd"
                                            value = "${imp.impDate}" />" name="impDate"/>
                                    <span class="input-group-addon">
                                        <button style=height:25px;width:30px> <i style="font-size:15px;color:#3e71fb" class="fa fa-calendar"></i></button>
                                        <%--<span class="glyphicon glyphicon-calendar"></span>--%>
                                    </span>
                                </div>
                            </div>
                            <div class="col-md-2"></div>
                        </div>
                        <div class="row">
                            <div class="col-md-4"></div>
                            <div class="col-md-8">
                                <div class="row">
                                    <div class="col-md-3">
                                        <button type="button" class="btn btn-primary" style="width: 100%">Help</button>
                                    </div>
                                    <div class="col-md-3">
                                        <a class="btn btn-primary" style="width: 100%;margin-top: 3px"
                                           href="${root}/data/improvements">New</a>
                                    </div>
                                    <div class="col-md-3">
                                        <c:choose>
                                            <c:when test="${imp.assetImpId > 0 }">
                                                <button type="submit" class="btn btn-primary" style="width: 100%">
                                                    Update
                                                </button>
                                            </c:when>
                                            <c:otherwise>
                                                <button type="submit" class="btn btn-primary" style="width: 100%">Save
                                                </button>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                    <div class="col-md-3"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <input type="hidden" name="assetImpId" id="assetImpId" value="0">
                <input type="hidden" name="transactionNo" id="transactionNo" value="${transactionNo}"/>
            </form>
        </div>
    </div>
    <div class="col-md-5">
        <table id="dataTable" class="display compact" width="100%" cellspacing="0">
            <thead>
            <tr>
                <th>Asset Code</th>
                <th>Description</th>
                <th>Value</th>
                <th>Edit</th>
                <th>Delete</th>

            </tr>
            </thead>

            <tbody>
            <c:forEach var="assetImprovements" items="${imps}">
                <tr id="${assetImprovements.assetImpId}">
                    <td>${assetImprovements.asset.asCode}</td>
                    <td>${assetImprovements.description}</td>
                    <td>${assetImprovements.value}</td>
                    <td><a href="${root}/data/editImprovement/${assetImprovements.assetImpId}"><i
                            class="fa fa-pencil-square-o"></i></a></td>
                    <td><a onclick="onDelete(this)"><i class="fa fa-trash-o"></i></a></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<input type="hidden" id="pageType" value="${pageType}"/>
<input type="hidden" id="status" value="${status}"/>
<input type="hidden" id="isRate" value="${isRate}"/>

<script type="text/javascript">
    $(".chosen").chosen();
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
        $('.date').datepicker({
            format: 'dd/mm/yyyy',
            autoclose: true
        });
    });


    $(function () {
        var isRate = $("#isRate").val();
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
                    title: message+transactionNo,
                    type: 'success',

                }).then(function () {
                    window.location.href = "./improvements";})
            }else if (isRate == 'false') {
                    swal({
                        title: 'Error',
                        text: 'Please Update Currency Rate in improvements Date !!',
                        type: 'error',

                    })
            } else {
                swal({
                    title: 'Error !',
                    text: 'Improvement Added Fail !!',
                    type: 'error',

                })
            }
        }

    });

    function checkImprovementDate() {
        var dat = $("input[name=impDate]").val();
        var assetId = $("#assetCodeId").find("option:selected").val();
        if (dat != "" && assetId > 0) {
            var date = formatDate(dat);
            $.ajax({
                url: '${root}/data/checkImprovementDate',
                data: {date: date, assetId: assetId},
                success: function (data) {
                    if (data > 0) {
                        var msg;
                        switch (data) {
                            case 1:
                                msg = "Please change Transfers date";
                                break;
                            case 2:
                                msg = "Please select date, after the Asset purchase or register date";
                                break;
                            case 3 :
                                msg = "Please select date, after the Asset transfer date";
                        }
                        swal({
                            title: 'Warning',
                            text: msg,
                            type: 'warning'
                        })
                        $("input[name=impDate]").val("");
                    }

                }

            });
        }
    }


    function onDelete(id) {
        var trId = $(id).closest('tr').attr('id');
        swal({
            title: 'Are you sure?',
            text: "You won't be able to revert this!",
            type: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Yes, delete it!'
        }).then(function () {
            $.ajax({
                url: '${root}/data/deleteImprovement/' + trId,
                success: function (data) {
                    if (data == 1) {
                        swal(
                            'Deleted!',
                            'Your file has been deleted.',
                            'success'
                        )
                        var row = id.parentNode.parentNode;
                        row.parentNode.removeChild(row);
                    } else if (data == 2) {
                        swal(
                            'Sorry!',
                            'Asset Improvement already used !!',
                            'warning'
                        )
                    } else {
                        swal(
                            'Sorry!',
                            'Can\'t Delete Asset !!',
                            'warning'
                        )
                    }
                }
            });
        })
    }

    function loadTransactionNoList() {

        var assetId = $("#assetCodeId").find("option:selected").val();
        $("#transactionSelectId").find("option:not(:first)").remove();
        $.ajax({
            url: '${root}/data/loadImprovementNoList/' + assetId,
            success: function (data) {

                for (var i = 0; i < data.length; i++) {
                    $("#transactionSelectId").append(
                        "<option value = '" + data[i][0]+ "'>" + data[i][1]
                        + "</option>");
                }
            }
        });
    }
    function loadImprovementsDetails() {
        var improvementId = $("#transactionSelectId").find("option:selected").val();

        $.ajax({
            url: '${root}/data/loadImprovementDetailsByImprovementId/' + improvementId,
            success: function (data) {

                if (data != "") {
                    $("input[name=assetImpId]").val(data[0][0]);
                    $("input[name=transactionNo]").val(data[0][1]);
                    $("input[name=impDate]").val(dateFormator(data[0][2]));
                    $("input[name=currencyValue]").val(data[0][3]);
                    $("textarea[name=description]").val(data[0][4]);
                    document.getElementById("currencyId").selectedIndex= data[0][5];

                }
            }
        });}


</script>