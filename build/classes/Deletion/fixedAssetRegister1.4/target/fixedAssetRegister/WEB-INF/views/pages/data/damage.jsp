<%--
  Created by IntelliJ IDEA.
  User: MsD
  Date: 9/28/2017
  Time: 4:17 AM
  To change this template use File | Settings | File Templates.

  Modification Date : 3/8/2019:
  User              : Dilusha Kumari
  Purose            : Add a method for generating Transaction Number
--%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>

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
    <form name="damageForm"
          action="${root}/data/saveAssetDamage" method="post">

        <div class="row" style="margin: 0">
            <legend>Damaged Asset</legend>
        </div>
                <div class="row">
                    <div class="col-md-4">Asset Code</div>
                    <div class="col-md-8" >
                        <select required id="assetCodeId" style="width: 100%" class="chosen" name="asset" onchange="loadTransactionNoList()">
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
                <select  id="transactionSelectId" style="width: 100%"
                         onchange="loadDamageDetails()"
                         name="transactionSelect">
                    <option value="">---SELECT---</option>
                </select>
            </div>

        </div>
                <div class="row">
                    <div class="col-md-4">Date</div>
                    <div class="col-md-8">
                        <div class='input-group date' style="width: 100%">
                            <input type='text' onchange="checkDisposalDate()" required class="form-control"
                                   name="date"/>
                            <span class="input-group-addon">
                                        <span class="glyphicon glyphicon-calendar"></span>
                                    </span>
                        </div>
                    </div>

                </div>


        <div class="row">
            <div class="col-md-4">Value</div>
            <div class="col-md-8">
                <input type="text" name="dmgCost" maxlength="16" required onkeyup="isNumber(this)" style="width: 100%"/>
            </div>

        </div>

                <div class="row">
                    <div class="col-md-4">Description</div>
                    <div class="col-md-8">
                        <textarea  name="dmgDes" required maxlength="35" style="width: 100%"></textarea>
                    </div>

                </div>


                <div class="row">
                    <div class="col-md-4"></div>
                    <div class="col-md-8">
                        <div class="row" style="padding-top: 10px">

                            <div class="col-md-6">
                                <a class="btn btn-primary" style="width: 100%" href="${root}/data/damage">New</a>
                            </div>
                            <div class="col-md-6">
                                <button type="submit" class="btn btn-primary" style="width: 100%">Save</button>
                            </div>

                        </div>
                    </div>
                </div>
        <input type="hidden" name="dmgAsId" id="dmgAsId" value="0">
        <input type="hidden" name="transactionNo" id="transactionNo" value="${transactionNo}"/>
</form>

</div>

<input type="hidden" id="pageType" value="${pageType}"/>
<input type="hidden" id="status" value="${status}"/>

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
                    window.location.href = "./damage";
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

    function getAssetAlocation() {
        var assetId = $("#assetCodeId").find("option:selected").val();
        if (assetId > 0) {
            $.ajax({
                url: '${root}/data/getAssetAlocation/' + assetId,
                success: function (data) {
                    if (data != "") {
                        var subCat = data.split("-");
                        $("#companyID").val(subCat[0]);
                        $("#departmentID").val(subCat[1]);
                        $("#sectionID").val(subCat[2]);
                        $("#locationID").val(subCat[3]);
                    }
                }
            });
        }
    }

    function checkDisposalDate() {
        var dat = $("input[name=date]").val();
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
                                msg = "Please change Transfers date";
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
                        $("input[name=date]").val("");
                    }

                }

            });
        }
    }


    function loadTransactionNoList() {

        var assetId = $("#assetCodeId").find("option:selected").val();

        $("#transactionSelectId").find("option:not(:first)").remove();
        $.ajax({
            url: '${root}/data/loadDamageNoList/' + assetId,
            success: function (data) {

                for (var i = 0; i < data.length; i++) {
                    $("#transactionSelectId").append(
                        "<option value = '" + data[i][0]+ "'>" + data[i][1]
                        + "</option>");
                }
            }
        });
    }
    function loadDamageDetails() {
        var damageId = $("#transactionSelectId").find("option:selected").val();

        $.ajax({
            url: '${root}/data/loadDamageDetailsByDamageId/' + damageId,
            success: function (data) {

                if (data != "") {
                    $("input[name=dmgAsId]").val(data[0][0]);
                    $("input[name=transactionNo]").val(data[0][1]);
                    $("input[name=date]").val(dateFormator(data[0][2]));
                    $("input[name=dmgCost]").val(data[0][3]);
                    $("textarea[name=dmgDes]").val(data[0][4]);

                }
            }
        });}


</script>