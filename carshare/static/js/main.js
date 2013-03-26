$(function() {
    $( ".datepicker" ).datepicker();
});




$(function () {

    options = {
        pattern: 'yyyy-mm',
        selectedYear: 2014,
        startYear: 2013,
        finalYear: 2025,
    };


    $('#monthpicker').monthpicker(options);
});

// Initialize tooltips
$(function () {
    $("[data-toggle='tooltip']").tooltip();
});