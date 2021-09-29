$(document).ready(function () {
    $('#new_quote').click(function () {
        $.ajax({
            url: "/services/get_quote",
            type: "GET",
            success: function (data) {
                // append data to your page
                $("#quote_box").html(data['quote']);
                $("#rating_box").html(data['rating']);

                if (data['did_rate'] == false) {
                    $("#rate_value").show();
                    $("#rate_quote").show();
                }
            },
            error: function (data) {
                alert("There was an error processing this request");
            }
        });
    });
    $('#rate_quote').click(function () {
        var quote_string = $("#quote_box").text();
        var dropdown_rank = $('#rate_value').find(":selected").text();

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
                $("#rate_value").hide();
                $("#rate_quote").hide();
            },
            error: function (data) {
                alert("There was an error processing this request");
            }
        });
    });
});
