<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <title>Бронирование билета</title>
</head>
<body>
<%
    String row = request.getParameter("row");
    String cell = request.getParameter("cell");
%>
<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script>
    function validate() {
        let result = '';
        if ($('#username').val() === '') {
            result = result + 'Введите Ваше имя' + '\n';
        }
        if ($('#phone').val() === '') {
            result = result + 'Введите номер телефона для связи с Вами' + '\n';
        }
        if (result !== '') {
            alert(result);
            return false
        }
        return true;
    }
</script>

<div class="container">
    <div class="row pt-3">
        <h3>
            Вы выбрали ряд <%= row %> место <%= cell %>, Сумма : 500 рублей.
        </h3>
    </div>
    <div class="row">
        <form action="<%= request.getContextPath() %>/buyTicket.do?row=<%= row %>&cell=<%= cell %>" method="post">
            <div class="form-group">
                <label for="username">ФИО</label>
                <input type="text" class="form-control" id="username" placeholder="ФИО" name="username">
            </div>
            <div class="form-group">
                <label for="phone">Номер телефона</label>
                <input type="text" class="form-control" id="phone" placeholder="Номер телефона" name="phone">
            </div>
            <button type="submit" class="btn btn-success" onclick="return validate();">Оплатить</button>
        </form>
    </div>
</div>
</body>
</html>