<%--
  Created by IntelliJ IDEA.
  User: Dilusha Kumari
  Date: 1/17/2019
  Time: 10:45 AM
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
        <legend> Modification</legend>
    </div>

    <div class="row">
        <div class="col-md-12">
            <form name="modificationForm" action="${root}/maintenance/saveModification" method="post">

                <div class="row">
                    <div class="col-md-4">Asset Code</div>
                    <div class="col-md-8">
                        <select class="chosen" id="assetCode" required onchange="clearFields(), loadTransactionNoList()"
                                name="assetId" style="width: 100%">
                            <option value="">---SELECT---</option>
                            <c:forEach var="asset" items="${assets}">
                                <option value="${asset.asId}">${asset.asCode} - ${asset.asDes}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4">Transaction No.</div>
                    <div class="col-md-8">
                        <select  id="transactionSelectId" class="chosen" style="width: 100%"
                                 onchange="loadModificationDetails()"
                                 name="transactionSelect">
                            <option value="">---SELECT---</option>
                        </select>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4">Type</div>
                    <div class="col-md-8">
                        <select class="chosen" id="modiTypeId"
                                name="modiType" style="width: 100%">
                            <option value="0">---SELECT---</option>
                            <option value="1">Enhance</option>
                            <option value="2">Improvement</option>
                            <option value="3">Demolish</option>
                        </select>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-4">Date</div>
                    <div class="col-md-8">
                        <div class='input-group date' style="width: 102%">
                            <input type='text' required class="form-control"
                                   name="modiDa"/>
                            <span class="input-group-addon">\
                                <button style=height:25px;width:30px> <i style="font-size:15px;color:#3e71fb" class="fa fa-calendar"></i></button>
                                        <%--<span class="glyphicon glyphicon-calendar"></span>--%>
                            </span>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-4"> Work</div>
                    <div class="col-md-8">
                        <input type="text" required style="width: 100%" id="workId" name="modiWork" maxlength="200"
                               required/>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-4" style="">Cost</div>
                    <div class="col-md-8">
                        <input type="text" required style="width: 100%" id="costId" name="modiCost" maxlength="14"
                               onkeypress="return isNumberOnly(event)" required/>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-4" style="">Reason</div>
                    <div class="col-md-8">
                        <input type="text" required style="width: 100%" id="reasonId" name="modiReason" maxlength="200"
                               required/>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-3"></div>
                    <div class="col-md-3"></div>
                    <div class="col-md-3" style="margin-top: 2px">
                        <a class="btn btn-primary" style="width: 100%"
                           href="${root}/maintenance/modification">New</a>
                    </div>
                    <div class="col-md-3">
                        <button type="submit" class="btn btn-primary" style="width: 100%">Save</button>
                    </div>


                </div>
                <input type="hidden" name="modificationId" value="${modification.modificationId}">
                <input type="hidden" name="transactionNo" id = "transactionNo" value="${transactionNo}" style="width: 100%"/>
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
                    window.location.href = "./modification";
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

        var assetId = $("#assetCode").find("option:selected").val();

        $("#transactionSelectId").find("option:not(:first)").remove();
        $.ajax({
            url: '${root}/maintenance/loadModificationNoList/' + assetId,
            success: function (data) {
                for (var i = 0; i < data.length; i++) {
                    $("#transactionSelectId").append(
                        "<option value = '" + data[i].modificationId + "'>" + data[i].transactionNo
                        + "</option>");
                }
            }
        });
    }

    function loadModificationDetails() {
        var modificationId = $("#transactionSelectId").find("option:selected").val();

        $.ajax({
            url: '${root}/maintenance/loadModificationDetailsByModificationId/' + modificationId,
            success: function (data) {
                if (data != "") {

                    $("input[name=modificationId]").val(data.modificationId);
                    $("input[name=transactionNo]").val(data.transactionNo);
                    document.getElementById("modiTypeId").selectedIndex= data.modiType;
                    $("input[name=modiDa]").val(dateFormator(data.modiDa));
                    $("input[name=modiWork]").val(data.modiWork)
                    $("input[name=modiCost]").val(data.modiCost);
                    $("input[name=modiReason]").val(data.modiReason);
                }
            }
        });}


    function clearFields(){
        document.getElementById("modiTypeId").selectedIndex= 0;
        $("input[name=modiDa]").val("");
        $("input[name=modiWork]").val("")
        $("input[name=modiCost]").val("");
        $("input[name=modiReason]").val("");

    }


</script>