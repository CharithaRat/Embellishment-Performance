<%--
  ~
  ~      Copyright (c) 2018,  MsSoftIT Solution All Rights Reserved.
  ~       *  PROPRIETARY AND COPYRIGHT NOTICE.
  ~
  ~          This software product contains information which is proprietary to
  ~          and considered a trade secret MsSoftIT Solution .
  ~          It is expressly agreed that it shall not be reproduced in whole or part,
  ~          disclosed, divulged or otherwise made available to any third party directly
  ~          or indirectly.  Reproduction of this product for any purpose is prohibited
  ~          without written authorisation from the The MsSoftIT Solution
  ~          All Rights Reserved.
  ~
  ~          E-Mail mssoftit@gmail.com
  ~          URL : mssoftit.lk
  ~          Created By : Mahendra Sri Dayarathna
  ~
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
        <form name="landPrimaryForm" action="${root}/maintenance/saveLandDetail" method="POST">

            <ul class="nav nav-tabs" id="myTab" role="tablist">
                <li class="nav-item">
                    <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Land - Primary Data</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">Land - Secondary Data</a>
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
                                            name="assetId"
                                            onchange="loadLandDetails()" style="width: 100%">
                                        <option value="">---SELECT---</option>
                                        <c:forEach var="asset" items="${assets}">
                                            <option value="${asset.asId}">${asset.asCode}
                                                - ${asset.asDes}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-7"></div>
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
                        <div class="col-md-2"></div>
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
                                    <input type="text" required style="width: 100%" id="addressLine1Id" maxlength="20" name="lanAdd1"/>
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
                                    <input type="text" required style="width: 100%" id="deedNoId" onkeypress="return isNumberOnly(event)" maxlength="6"   name="deedNo"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-5">
                            <div class="row">
                                <div class="col-md-4" style="">Address Line 2</div>
                                <div class="col-md-8">
                                    <input type="text" required style="width: 100%" id="lanAdd2Id"  maxlength="20" name="lanAdd2"/>
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
                                    <div class='input-group date' style="width: 102%">
                                        <input type='text' required class="form-control"
                                               name="deedSignDate"/>
                                        <span class="input-group-addon">
                                        <span class="glyphicon glyphicon-calendar"></span>
                                    </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-5">
                            <div class="row">
                                <div class="col-md-4" style="">Address Line 3</div>
                                <div class="col-md-8">
                                    <input type="text" required style="width: 100%" id="lanAdd3Id" maxlength="20" name="lanAdd3"/>
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
                                    <div class='input-group date' style="width: 102%">
                                        <input type='text' required class="form-control"
                                               name="deedRegDate"/>
                                        <span class="input-group-addon">
                                        <span class="glyphicon glyphicon-calendar"></span>
                                    </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-5">
                            <div class="row">
                                <div class="col-md-4" style="">Address Line 4</div>
                                <div class="col-md-8">
                                    <input type="text" required style="width: 100%" id="lanAdd4Id" maxlength="20" name="lanAdd4"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-2"></div>
                    </div>

                    <div class="row">
                        <div class="col-md-5">
                            <div class="row">
                                <div class="col-md-4">Deed Amount</div>
                                <div class="col-md-8">
                                    <input type="text" class="numeric" required style="width: 100%" onkeypress="return isNumberOnly(event)"  maxlength="14" id="deedValueId" name="deedValue"/>
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
                            <div class="row" style="margin: 0">
                                <legend>Attest Details</legend>
                            </div>
                        </div>
                        <div class="col-md-5">
                            <div class="row" style="margin: 0">
                                <legend>Assesment Details</legend>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-5">
                            <div class="row">
                                <div class="col-md-4">Attester Name</div>
                                <div class="col-md-8">
                                    <input type="text"  style="width: 100%" maxlength="100" id="attesterId" name="attester"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-5">
                            <div class="row">
                                <div class="col-md-4" style="">Assesment No.</div>
                                <div class="col-md-8">
                                    <input type="text"  style="width: 100%" id="assesmentNoId" maxlength="6" name="assesmentNo"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-2"></div>
                    </div>


                    <div class="row">
                        <div class="col-md-5">
                            <div class="row">
                                <div class="col-md-4">Attester Address</div>
                                <div class="col-md-8">
                                    <input type="text"  style="width: 100%" id="attesterAddId" maxlength="200" name="attesterAdd"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-5">
                            <div class="row">
                                <div class="col-md-4" style="">Assesment Value</div>
                                <div class="col-md-8">
                                    <input type="text"  style="width: 100%" id="assesmentValueId" maxlength="14"  onkeypress="return isNumberOnly(event)"  name="assesmentValue"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-2"></div>
                    </div>


                    <div class="row">
                        <div class="col-md-5">
                            <div class="row">
                                <div class="col-md-4">Seller Name</div>
                                <div class="col-md-8">
                                    <input type="text"  style="width: 100%" id="sellerId" maxlength="100" name="seller"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-5">

                        </div>
                        <div class="col-md-2"></div>
                    </div>


                    <div class="row">
                        <div class="col-md-5">
                            <div class="row">
                                <div class="col-md-4">Seller Address</div>
                                <div class="col-md-8">
                                    <input type="text"  style="width: 100%" id="selAddId" maxlength="200" name="selAdd"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-5">

                        </div>
                        <div class="col-md-2"></div>
                    </div>

                    <div class="row">
                        <div class="col-md-5">
                            <div class="row" style="margin: 0">
                                <legend>Plan Details</legend>
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
                                    <input type="text"  style="width: 100%" id="surveyPlanNoId" maxlength="6" name="surveyPlanNo"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-5">
                            <div class="row">
                                <div class="col-md-4" style="">Land - Name</div>
                                <div class="col-md-8">
                                    <input type="text"  style="width: 100%" id="landNameId" maxlength="100" name="landName"/>
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
                                    <input type="text"  style="width: 100%" id="surveyNameId" maxlength="100" name="surveyName"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-5">
                            <div class="row">
                                <div class="col-md-4" style="">Situated</div>
                                <div class="col-md-8">
                                    <input type="text"  style="width: 100%" id="landSituatedId" maxlength="100" name="landSituated"/>
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
                                    <input type="text"  style="width: 100%" id="surveyAddId" maxlength="200" name="surveyAdd"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-5">
                            <div class="row">
                                <div class="col-md-4" style="">Provincial Area</div>
                                <div class="col-md-8">
                                    <input type="text"  style="width: 100%" id="landPAreaId" maxlength="100" name="landPArea"/>
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
                                    <input type="text"  style="width: 100%" onkeypress="return isNumberOnly(event)" maxlength="20" id="surveyTelId" name="surveyTel"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-5">
                            <div class="row">
                                <div class="col-md-4" style="">Grama Niladari Division No.</div>
                                <div class="col-md-8">
                                    <input type="text"  style="width: 100%" id="graNilDiviNoId" maxlength="6" name="graNilDiviNo"/>
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
                                    <div class='input-group date' style="width: 102%">
                                        <input type='text'   class="form-control"
                                               name="surveyDate"/>
                                        <span class="input-group-addon">
                                        <%--<span class="glyphicon glyphicon-calendar" style="font-size:30px;color:red"></span>--%>
                                            <i class="fa fa-calendar" style="font-size:24px;color:#3e71fb"></i>
                                    </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-5">
                            <div class="row">
                                <div class="col-md-4" style="">Division No.</div>
                                <div class="col-md-8">
                                    <input type="text"  style="width: 100%" id="divisionNoId" maxlength="6" name="divisionNo"/>
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
                                    <input type="text"  style="width: 100%" id="lotNoId" maxlength="6" name="lotNo"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-5">
                            <div class="row">
                                <div class="col-md-4" style="">District</div>
                                <div class="col-md-8">
                                    <input type="text"  style="width: 100%" id="landDistrictId" maxlength="100" name="landDistrict"/>
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
                                    <input type="text"  style="width: 100%" id="landProvinceId" maxlength="100" name="landProvince"/>
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
                        <div class="col-md-5">
                            <a class="btn btn-primary" style="width: 100%" href="${root}/maintenance/land">New</a>
                        </div>
                        <div class="col-md-5">
                            <button type="submit" id="btnSubmit" class="btn btn-primary" style="width: 100%">Save
                            </button>
                        </div>
                    </div>
                </div>
                <div class="col-md-2"></div>
            </div>
            <input type="hidden" name="landId" value="0">
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
        if (pageType == 1) {
            if (status == 'true') {
                window.location.href = "./land";
                swal({
                    title: 'success!',
                    type: 'success',
                    timer: 2000
                })
            } else {
                swal({
                    title: 'Error !',
                    text: 'Land Added Fail !!',
                    type: 'error',
                    timer: 2000
                })
            }
        }

    });

    function loadLandDetails() {
        var assetId = $("#assetCodeId").find("option:selected").val();
        $.ajax({
            url : '${root}/maintenance/loadLandDetailsByAsset/' + assetId,
            success : function (data) {
                if(data != "") {
                    $("input[name=landId]").val(data.landId);
                    // $("input[name=deedType]").val(data.deedType);
                    document.getElementById("deedTypeId").selectedIndex= data.deedType;
                    $("input[name=deedNo]").val(data.deedNo);
                    $("input[name=deedSignDate]").val(dateFormator(data.deedSignDate));
                    $("input[name=deedRegDate]").val(dateFormator(data.deedRegDate));
                    $("input[name=lanAdd1]").val(data.lanAdd1);
                    $("input[name=lanAdd2]").val(data.lanAdd2);
                    $("input[name=lanAdd3]").val(data.lanAdd3);
                    $("input[name=lanAdd4]").val(data.lanAdd4);
                    $("input[name=deedValue]").val(data.deedValue);
                    $("input[name=extent]").val(data.extent);
                    $("input[name=comments]").val(data.comments);
                    $("input[name=attester]").val(data.attester);
                    $("input[name=attesterAdd]").val(data.attesterAdd);
                    $("input[name=seller]").val(data.seller);
                    $("input[name=selAdd]").val(data.selAdd);
                    $("input[name=graNilDiviNo]").val(data.graNilDiviNo);
                    $("input[name=divisionNo]").val(data.divisionNo);
                    $("input[name=assesmentNo]").val(data.assesmentNo);
                    $("input[name=assesmentValue]").val(data.assesmentValue);
                    $("input[name=surveyPlanNo]").val(data.surveyPlanNo);
                    $("input[name=surveyName]").val(data.surveyName);
                    $("input[name=surveyAdd]").val(data.surveyAdd);
                    $("input[name=surveyTel]").val(data.surveyTel);
                    if(data.surveyDate!='') {
                        $("input[name=surveyDate]").val(dateFormator(data.surveyDate));
                    }else{
                        $("input[name=surveyDate]").val("");
                    }
                    $("input[name=lotNo]").val(data.lotNo);
                    $("input[name=landName]").val(data.landName);
                    $("input[name=landSituated]").val(data.landSituated);
                    $("input[name=landPArea]").val(data.landPArea);
                    $("input[name=landDistrict]").val(data.landDistrict);
                    $("input[name=landProvince]").val(data.landProvince);
                }else{
                    {
                        document.getElementById("deedTypeId").selectedIndex= 0;
                        $("input[name=landId]").val("0");
                        // $("input[name=deedType]").val("");
                        $("input[name=deedNo]").val("");
                        $("input[name=deedSignDate]").val("");
                        $("input[name=deedRegDate]").val("");
                        $("input[name=lanAdd1]").val("");
                        $("input[name=lanAdd2]").val("");
                        $("input[name=lanAdd3]").val("");
                        $("input[name=lanAdd4]").val("");
                        $("input[name=deedValue]").val("");
                        $("input[name=extent]").val("");
                        $("input[name=comments]").val("");
                        $("input[name=attester]").val("");
                        $("input[name=attesterAdd]").val("");
                        $("input[name=seller]").val("");
                        $("input[name=selAdd]").val("");
                        $("input[name=graNilDiviNo]").val("");
                        $("input[name=divisionNo]").val("");
                        $("input[name=assesmentNo]").val("");
                        $("input[name=assesmentValue]").val("");
                        $("input[name=surveyPlanNo]").val("");
                        $("input[name=surveyName]").val("");
                        $("input[name=surveyAdd]").val("");
                        $("input[name=surveyTel]").val("");
                         $("input[name=surveyDate]").val("");
                        $("input[name=lotNo]").val("");
                        $("input[name=landName]").val("");
                        $("input[name=landSituated]").val("");
                        $("input[name=landPArea]").val("");
                        $("input[name=landDistrict]").val("");
                        $("input[name=landProvince]").val("");
                    }
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
            format: 'mm/dd/yyyy',
            autoclose: true
        });
    });
</script>
