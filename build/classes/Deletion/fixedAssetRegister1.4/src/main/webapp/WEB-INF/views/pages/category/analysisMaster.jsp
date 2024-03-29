<%--
  Created by IntelliJ IDEA.
  User: MsD
  Date: 12/6/2017
  Time: 8:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="root" value="${pageContext.request.contextPath}" />

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
        background: url(${root}/resources/images/Preloader_3.gif) center
        no-repeat #fff;
        opacity: .8;
    }
</style>

<!-- Paste this code after body tag -->
<div class="se-pre-con"></div>
<!-- Ends -->
<div class="row">
    <div class="col-md-7">
        <div class="page">
            <form name="analysisDataForm"
                  action="${root}/category/saveAnalysisData" method="post">

                <div class="row" style="margin: 0">
                    <legend>Analysis code</legend>
                </div>
                <input type="hidden" name="anaCodeId" value="${analysis.anaCodeId}" />
                <div class="row">

                    <div class="col-md-12">
                        <div class="row">
                            <div class="col-md-4">Code</div>
                            <div class="col-md-6">
                                <input type="text" onblur="checkAnalysisCode(this)" class="uppercase" name="anaCode"
                                       id="anaCodeID" maxlength="3" required="required" value="${analysis.anaCode}"
                                       style="width: 100%"/>
                            </div>
                            <div class="col-md-2"></div>

                        </div>
                        <div class="clearfix"></div>
                        <div class="row">
                            <div class="col-md-4">Description</div>
                            <div class="col-md-6">
                                <textarea name="description"  required = "required" maxlength="35" style="width: 100%">${analysis.description}</textarea>
                            </div>
                            <div class="col-md-2"></div>
                        </div>

                        <div class="row">
                            <div class="col-md-4"></div>
                            <div class="col-md-8">

                                <div class="row">
                                    <div class="col-md-3">
                                        <button type="button"  class="btn btn-primary" style="width: 100%">Help</button>
                                    </div>
                                    <div class="col-md-3" style="margin-top: 3px">
                                        <a class="btn btn-primary" style="width: 100%" href="${root}/data/analysisData">New</a>
                                    </div>
                                    <div class="col-md-3">
                                        <c:choose>
                                            <c:when test="${analysis.anaCodeId > 0 }">
                                                <button type="submit" class="btn btn-primary" style="width: 100%">Update</button>
                                            </c:when>
                                            <c:otherwise>
                                                <button type="submit" class="btn btn-primary" style="width: 100%">Save</button>
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
                <th>Analysis Code</th>
                <th>Description</th>
                <th>Edit</th>
                <th>Delete</th>
            </tr>
            </thead>

            <tbody>
            <c:forEach var="analysisData" items="${analysisData}">
                <tr id="${analysisData.anaCodeId}">
                    <td>${analysisData.anaCode}</td>
                    <td>${analysisData.description}</td>
                    <td><a href="${root}/category/editAnalysisData/${analysisData.anaCodeId}"><i
                            class="fa fa-pencil-square-o"></i></a></td>
                    <td><a onclick="onDelete(this)"><i class="fa fa-trash-o"></i></a></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<input type="hidden" id="pageType" value="${pageType}" />
<input type="hidden" id="status" value="${status}" />

<script type="text/javascript">
    $(window).load(function() {
        // Animate loader off screen
        $(".se-pre-con").fadeOut("slow");
    });

    $('.btnSubmit').click(function() {
        $(".se-pre-con").show();
    });

    $(document).ready(function() {
        $('#dataTable').DataTable({
            "scrollY" : "300px",
            "scrollCollapse" : true,
            "paging" : false
        });
    });

    $(function() {
        var status = $("#status").val();
        var pageType = $("#pageType").val();
        if (pageType == 1) {
            window.location.href = "./analysisData";
            if (status == 'true') {
                swal({
                    title : 'success!',
                    type : 'success',
                    timer : 2000
                })
            } else {
                swal({
                    title : 'Error !',
                    text : 'Analysis Code Added Fail !!',
                    type : 'error',
                    timer : 2000
                })
            }
        }
    });
    function checkAnalysisCode(code) {
        var mainCode = code.value;
        $.ajax({
            url: '${root}/category/checkAnalysisCode/' + mainCode,
            success : function(data) {
                if(!data) {
                    $("#anaCodeID").focus();
                    $("#anaCodeID").addClass("txtError");
                    $("#anaCodeID").val("");
                    swal({
                        title: 'Warning',
                        text: 'Duplicate Analysis code !! Try again...!',
                        type: 'warning',
                        timer: 3000
                    })
                } else {
                    $("#mainCode").removeClass("txtError");
                }
            },
            error : function() {

            }
        });
    }
    <%--href="${root}/category/editMainCategory/${mainCategory.mcatId}"--%>
    function clickToEdit(id) {
        alert(id);
        $.ajax({
            url : '${root}/category/editableToMainCode/' + id,
            success : function (data) {
                if(data) {
                    $('#editForm').attr('action', '${root}/category/editMainCategory/'+id);
                    $('#editForm').submit();
                }else {
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
                url : '${root}/data/deleteAnalysisData/'+trId,
                success: function (data) {
                    if(data == 1) {
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
                            'Analysis already used !!',
                            'warning'
                        )
                    } else {
                        swal(
                            'Sorry!',
                            'Can\'t Delete Analysis Code!!',
                            'warning'
                        )
                    }
                }
            });
        })
    }


</script>