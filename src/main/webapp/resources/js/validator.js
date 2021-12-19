function Validator(options) {
    function validate(selectElement, rule) {
        var errormessage = rule.test(selectElement.value);
        var errorElement = selectElement.parentElement.querySelector('.form-message');
        if (errormessage) {
            errorElement.innerText = errormessage;
            return errormessage;
        } else {
            errorElement.innerText = '';
        }
    }
    var formElement = document.querySelector(options.form);
    if (formElement) {
        options.rules.forEach(function (rule) {
            var selectElement = formElement.querySelector(rule.selector);

            if (selectElement) {
                selectElement.onblur = function () {
                    validate(selectElement, rule);
                };
                selectElement.onchange = function () {
                    validate(selectElement, rule);
                };

                selectElement.oninput = function () {
                    validate(selectElement, rule);
                };

            }

        });

        formElement.onsubmit = function (event) {
            check = true;
            check2 = true;
            options.rules.forEach(function (rule) {

                var selectElement = formElement.querySelector(rule.selector);

                if (validate(selectElement, rule)) {
                    check = false;
                    return;
                }

            });
            var elementIdCards = document.querySelectorAll('.validate-id-card');
            var inputElementCard = document.querySelector('#id-card');
            if(elementIdCards && inputElementCard) {
                elementIdCards.forEach(function (elementIdCard) {
                    if (inputElementCard.value === elementIdCard.value) {
                        console.log('Số CMND/Hộ chiếu bị trùng trước đó');
                        var errorElement2 = inputElementCard.parentElement.querySelector('.form-message');
                        errorElement2.innerText = 'Số CMND/Hộ chiếu bị trùng trước đó';
                        check2 = false;
                        return;
                    } 
            })
            }
            console.log('kich lai ');
            if (!check || !check2) {
                event.preventDefault();
            }
        };

    }
}
;

            Validator.isCheckIn = function (selector) {

                return {
                    selector: selector,
                    test: function (value) {
                        if (value === 'dd / mm / yyyy') {
                            return 'Please select check in date';
                        } else {
                            return undefined;
                        }
                    }
                };
            };

            Validator.isCheckOut = function (selector) {

                return {
                    selector: selector,
                    test: function (value) {
                        if (value === 'dd / mm / yyyy') {
                            return 'Please select check out date';
                        } else {
                            return undefined;
                        }
                    }
                };
            };

            Validator.isFullName = function (selector) {

                return {
                    selector: selector,
                    test: function (value) {
                        if (value === '') {
                            return 'Please enter full name';
                        } else {
                            return undefined;
                        }
                    }
                };
            };
            Validator.isEmail = function (selector) {

                return {
                    selector: selector,
                    test: function (value) {
                        if (value === '') {
                            return 'Please enter email';
                        } else {
                            return undefined;
                        }
                    }
                };
            };
            Validator.isGender = function (selector) {

                return {
                    selector: selector,
                    test: function (value) {
                        if (value === '') {
                            return 'Please select gender';
                        } else {
                            return undefined;
                        }
                    }
                };
            };
            Validator.isPhoneNumber = function (selector) {

                return {
                    selector: selector,
                    test: function (value) {
                        var numberPhone = /^(?:[0-9]\d*|\d)$/;
                        if (value === '') {
                            return 'Please enter phone number';
                        } else if (!numberPhone.test(value) || value.length != 10) {
                            return 'Phone number is not valid';
                        } else {
                            return undefined;
                        }
                    }
                };
            };

            Validator.isBirthDay = function (selector) {

                return {
                    selector: selector,
                    test: function (value) {
                        if (value === '') {
                            return 'Please select birthdate';
                        } else {
                            return undefined;
                        }
                    }
                };
            };
            
            Validator.isExpDate = function (selector) {

                return {
                    selector: selector,
                    test: function (value) {
                        if (value === '') {
                            return 'Please select ExpDate';
                        } else {
                            return undefined;
                        }
                    }
                };
            };
            
            Validator.isAddress = function (selector) {

                return {
                    selector: selector,
                    test: function (value) {
                        if (value === '') {
                            return 'Please enter address';
                        } else {
                            return undefined;
                        }
                    }
                };
            };

            Validator.isIdCard = function (selector) {

                return {
                    selector: selector,
                    test: function (value) {

                        var idCard = /^(?:[0-9]\d*|\d)$/;
                        if (value ==='') {
                            return 'please enter Id card';
                        } else if (!idCard.test(value) || value.length != 9) {
                            return 'Your ID card is not valid';
                        } else {
                            return undefined;
                        }
                        ;
                    }
                }
            };
            
            Validator.isCardNumber = function (selector) {

                return {
                    selector: selector,
                    test: function (value) {

                        var idCard = /^(?:[0-9]\d*|\d)$/;
                        if (value ==='') {
                            return 'please enter Card Number';
                        } else if (!idCard.test(value) || value.length != 9) {
                            return 'Your Card number is not valid';
                        } else {
                            return undefined;
                        }
                        ;
                    }
                }
            };
            
             Validator.isCvvCode = function (selector) {

                return {
                    selector: selector,
                    test: function (value) {

                        var idCard = /^(?:[0-9]\d*|\d)$/;
                        if (value ==='') {
                            return 'please enter CVV code';
                        } else if (!idCard.test(value) || value.length != 3) {
                            return 'Your CVV code is not valid';
                        } else {
                            return undefined;
                        }
                        ;
                    }
                }
            };
            

