
function AuditEventsManagement() { 
    
    var tableHolder = "";
    var tableRoles = "";
    var BaseUrl = "";
    var _this = null;

    var PagingInfo = null;


    return {
        initManagement: function (Holder, BaseUrlString) {
            _this = this;
            BaseUrl = BaseUrlString;
            tableHolder = Holder;
            tableRoles = $("#" + tableHolder);

            _this.typingTimer = 0;
            _this.doneTypingInterval = 700;

            _this.PagingInfo = {
                HolderName: tableRoles.attr("id"),
                CurrentPage: tableRoles.attr("data-current-page"),
                ItemsPerPage: tableRoles.attr("data-items-per-page"),
                SortColumn: tableRoles.attr("data-sort-column"),
                SortOrderAsc: tableRoles.attr("data-sort-order-asc") == "true",
                Search: tableRoles.attr("data-filter-audit-event-search"),
                spinner: null
            }

            $("#audit-events-search").val(_this.PagingInfo.Search)

            window.onpopstate = function (e) {
                if (e.state) {
                    _this.Reload(e.state, true);
                }
            };

            this.InitAuditEventsPaging();
            this.InitHandlers();

            this.initParam(_this.PagingInfo);
            this.removeFocusFrame();
        },

        removeFocusFrame: function () {
            var links = document.getElementsByTagName('a');
            for (var i = 0; i < links.length; i++) {
                links[i].onmousedown = function () {
                    this.blur();
                    return false;
                }
                links[i].onclick = function () {
                    this.blur();
                }
                if (/msie/i.test(navigator.userAgent) && !/opera/i.test(navigator.userAgent)) {
                    links[i].onfocus = function () {
                        this.blur();
                    }
                }
            }
        },

        initParam: function (pagingInfo) {
            if (window.history.pushState) {
                window.history.replaceState(pagingInfo, '');
                var params = "p=" + pagingInfo.CurrentPage + "&s=" + pagingInfo.ItemsPerPage + "&c=" + pagingInfo.SortColumn + "&o=" + (pagingInfo.SortOrderAsc ? "1" : "2") + (pagingInfo.Search.length > 0 ? "&q=" + encodeURIComponent(pagingInfo.Search) : "")

                if (BaseUrl.indexOf("?") > 0)
                    window.history.pushState(pagingInfo, '', BaseUrl + "/?" + params);
            }
        },

        InitAuditEventsPaging: function () {

            $(".audit-event-select").bind('click', function () {
                $(this).parent().parent().children().toggleClass("row-higlighted");
            });

            $(".audit-event-select-all-chb").bind("click", function (e) {

                if ($(".audit-event-select-all-chb").is(':checked')) {
                    $(".audit-event-select").prop('checked', true);
                    $(".audit-event-select").parent().parent().children().addClass("row-higlighted");
                }
                else {
                    $(".audit-event-select").prop('checked', false);
                    $(".audit-event-select").parent().parent().children().removeClass("row-higlighted");
                }
            });

            $(".role-sort-column").bind("click", function (e) {
                if ($(this).index() > 0) {

                    if (_this.PagingInfo.SortColumn == $(this).index())
                        _this.PagingInfo.SortOrderAsc = !_this.PagingInfo.SortOrderAsc
                    else
                        _this.PagingInfo.SortOrderAsc = true;

                    _this.PagingInfo.SortColumn = $(this).index();
                    _this.Reload(_this.PagingInfo);
                }
            });

            var callback = function (page_index, jq) {
                var spinner = $(jq).find("div");
                $(spinner).removeClass("glyphicon glyphicon-refresh glyphicon-refresh-animate");

                if (page_index == parseInt($("#" + tableHolder).attr("data-current-page")) - 1)
                    return false;
                var Table = $("#" + tableHolder);

                _this.PagingInfo.HolderName = tableHolder;
                _this.PagingInfo.CurrentPage = page_index + 1;
                _this.PagingInfo.ItemsPerPage = parseInt(Table.attr("data-items-per-page"));
                _this.PagingInfo.SortOrderAsc = Table.attr("data-sort-order-asc") == "true";
                _this.PagingInfo.SortColumn = Table.attr("data-sort-column");
                _this.PagingInfo.Search = Table.attr("data-filter-audit-event-search");

                _this.PagingInfo.spinner = $(spinner);

                $(spinner).addClass("glyphicon glyphicon-refresh glyphicon-refresh-animate");
                _this.Reload(_this.PagingInfo);

                // Prevent click eventpropagation
                return false;
            };

            $("#table-audit-events-pagination-top-" + tableHolder).pagination(parseInt($("#" + tableHolder).attr("data-total-items")),
            {
                callback: callback,
                items_per_page: parseInt($("#" + tableHolder).attr("data-items-per-page")),      // Number of items per page
                current_page: parseInt($("#" + tableHolder).attr("data-current-page")) - 1,      // Current page number
                num_display_entries: 8,             // Number of pagination links shown
                num_edge_entries: 2,                // Number of start and end points
                prev_text: "Prev",                  // Previous" label
                next_text: "Next"                   // "Next" labe
            });

            $("#table-audit-events-pagination-bottom-" + tableHolder).pagination(parseInt($("#" + tableHolder).attr("data-total-items")),
            {
                callback: callback,
                items_per_page: parseInt($("#" + tableHolder).attr("data-items-per-page")),      // Number of items per page
                current_page: parseInt($("#" + tableHolder).attr("data-current-page")) - 1,      // Current page number
                num_display_entries: 8,             // Number of pagination links shown
                num_edge_entries: 2,                // Number of start and end points
                prev_text: "Prev",                  // Previous" label
                next_text: "Next"                   // "Next" labe
            });
        },

        Reload: function (pagingInfo, history, scroll) {

            var _scroll = true

            if (scroll != undefined || scroll != null)
                _scroll = scroll;

            if (pagingInfo == undefined) {
                pagingInfo = _this.PagingInfo;
                history = false;
            }

            $("#div-" + pagingInfo.HolderName).fadeTo("fast", 0.5, function () {

            });

            var Info = {
                HolderName: pagingInfo.HolderName,
                CurrentPage: pagingInfo.CurrentPage,
                ItemsPerPage: pagingInfo.ItemsPerPage,
                SortColumn: pagingInfo.SortColumn,
                SortOrderAsc: pagingInfo.SortOrderAsc,
                Search: pagingInfo.Search
            };

            if (!history && window.history.pushState) {
                var params = "p=" + pagingInfo.CurrentPage + "&s=" + pagingInfo.ItemsPerPage + "&c=" + pagingInfo.SortColumn + "&o=" + (pagingInfo.SortOrderAsc ? "1" : "2") + (pagingInfo.Search.length > 0 ? "&q=" + encodeURIComponent(pagingInfo.Search) : "");

                window.history.pushState(Info, '', BaseUrl + "/?" + params);
            }

            $.ajax({
                type: "POST",
                url: BaseUrl + "/GetAuditEvents",
                dataType: "json",
                contentType: 'application/json; charset=utf-8',
                data: JSON.stringify(Info),
                cache: false,
                success: function (data) {
                    $("#div-" + tableHolder).html(data.Html);
                    $(pagingInfo.spinner).removeClass("glyphicon glyphicon-refresh glyphicon-refresh-animate");
                    _this.InitAuditEventsPaging();

                    if (_scroll) {
                        setTimeout(function (e) {
                            $.scrollTo($("body"), { duration: 900, axis: 'y' });
                        }, 500);
                    }

                    _this.PagingInfo = Info;
                    $("#audit-events-search").val(_this.PagingInfo.Search)
                    $("#div-" + pagingInfo.HolderName).fadeTo('fast', 1, function () {

                    });

                    $(".audit-item-details").bind("click", function (e) {
                        e.preventDefault();
                        App.DialogGet(BaseUrl + "/GetAuditEventDetailsDialog", e, { AuditEventItem: parseInt($(this).attr("data-audit-event-id")) });
                        return false;
                    });
                },
                error: function (xhr, textStatus, errorThrown) {
                    App.DialogError(xhr, textStatus, errorThrown);
                    $(pagingInfo.spinner).removeClass("glyphicon glyphicon-refresh glyphicon-refresh-animate");
                    $("#div-" + pagingInfo.HolderName).fadeTo('slow', 1, function () {

                    });

                }
            });
        },

        //Detect keystroke and only execute after the user has finish typing
        delayExecute: function () {
            clearTimeout(_this.typingTimer);
            _this.typingTimer = setTimeout(
                function () {
                    _this.somethingExecuted()
                },
                _this.doneTypingInterval);
            return true;
        },

        somethingExecuted: function () {
            _this.Reload(_this.PagingInfo);
        },

        InitHandlers: function () {

            $("#refresh-member").bind("click", function (e) { _this.Reload(_this.PagingInfo, null, false); });
            $("#btn-audit-search").bind("click", function (e) { _this.Reload(_this.PagingInfo); });

            $("#audit-events-search").bind("keyup", function (e) {
                if (e.keyCode < 41 && e.keyCode != 8)
                    return;

                _this.PagingInfo.Search = $(this).val();

                if (e.keyCode == 13) {
                    clearTimeout(_this.typingTimer);
                    _this.ReloadMembers(_this.PagingInfo);
                    return;
                }

                _this.delayExecute();
            });

            $(".audit-item-details").bind("click", function (e) {
                e.preventDefault();
                App.DialogGet(BaseUrl + "/GetAuditEventDetailsDialog", e, { AuditEventItem: parseInt($(this).attr("data-audit-event-id")) });
                return false;
            });

            $("#remove-event-all").bind("click", function (e) {
                var __this = _this;

                if (confirm("Are you sure to remove all items")) {
                    // Removing file by AJAX request
                    $.ajax({
                        type: "POST",
                        url: BaseUrl + "/RemoveAuditEvents",
                        dataType: "json",
                        contentType: 'application/json; charset=utf-8',
                        data: {},
                        cache: false,
                        success: function (data) {
                            switch (data.NotifyType) {
                                case 0: $("#general-message").html(data.Html); break
                                case 1: $("#general-message").html(data.Html); break
                                case 2: $(data.Html).prependTo('body'); break;
                            };

                            if (data.NotifyType == 1)
                                $("body").animate({ scrollTop: 0 }, 'slow');

                            __this.Reload(__this.PagingInfo, null, false);
                        },
                        error: function (xhr, textStatus, errorThrown) {
                            App.DialogError(xhr, textStatus, errorThrown);

                        }
                    });
                }
            });

            /////////////////////////////////////////////////////////////////////////////
            $("#remove-event").bind("click", function (e) {
                var _checked = [];
                var __this = _this;
                $(".audit-event-select").each(function (e) {
                    if ($(this).is(':checked'))
                        _checked.push(parseInt($(this).attr("data-audit-event-id")));
                });

                if (_checked.length == 0) {
                    alert("Please, select items and try again.")
                    return false;
                }

                if (confirm("Are you sure to remove selected items")) {
                    // Removing file by AJAX request
                    $.ajax({
                        type: "POST",
                        url: BaseUrl + "/RemoveAuditEvents",
                        dataType: "json",
                        contentType: 'application/json; charset=utf-8',
                        data: JSON.stringify(_checked),
                        cache: false,
                        success: function (data) {
                            switch (data.NotifyType) {
                                case 0: $("#general-message").html(data.Html); break
                                case 1: $("#general-message").html(data.Html); break
                                case 2: $(data.Html).prependTo('body'); break;
                            };

                            if (data.NotifyType == 1)
                                $("body").animate({ scrollTop: 0 }, 'slow');

                            __this.Reload(__this.PagingInfo, null, false);
                        },
                        error: function (xhr, textStatus, errorThrown) {
                            App.DialogError(xhr, textStatus, errorThrown);

                        }
                    });
                }
            });


        }

    }
};