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
            <legend>Fixtures And Fitting</legend>
        </div>

        <div class="row">
            <div class="col-md-12">
                <form name="fixturesAndFittingForm" action="${root}/maintenance/saveFixturesAndFitting" method="post">
                    <div class="row">
                        <div class="col-md-5">
                            <div class="row">
                                <div class="col-md-4">Asset Code</div>
                                <div class="col-md-8">
                                    <select class="chosen" id="assetCode" required onchange="loadFixturesAndFittingsDetailsByAsset()"
                                            name="assetId"
                                            style="width: 100%">
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
                                <div class="col-md-4">Weight</div>
                                <div class="col-md-8">
                                    <input type="text" required style="width: 100%" maxlength="6" id="weightId" name="weight"/>
                                </div>
                            </div>

                        </div>
                        <div class="col-md-2"></div>
                    </div>


                    <div class="row">
                        <div class="col-md-5">
                            <div class="row">
                                <div class="col-md-4">Width</div>
                                <div class="col-md-8">
                                    <input type="text" required style="width: 100%" maxlength="6" id="widthId"
                                           name="width"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-5">
                            <div class="row">
                                <div class="col-md-4">Insurance</div>
                                <div class="col-md-8">
                                    <select id="isInsuranceId"
                                            name="isInsurance" style="width: 100%">
                                        <option value="0">No</option>
                                        <option value="1">Yes</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-2"></div>
                    </div>

                    <div class="row">
                        <div class="col-md-5">
                            <div class="row">
                                <div class="col-md-4">Length</div>
                                <div class="col-md-8">
                                    <input type="text" required style="width: 100%" maxlength="6" id="lengthId"
                                           name="length"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-5">
                            <div class="row">
                                <div class="col-md-4">Warranty</div>
                                <div class="col-md-8">
                                    <select id="isWarrantyId" name="isWarranty" style="width: 100%">
                                        <option value="0">No</option>
                                        <option value="1">Yes</option>
                                    </select>
                                </div>
                            </div>
                           </div>

                        <div class="col-md-2"></div>
                    </div>

                    <div class="row">
                        <div class="col-md-5">
                            <div class="row">
                                <div class="col-md-4">Height</div>
                                <div class="col-md-8">
                                    <input type="text" required style="width: 100%" maxlength="6" id="heightId" name="height"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-5"></div>
                        <div class="col-md-2"></div>
                    </div>

                    <div class="row">
                        <div class="col-md-5">

                        </div>
                        <div class="col-md-5"></div>
                        <div class="col-md-2"></div>
                    </div>


                    <div class="row">
                        <div class="col-md-5"></div>
                        <div class="col-md-5">
                            <div class="row" style="padding-top: 10px">
                                <div class="col-md-4"></div>
                                <div class="col-md-4">
                                    <a class="btn btn-primary" style="width: 100%" href="${root}/maintenance/fixturesAndFitting">New</a>
                                </div>
                                <div class="col-md-4" style="margin-top:-2px">
                                    <%--<button type="submit" class="btn btn-primary" style="width: 100%" name="savebtn">Save</button>--%>

                                </div>

                            </div>
                        </div>
                        <div class="col-md-2"></div>
                    </div>
                    <input type="hidden" name="fittingsId" value="0">
                </form>
            </div>
        </div>
    </div>
</div>

<input type="hidden" id="pageType" value="${pageType}"/>
<input type="hidden" id="status" value="${status}"/>

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


    $(function () {
        var status = $("#status").val();
        var pageType = $("#pageType").val();
        if (pageType == 1) {
            if (status == 'true') {
                window.location.href = "./fixturesAndFitting";
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


    function loadFixturesAndFittingsDetailsByAsset() {
        var assetId = $("#assetCode").find("option:selected").val();
        $.ajax({
            url: '${root}/maintenance/loadFixturesAndFittingsDetailsByAsset/' + assetId,
            success: function (data) {
                if (data != "") {
                    $("input[name=fittingsId]").val(data.fittingsId);
                    $("input[name=width]").val(data.width);
                    $("input[name=length]").val(data.length);
                    $("input[name=weight]").val(data.weight);
                    $("input[name=height]").val(data.height);
                    $("input[name=comments]").val(data.comments);
                    document.getElementById("isWarrantyId").selectedIndex = data.isWarranty;
                    document.getElementById("isInsuranceId").selectedIndex = data.isInsurance;
                    // $(" button[name=savebtn]").val("Update");

                } else {
                    $("input[name=fittingsId]").val("0");
                    $("input[name=width]").val("");
                    $("input[name=length]").val("");
                    $("input[name=weight]").val("");
                    $("input[name=height]").val("");
                    $("input[name=comments]").val("");
                    document.getElementById("isWarrantyId").selectedIndex = 0;
                    document.getElementById("isInsuranceId").selectedIndex = 0;
                    // $("button[name=savebtn]").val("Save");

                }
            }
        });
    }
</script>