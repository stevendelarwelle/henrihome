$(document).ready(function () {
    $('#new_quote').click(function () {
        $('#new_quote').prop('disabled', true);
        $.ajax({
            url: "/services/get_quote",
            type: "GET",
            success: function (data) {
                // append data to your page
                $("#quote_box").html(data['quote']);
                $("#rating_box").html(data['rating']);
                var did_rate = data['did_rate']
                if (did_rate == false) {
                    $("#rating_row").show();
                }else{
                    $("#rating_row").hide();
                }
            },
            error: function (data) {
                alert("There was an error processing this request");
            }

        });
        $('#new_quote').prop('disabled', false);
    });
    $('#rate_quote').click(function () {
        var quote_string = $("#quote_box").text();
        var dropdown_rank = $('#rate_value').find(":selected").text();
        $('#rate_quote').prop('disabled', true);
        $.ajax({
            url: "/services/rate_quote",
            type: "GET",
            data: {
                quote: quote_string,
                rank: dropdown_rank
            },
            success: function (data) {
                // append data to your page
                $("#rating_box").html(data['rating']);
                $("#rating_row").hide();
            },
            error: function (data) {
                alert("There was an error processing this request");
            }
        });
        $('#rate_quote').prop('disabled', false);
    });
});
