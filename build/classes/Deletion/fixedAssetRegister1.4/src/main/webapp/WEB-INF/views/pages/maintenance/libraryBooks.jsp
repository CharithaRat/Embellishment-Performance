<%--
  Created by IntelliJ IDEA.
  User: Dilusha Kumari
  Date: 1/30/2019
  Time: 1:20 PM
  To change this template use File | Settings | File Templates.
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

<!-- Paste this code after body tag -->
<div class="se-pre-con"></div>
<!-- Ends -->
<div class="col-md-6 page">
    <div class="row" style="margin: 0">
        <legend>Library Books</legend>
    </div>

    <div class="row">
        <div class="col-md-12">
            <form name="libraryBooksForm" action="${root}/maintenance/saveLibraryBooks" method="post">

                <div class="row">
                    <div class="col-md-4">Asset Code</div>
                    <div class="col-md-8">
                        <select class="chosen" id="assetCode" required
                                name="assetId" style="width: 100%" onchange="loadLibraryBooksDetails()">
                            <option value="">---SELECT---</option>
                            <c:forEach var="asset" items="${assets}">
                                <option value="${asset.asId}">${asset.asCode} - ${asset.asDes}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-4" style="">Author</div>
                    <div class="col-md-8">
                        <input type="text" required style="width: 100%" id="authorId" name="author" maxlength="100"
                        />
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4" style="">Editors</div>
                    <div class="col-md-8">
                        <input type="text" style="width: 100%" id="editorsId" name="editors" maxlength="100"
                               required/>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-4" style="">Place Of Publication</div>
                    <div class="col-md-8">
                        <input type="text" style="width: 100%" id="placeOfPublicationId"
                               name="placeOfPublication" maxlength="100" required/>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-4" style="">Publisher</div>
                    <div class="col-md-8">
                        <input type="text" style="width: 100%" id="publisherId" name="publisher"
                               maxlength="100" required/>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4">Date of Publication</div>
                    <div class="col-md-8">
                        <div class='input-group date' style="width: 102%">
                            <input type='text' required class="form-control"
                                   name="dateOfPublication"/>
                            <span class="input-group-addon">
                                <button style=height:25px;width:30px> <i style="font-size:15px;color:#3e71fb" class="fa fa-calendar"></i></button>
                                        <%--<span class="glyphicon glyphicon-calendar"></span>--%>
                                    </span>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-4" style="">No. Of Series</div>
                    <div class="col-md-8">
                        <input type="text" style="width: 100%" id="seriesNoId" name="seriesNo" maxlength="10"
                                onkeypress="return isNumberOnly(event)"
                               required/>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-4" style="">Edition</div>
                    <div class="col-md-8">
                        <input type="text" required style="width: 100%" id="editionId" name="edition" maxlength="10"
                               required/>
                    </div>

                </div>

                <div class="row">
                    <div class="col-md-4" style="">ISBN No.</div>
                    <div class="col-md-8">
                        <input type="text" required style="width: 100%" id="isbmNoId" name="isbmNo" maxlength="10"
                               required/>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-4" style="">Contents</div>
                    <div class="col-md-8">
                        <input type="text" required style="width: 100%" id="contentsId" name="contents" maxlength="100"
                               required/>
                    </div>

                </div>

                <div class="row">
                    <div class="col-md-4" style="">Comments</div>
                    <div class="col-md-8">
                        <input type="text" required style="width: 100%" id="commentsId" name="comments" maxlength="200"
                               required/>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6"></div>
                    <div class="col-md-3" style="margin-top: 2px">
                        <a class="btn btn-primary" style="width: 100%"
                           href="${root}/maintenance/libraryBooks">New</a>
                    </div>
                    <div class="col-md-3">
                        <button type="submit" class="btn btn-primary" style="width: 100%">Save</button>
                    </div>
                </div>

                <input type="hidden" name="libraryBookId" value="0">
            </form>
        </div>
    </div>

</div>


<input type="hidden" id="pageType" value="${pageType}"/>
<input type="hidden" id="status" value="${status}"/>


<script type="text/javascript">
    $(function () {
        $('.date').datepicker({
            format: 'dd/mm/yyyy',
            autoclose: true,
            endDate: '+0d'
        });
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
                window.location.href = "./libraryBooks";
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
    function loadLibraryBooksDetails() {
        var assetId = $("#assetCode").find("option:selected").val();

        $.ajax({
            url : '${root}/maintenance/loadLibraryBooksDetailsByAsset/' + assetId,
            success : function (data) {
                if(data != "") {
                    $("input[name=libraryBookId]").val(data.libraryBookId);
                    $("input[name=author]").val(data.author);
                    $("input[name=editors]").val(data.editors);
                    $("input[name=placeOfPublication]").val(data.placeOfPublication);
                    $("input[name=dateOfPublication]").val(dateFormator(data.dateOfPublication));
                    $("input[name=seriesNo]").val(data.seriesNo)
                    $("input[name=edition]").val(data.edition)
                    $("input[name=isbmNo]").val(data.isbmNo);
                    $("input[name=contents]").val(data.contents);
                    $("input[name=comments]").val(data.comments);
                    $("input[name=publisher]").val(data.publisher);
                }else{
                    $("input[name=libraryBookId]").val("0");
                    $("input[name=author]").val("");
                    $("input[name=editors]").val("");
                    $("input[name=placeOfPublication]").val("");
                    $("input[name=dateOfPublication]").val("");
                    $("input[name=seriesNo]").val("")
                    $("input[name=edition]").val("")
                    $("input[name=isbmNo]").val("");
                    $("input[name=contents]").val("");
                    $("input[name=comments]").val("");
                    $("input[name=publisher]").val("");
                }
            }
        });

    }
</script>