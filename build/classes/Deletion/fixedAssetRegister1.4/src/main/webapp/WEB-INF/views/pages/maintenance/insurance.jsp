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
            <legend>Insurance</legend>
        </div>

        <div class="row">
            <div class="col-md-12">
                <form name="insuranceForm"
                      action="${root}/maintenance/saveInsurance" method="post">

                    <div class="row">
                        <div class="col-md-5">
                            <div class="row">
                                <div class="col-md-4">Asset Code</div>
                                <div class="col-md-8">
                                    <select required id="assetId" class="chosen" style="width: 100%"
                                            onchange="clearFields(),loadTransactionNoList()"
                                            name="assetId">
                                        <option value="">---SELECT---</option>
                                        <c:forEach var="asset" items="${assets}">
                                            <option value="${asset.asId}">${asset.asCode} - ${asset.asDes}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-5">
                            <div class="row">
                                <div class="col-md-4">Policy No.</div>
                                <div class="col-md-8">
                                    <input type="text" required style="width: 100%" id="insurancePolicyNoId"
                                           maxlength="10"
                                           name="insurancePolicyNo"/>
                                </div>
                            </div>

                        </div>
                        <div class="col-md-2"></div>
                    </div>

                    <div class="row">
                        <div class="col-md-5">
                            <div class="row">
                                <div class="col-md-4">Transaction No.</div>
                                <div class="col-md-8">
                                    <select  id="transactionSelectId" class="chosen" style="width: 100%"
                                            onchange="loadInsuranceDetails()"
                                            name="transactionSelect">
                                        <option value="0">---SELECT---</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-5">
                            <div class="row">
                                <div class="col-md-4">Value</div>
                                <div class="col-md-8">
                                    <input type="text" name="insuranceValue" id="insuranceValueId" maxlength="14"
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
                                <div class="col-md-4">Insurance Policy</div>
                                <div class="col-md-8">
                                    <input type="text" name="insurancePolicy" id="insurancePolicyId" maxlength="100"
                                           style="width: 100%"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-5">
                            <div class="row">
                                <div class="col-md-4">Insuranced Company</div>
                                <div class="col-md-8">
                                    <input type="text" required style="width: 100%" id="insuranceCompanyId"
                                           maxlength="100"
                                           name="insuranceCompany"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-2"></div>
                    </div>

                    <div class="row">
                        <div class="col-md-5">
                            <div class="row">
                                <div class="col-md-4">Insurance Period</div>
                                <div class="col-md-8">
                                    <input type="text" required style="width: 100%" id="insurancePeriodId"
                                           maxlength="50"
                                           name="insurancePeriod"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-5">
                            <div class="row">
                                <div class="col-md-4">Agent</div>
                                <div class="col-md-8">
                                    <input type="text" required style="width: 100%" id="insuranceAgentId" maxlength="50"
                                           name="insuranceAgent"/>
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
                                               name="insurancePeriodFrom" id="insurancePeriodFromId"/>
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
                                <div class="col-md-4">Telephone No.</div>
                                <div class="col-md-8">
                                    <input type="text" required style="width: 100%" id="insuranceTelephoneNoId"
                                           maxlength="15"
                                           name="insuranceTelephoneNo"/>
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
                                               name="insurancePeriodTo"/>
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
                                <div class="col-md-4">Address</div>
                                <div class="col-md-8">
                                    <input type="text" required style="width: 100%" id="insuranceAddressId"
                                           maxlength="100"
                                           name="insuranceAddress"/>
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
                                       href="${root}/maintenance/insurance">New</a>
                                </div>
                                <div class="col-md-4" style="margin-top:1px">
                                    <button type="submit" class="btn btn-primary" style="width: 100%" id="save" >Save</button>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-2"></div>
                    </div>
                    <input type="hidden" name="insuranceID" value="0">
                    <input type="hidden" name="transactionNo" id="transactionNo" value="${transactionNo}"
                           style="width: 100%"/>
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
                        window.location.href = "./insurance";
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
            url: '${root}/maintenance/loadInsuranceNoList/' + assetId,
            success: function (data) {
                for (var i = 0; i < data.length; i++) {
                    $("#transactionSelectId").append(
                        "<option value = '" + data[i].insuranceID + "'>" + data[i].transactionNo + "---" + data[i].insurancePolicyNo
                        + "</option>");
                }
            }
        });
    }

    function loadInsuranceDetails() {
        var insuranceId = $("#transactionSelectId").find("option:selected").val();

        $.ajax({
            url: '${root}/maintenance/loadInsuranceDetailsByInsuranceId/' + insuranceId,
            success: function (data) {
                if (data != "") {
                    $("input[name=insuranceID]").val(data.insuranceID);
                    $("input[name=transactionNo]").val(data.transactionNo);
                    $("input[name=insurancePolicyNo]").val(data.insurancePolicyNo);
                    $("input[name=insurancePolicy]").val(data.insurancePolicy);
                    $("input[name=insurancePeriodFrom]").val(dateFormator(data.insurancePeriodFrom));
                    $("input[name=insurancePeriodTo]").val(dateFormator(data.insurancePeriodTo));
                    $("input[name=insurancePeriod]").val(data.insurancePeriod)
                    $("input[name=insuranceValue]").val(data.insuranceValue);
                    $("input[name=insuranceCompany]").val(data.insuranceCompany);
                    $("input[name=insuranceAgent]").val(data.insuranceAgent);
                    $("input[name=insuranceAddress]").val(data.insuranceAddress);
                    $("input[name=insuranceTelephoneNo]").val(data.insuranceTelephoneNo);


                }
            }
        });}


    function clearFields(){

        $("input[name=insurancePolicyNo]").val("");
        $("input[name=insurancePolicy]").val("");
        $("input[name=insurancePeriodFrom]").val("");
        $("input[name=insurancePeriodTo]").val("");
        $("input[name=insurancePeriod]").val("");
        $("input[name=insuranceValue]").val("");
        $("input[name=insuranceCompany]").val("");
        $("input[name=insuranceAgent]").val("");
        $("input[name=insuranceAddress]").val("");
        $("input[name=insuranceTelephoneNo]").val("");


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
