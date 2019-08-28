<%--
  Created by IntelliJ IDEA.
  User: Dilusha Kumari
  Date: 1/15/2019
  Time: 3:20 PM
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
<!-- Ends -->
<div class="col-md-6 page">
    <div class="row" style="margin: 0">
        <legend>Teaching Equipment</legend>
    </div>

    <div class="row">
        <div class="col-md-12">
            <form name="teachingEquipmentForm" action="${root}/maintenance/saveTeachingEquipment" method="post">

                <div class="row">
                    <div class="col-md-4">Asset Code</div>
                    <div class="col-md-8">
                        <select class="chosen" id="assetCode" required onchange="loadTeachingEquipmentsDetailsByAsset()"
                                name="assetId" style="width: 100%">
                            <option value="">---SELECT---</option>
                            <c:forEach var="asset" items="${assets}">
                                <option value="${asset.asId}">${asset.asCode} - ${asset.asDes}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-4" style="">Model</div>
                    <div class="col-md-8">
                        <input type="text" required style="width: 100%" id="modelId" name="model" maxlength="50"
                               required/>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4" style="">Width</div>
                    <div class="col-md-8">
                        <input type="text" required style="width: 100%" id="widthId" name="width" maxlength="10"
                                required/>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-4" style="">Length</div>
                    <div class="col-md-8">
                        <input type="text" required style="width: 100%" id="lengthId" name="length" maxlength="6"
                               required/>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-4" style="">Weight</div>
                    <div class="col-md-8">
                        <input type="text" required style="width: 100%" id="weightId" name="weight" maxlength="6"
                               required/>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-4" style="">Height</div>
                    <div class="col-md-8">
                        <input type="text" required style="width: 100%" id="heightId" name="height" maxlength="6"
                                required/>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-4" style="">Warranty</div>
                    <div class="col-md-8">
                        <select class="chosen" id="isWarrantyId" required
                                name="isWarranty"
                                style="width: 100%">
                            <option value="0"> No</option>
                            <option value="1"> Yes</option>
                        </select>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-4" style="">Insurance</div>
                    <div class="col-md-8">
                        <select class="chosen" id="isInsuranceId" required
                                name="isInsurance" style="width: 100%">
                            <option value="0"> No</option>
                            <option value="1"> Yes</option>
                        </select>
                    </div>

                </div>

                <div class="row">
                    <div class="col-md-4" style="">Service Agreement</div>
                    <div class="col-md-8">
                        <select class="chosen" id="isServiceAgreId" required
                                name="isServiceAgre" style="width: 100%">
                            <option value="0"> No</option>
                            <option value="1"> Yes</option>
                        </select>
                    </div>

                </div>

                <div class="row">
                    <div class="col-md-6"></div>
                    <div class="col-md-3" style="margin-top: 2px">
                        <a class="btn btn-primary" style="width: 100%"
                           href="${root}/maintenance/teachingEquipment">New</a>
                    </div>
                    <div class="col-md-3">
                        <button type="submit" class="btn btn-primary" style="width: 100%">Save</button>
                    </div>
                </div>
                <input type="hidden" value="0" name="teachingId">
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

    $(function () {
        var status = $("#status").val();
        var pageType = $("#pageType").val();
        if (pageType == 1) {
            if (status == 'true') {
                window.location.href = "./teachingEquipment";
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

    function loadTeachingEquipmentsDetailsByAsset() {
        var assetId = $("#assetCode").find("option:selected").val();
        $.ajax({
            url: '${root}/maintenance/loadTeachingEquipmentsDetailsByAsset/' + assetId,
            success: function (data) {
                if (data != "") {
                    $("input[name=teachingId]").val(data.teachingId);
                    $("input[name=model]").val(data.model);
                    $("input[name=width]").val(data.width);
                    $("input[name=length]").val(data.length);
                    $("input[name=weight]").val(data.weight);
                    $("input[name=height]").val(data.height);
                    $("input[name=comments]").val(data.comments);
                    document.getElementById("isInsuranceId").selectedIndex = data.isInsurance;
                    document.getElementById("isServiceAgreId").selectedIndex = data.isServiceAgre;
                }else{
                    $("input[name=teachingId]").val("0");
                    $("input[name=model]").val("");
                    $("input[name=width]").val("");
                    $("input[name=length]").val("");
                    $("input[name=weight]").val("");
                    $("input[name=height]").val("");
                    $("input[name=comments]").val("");
                    document.getElementById("isInsuranceId").selectedIndex = 0;
                    document.getElementById("isServiceAgreId").selectedIndex = 0;
                }
            }
        });
    }
</script>