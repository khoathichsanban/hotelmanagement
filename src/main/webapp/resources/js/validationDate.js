$('#dateFrom').datepicker({
    onSelect: function(dateText, inst){
        $('#dateTo').datepicker('option', 'minDate', new Date(dateText));
    },
});

$('#dateTo').datepicker({
    onSelect: function(dateText, inst){
        $('#dateFrom').datepicker('option', 'maxDate', new Date(dateText));
    }
});

