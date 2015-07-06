

 /////////////////////////////////////////////////////////////////////////////
$(function () {
    $("body").on("click", ".reload-labels", function (e) {
        e.preventDefault();

        var _this = this;
        var url = $(this).attr("data-url");
        var _btn = e.currentTarget;

        if (confirm("Are you sure to reload labels?")) {

            $(_btn).button('loading')
            $(_this).attr("disabled", "disabled");

            // Removing file by AJAX request
            $.ajax({
                type: "POST",
                url: url,
                dataType: "json",
                contentType: 'application/json; charset=utf-8',
                data: JSON.stringify({ id: -1 }),
                cache: false,
                success: function (data) {
                    if (data.Html) {
                        $(".app-languages").html(data.Html);
                    }

                    $(_this).removeAttr("disabled");
                    $(_btn).button('reset');
                },
                error: function (xhr, textStatus, errorThrown) {

                    App.DialogError(xhr, textStatus, errorThrown);

                    $(_this).removeAttr("disabled");
                    $(_btn).button('reset');
                }
            });

        };

        return false;
    });

});

// http://stackoverflow.com/questions/7131909/facebook-callback-appends-to-return-url
if (window.location.hash == '#_=_') {
    window.location.hash = ''; // for older browsers, leaves a # behind
    history.pushState('', document.title, window.location.pathname); // nice and clean
    e.preventDefault(); // no page reload
};