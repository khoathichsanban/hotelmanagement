            $(function () {
                $("#date_From").datepicker({
                    numberOfMonths: 2,
                    onSelect: function (selected) {
                        var dt = new Date(selected);
                        dt.setDate(dt.getDate() + 1);
                        $("#date_To").datepicker("option", "minDate", dt);
                    }
                });
                $("#date_To").datepicker({
                    numberOfMonths: 2,
                    onSelect: function (selected) {
                        var dt = new Date(selected);
                        dt.setDate(dt.getDate() - 1);
                        $("#date_From").datepicker("option", "maxDate", dt);
                    }
                });
            });
