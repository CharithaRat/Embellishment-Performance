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
            <form name="cityForm"
                  action="${root}/location/saveCity" method="post">

                <div class="row" style="margin: 0">
                    <legend>City Details</legend>
                </div>
                <input type="hidden" name="cityId" value="${city.cityId}"/>
                <div class="row">
                    <div class="col-md-12">
                        <div class="row">
                            <div class="col-md-3">City</div>
                            <div class="col-md-6">
                                <input type="text" class="uppercase" id="cityCode" onkeyup="validateCharacter(this)"
                                       onblur="checkCompanyCode(this),validateMasterCode(this)"
                                       value="${city.cityCode}" maxlength="3" required="required" name="cityCode"
                                       style="width: 100%"/>
                            </div>
                            <div class="col-md-3"></div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="row">
                            <div class="col-md-3">Description</div>
                            <div class="col-md-6">
                                <input type="text" name="description" maxlength="35" value="${city.description}"
                                       required="required"
                                       style="width: 100%"/>
                            </div>
                            <div class="col-md-3"></div>
                        </div>
                        <div class="row" style="margin-top: 15px">
                            <div class="col-md-3"></div>
                            <div class="col-md-6">

                                <div class="row">
                                    <div class="col-md-6">
                                        <a class="btn btn-primary" style="width: 100%"
                                           href="${root}/location/city">New</a>
                                    </div>
                                    <div class="col-md-6">

                                        <c:choose>
                                            <c:when test="${city.cityId > 0 }">
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
                                </div>
                            </div>
                            <div class="col-md-3"></div>

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
                <th>City Code</th>
                <th>Description</th>
                <th>Edit</th>
                <th>Delete</th>

            </tr>
            </thead>

            <tbody>
            <c:forEach var="city" items="${cityList}">
                <tr id="${city.cityId}">
                    <td>${city.cityCode}</td>
                    <td>${city.description}</td>
                    <td><a href="${root}/location/editCity/${city.cityId}"><i class="fa fa-pencil-square-o"></i></a>
                    </td>
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
            $('#cityCode').prop('readonly', true);
        }
        if (pageType == 1) {
            if (status == 'true') {
                window.location.href = "./city";
                swal({
                    title: 'success!',
                    type: 'success',
                    timer: 2000
                })
            } else {
                swal({
                    title: 'Error !',
                    text: 'City Added Fail !!',
                    type: 'error',
                    timer: 2000
                })
            }
        }
    });
    function checkCompanyCode(code) {
        var cityCode = code.value;
        $.ajax({
            url: '${root}/location/checkCityCode/' + cityCode,
            success: function (data) {
                if (!data) {
                    $("#cityCode").focus();
                    $("#cityCode").addClass("txtError");
                    $("#cityCode").val("");
                    swal({
                        title: 'Warning',
                        text: 'Duplicate  City code !! Try again...!',
                        type: 'warning',
                        timer: 3000
                    })
                } else {
                    $("#cityCode").removeClass("txtError");
                }
            },
            error: function () {

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
                url: '${root}/location/deleteCity/' + trId,
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
                            'City Code already used !!',
                            'warning'
                        )
                    } else {
                        swal(
                            'Sorry!',
                            'Can\'t Delete City Code !!',
                            'warning'
                        )
                    }
                }
            });
        })
    }


</script>