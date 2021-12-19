
$('#payment-submit').click(function () {
    var creditCardName = $('#fullName').val();
    var creditCardNumber = $('#cardNumber').val();
    var creditCardExpDate = $('#expDate').val();
    var creditCardCVV = $('#cvvCode').val();
    $.ajax({
        url: 'http://localhost:8080/Spring_MVC_Project_Hotel_Management/api/payment-return-message',
        type: 'get',
        data: {
            fullName: creditCardName,
            cardNumber: creditCardNumber,
            expDate: creditCardExpDate,
            cvvCode: creditCardCVV
        },
        success: function (value) {
            if (value === 'error1') {
                $('#message-payment').text('Please enter credit card infomation');
            } else if (value === 'error2') {
                $('#message-payment').text('CVV code or exp date is incorrect');
            } else if (value === 'error3') {
                $('#message-payment').text('Your credit card is expired');
            }else if (value === 'error4') {
                $('#message-payment').text('Your credit card is not enough money');
            }  
            else {
                document.querySelector('#payment-submit').classList.add('display-change-payment');
                document.querySelector('#change-button').classList.remove('display-change-payment');
                $('#message-payment').text('you have successfully payment. Please check your email');
            }
        }
    });
});




