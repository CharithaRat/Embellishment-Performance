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
<div class="col-md-12 page">
    <div class="row" style="margin: 0">
        <legend>Computer - Primary Data</legend>
    </div>

    <div class="row">
        <div class="col-md-12">
            <form name="computerForm"
                  action="${root}/maintenance/saveComputer" method="post">

                <div class="row">
                    <div class="col-md-5">
                        <div class="row">
                            <div class="col-md-4">Asset Code</div>
                            <div class="col-md-8">
                                <select class="chosen" id="assetCode" required onchange="loadComputerDetailsByAsset()"
                                        name="assetId" style="width: 100%">
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
                            <div class="col-md-4">Operating System</div>
                            <div class="col-md-8">
                                <input type="text" maxlength="50" required style="width: 100%" id="operatingSystemId"
                                       name="operatingSystem"/>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-2"></div>
                </div>


                <div class="row">
                    <div class="col-md-5">
                        <div class="row">
                            <div class="col-md-4">Computer Type</div>
                            <div class="col-md-8">
                                <input type="text" maxlength="20" required style="width: 100%" id="computerTypeId"
                                       name="computerType"/>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-5">
                        <div class="row">
                            <div class="col-md-4">Battery</div>
                            <div class="col-md-8">
                                <input type="text" maxlength="50" required style="width: 100%" id="batteryId" name="battery"/>
                            </div>
                        </div>
                    </div>
                <div class="col-md-2"></div>
        </div>

        <div class="row">
            <div class="col-md-5">
                <div class="row">
                    <div class="col-md-4">Brand</div>
                    <div class="col-md-8">
                        <input type="text" maxlength="50" required style="width: 100%" id="brandId" name="brand"/>
                    </div>
                </div>
            </div>
            <div class="col-md-5">
                <div class="row">
                    <div class="col-md-4">Buyer Name</div>
                    <div class="col-md-8">
                        <input type="text" maxlength="50" required style="width: 100%" id="buyerId" name="buyer"/>
                    </div>
                </div>
            </div>
            <div class="col-md-2"></div>
        </div>


        <div class="row">
            <div class="col-md-5">
                <div class="row">
                    <div class="col-md-4">Device Name</div>
                    <div class="col-md-8">
                        <input type="text" maxlength="50" required style="width: 100%" id="deviceNameId" name="deviceName"/>
                    </div>
                </div>
            </div>
            <div class="col-md-5">
                <div class="row">
                    <div class="col-md-4">Buyer Address</div>
                    <div class="col-md-8">
                        <input type="text" maxlength="100" required style="width: 100%" id="buyerAddressId"
                               name="buyerAddress"/>
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
                        <input type="text" maxlength="6" required style="width: 100%" id="lengthId" name="length"/>
                    </div>
                </div>
            </div>
            <div class="col-md-5">
                <div class="row">
                    <div class="col-md-4" style="">Buyer Telephone No.</div>
                    <div class="col-md-8">
                        <input type="text" maxlength="20" required style="width: 100%" id="buyerTelId" name="buyerTel"/>
                    </div>
                </div>
            </div>
            <div class="col-md-2"></div>
        </div>


        <div class="row">
            <div class="col-md-5">
                <div class="row">
                    <div class="col-md-4" style="">Width</div>
                    <div class="col-md-8">
                        <input type="text" maxlength="6" required style="width: 100%" id="widthId" name="width"/>
                    </div>
                </div>
            </div>
            <div class="col-md-5">
                <div class="row">
                    <div class="col-md-4" style="">Color</div>
                    <div class="col-md-8">
                        <input type="text" maxlength="20" required style="width: 100%" id="computerColorId"
                               name="computerColor"/>
                    </div>
                </div>
            </div>
            <div class="col-md-2"></div>
        </div>


        <div class="row">
            <div class="col-md-5">
                <div class="row">
                    <div class="col-md-4" style="">Height</div>
                    <div class="col-md-8">
                        <input type="text" maxlength="6"required style="width: 100%" id="heightId" name="height"/>
                    </div>
                </div>
            </div>
            <div class="col-md-5">
                <div class="row">
                    <div class="col-md-4" style="">Processor</div>
                    <div class="col-md-8">
                        <input type="text" maxlength="20" required style="width: 100%" id="processorId" name="processor"/>
                    </div>
                </div>
            </div>
            <div class="col-md-2"></div>
        </div>


        <div class="row">
            <div class="col-md-5">
                <div class="row">
                    <div class="col-md-4" style="">Weight</div>
                    <div class="col-md-8">
                        <input type="text" maxlength="6" required style="width: 100%" id="weightId" name="weight"/>
                    </div>
                </div>
            </div>
            <div class="col-md-5">
                <div class="row">
                    <div class="col-md-4" style="">Adaptor</div>
                    <div class="col-md-8">
                        <input type="text" maxlength="6" required style="width: 100%" id="adapterId" name="adapter"/>
                    </div>
                </div>
            </div>
            <div class="col-md-2"></div>
        </div>


        <div class="row">
            <div class="col-md-5">
                <div class="row">
                    <div class="col-md-4" style="">RAM Size</div>
                    <div class="col-md-8">
                        <input type="text" maxlength="6" required style="width: 100%" id="ramSizeId" name="ramSize"/>
                    </div>
                </div>
            </div>
            <div class="col-md-5">
                <div class="row">
                    <div class="col-md-4" style="">Warranty</div>
                    <div class="col-md-8">
                        <select class="chosen" id="isWarrantyId" required
                                name="isWarranty"
                                style="width: 100%">
                            <option   value="0">No</option>
                            <option  value="1">Yes</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="col-md-2"></div>
        </div>

        <div class="row">
            <div class="col-md-5">
                <div class="row">
                    <div class="col-md-4" style="">Device ID</div>
                    <div class="col-md-8">
                        <input type="text" maxlength="50" required style="width: 100%" id="deviceId" name="deviceId"/>
                    </div>
                </div>
            </div>
            <div class="col-md-5">
                <div class="row">
                    <div class="col-md-4" style="">Insurance</div>
                    <div class="col-md-8">
                        <select class="chosen" id="isInsuranceId" required
                                name="isInsurance" style="width: 100%">
                            <option   value="0">No</option>
                            <option  value="1">Yes</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="col-md-2"></div>
        </div>


                <div class="row">
                    <div class="col-md-5">
                        <div class="row">
                            <div class="col-md-4" style="">Product ID</div>
                            <div class="col-md-8">
                                <input type="text" maxlength="50" required style="width: 100%" id="productId" name="productId"/>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-5">
                        <div class="row">
                            <div class="col-md-4" style="">System Type</div>
                            <div class="col-md-8">
                                <input type="text" maxlength="50" required style="width: 100%" id="systemTypeId" name="systemType"/>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-2"></div>
                </div>

                <div class="row">
                    <div class="col-md-5">
                        <div class="row">
                            <div class="col-md-4" style="">Monitor</div>
                            <div class="col-md-8">
                                <input type="text" maxlength="6" required style="width: 100%" id="monitorId" name="monitor"/>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-5">
                        <div class="row">
                            <div class="col-md-4" style="">HDD</div>
                            <div class="col-md-8">
                                <input type="text" maxlength="6" required style="width: 100%" id="hardDiskCapacityId" name="hardDiskCapacity"/>
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
                    <div class="col-md-4" style="margin-top: 2px">
                        <a class="btn btn-primary" style="width: 100%"
                           href="${root}/maintenance/computer">New</a>
                    </div>
                    <div class="col-md-4">
                        <button type="submit" class="btn btn-primary" style="width: 100%">Save</button>
                    </div>

                </div>
            </div>
            <div class="col-md-2"></div>

        </div>
                <input type="hidden" name="computerId" value="0">
        </form>
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

    $(document).ready(function () {
        $('#dataTable').DataTable({
            "scrollY": "300px",
            "scrollCollapse": true,
            "paging": false
        });
    });

    function loadComputerDetailsByAsset() {
        var assetId = $("#assetCode").find("option:selected").val();

        $.ajax({
            url : '${root}/maintenance/loadComputerDetailsByAsset/' + assetId,
            success : function (data) {
                if(data != "") {
                    $("input[name=computerId]").val(data.computerId);
                    $("input[name=operatingSystem]").val(data.operatingSystem);
                    $("input[name=computerType]").val(data.computerType);
                    $("input[name=battery]").val(data.battery);
                    $("input[name=brand]").val(data.brand);
                    $("input[name=buyer]").val(data.buyer);
                    $("input[name=deviceName]").val(data.deviceName);
                    $("input[name=buyerAddress]").val(data.buyerAddress);
                    $("input[name=length]").val(data.length);
                    $("input[name=buyerTel]").val(data.buyerTel);
                    $("input[name=width]").val(data.width);
                    $("input[name=height]").val(data.height);
                    $("input[name=processor]").val(data.processor);
                    $("input[name=weight]").val(data.weight);
                    $("input[name=adapter]").val(data.adapter);
                    $("input[name=ramSize]").val(data.ramSize);
                    $("input[name=isWarranty]").val(data.isWarranty);
                    $("input[name=deviceId]").val(data.deviceId);
                    $("input[name=isInsurance]").val(data.isInsurance);
                    $("input[name=productId]").val(data.productId);
                    $("input[name=systemType]").val(data.systemType);
                    $("input[name=computerColor]").val(data.computerColor);
                    $("input[name=monitor]").val(data.monitor);
                    $("input[name=hardDiskCapacity]").val(data.hardDiskCapacity);
                }else{
                    $("input[name=computerId]").val("0");
                    $("input[name=operatingSystem]").val("");
                    $("input[name=computerType]").val("");
                    $("input[name=battery]").val("");
                    $("input[name=brand]").val("");
                    $("input[name=buyer]").val("");
                    $("input[name=deviceName]").val("");
                    $("input[name=buyerAddress]").val("");
                    $("input[name=length]").val("");
                    $("input[name=buyerTel]").val("");
                    $("input[name=width]").val("");
                    $("input[name=height]").val("");
                    $("input[name=processor]").val("");
                    $("input[name=weight]").val("");
                    $("input[name=adapter]").val("");
                    $("input[name=ramSize]").val("");
                    $("input[name=isWarranty]").val("");
                    $("input[name=deviceId]").val("");
                    $("input[name=isInsurance]").val("");
                    $("input[name=productId]").val("");
                    $("input[name=systemType]").val("");
                    $("input[name=computerColor]").val("");
                    $("input[name=monitor]").val("");
                    $("input[name=hardDiskCapacity]").val("");
                }
            }
        });

    }

    $(function () {
        var status = $("#status").val();
        var pageType = $("#pageType").val();
        if (pageType == 1) {
            if (status == 'true') {
                window.location.href = "./computer";
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
</script>