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