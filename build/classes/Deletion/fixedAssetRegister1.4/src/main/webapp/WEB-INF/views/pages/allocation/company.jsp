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
            <form name="companyForm"
                  action="${root}/allocation/saveCompany" method="post">

                <div class="row" style="margin: 0">
                    <legend>Company Details</legend>
                </div>
                <input type="hidden" name="comId" value="${company.comId}"/>
                <div class="row">
                    <div class="col-md-12">
                        <div class="row">
                            <div class="col-md-4">Code</div>
                            <div class="col-md-6">
                                <input type="text" class="uppercase" id="comCode" onkeyup="validateCharacter(this)"
                                       onblur="checkCompanyCode(this),validateMasterCode(this)"
                                       value="${company.comCode}" maxlength="3" required="required" name="comCode"
                                       style="width: 100%"/>
                            </div>
                            <div class="col-md-2"></div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="row">
                            <div class="col-md-4">Name</div>
                            <div class="col-md-6">
                                <input type="text" name="comDes" value="${company.comDes}" required="required"
                                       style="width: 100%"/>
                            </div>
                            <div class="col-md-2"></div>
                        </div>
                        <div class="row">
                            <div class="col-md-4"></div>
                            <div class="col-md-6">

                                <div class="row" style="margin-top: 15px">
                                    <div class="col-md-6">
                                        <a class="btn btn-primary" style="width: 100%"
                                           href="${root}/allocation/company">New</a>
                                    </div>
                                    <div class="col-md-6">

                                        <c:choose>
                                            <c:when test="${company.comId > 0 }">
                                                <button type="submit" class="btn btn-primary" style="width: 100%">
                                                    Update
                                                </button>
                                            </c:when>
                                            <c:otherwise>
                                                <button type="submit" class="btn btn-primary" style="width: 100%">Save
                                                </button>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                    <div class="col-md-3"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <div class="col-md-5">
        <table id="dataTable" class="display compact" width="100%" cellspacing="0">
            <thead>
            <tr>
                <th>Company Code</th>
                <th>Company Name</th>
                <th>Edit</th>
                <th>Delete</th>

            </tr>
            </thead>

            <tbody>
            <c:forEach var="companyList" items="${companyList}">
                <tr id="${companyList.comId}">
                    <td>${companyList.comCode}</td>
                    <td>${companyList.comDes}</td>
                        <%--<i onclick="clickToEdit()" class="fa fa-pencil-square-o" aria-hidden="true"></i>--%>
                    <td><a href="${root}/allocation/editCompany/${companyList.comId}"><i
                            class="fa fa-pencil-square-o"></i></a></td>
                    <td><a onclick="onDelete(this)"><i class="fa fa-trash-o"></i></a></td>
                </tr>

            </c:forEach>
            </tbody>
        </table>

    </div>
</div>

<input type="hidden" id="pageType" value="${pageType}"/>
<input type="hidden" id="status" value="${status}"/>
<input type="hidden" id="isEdit" value="${isEdit}"/>

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
            "paging": false
        });
    });

    $(function () {
        var status = $("#status").val();
        var pageType = $("#pageType").val();
        var isEdit = $("#isEdit").val();
        if (isEdit == 1) {
            $('#comCode').prop('readonly', true);
        }
        if (pageType == 1) {
            if (status == 'true') {
                window.location.href = "./company";
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

    function checkCompanyCode(code) {
        var comCode = code.value;
        var isEdit = $("#isEdit").val();
        if (isEdit != 1) {
            $.ajax({
                url: '${root}/allocation/checkCompanyCode/' + comCode,
                success: function (data) {
                    if (!data) {
                        $("#comCode").focus();
                        $("#comCode").addClass("txtError");
                        $("#comCode").val("");
                        swal({
                            title: 'Warning',
                            text: 'Duplicate  Company code !! Try again...!',
                            type: 'warning',
                            timer: 3000
                        })
                    } else {
                        $("#comCode").removeClass("txtError");
                    }
                },
                error: function () {

                }
            });
        }
    }

    function onDelete(id) {
        var trId = $(id).closest('tr').attr('id');
        swal({
            title: 'Are you sure?',
            text: "You won't be able to revert this!",
            type: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Yes, delete it!'
        }).then(function () {
            $.ajax({
                url: '${root}/allocation/deleteCompany/' + trId,
                success: function (data) {
                    if (data == 1) {
                        swal(
                            'Deleted!',
                            'Your file has been deleted.',
                            'success'
                        )
                        var row = id.parentNode.parentNode;
                        row.parentNode.removeChild(row);
                    } else if (data == 2) {
                        swal(
                            'Sorry!',
                            'Company Code already used !!',
                            'warning'
                        )
                    } else {
                        swal(
                            'Sorry!',
                            'Can\'t Delete Company Code !!',
                            'warning'
                        )
                    }
                }
            });
        })
    }


</script>