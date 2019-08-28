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
  ~          Created By : Dilusha Kumari
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
<div class="col-md-6 page">
    <div class="row" style="margin: 0">
        <legend>Accessory Master</legend>
    </div>
        <form name="accessoryMasterForm" action="${root}/category/saveAccessoryMaster" method="POST">

                    <div class="row">&nbsp</div>
                    <div class="row">
                                <div class="col-md-4"> Code</div>
                                <div class="col-md-8">
                                    <input type="text" name="accerCode" id="accerCodeId" class="form-control" style="width: 100%">
                                </div>

                    </div>

                    <div class="row">&nbsp</div>
                    <div class="row">

                                <div class="col-md-4"> Name</div>
                                <div class="col-md-8">
                                    <input type="text" name="accerName" id="accerNameId" class="form-control" style="width: 100%">
                                </div>
                    </div>

                    <div class="row">&nbsp</div>

                            <div class="row" style="padding-top: 10px">
                                <div class="col-md-4"></div>
                                <div class="col-md-4">
                                    <a class="btn btn-primary" style="width: 100%" href="${root}/category/accessoryMaster">New</a>
                                </div>
                                <div class="col-md-4">
                                    <button type="submit" id="btnSubmit" class="btn btn-primary" style="width: 100%">Save
                                    </button>
                                </div>
                            </div>

            </div>
        </form>
    </div>
</div>
<input type="hidden" id="pageType" value="${pageType}"/>
<input type="hidden" id="status" value="${status}"/>


<script type="text/javascript">

    $(function () {
        var status = $("#status").val();
        var pageType = $("#pageType").val();

        if (pageType == 1) {
            if (status == 'true') {
                window.location.href = "./accessoryMaster";
                swal({
                    title: 'success!',
                    type: 'success',
                    timer: 2000
                })
            } else {
                swal({
                    title: 'Error !',
                    text: 'Accessory Added Fail !!',
                    type: 'error',
                    timer: 2000
                })
            }
        }

    });

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
