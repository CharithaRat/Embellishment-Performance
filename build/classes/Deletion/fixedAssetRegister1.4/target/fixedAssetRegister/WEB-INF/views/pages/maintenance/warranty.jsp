<%--
  Created by IntelliJ IDEA.
  User: Hashane
  Date: 2019-01-07
  Time: 2:46 PM
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
<div class="row">
    <div class="col-md-6 page">
        <div class="row" style="margin: 0">
            <legend>Warranty </legend>
        </div>

        <div class="row">
            <div class="col-md-12">
                <form name="WarrantyForm" action="${root}/maintenance/saveWarranty" method="post">
                    <div class="row">
                                <div class="col-md-4">Asset Code</div>
                                <div class="col-md-8">
                                    <select required id="assetId" class="chosen" style="width: 100%"
                                            onchange="clearFields(),loadWarrantyNoList()" name="assetId">
                                        <option value="">---SELECT---</option>
                                        <c:forEach var="asset" items="${assets}">
                                            <option value="${asset.asId}">${asset.asCode}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                    </div>

                    <div class="row">

                                <div class="col-md-4">Transaction No.</div>
                                <div class="col-md-8">
                                    <select  id="transactionSelectId" class="chosen" style="width: 100%"
                                             onchange="loadWarrantyDetails()"
                                             name="transactionSelect">
                                        <option value="">---SELECT---</option>
                                    </select>
                                </div>
                    </div>
                    <div class="row">

                        <div class="col-md-4">Warranty Period</div>
                        <div class="col-md-8">
                            <input type="text" required style="width: 100%"  maxlength="10" id="warrantyPeriodId"
                                   name="warrantyPeriod"/>
                        </div>
                    </div>

                    <div class="row">

                                <div class="col-md-4"> From</div>
                                <div class="col-md-8">
                                    <div class='input-group date' style="width: 100%">
                                        <input type='text' required class="form-control"
                                               id="warrantyPeriodFromId"
                                               name="warrantyPeriodFrom"/>
                                        <span class="input-group-addon">
                                        <span class="glyphicon glyphicon-calendar"></span>
                                    </span>
                                    </div>

                        </div>
                    </div>

                    <div class="row">

                                <div class="col-md-4"> To</div>
                                <div class="col-md-8">
                                    <div class='input-group date' style="width: 100%">
                                        <input type='text' required class="form-control" id="warrantyPeriodToId"
                                               name="warrantyPeriodTo"/>
                                        <span class="input-group-addon">
                                        <span class="glyphicon glyphicon-calendar"></span>
                                    </span>
                                    </div>
                                </div>
                    </div>
<div>&nbsp</div>
                    <div class="row">
                        <div class="col-md-6"></div>
                        <div class="col-md-3" style="margin-top: 2px">
                            <a class="btn btn-primary" style="width: 100%"
                               href="${root}/maintenance/warranty">New</a>
                        </div>
                        <div class="col-md-3">
                            <button type="submit" class="btn btn-primary" style="width: 100%">Save</button>
                        </div>

                    </div>

                    <input type="hidden" name="warrantyId" value="${warranty.warrantyId}"/>
                    <input type="hidden" name="transactionNo" id="transactionNo" value="${transactionNo}"/>

                </form>
            </div>
        </div>
    </div>
</div>


<input type="hidden" id="pageType" value="${pageType}"/>
<input type="hidden" id="status" value="${status}"/>



<script type="text/javascript">

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
                    window.location.href = "./warranty";
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


    function loadWarrantyNoList() {

        var assetId = $("#assetId").find("option:selected").val();

        $("#transactionSelectId").find("option:not(:first)").remove();
        $.ajax({
            url: '${root}/maintenance/loadWarrantyNoList/' + assetId,
            success: function (data) {
                for (var i = 0; i < data.length; i++) {
                    $("#transactionSelectId").append(
                        "<option value = '" + data[i].warrantyId + "'>" + data[i].transactionNo
                        + "</option>");
                }
            }
        });
    }

    function loadWarrantyDetails() {
        var warrantyId = $("#transactionSelectId").find("option:selected").val();

        $.ajax({
            url: '${root}/maintenance/loadWarrantyDetailsByWarrantyId/' + warrantyId,
            success: function (data) {
                if (data != "") {
                    $("input[name=warrantyId]").val(data.warrantyId);
                    $("input[name=transactionNo]").val(data.transactionNo);
                    $("input[name=warrantyPeriod]").val(data.warrantyPeriod);
                    $("input[name=warrantyPeriodFrom]").val(dateFormator(data.warrantyPeriodFrom));
                    $("input[name=warrantyPeriodTo]").val(dateFormator(data.warrantyPeriodTo));

                }
            }
        });}


    function clearFields(){

        $("input[name=warrantyPeriod]").val("");
        $("input[name=warrantyPeriodFrom]").val("");
        $("input[name=insurancePeriodFrom]").val("");
        $("input[name=warrantyPeriodTo]").val("");

    }


    $(window).load(function () {
        // Animate loader off screen
        $(".se-pre-con").fadeOut("slow");
    });

    $('.tabgroup > div').hide();
    $('.tabgroup > div:first-of-type').show();
    $('.tabs a').click(function (e) {
        e.preventDefault();
        var $this = $(this),
            tabgroup = '#' + $this.parents('.tabs').data('tabgroup'),
            others = $this.closest('li').siblings().children('a'),
            target = $this.attr('href');
        others.removeClass('active');
        $this.addClass('active');
        $(tabgroup).children('div').hide();
        $(target).show();

    });

    $(function () {
        $('.date').datepicker({
            format: 'mm/dd/yyyy',
            autoclose: true
        });
    });
</script>
