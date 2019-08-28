<%--
     Copyright (c) 2018,  MsSoftIT Solution All Rights Reserved.
     *  PROPRIETARY AND COPYRIGHT NOTICE.

        This software product contains information which is proprietary to
        and considered a trade secret MsSoftIT Solution .
        It is expressly agreed that it shall not be reproduced in whole or part,
        disclosed, divulged or otherwise made available to any third party directly
        or indirectly.  Reproduction of this product for any purpose is prohibited
        without written authorisation from the The MsSoftIT Solution
        All Rights Reserved.

        E-Mail mssoftit@gmail.com
        URL : mssoftit.lk
        Created By : Mahendra Sri Dayarathna

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
    <div class="col-md-7">
        <div class="page">
            <form name="userForm"
                  action="${root}/user/loadUseJobList" method="post">
                <div class="row" style="margin: 0">
                    <legend>Use level Job Define</legend>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="clearfix"></div>
                        <div class="row">
                            <div class="col-md-3">User Name</div>
                            <div class="col-md-6">
                                <select id="userId" required name="userId" style="width: 100%">
                                    <option value="">---SELECT---</option>
                                    <c:forEach items="${users}" var="users">
                                        <option value="${users.userId}">${users.username}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="col-md-3">
                                <button type="submit" class="btn btn-primary" style="width: 100%">Load
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<input type="hidden" id="pageType" value="${pageType}"/>
<input type="hidden" id="status" value="${status}"/>

<script type="text/javascript">
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
            searching: false,
            paging: false,
            info: false,
            "paging": false
        });
    });

    $(function () {
        var status = $("#status").val();
        var pageType = $("#pageType").val();
        if (pageType == 1) {
            if (status == 'true') {
                window.location.href = "./userJobs";
                swal({
                    title: 'success!',
                    type: 'success',
                    timer: 2000
                })
            } else {
                swal({
                    title: 'Error !',
                    text: 'Company Added Fail !!',
                    type: 'error',
                    timer: 2000
                })
            }
        }

    });

</script>