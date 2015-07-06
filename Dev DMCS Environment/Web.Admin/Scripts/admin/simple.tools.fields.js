
// Return a helper with preserved width of cells
var fixHelper = function (e, ui) {
    ui.children().each(function () {
        $(this).width($(this).width());
    });
    return ui;
};

var helper = function (e, tr) {
    var $originals = tr.children();
    var $helper = tr.clone();
    $helper.children().each(function (index) {
        // Set helper cell sizes to match the original sizes
        $(this).width($originals.eq(index).width() + 12)
    });
    return $helper;
}

function BindSortGroups() {

    $('.canSortGroup').sortable({
        items: 'tbody > tr',
        connectWith: '.canSortGroup',
        dropOnEmpty: true,
        receive: function (e, ui) {
            $(ui.item).appendTo($(e.target).find('tbody'));
        },
        helper: helper,
        cursor: 'pointer',
        handle: '.handle',
        scroll: true,
        scrollSensitivity: 40,
        axis: 'y',
        placeholder: 'ui-state-highlight',
        update: function (e, ui) {
            //$(this).sortable("refresh");
            var ids = $(this).sortable("toArray").toString().replace(/row-/gi, "");
            $("#grouporder").val(ids);
        },
        start: function (event, ui) {
            $(".ui-state-highlight").html("<td class='ui-state-highlight'>&nbsp;</td><td class='ui-state-highlight'>&nbsp;</td><td class='ui-state-highlight'>&nbsp;</td>");

        },
        stop: function (event, ui) {

        }
    }).disableSelection();


}


function FieldsManagement() {

    var BaseUrl = "";
    var _this = null;

    return {

        initManagement: function (BaseUrlString) {
            _this = this;
            BaseUrl = BaseUrlString;
            this.InitHandlers();
        },

        InitDragAndDrop: function()
        {
            $('.canSort').sortable({
                //appendTo: '.scroll-container',
                items: 'tbody > tr',
                connectWith: '.canSort',
                dropOnEmpty: true,
                receive: function (e, ui) {
                    $(ui.item).appendTo($(e.target).find('tbody'));
                },
                helper: helper,
                cursor: 'pointer',
                scroll: true,
                handle: '.handle',
                scrollSensitivity: 40,
                axis: 'y',
                placeholder: 'ui-state-highlight',
                start: function (event, ui) {
                    $(".ui-state-highlight").html("<td class='ui-state-highlight'>&nbsp;</td><td class='ui-state-highlight'>&nbsp;</td><td class='ui-state-highlight'>&nbsp;</td><td class='ui-state-highlight'>&nbsp;</td><td class='ui-state-highlight'>&nbsp;</td><td class='ui-state-highlight'>&nbsp;</td><td class='ui-state-highlight'>&nbsp;</td><td class='ui-state-highlight'>&nbsp;</td><td class='ui-state-highlight'>&nbsp;</td>");
                },
                stop: function (event, ui) {

                },
                update: function (e, ui) {
                    var ids = $(this).sortable("toArray").toString().replace(/row-/gi, "")
                    var groupID = parseInt($(this).attr("data-group-id"));
                    $.ajax({
                        type: "POST",
                        url: BaseUrl + "/SortFields",
                        dataType: "json",
                        contentType: 'application/json; charset=utf-8',
                        data: JSON.stringify({ Fields: ids, GroupID: groupID }),
                        cache: false,
                        success: function (data) {
                            //$(this).sortable("refresh");
                        },
                        error: function (xhr, textStatus, errorThrown) {

                        }
                    });
                }
            }).disableSelection();


            $('.sort').mousedown(function (e) { e.stopPropagation(); });
            $('.sortable2').mousedown(function (e) { return false; });        
        },

        InitHandlers: function () {

            this.InitDragAndDrop();

            $("body").on('click',".field-group-item", function () {
                $(this).parent().parent().children().toggleClass("row-higlighted");
            });

            $("body").on("click",".field-group-select", function (e) {
                var id = $(this).attr("data-table-id")

                if ($("#field-group-select-all-fields-" + id).is(':checked')) {
                    $(".field-group-select-" + id).prop('checked', true);
                    $(".field-group-select-" + id).parent().parent().children().addClass("row-higlighted");
                }
                else {
                    $(".field-group-select-" + id).prop('checked', false);
                    $(".field-group-select-" + id).parent().parent().children().removeClass("row-higlighted");
                }
            });


            $("body").on("click",".group-properties", function (e) {
                var groupID = parseInt($(this).attr("data-group-id"));
                App.DialogGet(BaseUrl + "/GetEditFieldGroupDialog", e, { GroupID: groupID });
            });

            $("body").on("click",".group-add", function (e) {
                App.DialogGet(BaseUrl + "/GetAddFieldGroupDialog", e, { ID: -1 });
            });

            $("body").on("click",".group-remove", function (e) {
                if (confirm("Warning: It will remove all fields (their data) which belong to group.\r\nAre you sure to remove " + $(this).attr("data-group-name") + " group ?")) {
                    var _id = parseInt($(this).attr("data-group-id"));

                    $.ajax({
                        type: "POST",
                        url: BaseUrl + "/RemoveFieldGroup",
                        dataType: "json",
                        contentType: 'application/json; charset=utf-8',
                        data: JSON.stringify({ GroupID: _id }),
                        cache: false,
                        success: function (data) {
                            switch (data.NotifyType) {
                                case 0: $("#general-message").html(data.Html); $("#tab-group-" + _id).remove(); break
                                case 1: $("#general-message").html(data.Html); $("body").animate({ scrollTop: 0 }, 'slow'); break
                                case 2: $(data.Html).prependTo('body'); break;
                            };


                        },
                        error: function (xhr, textStatus, errorThrown) {
                            App.DialogError(xhr, textStatus, errorThrown);

                        }
                    });

                }
            });


            $("body").on("click",".add-field", function (e) {
                var groupID = parseInt($(this).attr("data-group-id"));
                App.DialogGet(BaseUrl + "/GetAddFieldDialog", e, { GroupID: groupID });
            });

            $("body").on("click",".edit-field", function (e) {
                e.preventDefault();

                var groupID = parseInt($(this).attr("data-group-id"));
                var fieldID = parseInt($(this).attr("data-field-id"));
                var tabIndex = parseInt($(this).attr("data-tab-index"));
                App.DialogGet(BaseUrl + "/GetEditFieldDialog", e, { GroupID: groupID, FieldID: fieldID, TabIndex: tabIndex });

                return false;
            });

            $("body").on("click",".remove-field", function (e) {
                var _checked = [];
                var __this = _this;

                var groupID = parseInt($(this).attr("data-group-id"));

                $(".field-group-select-" + groupID).each(function (e) {
                    if ($(this).is(':checked') == true)
                        _checked.push(parseInt($(this).attr("data-field-id")));
                });

                if (_checked.length == 0) {
                    alert("Please, select items and try again.")
                    return false;
                }

                if (confirm("Warning: It will remove field(s) (their data) which belong to group.\r\nAre you sure to remove?")) {

                    $.ajax({
                        type: "POST",
                        url: BaseUrl + "/RemoveProfileFields",
                        dataType: "json",
                        contentType: 'application/json; charset=utf-8',
                        data: JSON.stringify({ Fields: _checked }),
                        cache: false,
                        success: function (data) {
                            switch (data.NotifyType) {
                                case 0: $("#general-message").html(data.Html); setTimeout(function () { $("#member-profile-fields").load(BaseUrl + "/GetMemberFields",function() {App.FieldsManagement.InitDragAndDrop()}) }, 10); break;
                                case 1: $("#general-message").html(data.Html); $("body").animate({ scrollTop: 0 }, 'slow'); break
                                case 2: $(data.Html).prependTo('body'); break;
                            };

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


