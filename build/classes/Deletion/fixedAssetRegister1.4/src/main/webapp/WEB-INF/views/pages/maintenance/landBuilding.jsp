<%--
  Created by IntelliJ IDEA.
  User: Hashane
  Date: 2019-01-08
  Time: 11:44 AM
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

<div class="se-pre-con"></div>
<div class="row">
    <div class="col-md-12 page">
        <form name="landBuildingForm" action="${root}/maintenance/saveLandBuilding" method="POST">

            <ul class="nav nav-tabs" id="myTab" role="tablist">
                <li class="nav-item">
                    <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab"
                       aria-controls="home" aria-selected="true">Land & Building - Primary Data</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab"
                       aria-controls="profile" aria-selected="false">Land & Building - Secondary Data</a>
                </li>
            </ul>

            <div class="tab-content" id="myTabContent">
                <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                    <div class="row">
                        <div class="col-md-5">
                            <div class="row">
                                <div class="col-md-4">Asset Code</div>
                                <div class="col-md-8">
                                    <select class="chosen" id="assetCodeId" required
                                            name="assetId" onchange="loadLandBuildingDetails()" style="width: 100%">
                                        <option value="">---SELECT---</option>
                                        <c:forEach var="asset" items="${assets}">
                                            <option value="${asset.asId}">${asset.asCode} - ${asset.asDes}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-5">
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-5">
                            <div class="row" style="margin: 0">
                                <legend>Deed Information</legend>
                            </div>
                        </div>
                        <div class="col-md-5">
                            <div class="row" style="margin: 0">
                                <legend>Location Address</legend>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-5">
                            <div class="row">
                                <div class="col-md-4">Deed Type</div>
                                <div class="col-md-8">
                                    <%--<input type="text" required style="width: 100%" id="deedTypeId" maxlength="20" name="deedType"/>--%>
                                        <select class="chosen" required  style="width: 100%" id="deedTypeId" name="deedType">
                                            <option  value="0"> ---SELECT--- </option>
                                            <option   value="1">Mortgage</option>
                                            <option  value="2">Transfer</option>
                                            <option  value="3">Gift</option>
                                            <option  value="4">Other</option>
                                        </select>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-5">
                            <div class="row">
                                <div class="col-md-4" style="">Address Line 1</div>
                                <div class="col-md-8">
                                    <input type="text" required style="width: 100%" maxlength="20"id="buildingAddress1Id"
                                           name="buildingAddress1"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-2"></div>
                    </div>


                    <div class="row">
                        <div class="col-md-5">
                            <div class="row">
                                <div class="col-md-4">Deed No.</div>
                                <div class="col-md-8">
                                    <input type="text" required style="width: 100%" id="deedNoId" maxlength="6" name="deedNo"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-5">
                            <div class="row">
                                <div class="col-md-4" style="">Address Line 2</div>
                                <div class="col-md-8">
                                    <input type="text" required style="width: 100%" maxlength="20" id="buildingAddress2Id"
                                           name="buildingAddress2"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-2"></div>
                    </div>

                    <div class="row">
                        <div class="col-md-5">
                            <div class="row">
                                <div class="col-md-4">Deed Signed Date</div>
                                <div class="col-md-8">
                                    <div class='input-group date' id='datetimepicker1' style="width: 100%">
                                        <input type='text' required class="form-control"
                                               name="deedSignedDate"/>
                                        <span class="input-group-addon">
                                            <button style=height:25px;width:30px> <i style="font-size:15px;color:#3e71fb" class="fa fa-calendar"></i></button>
                                        <%--<span class="glyphicon glyphicon-calendar"></span>--%>
                                    </span>
                                    </div>
                                </div>
                            </div>
                            <script type="text/javascript">
                                $(function () {
                                    $('#datetimepicker1').datepicker({
                                        // viewMode: 'years',
                                        format: 'dd/mm/yyyy',
                                        autoclose: true
                                    });
                                });
                            </script>
                        </div>
                        <div class="col-md-5">
                            <div class="row">
                                <div class="col-md-4" style="">Address Line 3</div>
                                <div class="col-md-8">
                                    <input type="text" required style="width: 100%" maxlength="20" id="buildingAddress3Id"
                                           name="buildingAddress3"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-2"></div>
                    </div>

                    <div class="row">
                        <div class="col-md-5">
                            <div class="row">
                                <div class="col-md-4">Deed Registered Date</div>
                                <div class="col-md-8">
                                    <div class='input-group date' style="width: 100%">
                                        <input type='text' required class="form-control"
                                               name="deedRegisterDate"/>
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
                                <div class="col-md-4" style="">Address Line 4</div>
                                <div class="col-md-8">
                                    <input type="text" required style="width: 100%" maxlength="20" id="buildingAddress4Id"
                                           name="buildingAddress4"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-2"></div>
                    </div>

                    <div class="row">
                        <div class="col-md-5">
                            <div class="row">
                                <div class="col-md-4">Value of the Building</div>
                                <div class="col-md-8">
                                    <input type="text" required style="width: 100%" id="deedValueId" maxlength="14" onkeypress="return isNumberOnly(event)" name="deedValue"/>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-5">
                            <div class="row">
                                <div class="col-md-4">Extent</div>
                                <div class="col-md-8">
                                    <input type="text" required style="width: 100%" id="extentId" maxlength="20" name="extent"/>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                    <div class="row">
                        <div class="col-md-5">
                            <div class="row">
                                <div class="col-md-4">No. of Stories</div>
                                <div class="col-md-8">
                                    <input type="text" style="width: 100%" maxlength="3" onkeypress="return isNumberOnly(event)"  id="buildingStoriedId"
                                           name="buildingStoried"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-5">
                            <div class="row">
                                <div class="col-md-4" style="">Assesment No.</div>
                                <div class="col-md-8">
                                    <input type="text" assessmentNo style="width: 100%" maxlength="6" id="assessmentNoId"
                                           name="assessmentNo"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-2"></div>
                    </div>


                    <div class="row">
                        <div class="col-md-5">
                            <div class="row">
                                <div class="col-md-4">Plan No.</div>
                                <div class="col-md-8">
                                    <input type="text"  style="width: 100%" maxlength="6" id="buildingPlanNoId"
                                           name="buildingPlanNo"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-5">
                            <div class="row">
                                <div class="col-md-4" style="">Assesment Value</div>
                                <div class="col-md-8">
                                    <input type="text"  style="width: 100%" maxlength="14" onkeypress="return isNumberOnly(event)" id="assessementValueId"
                                           name="assessementValue"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-2"></div>
                    </div>


                    <div class="row">
                        <div class="col-md-5">
                            <div class="row">
                                <div class="col-md-4">C.O.C No.</div>
                                <div class="col-md-8">
                                    <input type="text"  style="width: 100%" maxlength="6" id="cocNoId" name="cocNo"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-5">
                            <div class="row">
                                <div class="col-md-4">Attester of Deed</div>
                                <div class="col-md-8">
                                    <input type="text"  style="width: 100%" maxlength="100" id="attesterId" name="attester"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-2"></div>
                    </div>


                    <div class="row">
                        <div class="col-md-5">
                            <div class="row">
                                <div class="col-md-4">Lot No.</div>
                                <div class="col-md-8">
                                    <input type="text"  style="width: 100%" maxlength="6"  id="lotNoId" name="lotNo"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-5">
                            <div class="row">
                                <div class="col-md-4">Address of Attester</div>
                                <div class="col-md-8">
                                    <input type="text"  style="width: 100%" maxlength="200" id="attesterAddressId" name="attesterAddress"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-2"></div>
                    </div>

                    <div class="row">
                        <div class="col-md-5">
                            <div class="row">
                                <div class="col-md-4">Insuarance</div>
                                <div class="col-md-8">
                                    <select id="isInsuranceId"
                                            name="isInsurance" style="width: 100%">
                                        <option value="1">Yes</option>
                                        <option value="0">No</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-5">
                            <div class="row">
                                <div class="col-md-4">Name of the Seller</div>
                                <div class="col-md-8">
                                    <input type="text"  style="width: 100%" maxlength="100" id="sellerNameId" name="sellerName"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-2"></div>
                    </div>

                    <div class="row">
                        <div class="col-md-5">
                        </div>
                        <div class="col-md-5">
                            <div class="row">
                                <div class="col-md-4">Address of the Seller</div>
                                <div class="col-md-8">
                                    <input type="text"  style="width: 100%" maxlength="100" id="sellerAddressId" name="sellerAddress"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-2"></div>
                    </div>


                    <div class="row">
                        <div class="col-md-5">
                            <div class="row" style="margin: 0">
                                <legend>Survey Details</legend>
                            </div>
                        </div>
                        <div class="col-md-5">
                            <div class="row" style="margin: 0">
                                <legend>Location</legend>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-5">
                            <div class="row">
                                <div class="col-md-4">Survey Plan No.</div>
                                <div class="col-md-8">
                                    <input type="text"  style="width: 100%"  maxlength="6"  id="surveyPlanNoId"
                                           name="surveyPlanNo"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-5">
                            <div class="row">
                                <div class="col-md-4" style="">Building - Name</div>
                                <div class="col-md-8">
                                    <input type="text"  style="width: 100%" maxlength="100"  id="landNameId" name="landName"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-2"></div>
                    </div>


                    <div class="row">
                        <div class="col-md-5">
                            <div class="row">
                                <div class="col-md-4">Survey Name</div>
                                <div class="col-md-8">
                                    <input type="text"  style="width: 100%"  maxlength="100" id="surveyNameId"
                                           name="surveyName"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-5">
                            <div class="row">
                                <div class="col-md-4" style="">Situated</div>
                                <div class="col-md-8">
                                    <input type="text"  style="width: 100%"  maxlength="100"  id="landSituatedId"
                                           name="landSituated"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-2"></div>
                    </div>

                    <div class="row">
                        <div class="col-md-5">
                            <div class="row">
                                <div class="col-md-4">Survey Address</div>
                                <div class="col-md-8">
                                    <input type="text"  style="width: 100%"  maxlength="200"  id="surveyAddressId"
                                           name="surveyAddress"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-5">
                            <div class="row">
                                <div class="col-md-4" style="">Provincial Area</div>
                                <div class="col-md-8">
                                    <input type="text"  style="width: 100%"  maxlength="100"  id="landProvincalAreaId"
                                           name="landProvincalArea"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-2"></div>
                    </div>


                    <div class="row">
                        <div class="col-md-5">
                            <div class="row">
                                <div class="col-md-4">Survey Telephone</div>
                                <div class="col-md-8">
                                    <input type="text"  style="width: 100%"  maxlength="20"   id="surveyTelephoneId"
                                           name="surveyTelephone"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-5">
                            <div class="row">
                                <div class="col-md-4" style="">Grama Niladari Division No.</div>
                                <div class="col-md-8">
                                    <input type="text"  style="width: 100%"  maxlength="6"  id="graNilDivNoId"
                                           name="graNilDivNo"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-2"></div>
                    </div>


                    <div class="row">
                        <div class="col-md-5">
                            <div class="row">
                                <div class="col-md-4">Date Of Survey</div>
                                <div class="col-md-8">
                                    <div class='input-group date'  style="width: 100%">
                                        <input type='text'  class="form-control"
                                               name="surveyDate"/>
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
                                <div class="col-md-4" style="">Division No.</div>
                                <div class="col-md-8">
                                    <input type="text"  style="width: 100%"  maxlength="6"  id="divisionNoId"
                                           name="divisionNo"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-2"></div>
                    </div>


                    <div class="row">
                        <div class="col-md-5">

                        </div>
                        <div class="col-md-5">
                            <div class="row">
                                <div class="col-md-4" style="">District</div>
                                <div class="col-md-8">
                                    <input type="text"  style="width: 100%"  maxlength="100"  id="landDistrictId"
                                           name="landDistrict"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-2"></div>
                    </div>


                    <div class="row">
                        <div class="col-md-5">

                        </div>
                        <div class="col-md-5">
                            <div class="row">
                                <div class="col-md-4" style="">Province</div>
                                <div class="col-md-8">
                                    <input type="text"  style="width: 100%"  maxlength="100"  id="landProvinceId"
                                           name="landProvince"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-2"></div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-5"></div>
                <div class="col-md-5">
                    <div class="row" style="padding-top: 10px">
                        <div class="col-md-2"></div>
                        <div class="col-md-5" style="margin-top: 2px">
                            <a class="btn btn-primary" style="width: 100%" href="${root}/maintenance/landBuilding">New</a>
                        </div>
                        <div class="col-md-5">
                            <button type="submit" id="btnSubmit" class="btn btn-primary" style="width: 100%">Save
                            </button>
                        </div>
                    </div>
                </div>
                <div class="col-md-2"></div>
            </div>
            <input type="hidden" name="landBuildingID" value="0">
        </form>
    </div>
</div>
<input type="hidden" id="pageType" value="${pageType}"/>
<input type="hidden" id="status" value="${status}"/>
<input type="hidden" id="isEdit" value="${isEdit}"/>

<script type="text/javascript">
    $(function () {
        var status = $("#status").val();
        var pageType = $("#pageType").val();
// var isEdit = $("#isEdit").val();
// if (isEdit == 1) {
// $('#comCode').prop('readonly', true);
// }
        if (pageType == 1) {
            if (status == 'true') {
                window.location.href = "./landBuilding";
                swal({
                    title: 'success!',
                    type: 'success',
                    timer: 2000
                })
            } else {
                swal({
                    title: 'Error !',
                    text: 'Land And Building Added Fail !!',
                    type: 'error',
                    timer: 2000
                })
            }
        }

    });

    function loadLandBuildingDetails() {
        var assetId = $("#assetCodeId").find("option:selected").val();
        $.ajax({
            url : '${root}/maintenance/loadLandBuildingDetailsByAsset/' + assetId,
            success : function (data) {
                if(data != "") {
                    document.getElementById("deedTypeId").selectedIndex= data.deedType;
                    $("input[name=landBuildingID]").val(data.landBuildingID);
                    // $("input[name=deedType]").val(data.deedType);
                    $("input[name=deedNo]").val(data.deedNo);
                    $("input[name=deedSignedDate]").val(dateFormator(data.deedSignedDate));
                    $("input[name=deedRegisterDate]").val(dateFormator(data.deedRegisterDate));
                    $("input[name=buildingAddress1]").val(data.buildingAddress1);
                    $("input[name=buildingAddress2]").val(data.buildingAddress2);
                    $("input[name=buildingAddress3]").val(data.buildingAddress3);
                    $("input[name=buildingAddress4]").val(data.buildingAddress4);
                    $("input[name=deedValue]").val(data.deedValue);
                    $("input[name=extent]").val(data.extent);
                    $("input[name=comments]").val(data.comments);
                    $("input[name=attester]").val(data.attester);
                    $("input[name=attesterAddress]").val(data.attesterAddress);
                    $("input[name=seller]").val(data.seller);
                    $("input[name=sellerAddress]").val(data.sellerAddress);
                    $("input[name=graNilDivNo]").val(data.graNilDivNo);
                    $("input[name=divisionNo]").val(data.divisionNo);
                    $("input[name=assessmentNo]").val(data.assessmentNo);
                    $("input[name=assessementValue]").val(data.assessementValue);
                    $("input[name=surveyPlanNo]").val(data.surveyPlanNo);
                    $("input[name=surveyName]").val(data.surveyName);
                    $("input[name=surveyAddress]").val(data.surveyAddress);
                    $("input[name=surveyTelephone]").val(data.surveyTelephone);
                    if(data.surveyDate!='') {
                        $("input[name=surveyDate]").val(dateFormator(data.surveyDate));
                    }else{
                        $("input[name=surveyDate]").val("");
                    }
                    $("input[name=lotNo]").val(data.lotNo);
                    $("input[name=landName]").val(data.landName);
                    $("input[name=landSituated]").val(data.landSituated);
                    $("input[name=landProvincalArea]").val(data.landProvincalArea);
                    $("input[name=landDistrict]").val(data.landDistrict);
                    $("input[name=landProvince]").val(data.landProvince);
                    $("input[name=isInsurance]").val(data.isInsurance);
                    $("input[name=buildingStoried]").val(data.buildingStoried);
                    $("input[name=buildingPlanNo]").val(data.buildingPlanNo);
                    $("input[name=cocNo]").val(data.cocNo);
                }else{
                    $("input[name=landBuildingID]").val("0");
                    document.getElementById("deedTypeId").selectedIndex= 0;
                    // $("input[name=deedType]").val("");
                    $("input[name=deedNo]").val("");
                    $("input[name=deedSignedDate]").val("");
                    $("input[name=deedRegisterDate]").val("");
                    $("input[name=buildingAddress1]").val("");
                    $("input[name=buildingAddress2]").val("");
                    $("input[name=buildingAddress3]").val("");
                    $("input[name=buildingAddress4]").val("");
                    $("input[name=deedValue]").val("");
                    $("input[name=extent]").val("");
                    $("input[name=comments]").val("");
                    $("input[name=attester]").val("");
                    $("input[name=attesterAddress]").val("");
                    $("input[name=seller]").val("");
                    $("input[name=sellerAddress]").val("");
                    $("input[name=graNilDivNo]").val("");
                    $("input[name=divisionNo]").val("");
                    $("input[name=assessmentNo]").val("");
                    $("input[name=assessementValue]").val("");
                    $("input[name=surveyPlanNo]").val("");
                    $("input[name=surveyName]").val("");
                    $("input[name=surveyAddress]").val("");
                    $("input[name=surveyTelephone]").val("");
                    $("input[name=surveyDate]").val("");
                    $("input[name=lotNo]").val("");
                    $("input[name=landName]").val("");
                    $("input[name=landSituated]").val("");
                    $("input[name=landProvincalArea]").val("");
                    $("input[name=landDistrict]").val("");
                    $("input[name=landProvince]").val("");
                    $("input[name=isInsurance]").val("");
                    $("input[name=buildingStoried]").val("");
                    $("input[name=buildingPlanNo]").val("");
                    $("input[name=cocNo]").val("");
                }
            }
        });

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


