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
            <legend>Office Equipments</legend>
        </div>

        <div class="row">
            <div class="col-md-12">
                <form name="officeEquipmentForm" action="${root}/maintenance/saveOfficeEquipment" method="post">
                    <div class="row">
                        <div class="col-md-5">
                            <div class="row">
                                <div class="col-md-4">Asset Code</div>
                                <div class="col-md-8">
                                    <select class="chosen" id="assetCode" required onchange="loadOfficeEquipmentsDetails() "
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
                                <div class="col-md-4"> Length </div>
                                <div class="col-md-8">
                                    <input type="text" required style="width: 100%" maxlength="6" id="lenghtId"
                                           name="lenght"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-2"></div>
                    </div>


                    <div class="row">
                        <div class="col-md-5">
                            <div class="row">
                                <div class="col-md-4"> Fuel Type </div>
                                <div class="col-md-8">
                                    <input type="text" required style="width: 100%" maxlength="20" id="typeFuelId"
                                           name="typeFuel"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-5">
                            <div class="row">
                                <div class="col-md-4"> Width </div>
                                <div class="col-md-8">
                                    <input type="text" required style="width: 100%" maxlength="6" id="widthId"
                                           name="width"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-2"></div>
                    </div>

                    <div class="row">
                        <div class="col-md-5">
                            <div class="row">
                                <div class="col-md-4"> Make </div>
                                <div class="col-md-8">
                                    <input type="text" required style="width: 100%" maxlength="20" id="makeId"
                                           name="make"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-5">
                            <div class="row">
                                <div class="col-md-4"> Height </div>
                                <div class="col-md-8">
                                    <input type="text" required style="width: 100%" maxlength="6" id="heightId"
                                           name="height"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-2"></div>
                    </div>


                    <div class="row">
                        <div class="col-md-5">
                            <div class="row">
                                <div class="col-md-4"> Country of Origin </div>
                                <div class="col-md-8">
                                    <input type="text" required style="width: 100%" maxlength="50" id="countryOriginId"
                                           name="countryOrigin"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-5">
                            <div class="row">
                                <div class="col-md-4" style="">Warranty</div>
                                <div class="col-md-8">
                                    <select class="chosen" id="isWarrantyId" required
                                            name="isWarranty" style="width: 100%">
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
                                <div class="col-md-4"> Model </div>
                                <div class="col-md-8">
                                    <input type="text" required style="width: 100%" maxlength="50" id="modelId"
                                           name="model"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-5">
                            <div class="row">
                                <div class="col-md-4" style="">Insurance</div>
                                <div class="col-md-8">
                                    <select class="chosen" id="isInsuranceId" required
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
                                <div class="col-md-4"> Year of Manufacture </div>
                                <div class="col-md-8">
                                    <%--<input type="text" required style="width: 100%" maxlength="6" onkeypress="return isNumberOnly(event)" id="yearManufactureId"--%>
                                           <%--name="yearManufacture"/>--%>
                                    <input type="number" class="date-own form-control" onkeypress="return isNumberOnly(event)" required maxlength="4"
                                           style="width: 100%; font-size: 14px" type="text" id="yearManufactureId" min="1900" max="2099"
                                           name="yearManufacture">
                                    <script type="text/javascript">
                                        $('.date-own').datepicker({
                                            minViewMode: 2,
                                            format: 'yyyy'
                                        });
                                    </script>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-5">
                            <div class="row">
                                <div class="col-md-4" style="">Service Agreement</div>
                                <div class="col-md-8">
                                    <select class="chosen" id="isServiceAgreId" required name="isServiceAgre" style="width: 100%">
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
                                <div class="col-md-4"> Weight </div>
                                <div class="col-md-8">
                                    <input type="text" required style="width: 100%" maxlength="6" id="weightId"
                                           name="weight"/>
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
                                       href="${root}/maintenance/officeEquipment">New</a>
                                </div>
                                <div class="col-md-4" style="margin-top:-2px">
                                    <button type="submit" class="btn btn-primary" style="width: 100%">Save
                                    </button>
                                </div>

                            </div>
                        </div>
                        <div class="col-md-2"></div>
                    </div>
                    <input type="hidden" name="officeEquipmentsId" value="0">
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
            format: 'dd/mm/yyyy',
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
                window.location.href = "./officeEquipment";
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
    function loadOfficeEquipmentsDetails() {
        var assetId = $("#assetCode").find("option:selected").val();

        $.ajax({
            url : '${root}/maintenance/loadOfficeEquipmentsDetailsByAsset/' + assetId,
            success : function (data) {
                if(data != "") {
                    $("input[name=officeEquipmentsId]").val(data.officeEquipmentsId);
                    $("input[name=typeFuel]").val(data.typeFuel);
                    $("input[name=make]").val(data.make);
                    $("input[name=countryOrigin]").val(data.countryOrigin);
                    $("input[name=model]").val(data.model)
                    $("input[name=yearManufacture]").val(data.yearManufacture)
                    $("input[name=width]").val(data.width);
                    $("input[name=lenght]").val(data.lenght);
                    $("input[name=weight]").val(data.weight);
                    $("input[name=height]").val(data.height);
                    document.getElementById("isWarrantyId").selectedIndex= data.isWarranty;
                    document.getElementById("isInsuranceId").selectedIndex= data.isInsurance;
                    document.getElementById("isServiceAgreId").selectedIndex= data.isServiceAgre;
                } else {
                    $("input[name=officeEquipmentsId]").val("0");
                    $("input[name=typeFuel]").val("");
                    $("input[name=make]").val("");
                    $("input[name=countryOrigin]").val("");
                    $("input[name=model]").val("");
                    $("input[name=yearManufacture]").val("");
                    $("input[name=width]").val("");
                    $("input[name=lenght]").val("");
                    $("input[name=weight]").val("");
                    $("input[name=height]").val("");
                    document.getElementById("isWarrantyId").selectedIndex= 0;
                    document.getElementById("isInsuranceId").selectedIndex= 0;
                    document.getElementById("isServiceAgreId").selectedIndex= 0;
                }
            }
        });

    }
</script>