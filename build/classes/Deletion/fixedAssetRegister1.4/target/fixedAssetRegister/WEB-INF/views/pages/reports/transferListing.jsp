<%--
  Created by IntelliJ IDEA.
  User: MsD
  Date: 10/26/2017
  Time: 6:46 AM
  To change this template use File | Settings | File Templates.
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
<div class="row">
    <div class="col-md-12" style="width: 70%">
        <div class="page">
            <form name="" action="${root}/report/genarateTransferListing" target="_blank" method="post">

                <div class="row" style="margin: 0">
                    <legend>Transfer Listng</legend>
                </div>

                <div class="row" style="padding-bottom: 15px">
                    <div class="col-md-2"></div>
                    <div class="col-md-10" style="">
                        <div class="row">

                            <div class="col-md-1"><input type="radio" checked="checked" style="width: 100%" value="1"
                                                         name="btnDetails"></div>
                            <div class="col-md-3"><label>Date Order</label></div>
                            <div class="col-md-1"></div>
                            <div class="col-md-1"><input type="radio" style="width: 100%" value="2" name="btnDetails">
                            </div>
                            <div class="col-md-6"><label>Assets Registration Code Order</label></div>
                        </div>
                    </div>

                </div>


                <div class="row" id="dateRow">
                    <div class="col-md-6">
                        <div class="row">
                            <div class="col-md-5">Process Range</div>
                            <div class="col-md-7" style="margin-left: -30px">
                                <div class='input-group date'>
                                    <input type='text' class="form-control" value="" name="fromDate"/>
                                    <span class="input-group-addon">
                                                <span class="glyphicon glyphicon-calendar"></span>
                                                </span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="row">
                            <div class="col-md-7">
                                <div class='input-group date'>
                                    <input type='text' class="form-control" value="" name="toDate"/>
                                    <span class="input-group-addon">
                                                <span class="glyphicon glyphicon-calendar"></span>
                                                </span>
                                </div>
                            </div>
                            <div class="col-md-5"></div>
                        </div>

                    </div>
                </div>


                <div class="row" style="display: none" id="assetRow">
                    <div class="col-md-6">
                        <div class="row">
                            <div class="col-md-4">Assets</div>
                            <div class="col-md-8">
                                <select style="width: 95%" name="fromcord">
                                    <option value="">---SELECT---</option>
                                    <c:forEach var="asset" items="${assets}">
                                        <option value="${asset.asId}">${asset.asCode}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="row">
                            <div class="col-md-8">
                                <select style="width: 95%" name="tocord">
                                    <option value="">---SELECT---</option>
                                    <c:forEach var="asset" items="${assets}">
                                        <option value="${asset.asId}">${asset.asCode}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="col-md-4"></div>
                        </div>
                    </div>
                </div>

                <div class="row" style="padding-top: 10px">
                    <div class="col-md-6">
                        <div class="row">
                            <div class="col-md-4"></div>
                            <div class="col-md-4">
                                <button type="button" class="btn btn-primary" style="width: 100%">Help</button>
                            </div>

                            <div class="col-md-4">
                                <button type="submit" class="btn btn-primary" style="width: 100%">Ok</button>
                            </div>
                            <div class="col-md-2"></div>
                        </div>
                    </div>
                    <div class="col-md-6"></div>
                </div>

            </form>
        </div>
    </div>
</div>
</div>

<input type="hidden" id="pageType" value="${pageType}"/>
<input type="hidden" id="doPreparate" value="${doPreparate}"/>

<script type="text/javascript">
    $(window).load(function () {
        // Animate loader off screen
        $(".se-pre-con").fadeOut("slow");
    });

    $('#btnSubmit').click(function () {
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
        $('.date').datepicker({
            format: 'dd/mm/yyyy',
            autoclose: true
        });
    });


    $(function () {
        var status = $("#status").val();
        if (status == 'true') {
            swal({
                title: 'Warning',
                text: 'Please do the Report Preparation!',
                type: 'warning',
                timer: 5000
            })
        }

    });

    $(document).ready(function () {
        $('input[type=radio][name=btnDetails]').change(function () {
            if (this.value == 1) {
                document.getElementById('dateRow').style.display = 'block';
                document.getElementById('assetRow').style.display = 'none';
            }
            else if (this.value == 2) {

                document.getElementById('dateRow').style.display = 'none';
                document.getElementById('assetRow').style.display = 'block';
            }
        });
    });

</script>