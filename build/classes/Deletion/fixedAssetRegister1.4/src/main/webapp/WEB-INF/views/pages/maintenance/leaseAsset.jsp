<%--
  Created by IntelliJ IDEA.
  User: Dilusha Kumari
  Date: 2019-01-07
  Time: 10:20 AM
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
<div class="row">
    <div class="col-md-12 page">
        <div class="row" style="margin: 0">
            <legend>Lease Asset</legend>
        </div>

        <div class="row">
            <div class="col-md-12">
                <form name="leaseAssetForm" action="${root}/maintenance/saveLeaseAsset" method="post">

                    <div class="row">
                        <div class="col-md-5">
                            <div class="row">
                                <div class="col-md-4">Asset Code</div>
                                <div class="col-md-8">
                                    <select required id="assetId" class="chosen" style="width: 100%"
                                            onchange="clearFields(),loadTransactionNoList()"
                                            name="assetId">
                                        <option value="">---SELECT---</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-5">
                            <div class="row">
                                <div class="col-md-4">Transaction No.</div>
                                <div class="col-md-8">
                                    <select id="transactionSelectId" class="chosen" style="width: 100%"
                                            onchange="loadLeaseAssetDetails()"
                                            name="transactionSelect">
                                        <option value="">---SELECT---</option>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-2"></div>
                    </div>

                    <div class="row">
                        <div class="col-md-5">
                            <div class="row">
                                <div class="col-md-4">Lease Type</div>
                                <div class="col-md-8">
                                    <select name="leaseType" id="leaseTypeId" style="width: 100%">
                                        <option value="0">---SELECT---</option>
                                        <option value="1">Lease</option>
                                        <option value="2">Higher Purchase</option>
                                    </select>
                                </div>
                            </div>

                        </div>
                        <div class="col-md-5">
                            <div class="row">
                                <div class="col-md-4">Period From</div>
                                <div class="col-md-8">
                                    <div class='input-group date' style="width: 100%">
                                        <input type='text' required class="form-control"
                                               name="leasePeriodFrom" id="leasePeriodFromId"/>
                                        <span class="input-group-addon">
                                            <button style=height:25px;width:30px> <i style="font-size:15px;color:#3e71fb" class="fa fa-calendar"></i></button>
                                        <%--<span class="glyphicon glyphicon-calendar"></span>--%>
                                    </span>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="col-md-2"></div>
                    </div>
                    <div class="row">
                        <div class="col-md-5">
                            <div class="row">
                                <div class="col-md-4"> Agreement No.</div>
                                <div class="col-md-8">
                                    <input type="text" name="leaseAgreNo" id="leaseAgreNoId" style="width: 100%"/>
                                </div>
                            </div>

                        </div>
                        <div class="col-md-5">
                            <div class="row">
                                <div class="col-md-4">Period To</div>
                                <div class="col-md-8">
                                    <div class='input-group date' style="width: 100%">
                                        <input type='text' required class="form-control" name="leasePremiumTo"
                                               id="leasePremiumToId"/>
                                        <span class="input-group-addon">
                                            <button style=height:25px;width:30px> <i style="font-size:15px;color:#3e71fb" class="fa fa-calendar"></i></button>
                                        <%--<span class="glyphicon glyphicon-calendar"></span>--%>
                                    </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-2"></div>
                    </div>

                    <div class="row">
                        <div class="col-md-5">
                            <div class="row">
                                <div class="col-md-4">Leased Value</div>
                                <div class="col-md-8">
                                    <input type="text" name="leaseTot" id="leaseTotId"
                                           required
                                           onkeypress="return isNumberOnly(event)"
                                           style="width: 100%"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-5">
                            <div class="row">
                                <div class="col-md-4">Lease Company</div>
                                <div class="col-md-8">
                                    <input type="text" required style="width: 100%" id="leaseCompanyId" maxlength="200"
                                           name="leaseCompany"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-2"></div>
                    </div>
                    <div class="row">
                        <div class="col-md-5">
                            <div class="row">
                                <div class="col-md-4">Premium</div>
                                <div class="col-md-8">
                                    <input type="text" name="leasePremium" id="leasePremiumId"
                                           required
                                           onkeypress="return isNumberOnly(event)"
                                           style="width: 100%"/>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-5">
                            <div class="row">
                                <div class="col-md-4">Contact person</div>
                                <div class="col-md-8">
                                    <input type="text" required style="width: 100%" id="contactPersonId" maxlength="50"
                                           name="contactPerson"/>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-2"></div>
                    </div>

                    <div class="row">
                        <div class="col-md-5">
                            <div class="row">
                                <div class="col-md-4">Premium Date</div>
                                <div class="col-md-8">
                                    <select type="text" name="leasePremiumDate" id="leasePremiumDateId" required
                                            style="width: 100%">
                                        <option value="0">---SELECT---</option>
                                        <option value="1"> 1st</option>
                                        <option value="2"> 2nd</option>
                                        <option value="3"> 3rd</option>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-5">
                            <div class="row">
                                <div class="col-md-4">Address</div>
                                <div class="col-md-8">
                                    <textarea name="leaseAddress" id="leaseAddressId" maxlength="200"
                                              style="width: 100%"></textarea>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-2"></div>
                    </div>
                    <div class="row">
                        <div class="col-md-5">
                            <div class="row">
                                <div class="col-md-4">No. of Installment</div>
                                <div class="col-md-8">
                                    <input type="text" required style="width: 100%" id="leaseNoPremiumId"
                                           name="leaseNoPremium"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-5">
                            <div class="row">
                                <div class="col-md-4">Telephone No.</div>
                                <div class="col-md-8">
                                    <input type="text" required style="width: 100%" id="leaseTelephoneNoId"
                                            maxlength="20" name="leaseTelephoneNo"/>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-2"></div>

                    </div>

                    <div class="row">
                        <div class="col-md-5"></div>
                        <div class="col-md-5">
                            <div class="row" style="padding-top: 10px">
                                <div class="col-md-4"></div>
                                <div class="col-md-4">
                                    <a class="btn btn-primary" style="width: 100%"
                                       href="${root}/maintenance/leaseAsset">New</a>
                                </div>
                                <div class="col-md-4" style="margin-top:-2px">
                                    <button type="submit" class="btn btn-primary" style="width: 100%">Save
                                    </button>
                                </div>

                            </div>
                        </div>
                        <div class="col-md-2"></div>
                    </div>
                    <input type="hidden" name="leaseID"  id="leaseID" value="0">
                    <input type="hidden" name="transactionNo" id="transactionNo" value="${transactionNo}"
                           style="width: 100%"/>
                </form>
            </div>
        </div>
    </div>
</div>

<input type="hidden" id="pageType" value="${pageType}"/>
<input type="hidden" id="status" value="${status}"/>


<script type="text/javascript">

    loadAsset();
    loadPremiumDate();


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
                    window.location.href = "./leaseAsset";
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


    function loadTransactionNoList() {

        var assetId = $("#assetId").find("option:selected").val();

        $("#transactionSelectId").find("option:not(:first)").remove();
        $.ajax({
            url: '${root}/maintenance/loadLeaseAssetNoList/' + assetId,
            success: function (data) {
                for (var i = 0; i < data.length; i++) {
                    $("#transactionSelectId").append(
                        "<option value = '" + data[i].leaseID + "'>" + data[i].transactionNo
                        + "</option>");
                }
            }
        });
    }

    function loadLeaseAssetDetails() {
        var leaseId = $("#transactionSelectId").find("option:selected").val();

        $.ajax({
            url: '${root}/maintenance/loadLeaseAssetDetailsByLeaseId/' + leaseId,
            success: function (data) {
                if (data != "") {
                    $("input[name=leaseID]").val(data.leaseID);
                    $("input[name=transactionNo]").val(data.transactionNo);
                    $("input[name=leaseAgreNo]").val(data.leaseAgreNo);
                    $("input[name=leaseTot]").val(data.leaseTot);
                    $("input[name=leasePeriodFrom]").val(dateFormator(data.leasePeriodFrom));
                    $("input[name=leasePremiumTo]").val(dateFormator(data.leasePremiumTo));
                    $("input[name=leaseNoPremium]").val(data.leaseNoPremium)
                    $("input[name=leasePremiumDate]").val(data.leasePremiumDate);
                    $("input[name=leaseCompany]").val(data.leaseCompany);
                    $("input[name=contactPerson]").val(data.contactPerson);
                    $("textarea[name=leaseAddress]").val("ABC");
                    $("input[name=leaseTelephoneNo]").val(data.leaseTelephoneNo);
                    $("input[name=leasePremium]").val(data.leasePremium);
                    document.getElementById("leaseTypeId").selectedIndex=data.leaseType;
                    document.getElementById("leasePremiumDateId").selectedIndex=data.leasePremiumDate;

                }
            }
        });
    }


    function clearFields() {
        $("input[name=leaseAgreNo]").val("");
        $("input[name=leasePeriodFrom]").val("");
        $("input[name=leasePremiumTo]").val("");
        $("input[name=leaseNoPremium]").val("");
        $("input[name=leasePremiumDate]").val("");
        $("input[name=leaseCompany]").val("");
        $("input[name=contactPerson]").val("");
        $("textarea[name=leaseAddress]").val("");
        $("input[name=leaseTelephoneNo]").val("");
        $("input[name=leasePremium]").val("");
        $("input[name=leaseTot]").val("");
        document.getElementById("leaseTypeId").selectedIndex=0;
        document.getElementById("leasePremiumDateId").selectedIndex=0;

    }


    $(window).load(function () {
        // Animate loader off screen
        $(".se-pre-con").fadeOut("slow");
    });

    $(function () {
        $('.date').datepicker({
            format: 'dd/mm/yyyy',
            autoclose: true
        });
    });

    function loadAsset() {
        $.ajax({
            url: '${root}/maintenance/getAssetByLease/',
            success: function (data) {
                for (var i = 0; i < data.length; i++) {
                    $("#assetId").append(
                        "<option value = '" + data[i][0] + "'>" + data[i][1]
                        + "</option>");
                }
            }
        });

        }

    function loadPremiumDate() {
        for (var i = 4; i < 32; i++) {
            if (i == 31) {
                $("#leasePremiumDateId").append(
                    "<option value = '" + i + "'>" + i + "st"
                    + "</option>");
            }
            else {
                $("#leasePremiumDateId").append(
                    "<option value = '" + i + "'>" + i + "th"
                    + "</option>");
            }
        }

    }

</script>
