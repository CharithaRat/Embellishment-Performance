// Master Code Length
var masterCodeLength = 3;
var MAIN_CODE = 3;
var SUB_CODE = 3;
var DETAIL_CODE = 3;

function isNumber(evt) {
    var val = $(evt).val();

    if (isNaN(val)) {
        val = val.replace(/[^0-9\.]/g, '');
        if (val.split('.').length > 2)
            val = val.replace(/\.+$/, "");
    }
    $(evt).val(val);
}

function isNumberOnly(evt) {
    evt = (evt) ? evt : window.event;
    var charCode = (evt.which) ? evt.which : evt.keyCode;
    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
        return false;
    }
    return true;
}

function validateCharacter(code) {
    if (/[^a-zA-Z0-9\-\/]/.test(code.value)) {
        $("#" + ($(code).attr('id'))).val("");
        swal(
            'Sorry!',
            'Input is not alphanumeric',
            'warning'
        )
        return false;
    }
    return true;
}

function validatePercentageField(code) {
    var taxValuvePercentage = parseInt(code.value);
    if (taxValuvePercentage <= 0 || taxValuvePercentage >= 100) {
        $("#" + $(code).attr('id')).val("");
        $("#" + $(code).attr('id')).focus();
        swal({
            title: 'Sorry !',
            text: 'Please the correct percentage. ',
            type: 'error',
            timer: 5000
        })
        return false;
    }
}

function formatDate(date) {
    var d = new Date(date),
        month = '' + (d.getMonth() + 1),
        day = '' + d.getDate(),
        year = d.getFullYear();

    if (month.length < 2) month = '0' + month;
    if (day.length < 2) day = '0' + day;

    return [year, month, day].join('-');
}

function dateFormator(date) {
    var d = new Date(date),
        month = '' + (d.getMonth() + 1),
        day = '' + d.getDate(),
        year = d.getFullYear();

    if (month.length < 2) month = '0' + month;
    if (day.length < 2) day = '0' + day;

    return [month,day,year].join('/');
}

function validateMasterCode(field) {
    var value = field.value;
    if (value.length != masterCodeLength) {
        $("#" + ($(field).attr('id'))).val("");
        swal({
            title: 'Sorry !',
            text: 'Master Code length is ' + masterCodeLength,
            type: 'warning'
        })
        $("#" + $(field).attr('id')).focus();
    }
}



