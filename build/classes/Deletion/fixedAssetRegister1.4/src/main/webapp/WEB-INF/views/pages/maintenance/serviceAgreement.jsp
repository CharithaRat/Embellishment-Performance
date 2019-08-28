<%--
  Created by IntelliJ IDEA.
  User: Hashane
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
            <legend>Service Agreement</legend>
        </div>

        <div class="row">
            <div class="col-md-12">
                <form name="serviceAgreementForm" action="${root}/maintenance/saveServiceAgreement" method="post">

                    <div class="row">
                        <div class="col-md-5">
                            <div class="row">
                                <div class="col-md-4">Asset Code</div>
                                <div class="col-md-8">
                                    <select required id="assetCode" class="chosen" style="width: 100%" onchange="clearFields(),loadTransactionNoList()"
                                            name="assetId">
                                        <option value="0">---SELECT---</option>
                                        <c:forEach var="asset" items="${assets}">
                                            <option value="${asset.asId}">${asset.asCode} - ${asset.asDes}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-5">
                            <div class="row">
                                <div class="col-md-4">Transaction No.</div>
                                <div class="col-md-8">
                                    <select  id="transactionSelectId" class="chosen" style="width: 100%"
                                             onchange="loadServiceAgreementDetails()"
                                             name="transactionSelect">
                                        <option value="0">---SELECT---</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-2"></div>
                    </div>

                    <div class="row">
                        <div class="col-md-5">
                            <div class="row">

                                <div class="col-md-4">Agreement No.</div>
                                <div class="col-md-8">
                                    <input type="text" required style="width: 100%" id="agreeNumberId" maxlength="10"
                                           name="agreeNumber"/>
                                </div>

                            </div>
                        </div>
                        <div class="col-md-5">
                            <div class="row">
                                <div class="col-md-4">Company</div>
                                <div class="col-md-8">
                                    <input type="text" required style="width: 100%" id="companyId" maxlength="100"
                                           name="agreeCompany" />

                                </div>
                            </div>
                        </div>
                        <div class="col-md-2"></div>
                    </div>

                    <div class="row">
                        <div class="col-md-5">
                            <div class="row">
                                <div class="col-md-4">Agreement Period</div>
                                <div class="col-md-8">
                                    <input type="text" required style="width: 100%" id="agreePeriodId" maxlength="10"
                                           name="agreePeriod"/>

                                </div>
                            </div>
                        </div>
                        <div class="col-md-5">
                            <div class="row">
                                <div class="col-md-4">Value of Service Agreement</div>
                                <div class="col-md-8">
                                    <input type="text" name="agreeCost" id="agreeCostId" maxlength="14" required
                                           required onkeypress="return isNumberOnly(event)"
                                           style="width: 100%"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-2"></div>
                    </div>

                    <div class="row">
                        <div class="col-md-5">
                            <div class="row">
                                <div class="col-md-4">Period From</div>
                                <div class="col-md-8">
                                    <div class='input-group date' style="width: 100%">
                                        <input type='text' required class="form-control"
                                               name="agreeFrom" id="agreeFromId"/>
                                        <span class="input-group-addon">
                                            <button style=height:25px;width:30px> <i style="font-size:15px;color:#3e71fb" class="fa fa-calendar"></i></button>
                                        <%--<span class="glyphicon glyphicon-calendar"></span>--%>
                                    </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-5">
                            <div class="row">
                                <div class="col-md-4">Interval of the Service</div>
                                <div class="col-md-8">
                                    <input type="text" required style="width: 100%" id="agreeServiceIntervalId"
                                           maxlength="10"
                                           name="agreeServiceInterval"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-2"></div>
                    </div>
                    <div class="row">
                        <div class="col-md-5">
                            <div class="row">
                                <div class="col-md-4">Period To</div>
                                <div class="col-md-8">
                                    <div class='input-group date' style="width: 100%">
                                        <input type='text' required class="form-control"
                                               name="agreeTo" id="agreeToId"/>
                                        <span class="input-group-addon">
                                            <button style=height:25px;width:30px> <i style="font-size:15px;color:#3e71fb" class="fa fa-calendar"></i></button>
                                        <%--<span class="glyphicon glyphicon-calendar"></span>--%>
                                    </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-5">
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
                                       href="${root}/maintenance/serviceAgreement">New</a>
                                </div>
                                <div class="col-md-4" style="margin-top:1px">
                                    <button type="submit" class="btn btn-primary" style="width: 100%">Save</button>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-2"></div>
                    </div>
                    <input type="hidden" id="agreeId" name="agreeId"  value="0"/>
                    <input type="hidden" id="transactionNo"  name="transactionNo" value="${transactionNo}"/>

                </form>
            </div>
        </div>
    </div>
</div>

<input type="hidden" id="pageType" value="${pageType}"/>
<input type="hidden" id="status" value="${status}"/>
<input type="hidden" id="isEdit" value="${isEdit}"/>


<script type="text/javascript">


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
                    window.location.href = "./serviceAgreement";
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

        var assetId = $("#assetCode").find("option:selected").val();

       $("#transactionSelectId").find("option:not(:first)").remove();
        $.ajax({
            url: '${root}/maintenance/loadServiceAgreeNoList/' + assetId,
            success: function (data) {
                for (var i = 0; i < data.length; i++) {
                    $("#transactionSelectId").append(
                        "<option value = '" + data[i].agreeId + "'>" + data[i].transactionNo
                        + "</option>");
                }
            }
        });
    }

    function loadServiceAgreementDetails() {
        var serviceAgreementId = $("#transactionSelectId").find("option:selected").val();

        $.ajax({
            url: '${root}/maintenance/loadServiceAgreementDetailsByServiceAgreeId/' + serviceAgreementId,
            success: function (data) {
                if (data != "") {
                    $("input[name=agreeId]").val(data.agreeId);
                    $("input[name=transactionNo]").val(data.transactionNo);
                    $("input[name=agreeNumber]").val(data.agreeNumber);
                    $("input[name=agreePeriod]").val(data.agreePeriod);
                    $("input[name=agreeFrom]").val(dateFormator(data.agreeFrom));
                    $("input[name=agreeTo]").val(dateFormator(data.agreeTo));
                    $("input[name=agreeCost]").val(data.agreeCost)
                    $("input[name=agreeCompany]").val(data.agreeCompany);
                    $("input[name=agreeServiceInterval]").val(data.agreeServiceInterval);


                }
            }
        });}


    function clearFields(){

        $("input[name=transactionNo]").val("");
        $("input[name=agreeNumber]").val("");
        $("input[name=agreePeriod]").val("");
        $("input[name=agreeFrom]").val("");
        $("input[name=agreeTo]").val("");
        $("input[name=agreeCost]").val("");
        $("input[name=agreeCompany]").val("");
        $("input[name=agreeServiceInterval]").val("");

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
</script>
