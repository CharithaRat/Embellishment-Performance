<%--
Created by IntelliJ IDEA.
User: MsD
Date: 10/7/2017
Time: 7:46 AM
To change this template use File | Settings | File Templates.
--%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<%--<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>--%>

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

    .redMsg {
        color: #E50000;
    }

    [src=''] {
        visibility: hidden;
    }
</style>

<!-- Paste this code after body tag -->
<div class="se-pre-con"></div>
<!-- Ends -->
<div class="row">
    <div class="col-md-8">
        <div class="page">
            <form id="assetFormID"
                  action="${root}/data/saveAsset" method="post">
                <div class="row" style="margin: 0">
                    <legend>Asset Registration</legend>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <div class="row">
                            <div class="col-md-4">Main Category Code <label class="redMsg">*</label></div>
                            <div class="col-md-5">
                                <select id="mainCategoryId" required class="select_style" onblur="loadSubCategory()"
                                        name=""
                                        style="width: 100%">
                                    <option value="">---SELECT---</option>
                                    <c:forEach var="mainCats" items="${mainCategory}">
                                        <%--<c:if test="${asset.assetCatergoryDetail.assetCatergorySub.assetCatergoryMain.mcatId == mainCats.mcatId}">--%>
                                            <%--<option selected value="${mainCats.mcatId}">${mainCats.mcatCode}--%>
                                                <%--- ${mainCats.mcatDes}</option>--%>
                                        <%--</c:if>--%>
                                        <option value="${mainCats.mcatId}">${mainCats.mcatCode}
                                            - ${mainCats.mcatDes}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="col-md-3"></div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">Sub Category Code<label class="redMsg">*</label></div>
                            <div class="col-md-5">
                                <select id="subCategoryId" required class="select_style" onblur="loadDetailCategory()"
                                        name=""
                                        style="width: 100%">
                                    <%--<c:if test="${asset.assetCatergoryDetail.assetCatergorySub.scatId > 0}">--%>
                                        <%--<option selected value="${asset.assetCatergoryDetail.assetCatergorySub.scatId}">${asset.assetCatergoryDetail.assetCatergorySub.scatCode}--%>
                                            <%--- ${asset.assetCatergoryDetail.assetCatergorySub.mcatDes}</option>--%>
                                    <%--</c:if>--%>

                                    <option value="">---SELECT---</option>
                                </select>
                            </div>
                            <div class="col-md-3"></div>

                        </div>

                        <div class="row">
                            <div class="col-md-4">Detail Category Code <label class="redMsg">*</label></div>
                            <div class="col-md-5">
                                <select id="detailCategoryListId" required class="select_style"
                                        onblur="generateAssetCode()"
                                        name="assetCatergoryDetail.dcatId"
                                        style="width: 100%">
                                    <%--<c:if test="${asset.assetCatergoryDetail.dcatId > 0}">--%>
                                        <%--<option selected value="${asset.assetCatergoryDetail.dcatId}">${asset.assetCatergoryDetail.dcatId}--%>
                                            <%--- ${asset.assetCatergoryDetail.dcatDes}</option>--%>
                                    <%--</c:if>--%>
                                    <option value="">---SELECT---</option>

                                </select>
                            </div>
                            <div class="col-md-3"></div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">Asset Code <label class="redMsg">*</label></div>
                            <div class="col-md-5">
                                <input type="text" required readonly id="assetCode" style="width: 100%" value="${asset.asCode}"
                                       name="asCode"/>
                            </div>
                            <div class="col-md-3"></div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">Asset Description</div>
                            <div class="col-md-5">
                                <textarea name="asDes" maxlength="35" style="width: 100%">${asset.asDes}</textarea>
                            </div>
                            <div class="col-md-3">

                                <img id='barcode'
                                  src=""
                                  alt=""
                                  width="50" height="50"/></div>
                        </div>


                        <div class="row">
                            <div class="col-md-4">Previous Asset Code</div>
                            <div class="col-md-5">
                                <input type="text" id="assetCodeOld" style="width: 100%" value="${asset.asCodeOld}" name="asCodeOld"/>
                            </div>
                            <div class="col-md-3"></div>
                        </div>

                        <div class="row" style="padding-bottom: 10px">
                            <div class="col-md-4">Analysis Code</div>
                            <div class="col-md-5">
                                <select id="analysisCode" class="select_style"  name="analysisCode"
                                        style="width: 100%">
                                    <option value="0">---SELECT---</option>
                                    <%--<c:if test="${asset.analysisCode != ''}">--%>
                                        <%--<option selected value="${asset.analysisCode}">${asset.analysisCode}</option>--%>
                                    <%--</c:if>--%>
                                    <c:forEach items="${analysiCodes}" var="analysiCodes">
                                        <option value="${analysiCodes.anaCode}">${analysiCodes.anaCode}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="col-md-3"></div>
                            <%--https://codepen.io/oknoblich/pen/EAzBc--%>
                        </div>
                        <div class="row" style="padding-bottom: 10px">
                            <div class="col-md-4">Related Document</div>
                            <div class="col-md-5">
                                <input type="file">
                            </div>
                            <div class="col-md-3"></div>
                        </div>
                        <div class="wrapper tab">
                            <div class='breadcrumbs'>
                                <div class='inner'>
                                    <ul class="tabs clearfix cf" data-tabgroup="first-tab-group">
                                        <li>
                                            <a href="#tab1" class="active">
                                                <span>1</span>
                                                <span>Purchase</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#tab2">
                                                <span>2</span>
                                                <span>Primary</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#tab3">
                                                <span>3</span>
                                                <span>Allocation</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#tab4">
                                                <span>4</span>
                                                <span>Accounting</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#tab5">
                                                <span>5</span>
                                                <span>Depreciation</span>
                                            </a>
                                        </li>

                                    </ul>
                                </div>
                            </div>

                            <section id="first-tab-group" class="tabgroup">
                                <div id="tab1">
                                    <div class="row">
                                        <div class="col-md-3">Purchase Order No.</div>
                                        <div class="col-md-4">
                                            <input type="text" maxlength="25" style="width: 100%" value="${asset.poNo}" id="poNoId"
                                                   name="poNo"/>
                                        </div>
                                        <div class="col-md-5"></div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-3">Purchase Order Date</div>
                                        <div class="col-md-4">
                                            <div class='input-group date'>
                                                <input type='text' class="form-control" value="${asset.poDate}" id="poDateId" name="poDate"/>
                                                <span class="input-group-addon">
                                                <span class="glyphicon glyphicon-calendar"></span>
                                                </span>
                                            </div>
                                        </div>
                                        <div class="col-md-5"></div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-3">GRN No.</div>
                                        <div class="col-md-4">
                                            <input type="text" maxlength="25" style="width: 100%" value="${asset.grnNo}" id="grnNoId"
                                                   name="grnNo"/>
                                        </div>
                                        <div class="col-md-5"></div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-3">GRN Date</div>
                                        <div class="col-md-4">
                                            <div class='input-group date'>
                                                <input type='text' class="form-control" onchange="checkGRNDate(this)"
                                                       id="grnDateId" name="grnDate" value="${asset.grnDate}"/>
                                                <span class="input-group-addon">
                                                <span class="glyphicon glyphicon-calendar"></span>
                                                </span>
                                            </div>
                                        </div>
                                        <div class="col-md-5"></div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-3">Issue Note No.</div>
                                        <div class="col-md-4">
                                            <input type="text" maxlength="25" style="width: 100%" id="issueNoteNoId"
                                                   value="${asset.issueNoteNo}" name="issueNoteNo"/>
                                        </div>
                                        <div class="col-md-5"></div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-3">Issue Note Date</div>
                                        <div class="col-md-4">
                                            <div class='input-group date'>
                                                <input type='text' class="form-control" onchange="checkIssueDate(this)"
                                                       id="issueNoteDateId"
                                                       name="issueNoteDate" value="${asset.issueNoteDate}"/>
                                                <span class="input-group-addon">
                                                <span class="glyphicon glyphicon-calendar"></span>
                                                </span>
                                            </div>
                                        </div>
                                        <div class="col-md-5"></div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-3">Supplier Invoice No.</div>
                                        <div class="col-md-4">
                                            <input type="text" maxlength="25" style="width: 100%" value="${asset.suppliersInvoiceNo}"
                                                   id="suppliersInvoiceNoId" name="suppliersInvoiceNo"/>
                                        </div>
                                        <div class="col-md-5"></div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-3">Invoice Date</div>
                                        <div class="col-md-4">
                                            <div class='input-group date'>
                                                <input type='text' class="form-control" id="invoiceDateId"
                                                       name="invoiceDate" value="${asset.invoiceDate}"/>
                                                <span class="input-group-addon">
                                                <span class="glyphicon glyphicon-calendar"></span>
                                                </span>
                                            </div>
                                        </div>
                                        <div class="col-md-5"></div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-3">Supplier Name</div>
                                        <div class="col-md-4">
                                            <input type="text" style="width: 100%" maxlength="45" id="supplierNameId"
                                                   value="${asset.supplierName}"
                                                   name="supplierName"/>
                                        </div>
                                        <div class="col-md-5"></div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-3">Address</div>
                                        <div class="col-md-4">
                                            <input type="text" style="width: 100%" maxlength="45" id="addressId"
                                                   name="address" value="${asset.address}"/>
                                        </div>
                                        <div class="col-md-5"></div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-3">Telephone No.</div>
                                        <div class="col-md-4">
                                            <input type="text" maxlength="20" onkeypress="return isNumberOnly(event)"
                                                   style="width: 100%" value="${asset.telephoneNo}" id="telephoneNoId" name="telephoneNo"/>
                                        </div>
                                        <div class="col-md-2"></div>
                                    </div>
                                </div>
                                <div id="tab2">
                                    <div class="row">
                                        <div class="col-md-4">Purchased Date <label class="redMsg">*</label></div>
                                        <div class="col-md-5">
                                            <div class='input-group date'>
                                                <input type='text' class="form-control" id="purchaseDate"
                                                       required="required" value="${asset.purDate}" name="purDate"/>
                                                <span class="input-group-addon">
                                                <span class="glyphicon glyphicon-calendar"></span>
                                                </span>
                                            </div>
                                        </div>
                                        <div class="col-md-3"></div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-4">Registered Date <label class="redMsg">*</label></div>
                                        <div class="col-md-5">
                                            <div class='input-group date'>
                                                <input type='text' class="form-control" onchange="checkRegDate(this)"
                                                       id="regDate" required="required" value="${asset.regDate}" name="regDate"/>
                                                <span class="input-group-addon">
                                                <span class="glyphicon glyphicon-calendar"></span>
                                                </span>
                                            </div>
                                        </div>
                                        <div class="col-md-3"></div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-4">No of Units <label class="redMsg">*</label></div>
                                        <div class="col-md-5">
                                            <input type="text" required id="noOfUnitId" style="width: 100%"
                                                   class="numeric" maxlength="16"
                                                   onkeypress="return isNumberOnly(event)" onchange="callTotal()"
                                                   value="${asset.noOfUnit}" name="noOfUnit"/>
                                        </div>
                                        <div class="col-md-3"></div>
                                    </div>

                                    <div class="row" style="">
                                        <div class="col-md-4">Currency Type <label class="redMsg">*</label></div>
                                        <div class="col-md-5">
                                            <select id="currencyId" required class="select_style" name="currencyType"
                                                    style="width: 100%">
                                                <option value="0">---SELECT---</option>
                                                <c:forEach items="${currencyTypes}" var="currencyType">
                                                    <%--<c:if test="${asset.currencyType == currencyType.currencyId}">--%>
                                                        <%--<option selected value="${currencyType.currencyId}">${currencyType.currencyCode}</option>--%>
                                                    <%--</c:if>--%>
                                                    <option value="${currencyType.currencyId}">${currencyType.currencyCode}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div class="col-md-3"></div>

                                    </div>

                                    <div class="row">
                                        <div class="col-md-4">Unit Price <label class="redMsg">*</label></div>
                                        <div class="col-md-5">
                                            <input type="text" required class="numeric" style="width: 100%"
                                                   maxlength="16" onkeyup="isNumber(this)" onchange="callTotal()"
                                                   value="${asset.unitPrice}" name="unitPrice"/>
                                        </div>
                                        <div class="col-md-3"></div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-4">Amount <label class="redMsg">*</label></div>
                                        <div class="col-md-5">
                                            <input type="text" readonly maxlength="16" style="width: 100%"
                                                   value="${asset.amount}" name="amount"/>
                                        </div>
                                        <div class="col-md-3"></div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-4">Asset Manufacturer’s Reg.No.</div>
                                        <div class="col-md-5">
                                            <input type="text" maxlength="35" style="width: 100%" value="${asset.manRegNo}" name="manRegNo"/>
                                        </div>
                                        <div class="col-md-3"></div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-4">Manufacturer</div>
                                        <div class="col-md-5">
                                            <input type="text" maxlength="50" style="width: 100%" value="${asset.manufacturer}" name="manufacturer"/>
                                        </div>
                                        <div class="col-md-3"></div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-4">Original Cost</div>
                                        <div class="col-md-5">
                                            <input type="text" style="width: 100%" value="${asset.originalCost}" name="originalCost"/>
                                        </div>
                                        <div class="col-md-3"></div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-4">Funding Sources</div>
                                        <div class="col-md-5">
                                            <textarea name="fundingSource" maxlength="100"
                                                      style="width: 100%">${asset.fundingSource}</textarea>
                                        </div>
                                        <div class="col-md-3"></div>
                                    </div>
                                </div>
                                <div id="tab3">
                                    <div class="row">
                                        <div class="col-md-3">Company <label class="redMsg">*</label></div>
                                        <div class="col-md-5">
                                            <select id="comId" required onblur="loadDepartments()" class="select_style"
                                                    style="width: 100%">
                                                <option value="">---SELECT---</option>
                                                <%--<c:if test="${assetLocation.sectionMaster.departmentMaster.companyMaster.comId > 0}">--%>
                                                    <%--<option selected value="${assetLocation.sectionMaster.departmentMaster.companyMaster.comId}">${assetLocation.sectionMaster.departmentMaster.companyMaster.comCode}--%>
                                                        <%--- ${assetLocation.sectionMaster.departmentMaster.companyMaster.comDes}</option>--%>
                                                <%--</c:if>--%>
                                                <c:forEach var="companyList" items="${companyList}">
                                                    <option value="${companyList.comId}">${companyList.comCode}
                                                        - ${companyList.comDes}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div class="col-md-4"></div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-3">Department/Branch <label class="redMsg">*</label></div>
                                        <div class="col-md-5">
                                            <select name="" required id="departmentId" class="select_style"
                                                    onblur="loadSections()"
                                                    style="width: 100%">
                                                <option value="">---SELECT---</option>
                                                <%--<c:if test="${assetLocation.sectionMaster.departmentMaster.depId > 0}">--%>
                                                    <%--<option selected value="${assetLocation.sectionMaster.departmentMaster.depId}">${assetLocation.sectionMaster.departmentMaster.depCode}--%>
                                                        <%--- ${assetLocation.sectionMaster.departmentMaster.depDes}</option>--%>
                                                <%--</c:if>--%>
                                            </select>

                                        </div>
                                        <div class="col-md-4"></div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-3">Section <label class="redMsg">*</label></div>
                                        <div class="col-md-5">
                                            <select id="sectionId" required onblur="loadLocation()" class="select_style"
                                                    style="width: 100%">
                                                <option value="">---SELECT---</option>
                                            </select>
                                        </div>
                                        <div class="col-md-4"></div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-3">Location <label class="redMsg">*</label></div>
                                        <div class="col-md-5">
                                            <select name="locationMaster.locId" required id="locationId" class="select_style"
                                                    style="width: 100%">
                                                <option value="">---SELECT---</option>
                                            </select>

                                        </div>
                                        <div class="col-md-4"></div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-3">Authorized Personnel</div>
                                        <div class="col-md-5">
                                            <input type="text" maxlength="45" style="width: 100%" name="authPerson" value="${asset.authPerson}"/>
                                        </div>
                                        <div class="col-md-4"></div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-3">Leasing</div>
                                        <div class="col-md-5">
                                            <select name="isLeasing" class="select_style"
                                                    style="width: 100%">
                                                <option selected value="0">No</option>
                                                <option value="1">Yes</option>
                                            </select>
                                        </div>
                                        <div class="col-md-4"></div>
                                    </div>
                                </div>
                                <div id="tab4">
                                    <div class="row">
                                        <div class="col-md-3">Ledger Code</div>
                                        <div class="col-md-4">
                                            <input type="text" maxlength="25" id="ledgerCodeId" value="${asset.ledgerCode}" name="ledgerCode"/>
                                        </div>
                                        <div class="col-md-5"></div>
                                    </div>
                                </div>
                                <div id="tab5">
                                    <div class="row">
                                        <div class="col-md-3">Life Time  <label class="redMsg">*</label></div>
                                        <div class="col-md-5">
                                            <input type="text" maxlength="11" id="lifeTimeId" value="${asset.lifeTime}"
                                                   onkeypress="return isNumberOnly(event)"
                                                   name="lifeTime"/>
                                            <label>Month(s)</label>

                                        </div>
                                        <div class="col-md-4"></div>
                                    </div>

                                </div>

                            </section>
                        </div>

                        <div class="row" style="margin-top: 15px">
                            <div class="col-md-4"></div>
                            <div class="col-md-6">

                                <div class="row">
                                    <div class="col-md-6">
                                        <a class="btn btn-primary" style="width: 100%" href="${root}/data/asset">New</a>
                                    </div>
                                    <div class="col-md-6">
                                        <button type="submit" class="btn btn-primary" style="width: 100%">Save</button>
                                    </div>
                                    <div class="col-md-3"></div>

                                </div>

                            </div>
                            <div class="col-md-2"></div>

                        </div>
                    </div>
                </div>

            </form>
        </div>
    </div>
    <div class="col-md-4">
        <%--<div><input type="text" id="" placeholder="Transaction No"></div>--%>
        <table id="dataTable" class="display compact" width="100%" cellspacing="0">
            <thead>
            <tr>
                <th>TransactionNo</th>
                <th>Date</th>
                <th>Delete</th>
            </tr>
            </thead>

            <tbody>
            <c:forEach var="asset" items="${assets}">
                <tr id="${asset.transactionNo}">
                    <td>${asset.transactionNo}</td>
                    <td>${asset.regDate}</td>
                    <%--<td><a href="${root}/data/editAsset/${asset.transactionNo}"><i--%>
                            <%--class="fa fa-pencil-square-o"></i></a></td>--%>
                    <td><a onclick="onDelete(this)"><i class="fa fa-trash-o"></i></a></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<input type="hidden" id="pageType" value="${pageType}"/>
<input type="hidden" id="status" value="${status}"/>
<input type="hidden" id="transactionNo" value="${transactionNo}"/>

<script type="text/javascript">


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

    $(function () {
        $('.date').datepicker({
            format: 'mm/dd/yyyy',
            autoclose: true
        });
    });

    function checkRegDate(date2) {
        var date1 = $("#purchaseDate").val();
        var d1 = dateFormator(date1);
        var d2 = dateFormator((date2.value))
        if ((d1.getTime() > d2.getTime())) {
            swal({
                title: 'Warning',
                text: 'Please select Registered Date after the Purchased Date!',
                type: 'warning'

            })
            $("#regDate").val("");
        }
    }

    function checkGRNDate(date2) {
        var date1 = $("#poDateId").val();
        var d1 = dateFormator(date1);
        var d2 = dateFormator((date2.value))
        if ((d1.getTime() > d2.getTime())) {
            swal({
                title: 'Warning',
                text: 'Please select Date after the Purchase Order Date!',
                type: 'warning'

            })
            $("#grnDateId").val("");
        }
    }

    function checkIssueDate(date2) {
        var date1 = $("#poDateId").val();
        var date3 = $("#grnDateId").val();
        var d1 = dateFormator(date1);
        var d2 = dateFormator((date2.value))
        var d3 = dateFormator((date3))
        if ((d1.getTime() > d2.getTime())) {
            swal({
                title: 'Warning',
                text: 'Please select Date after the Purchase Order Date!',
                type: 'warning'

            })
            $("#issueNoteDateId").val("");
        }
        if ((d3.getTime() > d2.getTime())) {
            swal({
                title: 'Warning',
                text: 'Please select Date after the GRN Date !',
                type: 'warning'

            })
            $("#issueNoteDateId").val("");
        }
    }


    $(window).load(function () {
        // Animate loader off screen
        $(".se-pre-con").fadeOut("slow");
    });

    $('#btnSubmit').click(function () {
        $(".se-pre-con").show();
    });

    $(document).ready(function () {
        $('#dataTable').DataTable({
            "scrollY": "800px",
            "scrollCollapse": true,
            "paging": false
        });
    });

    $(function () {
        var status = $("#status").val();
        var pageType = $("#pageType").val();
        var transactionNo = $("#transactionNo").val();
        if (pageType == 1) {
            if (status == 'true') {
                swal({
                    title: 'success! Transaction No : ' + transactionNo,
                    type: 'success',

                }).then(function () {
                    window.location.href = "./asset";
                })
            } else {
                swal({
                    title: 'Error',
                    text: 'Please try again !!',
                    type: 'error',
                }).then(function () {
                    window.location.href = "./asset";
                })
            }
        }
    });

    function loadSubCategory() {
        $("#subCategoryId").empty();
        var mainCat = $("#mainCategoryId").find("option:selected").val();
        $.ajax({
            url: '${root}/category/getSubCategoryList/' + mainCat,
            success: function (data) {
                for (var i = 0; i < data.length; i++) {
                    var sub = data[i];
                    var subCat = sub.split("-");
                    $("#subCategoryId").append(
                        "<option value = '" + subCat[0] + "'>" + subCat[1] + " - " + subCat[2]
                        + "</option>");
                }
            },
            error: function () {
                swal({
                    title: 'Warning',
                    text: 'Select Main Category...!',
                    type: 'warning',
                    timer: 3000
                })
            }
        });
    }

    function generateAssetCode() {
        $("#assetCode").val();
        var main = $("#mainCategoryId").find("option:selected").text();
        var sub = $("#subCategoryId").find("option:selected").text();
        var detail = $("#detailCategoryListId").find("option:selected").text();
        var detailCatId = $("#detailCategoryListId").find("option:selected").val();

        var manCat = main.split(" - ")[0].trim();
        var subCat = sub.split(" - ")[0].trim();
        var detailCat = detail.split(" - ")[0].trim();

        if (detailCat != "") {
            $.ajax({
                url: '${root}/category/getDetailsCatSerial/' + detailCatId,
                success: function (data) {
                    if (data != "No") {
                        var code = manCat + subCat + detailCat + data;
                        $("#assetCode").val(code.toUpperCase());
                        $('#assetCode').prop('readonly', true);
                       // var nric = $('#assetCode').val();
//                        if(nric!=""){
//                            var url = 'https://api.qrserver.com/v1/create-qr-code/?data=' + nric + '&amp;size=50x50';
//                            $('#barcode').attr('src', url);
//                        }
                    } else {
                        swal({
                            title: 'Warning',
                            text: 'Can\'t be create Asset Code !! Please try again',
                            type: 'warning',
                            timer: 3000
                        })
                    }
                }
            });
        }
    }

    function loadDetailCategory() {
        $("#detailCategoryListId").empty();
        var subCat = $("#subCategoryId").find("option:selected").val();
        $.ajax({
            url: '${root}/category/getDetailCategoryList/' + subCat,
            success: function (data) {
                for (var i = 0; i < data.length; i++) {
                    var det = data[i];
                    var detailCat = det.split("-");
                    $("#detailCategoryListId").append(
                        "<option value = '" + detailCat[0] + "'>" + detailCat[1] + " - " + detailCat[2]
                        + "</option>");
                }
            },
            error: function () {
                swal({
                    title: 'Warning',
                    text: 'Please select subcategory !!',
                    type: 'warning',
                    timer: 3000
                })
            }
        });
    }

    function loadDepartments() {
        $("#departmentId").empty();
        var comId = $("#comId").find("option:selected").val();
        $.ajax({
            url: '${root}/allocation/getDepartments/' + comId,
            success: function (data) {
                for (var i = 0; i < data.length; i++) {
                    var sub = data[i];
                    var subCat = sub.split("-");
                    $("#departmentId").append(
                        "<option value = '" + subCat[0] + "'>" + subCat[1] + " - " + subCat[2]
                        + "</option>");
                }
            },
            error: function () {
                swal({
                    title: 'Warning',
                    text: 'Please select company !!',
                    type: 'warning',
                    timer: 3000
                })
            }
        });
    }


    function loadSections() {
        $("#sectionId").empty();
        var departmentId = $("#departmentId").find("option:selected").val();
        $.ajax({
            url: '${root}/allocation/getSections/' + departmentId,
            success: function (data) {
                for (var i = 0; i < data.length; i++) {
                    var sub = data[i];
                    var subCat = sub.split("-");
                    $("#sectionId").append(
                        "<option value = '" + subCat[0] + "'>" + subCat[1] + " - " + subCat[2]
                        + "</option>");
                }
            },
            error: function () {
                swal({
                    title: 'Warning',
                    text: 'Please select department !!',
                    type: 'warning',
                    timer: 3000
                })
            }
        });
    }

    function loadLocation() {
        $("#locationId").empty();
        var sectionId = $("#sectionId").find("option:selected").val();
        $.ajax({
            url: '${root}/allocation/getLocations/' + sectionId,
            success: function (data) {
                for (var i = 0; i < data.length; i++) {
                    var sub = data[i];
                    var subCat = sub.split("-");
                    $("#locationId").append(
                        "<option value = '" + subCat[0] + "'>" + subCat[1] + " - " + subCat[2]
                        + "</option>");
                }
            },
            error: function () {
                swal({
                    title: 'Warning',
                    text: 'Please select section !!',
                    type: 'warning',
                    timer: 3000
                })
            }
        });
    }

    //    $( "#assetFormID" ).submit(function( event ) {
    //        var mainId = $("#mainCategoryId").find("option:selected").val();
    //        var subId = $("#subCategoryId").find("option:selected").val();
    //        var detailId = $("#detailCategoryListId").find("option:selected").val();
    //        var comId = $("#comId").find("option:selected").val();
    //        var depaId = $("#departmentId").find("option:selected").val();
    //        var secId = $("#sectionId").find("option:selected").val();
    //        var locId = $("#locationId").find("option:selected").val();
    //        var noOfUnit = $("#noOfUnitId").val();
    //
    //
    //        if(mainId == 0) {
    //            $("#mainCategoryId").addClass("txtError");
    //            $("#mainCategoryId").focus();
    //        } else if (subId == 0) {
    //            $("#subCategoryId").addClass("txtError");
    //            $("#subCategoryId").focus();
    //        } else if(detailId == 0) {
    //            $("#detailCategoryListId").addClass("txtError");
    //            $("#detailCategoryListId").focus();
    //        } else if(comId == 0) {
    //            $("#comId").addClass("txtError");
    //            $("#comId").focus();
    //        }else if(depaId == 0) {
    //            $("#departmentId").addClass("txtError");
    //            $("#departmentId").focus();
    //        }else if(secId == 0) {
    //            $("#sectionId").addClass("txtError");
    //            $("#sectionId").focus();
    //        }
    //        else if(locId == 0) {
    //            $("#locationId").addClass("txtError");
    //            $("#locationId").focus();
    //        }
    //        else if(noOfUnit == 0) {
    //            $("#noOfUnitId").addClass("txtError");
    //            $("#noOfUnitId").focus();
    //        }else {
    //            $("#assetFormID").submit();
    //        }
    //        event.preventDefault();
    //    });


    //        $("#assetFormID").submit(function(e){
    //
    //            var selects = $(".select_style");
    //
    //            var option_occurrences = {0:0, 1:0, 2:0, 3:0, 4:0, 5:0,6:0,7:0};
    //
    //            for (var i = 0; i < selects.length; i ++) {
    //                option_occurrences[selects[i].value] ++;
    //            }
    //
    //            var ok = true;
    //
    //            for (var i = 1; i <= Math.min(7, selects.length); i ++) {
    //                if (option_occurrences[i] != 1) {
    //                    ok = false;
    //                    break;
    //                }
    //            }
    //            if(!ok) {
    //                swal({
    //                    title: 'Warning',
    //                    text: 'Unsuccessfully !!',
    //                    type: 'warning',
    //                    timer: 3000
    //                })
    //            }
    //
    //            e.preventDefault();
    //        });
    //


    function callTotal() {
        var noOfUnit = $("input[name=noOfUnit]").val();
        var unitPrice = $("input[name=unitPrice]").val();

        if (noOfUnit != "" && unitPrice != "") {
            $("input[name=amount]").val(noOfUnit * unitPrice);
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
                url: '${root}/data/deleteAsset/' + trId,
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
                            'Assets already used !!',
                            'warning'
                        )
                    } else {
                        swal(
                            'Sorry!',
                            'Can\'t Delete Asset !!',
                            'warning'
                        )
                    }
                }
            });
        })
    }

</script>