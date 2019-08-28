<%--
  Created by IntelliJ IDEA.
  User: MsD
  Date: 11/12/2017
  Time: 9:09 PM
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
<div class="col-md-12 page">

    <div class="row">
        <div class="col-md-6">
            <form name="reasonForm"
                  action="${root}/category/saveReason" method="post">
                <input type="hidden" name="reasonId" value="${rs.reasonId}">
                <div class="row" style="margin: 0">
                    <legend>Disposal Category</legend>
                </div>

                <div class="row">
                    <div class="col-md-2">Reason</div>
                    <div class="col-md-10">
                        <textarea required name="reason" maxlength="45" style="width: 80%">${rs.reason}</textarea>
                    </div>
                    </div>
                <div class="row" style="padding-top: 10px">
                    <div class="col-md-2"></div>
                    <div class="col-md-4">
                        <a class="btn btn-primary" style="width: 100%" href="${root}/category/disposalCategory">New</a>
                    </div>
                    <div class="col-md-4">
                        <c:choose>
                            <c:when test="${rs.reasonId > 0 }">
                                <button type="submit" class="btn btn-primary btnSubmit"
                                        style="width: 100%">
                                    Update
                                </button>
                            </c:when>
                            <c:otherwise>
                                <button type="submit" class="btn btn-primary" style="width: 100%">Save</button>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
        </form>

        </div>

    <div class="col-md-6">
        <table id="dataTable" class="display compact" width="100%" cellspacing="0">
            <thead>
            <tr>
                <th>Reason</th>
                <th>Edit</th>
                <th>Delete</th>
            </tr>
            </thead>

            <tbody>
            <c:forEach var="reason" items="${reasons}">
                <tr id="${reason.reasonId}">
                    <td>${reason.reason}</td>
                    <td><a href="${root}/category/editReason/${reason.reasonId}"><i
                            class="fa fa-pencil-square-o"></i></a></td>
                    <td><a onclick="onDelete(this)"><i class="fa fa-trash-o"></i></a></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>


    </div>
</div>
</div>
</div>

<input type="hidden" id="pageType" value="${pageType}"/>
<input type="hidden" id="status" value="${status}"/>

<script>

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
        if (pageType == 1) {
            if (status == 'true') {
                window.location.href = "./disposalCategory";
                swal({
                    title: 'success!',
                    type: 'success',
                    timer: 2000
                })
            } else {
                swal({
                    title: 'Error',
                    text: 'Please try again !!',
                    type: 'error',
                    timer: 2000
                })
            }
        }

    });

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
                url: '${root}/category/deleteReason/' + trId,
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
                            'Reason already used !!',
                            'warning'
                        )
                    } else {
                        swal(
                            'Sorry!',
                            'Can\'t Delete Disposal Reason !!',
                            'warning'
                        )
                    }
                }
            });
        })
    }
</script>