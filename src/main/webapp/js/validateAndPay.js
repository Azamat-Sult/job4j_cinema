function validateAndPay() {
    let result = 'Выберите ряд и место';
    let radios = document.getElementsByName("place");
    let params ='';
    for (let i = 0; i < radios.length; i++) {
        if (radios[i].checked === true) {
            result = '';
            params = radios[i].value;
        }
    }
    if (result !== '') {
        alert(result);
        return false
    }
    window.location.href = document.location.href + "payment.jsp" + params;
}