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
            <legend>Software</legend>
        </div>

        <div class="row">
            <div class="col-md-12">
                <form name="softwareForm" action="${root}/maintenance/saveSoftware" method="post">

                    <div class="row">
                        <div class="col-md-5">
                            <div class="row">
                                <div class="col-md-4">Asset Code</div>
                                <div class="col-md-8">
                                    <select class="chosen" id="assetCode" required onchange="loadSoftwareDetailsByAsset()"
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
                                <div class="col-md-4">Seller/Dealer</div>
                                <div class="col-md-8">
                                    <input type="text" required style="width: 100%" maxlength="100" id="sellerDealerId"
                                           name="sellerDealer"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-2"></div>
                    </div>


                    <div class="row">
                        <div class="col-md-5">
                            <div class="row">
                                <div class="col-md-4">Seller-Address</div>
                                <div class="col-md-8">
                                    <input type="text" required style="width: 100%" maxlength="200" id="sellerAddId"
                                           name="sellerAdd"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-5">
                            <div class="row">
                                <div class="col-md-4">Owner</div>
                                <div class="col-md-8">
                                    <input type="text" required style="width: 100%" maxlength="100" id="softOwnerNameId"
                                           name="softOwnerName"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-2"></div>
                    </div>

                    <div class="row">
                        <div class="col-md-5">
                            <div class="row">
                                <div class="col-md-4">Product Key</div>
                                <div class="col-md-8">
                                    <input type="text" required style="width: 100%" maxlength="100" id="productKeyId"
                                           name="productKey"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-5">
                            <div class="row">
                                <div class="col-md-4">No. of Users</div>
                                <div class="col-md-8">
                                    <input type="text" required style="width: 100%" maxlength="12" id="noUsersId"
                                           name="noUsers"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-2"></div>
                    </div>


                    <div class="row">
                        <div class="col-md-5">
                            <div class="row">
                                <div class="col-md-4">Service Agreement</div>
                                <div class="col-md-8">
                                    <select id="isServiceAgreId" required
                                            name="isServiceAgre"
                                            style="width: 100%">
                                        <option value="0">No</option>
                                        <option value="1">Yes</option>
                                    </select></div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-5"></div>
                        <div class="col-md-5">
                            <div class="row" style="padding-top: 10px">
                                <div class="col-md-4"></div>
                                <div class="col-md-4">
                                    <a class="btn btn-primary" style="width: 100%"
                                       href="${root}/maintenance/software">New</a>
                                </div>
                                <div class="col-md-4">
                                    <button type="submit" class="btn btn-primary" style="width: 100%">Save
                                    </button>
                                </div>

                            </div>
                        </div>
                        <div class="col-md-2"></div>
                    </div>
                    <input type="hidden" value="0" name="softwareId">
                    <input type="hidden" id="pageType" value="${pageType}"/>
                    <input type="hidden" id="status" value="${status}"/>
                </form>
            </div>
        </div>
    </div>
</div>


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

    $(function () {
        var status = $("#status").val();
        var pageType = $("#pageType").val();
        if (pageType == 1) {
            if (status == 'true') {
                window.location.href = "./software";
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

    function loadSoftwareDetailsByAsset() {
        var assetId = $("#assetCode").find("option:selected").val();
        $.ajax({
            url: '${root}/maintenance/loadSoftwareDetailsByAsset/' + assetId,
            success: function (data) {
                if (data != "") {
                    $("input[name=softwareId]").val(data.softwareId);
                    $("input[name=sellerDealer]").val(data.sellerDealer);
                    $("input[name=sellerAdd]").val(data.sellerAdd);
                    $("input[name=softOwnerName]").val(data.softOwnerName);
                    $("input[name=productKey]").val(data.productKey);
                    $("input[name=noUsers]").val(data.noUsers);
                    $("input[name=comments]").val(data.comments);
                    document.getElementById("isServiceAgreId").selectedIndex = data.isServiceAgre;
                }else{
                    $("input[name=softwareId]").val("0");
                    $("input[name=sellerDealer]").val("");
                    $("input[name=sellerAdd]").val("");
                    $("input[name=softOwnerName]").val("");
                    $("input[name=productKey]").val("");
                    $("input[name=noUsers]").val("");
                    $("input[name=comments]").val("");
                    document.getElementById("isServiceAgreId").selectedIndex = 0;
                }
            }
        });
    }
</script>