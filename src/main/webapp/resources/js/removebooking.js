
function removeBooking(index) {
    console.log('sussces');
    $.ajax({
        type: "GET",
        url: "http://localhost:8080/Spring_MVC_Project_Hotel_Management/remove-booking-detail",
        data: {
            index: index
        },
        success: function (data) {
            $("#load-booking").html(data);
            console.log('aaaaaaaaaaa');
        },
        error: function (error) {
            alert(error);
        }
    });
}
;



