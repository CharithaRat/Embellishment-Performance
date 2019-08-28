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
        <legend>Furniture</legend>
    </div>
    <%--<div class="row">&nbsp;</div>--%>

    <div class="row">
        <div class="col-md-12">
            <form name="furnitureForm" action="${root}/maintenance/saveFurniture"  method="post">

                <div class="row">
                    <div class="col-md-4">Asset Code From :</div>
                    <div class="col-md-8">
                        <select required id="assetCodeFrom" class="chosen" style="width: 100%"
                                onchange="loadFurnitureDetails()" name="assetIdFrom">
                            <option value="">---SELECT---</option>
                            <c:forEach var="asset" items="${assets}">
                                <option value="${asset.asId}">${asset.asCode}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4">Asset Code To:</div>
                    <div class="col-md-8">
                        <select  id="assetCodeTo" class="chosen" style="width: 100%" name="assetIdTo" >
                            <option value="0">---SELECT---</option>
                            <c:forEach var="asset" items="${assets}">
                                <option value="${asset.asId}">${asset.asCode}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4" style="">Warranty</div>
                    <div class="col-md-8">
                        <select class="chosen" id="isWarrantyId" required
                                name="isWarranty"
                                style="width: 100%">
                            <option  value="0"> No </option>
                            <option  value="1"> Yes </option>
                        </select>
                    </div>
                </div>
                <%--<div class="row">&nbsp;</div>--%>
                <div class="row">
                        <div class="col-md-4" style="">Insurance</div>
                        <div class="col-md-8">
                            <select class="chosen" id="isInsuranceId" required
                                name="isInsurnce" style="width: 100%">
                                <option  value="0"> No </option>
                                <option   value="1"> Yes </option>
                            </select>
                        </div>

                </div>
                <%--<div class="row">&nbsp;</div>--%>
                <div class="row">
                    <div class="col-md-6"></div>
                    <div class="col-md-3" style="margin-top: 2px">
                                <a class="btn btn-primary" style="width: 100%"
                                   href="${root}/maintenance/furniture">New</a>
                    </div>
                    <div class="col-md-3">
                        <button type="submit" class="btn btn-primary" style="width: 100%">Save</button>
                    </div>
                </div>

                </div>
                <input type="hidden" value="0" name="furnitureId">
            </form>
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
                window.location.href = "./furniture";
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

    function loadFurnitureDetails() {
        var assetId = $("#assetCodeFrom").find("option:selected").val();
        $.ajax({
            url : '${root}/maintenance/loadFurnitureDetailsByAsset/' + assetId,
            success : function (data) {
                if(data != "") {
                    $("input[name=furnitureId]").val(data.furnitureId);
                    $("input[name=assetIdFrom]").val(data.assetId);
                    document.getElementById("isWarrantyId").selectedIndex= data.isWarranty;
                    document.getElementById("isInsuranceId").selectedIndex= data.isInsurnce;
                }else{
                    $("input[name=furnitureId]").val("0");
                }
            }
        });

    }
</script>