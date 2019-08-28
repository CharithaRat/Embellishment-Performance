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
            <form name="mainCatergoryForm" id="mainCatergory" action="${root}/category/saveMainCatergory" method="post">

                <div class="row" style="margin: 0">
                    <legend>Asset Category-Main</legend>
                </div>
                <input type="hidden" name="mcatId" value="${mainCat.mcatId}"/>
                <div class="row">

                    <div class="col-md-12">
                        <div class="row">
                            <div class="col-md-4">Main Code</div>
                            <div class="col-md-6">
                                <input type="text" class="uppercase" id="mainCode" onkeyup="validateCharacter(this)"
                                       onblur="checkMainCode(this),validateMasterCode(this)"
                                       name="mcatCode" maxlength="3" required="required" value="${mainCat.mcatCode}"
                                       style="width: 100%"/>
                            </div>
                            <div class="col-md-2"></div>

                        </div>
                        <div class="clearfix"></div>
                        <div class="row">
                            <div class="col-md-4">Description</div>
                            <div class="col-md-6">
                                <textarea name="mcatDes" maxlength="35" required="required"
                                          style="width: 100%">${mainCat.mcatDes}</textarea>
                            </div>
                            <div class="col-md-2"></div>
                        </div>

                        <div class="row" style="margin-top: 15px">
                            <div class="col-md-4"></div>
                            <div class="col-md-6">
                                <div class="row">
                                    <div class="col-md-6">
                                        <a class="btn btn-primary" style="width: 100%"
                                           href="${root}/category/mainCategory">New</a>
                                    </div>
                                    <div class="col-md-6">
                                        <c:choose>
                                            <c:when test="${mainCat.mcatId > 0 }">
                                                <button type="submit" class="btn btn-primary btnSubmit"
                                                        style="width: 100%">
                                                    Update
                                                </button>
                                            </c:when>
                                            <c:otherwise>
                                                <button type="submit" class="btn btn-primary btnSubmit"
                                                        style="width: 100%">Save
                                                </button>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                    <div class="col-md-2"></div>
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
                <th>Main Category Code</th>
                <th>Description</th>
                <th>Edit</th>
                <th>Delete</th>
            </tr>
            </thead>

            <tbody>
            <c:forEach var="mainCategory" items="${mainCategory}">
                <tr id="${mainCategory.mcatId}">
                    <td>${mainCategory.mcatCode}</td>
                    <td>${mainCategory.mcatDes}</td>
                    <td><a href="${root}/category/editMainCategory/${mainCategory.mcatId}"><i
                            class="fa fa-pencil-square-o"></i></a></td>
                    <td><a onclick="onDelete(this)"><i class="fa fa-trash-o"></i></a></td>

                </tr>
            </c:forEach>
            </tbody>
        </table>
        <%--href="${root}/category/editMainCategory/${mainCategory.mcatId}"--%>
    </div>
</div>


<form id="editForm"></form>
<input type="hidden" id="pageType" value="${pageType}"/>
<input type="hidden" id="status" value="${status}"/>
<input type="hidden" id="isEdit" value="${isEdit}"/>

<script type="text/javascript">
    $(window).load(function () {
// Animate loader off screen
        $(".se-pre-con").fadeOut("slow");
    });

    //    $('.btnSubmit').click(function (e) {
    //        $(".se-pre-con").show();
    //    });

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
            $('#mainCode').prop('readonly', true);
        }
        if (pageType == 1) {

            if (status == 'true') {
                window.location.href = "./mainCategory";
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

    function checkMainCode(code) {
        var mainCode = code.value;
        var isEdit = $("#isEdit").val();
        if (isEdit != 1) {
            $.ajax({
                url: '${root}/category/checkMainCode/' + mainCode,
                success: function (data) {
                    if (!data) {
                        $("#mainCode").focus();
                        $("#mainCode").addClass("txtError");
                        $("#mainCode").val("");
                        swal({
                            title: 'Warning',
                            text: 'Duplicate Main Category code !! Try again...!',
                            type: 'warning',
                            timer: 3000
                        })
                    } else {
                        $("#mainCode").removeClass("txtError");
                    }
                },
                error: function () {

                }
            });
        }

    }

    <%--href="${root}/category/editMainCategory/${mainCategory.mcatId}"--%>

    function clickToEdit(id) {
        alert(id);
        $.ajax({
            url: '${root}/category/editableToMainCode/' + id,
            success: function (data) {
                if (data) {
                    $('#editForm').attr('action', '${root}/category/editMainCategory/' + id);
                    $('#editForm').submit();
                } else {
                    swal({
                        title: 'Warning',
                        text: 'Can\'t Change Main Category code !!',
                        type: 'warning',
                        timer: 5000
                    })
                }
            }
        });
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
                url: '${root}/category/deleteMainCategory/' + trId,
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
                            'Main Category already used !!',
                            'warning'
                        )
                    } else {
                        swal(
                            'Sorry!',
                            'Can\'t Delete Main Category!!',
                            'warning'
                        )
                    }
                }
            });
        })
    }


</script>