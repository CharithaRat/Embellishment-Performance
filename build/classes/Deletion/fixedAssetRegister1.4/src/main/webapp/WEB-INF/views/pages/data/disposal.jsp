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
        <legend>Asset Disposal</legend>
    </div>

    <div class="row">
        <div class="col-md-12">
            <form name="disposalForm"
                  action="${root}/data/saveAssetDisposal" method="post">

                <div class="row">
                    <div class="col-md-5">
                        <div class="row">
                            <div class="col-md-4">Date</div>
                            <div class="col-md-8">
                                <div class='input-group date'>
                                    <input type='text' onchange="checkDisposalDate()" class="form-control"
                                           required="required" name="dpDate"/>
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
                            <div class="col-md-4">Asset Code</div>
                            <div class="col-md-8">
                                <select class="chosen" id="assetCodeId" onblur="checkDisposalDate()" required
                                        name="asset.asId"
                                        onchange="getAssetAllocation(),loadTransactionNoList()" style="width: 100%">
                                    <option value="">---SELECT---</option>
                                    <c:forEach var="asset" items="${assets}">
                                        <option value="${asset.asId}">${asset.asCode} - ${asset.asDes}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-2"></div>
                </div>


                <div class="row">
                    <div class="col-md-5">
                        <div class="row">
                            <div class="col-md-4">Transaction No.</div>
                            <div class="col-md-8">
                                <select id="transactionSelectId" style="width: 100%"
                                        onchange="loadDisposalDetails()"
                                        name="transactionSelect">
                                    <option value="">---SELECT---</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-5">
                        <div class="row">
                            <div class="col-md-4" style="">Currency Type</div>
                            <div class="col-md-8"><select id="currencyId" required class="select_style"
                                                          name="currencyType" style="width: 100%">
                                <option value="0">---SELECT---</option>
                                <c:forEach items="${currencyTypes}" var="currencyType">
                                    <option value="${currencyType.currencyId}">${currencyType.currencyCode}</option>
                                </c:forEach>
                            </select>
                            </div>
                        </div>
                        <div class="col-md-2"></div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-5">
                        <div class="row">
                            <div class="col-md-4" style="">Company</div>
                            <div class="col-md-8">
                                <input type="text" required style="width: 100%" id="companyID" name=""/>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-5">
                        <div class="row">
                            <div class="col-md-4" style="">Disposal Value</div>
                            <div class="col-md-8">
                                <input type="text" onkeyup="isNumber(this)" maxlength="16" required
                                       style="width: 100%"
                                       name="currencyValue"/>
                            </div>
                        </div>
                        <div class="col-md-2"></div>
                    </div>
                </div>


                <div class="row">
                    <div class="col-md-5">
                        <div class="row">
                            <div class="col-md-4" style="">Department</div>
                            <div class="col-md-8">
                                <input type="text" required style="width: 100%" id="departmentID" name=""/>
                            </div>

                        </div>
                    </div>

                    <div class="col-md-5">
                        <div class="row">
                            <div class="col-md-4" style="">Reason</div>
                            <div class="col-md-8">
                                <select required style="width: 100%" name="dpReason">
                                    <option value="">---SELECT---</option>
                                    <c:forEach items="${reasons}" var="reasons">
                                        <option value="${reasons.reason}">${reasons.reason}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-2"></div>
                </div>


                <div class="row">
                    <div class="col-md-5">
                        <div class="row">
                            <div class="col-md-4" style="">Section</div>
                            <div class="col-md-8">
                                <input type="text" required style="width: 100%" id="sectionID" name=""/>
                            </div>

                        </div>
                    </div>
                    <div class="col-md-5">
                        <div class="row">
                            <div class="col-md-4" style="">Remarks</div>
                            <div class="col-md-8">
                                <textarea name="dpDes" maxlength="100"  col="5" rows ="2" style="width: 100%"></textarea>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-5">
                        <div class="row">
                            <div class="col-md-4" style="">Location</div>
                            <div class="col-md-8">
                                <input type="text" required style="width: 100%" id="locationID" name=""/>
                            </div>

                        </div>
                    </div>
                    <div class="col-md-5">

                    </div>

                </div>

                <div class="row">
                    <div class="col-md-5"></div>
                    <div class="col-md-5">
                        <div class="row" style="padding-top: 10px">
                            <div class="col-md-4"></div>
                            <div class="col-md-4">
                                <a class="btn btn-primary" style="width: 100%" href="${root}/data/disposal">New</a>
                            </div>
                            <div class="col-md-4" style="margin-top: -1px">
                                <button type="submit" class="btn btn-primary" style="width: 100%">
                                    Save
                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-2"></div>
                </div>
                <input type="hidden" name="dpId" id="dpId" value="0">
                <input type="hidden" name="transactionNo" id="transactionNo" value="${transactionNo}"/>
            </form>
        </div>
    </div>
    <div class="row">&nbsp</div>
    <div class="row">&nbsp</div>
    <div class="row">
        <div class="col-md-12">
            <table id="dataTable" class="display compact" width="100%" cellspacing="0">
                <thead>
                <tr>
                    <th>Asset Code</th>
                    <th>Date</th>
                    <th>Disposal Value</th>
                    <th>Reason</th>

                </tr>
                </thead>

                <tbody>
                <c:forEach var="disposal" items="${disposals}">
                    <tr>
                        <td>${disposal.asset.asCode}</td>
                        <td><fmt:formatDate pattern="dd-MM-yyyy" value="${disposal.dpDate}"/></td>
                        <td>${disposal.dp_value}</td>
                        <td>${disposal.dpReason}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

<input type="hidden" id="pageType" value="${pageType}"/>
<input type="hidden" id="status" value="${status}"/>
<input type="hidden" id="isRate" value="${isRate}"/>

<script type="text/javascript">
    $(".chosen").chosen();
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
        var isRate = $("#isRate").val();
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
                    title:  message + transactionNo,
                    type: 'success',
                    timer: 2000
                }).then(function () {
                    window.location.href = "./disposal";
                })
            } else if (isRate == 'false') {
                swal({
                    title: 'Error',
                    text: 'Please Update Currency Rate in Disposal Date !!',
                    type: 'error',
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

    function getAssetAllocation() {
        var assetId = $("#assetCodeId").find("option:selected").val();

        if (assetId > 0) {
            $.ajax({
                url: '${root}/data/getAssetAlocation/' + assetId,
                success: function (data) {

                    if (data != "") {
                        var subCat = data.split("-");
                        $("#companyID").val("");
                        $("#departmentID").val("");
                        $("#sectionID").val("");
                        $("#locationID").val("");
                        $("#companyID").val(subCat[0].toUpperCase());
                        $("#departmentID").val(subCat[1].toUpperCase());
                        $("#sectionID").val(subCat[2].toUpperCase());
                        $("#locationID").val(subCat[3].toUpperCase());
                    }
                }
            });
        }
    }

    function checkDisposalDate() {
        var dat = $("input[name=dpDate]").val();
        var assetId = $("#assetCodeId").find("option:selected").val();
        if (dat != "" && assetId > 0) {
            var date = formatDate(dat);
            $.ajax({
                url: '${root}/data/checkDisposalDate',
                data: {date: date, assetId: assetId},
                success: function (data) {
                    if (data > 0) {
                        var msg;
                        switch (data) {
                            case 1:
                                msg = "Please change Disposal date";
                                break;
                            case 2:
                                msg = "Please select date, after the Asset purchase or register date";
                                break;
                            case 3 :
                                msg = "Please select date, after the Asset transfer date";
                                break;
                            case 4 :
                                msg = "Please select date, after the Asset Damage date";
                                break;
                            case 5 :
                                msg = "Please select date, after the Asset Improvement date";
                        }
                        swal({
                            title: 'Warning',
                            text: msg,
                            type: 'warning'
                        })
                        $("input[name=dpDate]").val("");
                    }

                }

            });
        }
    }



    function loadTransactionNoList() {

        var assetId = $("#assetCodeId").find("option:selected").val();

        $("#transactionSelectId").find("option:not(:first)").remove();
        $.ajax({
            url: '${root}/data/loadDisposeNoList/' + assetId,
            success: function (data) {

                for (var i = 0; i < data.length; i++) {
                    $("#transactionSelectId").append(
                        "<option value = '" + data[i][0]+ "'>" + data[i][1]
                        + "</option>");
                }
            }
        });
    }
</script>