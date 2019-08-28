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
            <legend>Motor Vehicles</legend>
        </div>

        <div class="row">
            <div class="col-md-12">
                <form name="vehicleForm" action="${root}/maintenance/saveVehicle" method="post">
                    <div class="row">
                        <div class="col-md-5">
                            <div class="row">
                                <div class="col-md-4">Asset Code</div>
                                <div class="col-md-8">
                                    <select class="chosen" id="assetCode" required
                                            name="assetId" onchange="loadVehicleDetails()"
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
                                <div class="col-md-4">Vehicle Class</div>
                                <div class="col-md-8">
                                    <input type="text" required style="width: 100%" maxlength="50" id="vehicleClassId"
                                           name="vehicleClass"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-2"></div>
                    </div>


                    <div class="row">
                        <div class="col-md-5">
                            <div class="row">
                                <div class="col-md-4">Registration No.</div>
                                <div class="col-md-8">
                                    <input type="text" required style="width: 100%" maxlength="12" id="regiNoId"
                                           name="regiNo"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-5">
                            <div class="row">
                                <div class="col-md-4">Make</div>
                                <div class="col-md-8">
                                    <input type="text" required style="width: 100%" maxlength="20" id="makeId"
                                           name="make"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-2"></div>
                    </div>

                    <div class="row">
                        <div class="col-md-5">
                            <div class="row">
                                <div class="col-md-4">Fuel Type</div>
                                <div class="col-md-8">
                                    <input type="text" required style="width: 100%" maxlength="20" id="typeFuelId"
                                           name="typeFuel"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-5">
                            <div class="row">
                                <div class="col-md-4">Model</div>
                                <div class="col-md-8">
                                    <input type="text" required style="width: 100%" maxlength="50" id="model"
                                           name="model"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-2"></div>
                    </div>


                    <div class="row">
                        <div class="col-md-5">
                            <div class="row">
                                <div class="col-md-4">Country of Origin</div>
                                <div class="col-md-8">
                                    <input type="text" required style="width: 100%" maxlength="50" id="countryOriginId"
                                           name="countryOrigin"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-5">
                            <div class="row">
                                <div class="col-md-4">Year of Manufacture</div>
                                <div class="col-md-8">
                                    <%--<input type='text' required style="width: 100%" maxlength="6"--%>
                                           <%--onkeypress="return isNumberOnly(event)" id="yearManufactuteId"--%>
                                           <%--name="yearManufactute"/>--%>
                                    <%--<input type="number" min="1900" max="2099" step="1" value="2016" />--%>
                                    <input type="number" class="date-own form-control" onkeypress="return isNumberOnly(event)" required maxlength="4"
                                           style="width: 100%; font-size: 14px" type="text" id="yearManufactuteId" min="1900" max="2099"
                                           name="yearManufactute">
                                    <script type="text/javascript">
                                        $('.date-own').datepicker({
                                            minViewMode: 2,
                                            format: 'yyyy'
                                        });
                                    </script>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-2"></div>
                    </div>


                    <!--  <div class="row">
                          <div class="col-md-5">
                              <div class="row">
                                  <div class="col-md-4">Year of Manufacture</div>
                                  <div class="col-md-8">
                                          <input type='text' required style="width: 100%" maxlength="6" onkeypress="return isNumberOnly(event)" id="yearManufactuteId"
                                                 name="yearManufactute"/>
                                      </div>
                                  </div>
                              </div>
                      -->

                    <div class="row">
                        <div class="col-md-5">
                            <div class="row">
                                <div class="col-md-4">Color</div>
                                <div class="col-md-8">
                                    <input type="text" required style="width: 100%" maxlength="20" id="colourId"
                                           name="colour"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-5">
                            <div class="row">
                                <div class="col-md-4">Engine No.</div>
                                <div class="col-md-8">
                                    <input type="text" required style="width: 100%" maxlength="20" id="engineNoId"
                                           name="engineNo"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-2"></div>
                    </div>

                    <div class="row">
                        <div class="col-md-5">
                            <div class="row">
                                <div class="col-md-4">Chassis No.</div>
                                <div class="col-md-8">
                                    <input type="text" required style="width: 100%" maxlength="20" id="chassisNoId"
                                           name="chassisNo"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-5">
                            <div class="row">
                                <div class="col-md-4" style="">Seller Address</div>
                                <div class="col-md-8">
                                    <input type="text" required style="width: 100%" maxlength="100" id="sellerAddressId"
                                           name="sellerAddress"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-2"></div>
                    </div>


                    <div class="row">
                        <div class="col-md-5">
                            <div class="row">
                                <div class="col-md-4" style="">Seller Name</div>
                                <div class="col-md-8">
                                    <input type="text" required style="width: 100%" maxlength="50" id="sellerNameId"
                                           name="sellerName"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-5">
                            <div class="row">
                                <div class="col-md-4" style="">Seller Telephone No.</div>
                                <div class="col-md-8">
                                    <input type="text" required style="width: 100%" maxlength="20"
                                           id="sellerTelephoneNoId"
                                           name="sellerTelephoneNo"/>
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
                                       href="${root}/maintenance/vehicle">New</a>
                                </div>
                                <div class="col-md-4" style="margin-top:-2px">
                                    <button type="submit" class="btn btn-primary" style="width: 100%">Save
                                    </button>
                                </div>

                            </div>
                        </div>
                        <div class="col-md-2"></div>
                    </div>
                    <input type="hidden" value="0" name="vehicleId">
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

    function loadVehicleDetails() {
        var assetId = $("#assetCode").find("option:selected").val();
        $.ajax({
            url : '${root}/maintenance/loadVehicleDetailsByAsset/' + assetId,
            success : function (data) {
                if(data != "") {
                    $("input[name=vehicleId]").val(data.vehicleId);
                    $("input[name=vehicleClass]").val(data.vehicleClass);
                    $("input[name=regiNo]").val(data.regiNo);
                    $("input[name=make]").val(data.make);
                    $("input[name=typeFuel]").val(data.typeFuel);
                    $("input[name=model]").val(data.model);
                    $("input[name=countryOrigin]").val(data.countryOrigin);
                    $("input[name=yearManufactute]").val(data.yearManufactute);
                    $("input[name=colour]").val(data.colour);
                    $("input[name=engineNo]").val(data.engineNo);
                    $("input[name=chassisNo]").val(data.chassisNo);
                    $("input[name=sellerAddress]").val(data.sellerAddress);
                    $("input[name=sellerName]").val(data.sellerName);
                    $("input[name=sellerTelephoneNo]").val(data.sellerTelephoneNo);
                }else{
                    $("input[name=vehicleId]").val("0");
                    $("input[name=vehicleClass]").val("");
                    $("input[name=regiNo]").val("");
                    $("input[name=make]").val("");
                    $("input[name=typeFuel]").val("");
                    $("input[name=model]").val("");
                    $("input[name=countryOrigin]").val("");
                    $("input[name=yearManufactute]").val("");
                    $("input[name=colour]").val("");
                    $("input[name=engineNo]").val("");
                    $("input[name=chassisNo]").val("");
                    $("input[name=sellerAddress]").val("");
                    $("input[name=sellerName]").val("");
                    $("input[name=sellerTelephoneNo]").val("");
                }
            }
        });

    }

    $(function () {
        var status = $("#status").val();
        var pageType = $("#pageType").val();
        if (pageType == 1) {
            if (status == 'true') {
                window.location.href = "./vehicle";
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