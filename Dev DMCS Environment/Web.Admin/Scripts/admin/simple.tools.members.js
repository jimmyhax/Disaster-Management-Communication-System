
function MembersManagement() { 
    
    var tableHolder = "";
    var tableRoles = "";
    var BaseUrl = "";
    var _this = null;

    var PagingInfo = null;
    var membersUploadDialog = null;

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
                AlphabetFilter: eval("[" + tableRoles.attr("data-alpha-filter") + "]"),
                RolesFilter: eval("[" + tableRoles.attr("data-role-filter") + "]"),
                RolesFilterCondition: tableRoles.attr("data-roles-filter-condition"),
                Search: tableRoles.attr("data-filter-member-search"),
                spinner: null
            }

            if (_this.PagingInfo.RolesFilterCondition == "or") {
                $("#filter-role-condition-or").addClass("active");
                $("#filter-role-condition-and").removeClass("active");
            }
            else if (_this.PagingInfo.RolesFilterCondition == "and") {
                $("#filter-role-condition-or").removeClass("active");
                $("#filter-role-condition-and").addClass("active");
            }

            $("#members-search").val(_this.PagingInfo.Search)

            window.onpopstate = function (e) {
                if (e.state) {
                    _this.ReloadMembers(e.state, true);
                }
            };

            this.InitMembersPaging();
            this.InitHandlers();

            this.initParam(_this.PagingInfo);
            this.initAlphaBar(_this.PagingInfo);
            this.intiRolesList(_this.PagingInfo);
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

        intiRolesList: function (Info) {
            $(".filter-by-role").removeClass("panel-roles-selected")

            for (var i = 0; i <= Info.RolesFilter.length; i++)
                $("#filter-role-id-" + Info.RolesFilter[i]).addClass("panel-roles-selected")

            if (Info.RolesFilter.length == 0)
                $("#filter-role-id-none").addClass("panel-roles-selected")
        },


        initAlphaBar: function (Info) {
            $(".alphabet-filter").each(function () {

                var filterIndex = parseInt($(this).attr("data-filter-index"));
                var found = false;

                for (var i = 0; i <= Info.AlphabetFilter.length; i++) {
                    if (Info.AlphabetFilter[i] == filterIndex) {
                        $(this).addClass("active");
                        found = true;
                        break;
                    }
                }

                if (!found)
                    $(this).removeClass("active");
            });
        },


        initParam: function (pagingInfo) {

            if (window.history.pushState) {
                window.history.replaceState(pagingInfo, '');
                var params = "p=" + pagingInfo.CurrentPage + "&s=" + pagingInfo.ItemsPerPage + "&c=" + pagingInfo.SortColumn + "&o=" + (pagingInfo.SortOrderAsc ? "1" : "2") + "&f=" + pagingInfo.RolesFilterCondition + (pagingInfo.Search.length > 0 ? "&q=" + encodeURIComponent(pagingInfo.Search) : "")

                if (pagingInfo.AlphabetFilter.length > 0)
                    params += "&a=" + JSON.stringify(pagingInfo.AlphabetFilter).replace("[", "").replace("]", "");

                if (pagingInfo.RolesFilter.length > 0)
                    params += "&r=" + JSON.stringify(pagingInfo.RolesFilter).replace("[", "").replace("]", "");

                if (BaseUrl.indexOf("?") > 0)
                    window.history.pushState(pagingInfo, '', BaseUrl + "/?" + params);
            }
        },

        InitMembersPaging: function () {

            $(".member-select").bind('click', function () {
                $(this).parent().parent().children().toggleClass("row-higlighted");
            });

            $(".member-select-all-chb").bind("click", function (e) {

                if ($(".member-select-all-chb").is(':checked')) {
                    $(".member-select").prop('checked', true);
                    $(".member-select").parent().parent().children().addClass("row-higlighted");
                }
                else {
                    $(".member-select").prop('checked', false);
                    $(".member-select").parent().parent().children().removeClass("row-higlighted");
                }
            });

            $(".role-sort-column").bind("click", function (e) {
                if ($(this).index() > 0) {

                    if (_this.PagingInfo.SortColumn == $(this).index())
                        _this.PagingInfo.SortOrderAsc = !_this.PagingInfo.SortOrderAsc
                    else
                        _this.PagingInfo.SortOrderAsc = true;

                    _this.PagingInfo.SortColumn = $(this).index();
                    _this.ReloadMembers(_this.PagingInfo);
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
                _this.PagingInfo.AlphabetFilter = eval("[" + Table.attr("data-alpha-filter") + "]");
                _this.PagingInfo.RolesFilter = eval("[" + Table.attr("data-role-filter") + "]");
                _this.PagingInfo.RolesFilterCondition = tableRoles.attr("data-roles-filter-condition");
                _this.PagingInfo.Search = tableRoles.attr("data-filter-member-search");

                _this.PagingInfo.spinner = $(spinner);

                $(spinner).addClass("glyphicon glyphicon-refresh glyphicon-refresh-animate");
                _this.ReloadMembers(_this.PagingInfo);

                // Prevent click eventpropagation
                return false;
            };

            $("#table-members-pagination-top-" + tableHolder).pagination(parseInt($("#" + tableHolder).attr("data-total-items")),
           {
               callback: callback,
               items_per_page: parseInt($("#" + tableHolder).attr("data-items-per-page")),      // Number of items per page
               current_page: parseInt($("#" + tableHolder).attr("data-current-page")) - 1,      // Current page number
               num_display_entries: 8,             // Number of pagination links shown
               num_edge_entries: 2,                // Number of start and end points
               prev_text: "Prev",                  // Previous" label
               next_text: "Next"                   // "Next" labe
           });

            $("#table-members-pagination-bottom-" + tableHolder).pagination(parseInt($("#" + tableHolder).attr("data-total-items")),
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

        ReloadMembers: function (pagingInfo, history, scroll) {

            var _history = history;
            var _scroll = true

            if (scroll != undefined || scroll != null)
                _scroll = scroll;

            if (pagingInfo == undefined) {
                pagingInfo = _this.PagingInfo;
                history = false;
            }

            $("#div-" + pagingInfo.HolderName).fadeTo('fast', 0.5, function () {

            });

            var Info = {
                HolderName: pagingInfo.HolderName,
                CurrentPage: pagingInfo.CurrentPage,
                ItemsPerPage: pagingInfo.ItemsPerPage,
                SortColumn: pagingInfo.SortColumn,
                SortOrderAsc: pagingInfo.SortOrderAsc,
                AlphabetFilter: pagingInfo.AlphabetFilter,
                RolesFilter: pagingInfo.RolesFilter,
                RolesFilterCondition: pagingInfo.RolesFilterCondition,
                Search: pagingInfo.Search
            };

            if (!history && window.history.pushState) {
                var params = "p=" + pagingInfo.CurrentPage + "&s=" + pagingInfo.ItemsPerPage + "&c=" + pagingInfo.SortColumn + "&o=" + (pagingInfo.SortOrderAsc ? "1" : "2") + "&f=" + pagingInfo.RolesFilterCondition + (pagingInfo.Search.length > 0 ? "&q=" + encodeURIComponent(pagingInfo.Search) : "")

                if (pagingInfo.AlphabetFilter.length > 0)
                    params += "&a=" + JSON.stringify(pagingInfo.AlphabetFilter).replace("[", "").replace("]", "");

                if (pagingInfo.RolesFilter.length > 0)
                    params += "&r=" + JSON.stringify(pagingInfo.RolesFilter).replace("[", "").replace("]", "");

                window.history.pushState(Info, '', BaseUrl + "/?" + params);
            }

            $.ajax({
                type: "POST",
                url: BaseUrl + "/GetMembers",
                dataType: "json",
                contentType: 'application/json; charset=utf-8',
                data: JSON.stringify(Info),
                cache: false,
                success: function (data) {
                    $("#div-" + tableHolder).html(data.Html);
                    $(pagingInfo.spinner).removeClass("glyphicon glyphicon-refresh glyphicon-refresh-animate");
                    _this.InitMembersPaging();
                    _this.initAlphaBar(Info);
                    _this.intiRolesList(Info);

                    if (_scroll) {
                        setTimeout(function (e) {
                            $.scrollTo($("body"), { duration: 900, axis: 'y' });
                        }, 700);
                    }

                    _this.PagingInfo = Info;
                    $("#members-search").val(_this.PagingInfo.Search)
                    $("#div-" + pagingInfo.HolderName).fadeTo('fast', 1, function () {

                    });

                },
                error: function (xhr, textStatus, errorThrown) {
                    App.DialogError(xhr, textStatus, errorThrown);
                    $(pagingInfo.spinner).removeClass("glyphicon glyphicon-refresh glyphicon-refresh-animate");
                    $("#div-" + pagingInfo.HolderName).fadeTo('fast', 1, function () {

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

        HighlightSearch: function () {
            if (_this.PagingInfo.Search) {
                // disable highlighting if empty
                $(".highlight-words").highlight(_this.PagingInfo.Search);
            }
            else {
                // highlight the new term
                $(".highlight-words" + _this.pagingInfo.HolderName).removeHighlight();
            }
        },

        somethingExecuted: function () {
            _this.ReloadMembers(_this.PagingInfo);
        },

        InitUpload: function () {
            var _this = this;
            var dialogId = "#div-members-importing";
            new AjaxUpload('#members-import-csv', {
                action: BaseUrl + "/ImportMembers",
                multiple: false,
                data: {},
                onSubmit: function (file, ext) {
                    _this.membersUploadDialog = App.DialogBootstrap(dialogId, 400, 100, true, {}, false);
                    this.setData({});
                },
                onComplete: function (file, response) {
                    
                    var _response = response.replace('<pre style="word-wrap: break-word; white-space: pre-wrap;">', "");
                    _response = _response.replace('</pre>', "");

                    if (response.indexOf("</pre") > 0) {
                        setTimeout(function () { 
                            var _data = JSON.parse(_response);

                            _data.Html = _data.Html.replace(/&lt;/g, '<');
                            _data.Html = _data.Html.replace(/&gt;/g, '>');
                            _data.Html = _data.Html.replace(/&amp;/g, '&');

                            $("#importing-notify-message").html(_data.Html);
                            $(".importing-message-spinner").remove();
                            $("body").animate({ scrollTop: 0 }, 'slow');
                        }, 1300);
                        return;
                    }
                    
                    _this.membersUploadDialog.close();

                    try {
                        var _data = JSON.parse(response);
                        setTimeout(function () { $(_data.Html).prependTo('body'); }, 300);
                        setTimeout(function () { _this.ReloadMembers(_this.PagingInfo, true) }, 1300);
                        _this.InitUpload();
                    }
                    catch (e) {
                        App.DialogError("", "", response);
                    }
                }
            });

        },

        InitHandlers: function () {

            $("#add-member").bind("click", function (e) { App.DialogGet(BaseUrl + "/GetNewMemberDialog", e); });
            $("body").on("click",".member-edit", function (e) { App.DialogGet(BaseUrl + "/GetEditMemberDialog", e, { MemberID: parseInt($(this).attr("data-member-id")) }); });
            $("#refresh-member").bind("click", function (e) { _this.ReloadMembers(_this.PagingInfo, null, false); });
            $("#btn-member-search").bind("click", function (e) { _this.ReloadMembers(_this.PagingInfo); });

            $("#members-search").bind("keyup", function (e) {

                _this.PagingInfo.Search = $(this).val();

                if (e.keyCode == 13) {
                    clearTimeout(_this.typingTimer);
                    _this.ReloadMembers(_this.PagingInfo);
                    return;
                }

                if (e.keyCode < 41 && e.keyCode != 8)
                    return;

                _this.delayExecute();
            });

            $("#filter-role-condition-or").bind("click", function (e) {
                e.preventDefault();
                $("#filter-role-condition-and").removeClass("active");
                if (!$(this).hasClass("active")) {
                    $(this).addClass("active");
                    _this.PagingInfo.RolesFilterCondition = "or";
                    _this.ReloadMembers(_this.PagingInfo);
                }
                return false;
            });

            $("#filter-role-condition-and").bind("click", function (e) {
                e.preventDefault();
                $("#filter-role-condition-or").removeClass("active");
                if (!$(this).hasClass("active")) {
                    $(this).addClass("active");
                    _this.PagingInfo.RolesFilterCondition = "and";
                    _this.ReloadMembers(_this.PagingInfo);
                }
                return false;
            });

            /////////////////////////////////////////////////////////////////////////////
            $("#alphabet-filter-clear").bind("click", function (e) {
                e.preventDefault();
                _this.PagingInfo.AlphabetFilter = [];
                _this.ReloadMembers(_this.PagingInfo);

                return false;
            });

            /////////////////////////////////////////////////////////////////////////////
            $(".alphabet-filter").bind("click", function (e) {
                e.preventDefault();
                var filterIndex = parseInt($(this).attr("data-filter-index"));

                var elementIndex = -1;
                var found = false;

                for (var i = 0; i <= _this.PagingInfo.AlphabetFilter.length; i++) {
                    elementIndex = i;

                    if (_this.PagingInfo.AlphabetFilter[i] == filterIndex) {
                        found = true
                        break;
                    }
                }

                if (!found) {
                    _this.PagingInfo.AlphabetFilter.push(filterIndex);
                    $(this).addClass("active");
                }
                else {
                    _this.PagingInfo.AlphabetFilter.splice(elementIndex, 1);
                    $(this).removeClass("active");
                }

                _this.ReloadMembers(_this.PagingInfo);
                return false;
            });

            /////////////////////////////////////////////////////////////////////////////
            $(".filter-by-role").bind("click", function (e) {
                e.preventDefault();
                _this.PagingInfo.RolesFilter = [];

                if ($(this).attr("data-role-id") > 0) {

                    $(this).toggleClass("panel-roles-selected");
                    $(".filter-by-role").each(function (e) {
                        if ($(this).hasClass("panel-roles-selected")) {

                            var roleId = parseInt($(this).attr("data-role-id"));
                            if (roleId > 0)
                                _this.PagingInfo.RolesFilter.push(roleId);
                        }
                    });
                }

                _this.ReloadMembers(_this.PagingInfo);
                return false;
            });

            /////////////////////////////////////////////////////////////////////////////

            $("body").on("click","#generate-send-password", function (e) {
                var _spinner = $(this).attr("data-spinner-id");
                if (confirm("Are you sure to generate and sent random password ?")) {

                    $(".generate-password").button('loading')
                    $("#notify-message").html("")

                    $("#" + _spinner).addClass("glyphicon glyphicon-refresh glyphicon-refresh-animate");
                    $.ajax({
                        type: "POST",
                        url: BaseUrl + "/SendRandomPassword",
                        dataType: "json",
                        contentType: 'application/json; charset=utf-8',
                        data: JSON.stringify({ Email: $(this).attr("data-member-email") }),
                        cache: false,
                        success: function (data) {

                            switch (data.NotifyType) {
                                case 0: $("#general-message").html(data.Html); break
                                case 1: $("#notify-message").html(data.Html); break;
                                case 2: $(data.Html).prependTo('body'); break;
                            };

                            $("#" + _spinner).removeClass("glyphicon glyphicon-refresh glyphicon-refresh-animate");
                            $(".generate-password").button('reset')
                        },
                        error: function (xhr, textStatus, errorThrown) {
                            App.DialogError(xhr, textStatus, errorThrown);
                            $("#" + _spinner).removeClass("glyphicon glyphicon-refresh glyphicon-refresh-animate");
                            $(".generate-password").button('reset')
                        }
                    });
                }
            });

            /////////////////////////////////////////////////////////////////////////////

            $("body").on("click","#generate-member-token", function (e) {
                var _spinner = $(this).attr("data-spinner-id");
                if (confirm("Are you sure to generate member token ?")) {

                    $(".generate-member-token").button('loading')
                    $("#notify-message").html("")

                    $("#" + _spinner).addClass("glyphicon glyphicon-refresh glyphicon-refresh-animate");
                    $.ajax({
                        type: "POST",
                        url: BaseUrl + "/GenerateMemberToken",
                        dataType: "json",
                        contentType: 'application/json; charset=utf-8',
                        data: JSON.stringify({ Email: $(this).attr("data-member-email") }),
                        cache: false,
                        success: function (data) {

                            switch (data.NotifyType) {
                                case 0: $("#general-message").html(data.Html); break
                                case 1: $("#notify-message").html(data.Html); break;
                                case 2: $(data.Html).prependTo('body'); break;
                            };

                            $("#" + _spinner).removeClass("glyphicon glyphicon-refresh glyphicon-refresh-animate");
                            $(".generate-member-token").button('reset')

                            if (data.TokenPanel)
                                $(".member-token-tab").html(data.TokenPanel);
                        },
                        error: function (xhr, textStatus, errorThrown) {
                            App.DialogError(xhr, textStatus, errorThrown);
                            $("#" + _spinner).removeClass("glyphicon glyphicon-refresh glyphicon-refresh-animate");
                            $(".generate-member-token").button('reset')
                        }
                    });
                }
            });


            /////////////////////////////////////////////////////////////////////////////

            $("body").on("click","#remove-member-token", function (e) {
                var _spinner = $(this).attr("data-spinner-id");
                if (confirm("Are you sure to remove member token ?")) {

                    $(".remove-member-token").button('loading')
                    $("#notify-message").html("")

                    $("#" + _spinner).addClass("glyphicon glyphicon-refresh glyphicon-refresh-animate");
                    $.ajax({
                        type: "POST",
                        url: BaseUrl + "/RemoveMemberToken",
                        dataType: "json",
                        contentType: 'application/json; charset=utf-8',
                        data: JSON.stringify({ Email: $(this).attr("data-member-email") }),
                        cache: false,
                        success: function (data) {

                            switch (data.NotifyType) {
                                case 0: $("#general-message").html(data.Html); break
                                case 1: $("#notify-message").html(data.Html); break;
                                case 2: $(data.Html).prependTo('body'); break;
                            };

                            $("#" + _spinner).removeClass("glyphicon glyphicon-refresh glyphicon-refresh-animate");
                            $(".remove-member-token").button('reset')

                            if (data.TokenPanel)
                                $(".member-token-tab").html(data.TokenPanel);

                        },
                        error: function (xhr, textStatus, errorThrown) {
                            App.DialogError(xhr, textStatus, errorThrown);
                            $("#" + _spinner).removeClass("glyphicon glyphicon-refresh glyphicon-refresh-animate");
                            $(".remove-member-token").button('reset')
                        }
                    });
                }
            });


            /////////////////////////////////////////////////////////////////////////////
            $("body").on("click",".member-add-role-inline-link", function (e) {
                e.preventDefault();

                var memberid = parseInt($(this).attr("data-member-id"));
                var membername = $(this).attr("data-member-name");
                var _this = this;

                App.DialogGet(BaseUrl + "/GetMemberToRoleInlineDialog", e, { MemberID: memberid });
                return false;
            });


            /////////////////////////////////////////////////////////////////////////////
            $("body").on("click",".role-member-remove-cross", function (e) {
                e.preventDefault();

                var memberid = parseInt($(this).attr("data-member-id"));
                var roleid = parseInt($(this).attr("data-role-id"));
                var membername = $(this).attr("data-member-name");
                var rolename = $(this).attr("data-role-name");
                var _this = this;

                if (confirm("Are you sure to remove \"" + membername + "\" from \"" + rolename + "\" role ?")) {

                    // Removing file by AJAX request
                    $.ajax({
                        type: "POST",
                        url: BaseUrl + "/RemoveFromRole",
                        dataType: "json",
                        contentType: 'application/json; charset=utf-8',
                        data: JSON.stringify({ MemberID: memberid, RoleID: roleid }),
                        cache: false,
                        success: function (data) {
                            if (data.Html) {
                                $(_this).parent().parent().html(data.Html);
                            }
                        },
                        error: function (xhr, textStatus, errorThrown) {
                            App.DialogError(xhr, textStatus, errorThrown);
                        }
                    });

                }

                return false;
            });

            /////////////////////////////////////////////////////////////////////////////
            $("#remove-member").bind("click", function (e) {
                var _checked = [];

                $(".member-select").each(function (e) {
                    if ($(this).is(':checked'))
                        _checked.push(parseInt($(this).attr("data-member-id")));
                });

                if (_checked.length == 0) {
                    alert("Please, select members and try again.")
                    return false;
                }

                App.DialogGet(BaseUrl + "/GetRemoveMemberDialog", e, _checked);
            });

            this.InitUpload();
        }

    }
};