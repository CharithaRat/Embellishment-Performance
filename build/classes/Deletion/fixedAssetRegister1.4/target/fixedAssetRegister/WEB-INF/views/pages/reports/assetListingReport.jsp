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
                      action="${root}/report/genarateAssetListing" target="_blank"  method="post">

                <div class="row" style="margin: 0">
                    <legend>Assets Listing</legend>
                </div>

                <div class="row" style="padding-bottom: 15px">
                    <div class="col-md-3"></div>
                    <div class="col-md-4" style="margin-left: -25px">
                        <div class="row">
                            <div class="col-md-3"><label>Details</label></div>
                            <div class="col-md-2"><input type="radio" checked="checked" style="width: 100%" value="1"
                                                         name="btnDetails"></div>
                            <div class="col-md-1"></div>
                            <div class="col-md-3"><label>Quantity</label></div>
                            <div class="col-md-2"><input type="radio" style="width: 100%" value="2" name="btnDetails">
                            </div>
                            <div class="col-md-1"></div>
                        </div>
                    </div>
                    <div class="col-md-5"></div>
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <div class="row">
                            <div class="col-md-5">Department From</div>
                            <div class="col-md-7">
                                <select style="width: 85%" name="branchFrom">
                                    <option value="">---SELECT---</option>
                                    <c:forEach items="${departments}" var="department">
                                        <option value="${department.depId}">${department.depCode} - ${department.depDes}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="row">
                            <div class="col-md-1">To</div>
                            <div class="col-md-8">
                                <select style="width: 85%" name="branchTo">
                                    <option value="">---SELECT---</option>
                                    <c:forEach items="${departments}" var="department">
                                        <option value="${department.depId}">${department.depCode} - ${department.depDes}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="col-md-3"></div>
                        </div>

                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <div class="row">
                            <div class="col-md-5">Section From</div>
                            <div class="col-md-7">
                                <select style="width: 85%" name="secFrom">
                                    <option value="">---SELECT---</option>
                                    <c:forEach items="${sections}" var="section">
                                        <option value="${section.secId}">${section.secCode} - ${section.secDes}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">

                        <div class="row">
                            <div class="col-md-1">To</div>
                            <div class="col-md-8">
                                <select style="width: 85%" name="secTo">
                                    <option value="">---SELECT---</option>
                                    <c:forEach items="${sections}" var="section">
                                        <option value="${section.secId}">${section.secCode} - ${section.secDes}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="col-md-3"></div>
                        </div>

                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <div class="row">
                            <div class="col-md-5">Location From</div>
                            <div class="col-md-7">
                                <select style="width: 85%" name="locFrom">
                                    <option value="">---SELECT---</option>
                                    <c:forEach items="${locations}" var="location">
                                        <option value="${location.locId}">${location.locCode} - ${location.locDes}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">

                        <div class="row">
                            <div class="col-md-1">To</div>
                            <div class="col-md-8">
                                <select style="width: 85%" name="locTo">
                                    <option value="">---SELECT---</option>
                                    <c:forEach items="${locations}" var="location">
                                        <option value="${location.locId}">${location.locCode} - ${location.locDes}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="col-md-3"></div>
                        </div>

                    </div>
                </div>

                <div class="row" style="padding-top: 10px">
                    <div class="col-md-2">Date Wise</div>
                    <div class="col-md-1" style="margin-left: 4%"><input type="checkbox" style="float: left"
                                                                         name="dateWise"/></div>
                    <div class="col-md-10"></div>
                </div>


                <div class="row">
                    <div class="col-md-6">
                        <div class="row">
                            <div class="col-md-5">Date From</div>
                            <div class="col-md-7">
                                <div class='input-group date'>
                                    <input type='text' class="form-control" id=""
                                           value="" name="fromDate"/>
                                    <span class="input-group-addon">
                                                <span class="glyphicon glyphicon-calendar"></span>
                                                </span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="row">
                            <div class="col-md-1">To</div>
                            <div class="col-md-8">
                                <div class='input-group date'>
                                    <input type='text' class="form-control"
                                           value="" name="toDate"/>
                                    <span class="input-group-addon">
                                                <span class="glyphicon glyphicon-calendar"></span>
                                                </span>
                                </div>
                            </div>
                            <div class="col-md-3"></div>
                        </div>

                    </div>
                </div>
                <div class="row" style="padding-top: 10px">
                    <div class="col-md-4"></div>
                    <div class="col-md-8">
                        <div class="row">

                            <div class="col-md-4">
                                <button type="button" class="btn btn-primary" style="width: 100%">Close</button>
                            </div>
                            <div class="col-md-4">
                                <button type="submit" class="btn btn-primary" style="width: 100%">View</button>
                            </div>
                            <div class="col-md-4"></div>
                        </div>
                    </div>

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