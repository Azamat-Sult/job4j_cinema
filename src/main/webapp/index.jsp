<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"
            integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
            integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
            crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
            integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
            crossorigin="anonymous"></script>
    <script>
        $(document).ready(function () {
            $.ajax({
                type: 'GET',
                url: 'http://localhost:8080/cinema/loadHall',
                dataType: 'json'
            }).done(function (data) {
                let row = '<th style="width: 120px;">Ряд / Место</th>';
                for (let i = 1; i < data[0].length; i++) {
                    row += '<th>' + i + '</th>';
                }
                $('#tablehead').html(row);
                row = '';
                let disabled = '';
                let busy = ' (Свободно)';
                let bgcolor = ' style="background-color: lime;" ';
                for (let i = 1; i < data.length; i++) {
                    row += '<tr>'
                        + '<th>' + i + '</th>';
                    for (let j = 1; j < data[i].length; j++) {
                        if (data[i][j] === 1) {
                            disabled = 'disabled';
                            busy = ' (Занято)'
                            bgcolor = ' style="background-color: red;" ';
                        }
                        row += '<td' + bgcolor + '><input type="radio" name="place" value="?row=' + i + '&cell=' + j
                            + '"' + disabled + '> Ряд ' + i + ', Место ' + j + busy + '</td>';
                        disabled = '';
                        busy = ' (Свободно)';
                        bgcolor = ' style="background-color: lime;" ';
                    }
                    row += '</tr>';
                }
                $('#tablerows').html(row);
            }).fail(function (err) {
                console.log(err);
            });

        });
    </script>
    <script>
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
    </script>

    <title>Кинотеатр "Искра"</title>

    <meta http-equiv="refresh" content="30">

</head>
<body>
<div class="container">
    <div class="row pt-3">
        <h4>
            Бронирование места на сеанс
        </h4>
        <table class="table table-bordered">
            <thead>
            <tr id="tablehead">
            </tr>
            </thead>
            <tbody id="tablerows">
            </tbody>
        </table>
    </div>
    <div class="row float-right">
        <button type="button" class="btn btn-success" onclick="return validateAndPay();">Оплатить</button>
    </div>
</div>
</body>
</html>