
function RolesManagement() {

    var tableHolder = "";
    var tableRoles = "";
    var BaseUrl = "";
    var _this = null;

    var PagingInfo = null;
    var rolesUploadDialog = null; 

    return {
        
        initManagement: function (Holder, BaseUrlString) {
            _this = this;
            BaseUrl = BaseUrlString;
            tableHolder = Holder;
            tableRoles = $("#" + tableHolder);
            
            _this.PagingInfo = {
                HolderName: tableRoles.attr("id"),
                CurrentPage: tableRoles.attr("data-current-page"),
                ItemsPerPage: tableRoles.attr("data-items-per-page"),
                SortColumn: tableRoles.attr("data-sort-column"),
                SortOrderAsc: tableRoles.attr("data-sort-order-asc") == "true",
                spinner: null
            };

            window.onpopstate = function (e) {   
                if (e.state){     
                    _this.ReloadRoles(e.state, true);            
                }
            };

           this.InitRolesPaging();
           this.initParam(_this.PagingInfo);
           this.InitHandlers();
        },

        
        initParam: function (pagingInfo){
            if(window.history.pushState)
            {
                window.history.replaceState(pagingInfo, '');
                var params = "p="+pagingInfo.CurrentPage+"&s="+pagingInfo.ItemsPerPage+"&c="+pagingInfo.SortColumn+"&o="+ (pagingInfo.SortOrderAsc ? "1" : "2")
            
                if(BaseUrl.indexOf("?") > 0) 
                    window.history.pushState(pagingInfo, '', BaseUrl+"/?"+params);
            }
        },

        
        ReloadRoles: function (pagingInfo, history, scroll)
        {
             var _scroll = true

            if (scroll != undefined || scroll != null)
                _scroll = scroll;

           
           if (pagingInfo == undefined) {
                pagingInfo = _this.PagingInfo;
                history = false;
            }
            
            $("#div-"+pagingInfo.HolderName).fadeTo('fast', 0.5, function() {
             
            });
            
            var Info = {
                 HolderName :    pagingInfo.HolderName,
                 CurrentPage:    pagingInfo.CurrentPage, 
                 ItemsPerPage:   pagingInfo.ItemsPerPage,
                 SortColumn:     pagingInfo.SortColumn,  
                 SortOrderAsc:   pagingInfo.SortOrderAsc
            };

            if(!history && window.history.pushState)
            {
                var params = "p="+pagingInfo.CurrentPage+"&s="+pagingInfo.ItemsPerPage+"&c="+pagingInfo.SortColumn+"&o="+ (pagingInfo.SortOrderAsc ? "1" : "2")       
                window.history.pushState(Info, '', BaseUrl+"/?" + params );
            }
       
            // Removing file by AJAX request
            $.ajax({
               type: "POST",
               url: BaseUrl+"/GetRoles",
               dataType: "json",
               contentType: 'application/json; charset=utf-8',
               data: JSON.stringify(Info),
               cache: false,
               success: function (data) {
                   $("#div-"+tableHolder).html(data.Html);
                   $(pagingInfo.spinner).removeClass("glyphicon glyphicon-refresh glyphicon-refresh-animate");
                   _this.InitRolesPaging();
                    
                    if(_scroll)
                    {
                        setTimeout(function(e){
                        $.scrollTo($("body"), { duration: 900, axis: 'y' });
                        }, 700);
                    }
                   
                   _this.PagingInfo = Info;
                   
                   $("#div-"+pagingInfo.HolderName).fadeTo('fast', 1, function() {
             
                   });

               },        
               error: function(xhr, textStatus, errorThrown){
                   App.DialogError(xhr,textStatus, errorThrown);
                   $(pagingInfo.spinner).removeClass("glyphicon glyphicon-refresh glyphicon-refresh-animate");
                   $("#div-"+pagingInfo.HolderName).fadeTo('fast', 1, function() {
             
                   });                      
               }   
           });  
         },

        InitRolesPaging: function ()
        {
               var callback = function(page_index, jq)
               {         
                      var spinner = $(jq).find("div");
                      $(spinner).removeClass("spinner");
               
                      if(page_index == parseInt($("#"+tableHolder).attr("data-current-page"))-1)
                         return false;
               
                         var Table = $("#"+tableHolder);
               
                         _this.PagingInfo.HolderName   = tableHolder;
                         _this.PagingInfo.CurrentPage  = page_index + 1;
                         _this.PagingInfo.ItemsPerPage = parseInt(Table.attr("data-items-per-page"));
                         _this.PagingInfo.SortOrderAsc = Table.attr("data-sort-order-asc") == "true",
                         _this.PagingInfo.SortColumn   = Table.attr("data-sort-column"),
                         _this.PagingInfo.spinner      = spinner;
               
                         $(spinner).addClass("glyphicon glyphicon-refresh glyphicon-refresh-animate");
                         _this.ReloadRoles(_this.PagingInfo);
               
                       // Prevent click eventpropagation
                       return false;
               };
    
                $("#table-roles-pagination-top-"+tableHolder).pagination(parseInt($("#"+tableHolder).attr("data-total-items")),
               { 
                    callback: callback,
                    items_per_page:       parseInt($("#"+tableHolder).attr("data-items-per-page")),      // Number of items per page
                    current_page:         parseInt($("#"+tableHolder).attr("data-current-page"))-1,      // Current page number
                    num_display_entries:  8,                        // Number of pagination links shown
                    num_edge_entries:     2,                        // Number of start and end points
                    prev_text:            "Prev",                   // Previous" label
                    next_text:            "Next"                   // "Next" labe
               });

               $("#table-roles-pagination-bottom-"+tableHolder).pagination(parseInt($("#"+tableHolder).attr("data-total-items")),
               { 
                    callback: callback,
                    items_per_page:       parseInt($("#"+tableHolder).attr("data-items-per-page")),      // Number of items per page
                    current_page:         parseInt($("#"+tableHolder).attr("data-current-page"))-1,      // Current page number
                    num_display_entries:  8,                        // Number of pagination links shown
                    num_edge_entries:     2,                        // Number of start and end points
                    prev_text:            "Prev",                   // Previous" label
                    next_text:            "Next"                   // "Next" labe
               });
        },

        InitUpload : function(){        
         var _this = this;
         var dialogId = "#div-roles-importing";

         new AjaxUpload('#roles-import', {
                 action: BaseUrl+"/ImportRoles",
		         multiple: false,
                 data : {},
		         onSubmit : function(file , ext){
                  
		             _this.rolesUploadDialog = App.DialogBootstrap(dialogId, 400, 100, true, {}, false);            
                    this.setData({});					
		        },
		        onComplete : function(file, response){
		            debugger;
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

		            _this.rolesUploadDialog.close();

		           try {
                          var _data = JSON.parse(response);                 
                          setTimeout(function(){$(_data.Html).prependTo('body');}, 300);
                          setTimeout(function(){_this.ReloadRoles(_this.PagingInfo,true)}, 1100);
                          _this.InitUpload();                  
                   }
                   catch(e)
                   {
                       App.DialogError("","", response);                 
                   }
                 }		
            });
        },

        InitHandlers: function () {
        
            $("body").on('click',".role-select",function(){
               $(this).parent().parent().children().toggleClass("row-higlighted");
            });

            $("body").on("click",".role-select-all-chb", function(e){
                if($(".role-select-all-chb").is(':checked'))
                {         
                    $(".role-select").prop('checked', true);
                    $(".role-select").parent().parent().children().addClass("row-higlighted");
                }
                else
                {
                   $(".role-select").prop('checked', false);
                   $(".role-select").parent().parent().children().removeClass("row-higlighted");
                }
            });

            $("#role-add").bind("click", function (e)   {App.DialogGet(BaseUrl+"/GetNewRoleDialog",e);}); 
            $("#role-refresh").bind("click", function (e) {_this.ReloadRoles(_this.PagingInfo,null,false);});
    
            $("body").on("click",".role-edit",function(e) {App.DialogGet(BaseUrl+"/GetEditRoleDialog",e,{RoleID: parseInt($(this).attr("data-role-id"))});}); 

            $("body").on("click","#role-remove", function (e)   {
                   var _checked = [];

                    $(".role-select").each(function(e){
                        if($(this).is(":checked"))
                            _checked.push(parseInt($(this).attr("data-role-id")));
                    });
        
                    if(_checked.length == 0)
                    {
                        alert("Please, select roles and try again.")
                        return false;
                    }

                    App.DialogGet(BaseUrl+"/GetRemoveRoleDialog",e, _checked);
            }); 

            $("body").on("click",".role-sort-column", function(e){
                 if($(this).index() > 0){
         
                     if(_this.PagingInfo.SortColumn == $(this).index())
                         _this.PagingInfo.SortOrderAsc = !_this.PagingInfo.SortOrderAsc
                     else
                         _this.PagingInfo.SortOrderAsc = true;
         
                     _this.PagingInfo.SortColumn = $(this).index();
                     _this.ReloadRoles(_this.PagingInfo);
                 }
            });

            this.InitUpload();
        }
 
    }
};