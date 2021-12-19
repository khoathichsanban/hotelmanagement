function removeService(index) {
    console.log('sussces');
    $.ajax({
        type: "GET",
        url: "http://localhost:8080/Spring_MVC_Project_Hotel_Management/remove-service",
        data: {
            index: index
        },
        success: function (data) {
            $("#load-service").html(data);

        },
        error: function (error) {
            alert(error);
        }
    });
}
;