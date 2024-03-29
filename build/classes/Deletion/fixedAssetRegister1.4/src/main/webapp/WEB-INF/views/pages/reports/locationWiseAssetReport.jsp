<%--
  Created by IntelliJ IDEA.
  User: MsD
  Date: 12/2/2017
  Time: 5:37 PM
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
            <form name=""
                  action="${root}/report/genarateMasterListing" method="post">

                <div class="row" style="margin: 0">
                    <legend>Location</legend>
                </div>

                <div class="row">
                    <div class="col-md-2">Location From </div>
                    <div class="col-md-4">
                        <select id="" style="width: 85%" name="">
                            <option value="">---SELECT---</option>
                        </select>
                    </div>
                    <div class="col-md-6"></div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="row">
                            <div class="col-md-4">From</div>
                            <div class="col-md-8">
                                <select style="width: 85%" name="">
                                    <option value="">---SELECT---</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="row">
                            <div class="col-md-2">To</div>
                            <div class="col-md-8">
                                <select style="width: 85%" name="">
                                    <option value="">---SELECT---</option>
                                </select>
                            </div>
                            <div class="col-md-2"></div>
                        </div>
                    </div>
                </div>
                <div class="row" style="padding-top: 10px">
                    <div class="col-md-6">
                        <div class="row">
                            <div class="col-md-4"></div>
                            <div class="col-md-4">
                                <button type="submit" class="btn btn-primary" style="width: 100%">View</button>
                            </div>
                            <div class="col-md-4">
                                <button type="button" class="btn btn-primary" style="width: 100%">Close</button>
                            </div>
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
<input type="hidden" id="status" value="${status}"/>

<script type="text/javascript">
    $(window).load(function () {
        // Animate loader off screen
        $(".se-pre-con").fadeOut("slow");
    });

    $('#btnSubmit').click(function () {
        $(".se-pre-con").show();
    });

    $(function () {
        $('.date').datepicker({
            format: 'dd/mm/yyyy',
            autoclose: true
        });
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
                swal({
                    title: 'success!',
                    type: 'success',
                    timer: 2000
                })
            } else {
                swal({
                    title: 'Error !',
                    text: 'Main Category Added Fail !!',
                    type: 'error',
                    timer: 2000
                })
            }
        }
    });


</script>