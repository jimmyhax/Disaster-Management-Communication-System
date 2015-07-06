
function DomainsManagement() {

    var tableHolder = "";
    var tableDomains = "";
    var BaseUrl = "";
    var _this = null;

    var PagingInfo = null;

    return {
        
        initManagement: function (Holder, BaseUrlString) {
            _this = this;
            BaseUrl = BaseUrlString;
            tableHolder = Holder;
            tableDomains = $("#" + tableHolder);
            
            _this.PagingInfo = {
                HolderName: tableDomains.attr("id"),
                CurrentPage: tableDomains.attr("data-current-page"),
                ItemsPerPage: tableDomains.attr("data-items-per-page"),
                SortColumn: tableDomains.attr("data-sort-column"),
                SortOrderAsc: tableDomains.attr("data-sort-order-asc") == "true",
                spinner: null
            };

            window.onpopstate = function (e) {   
                if (e.state){     
                    _this.ReloadDomains(e.state, true);            
                }
            };

           this.InitDomainsPaging();
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

        
        ReloadDomains: function (pagingInfo, history, scroll)
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
               url: BaseUrl+"/GetDomains",
               dataType: "json",
               contentType: 'application/json; charset=utf-8',
               data: JSON.stringify(Info),
               cache: false,
               success: function (data) {
                   $("#div-"+tableHolder).html(data.Html);
                   $(pagingInfo.spinner).removeClass("glyphicon glyphicon-refresh glyphicon-refresh-animate");
                   _this.InitDomainsPaging();
                    
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

        InitDomainsPaging: function ()
        {
               var callback = function(page_index, jq)
               {         
                      var spinner = $(jq).find("div");
                      $(spinner).removeClass("glyphicon glyphicon-refresh glyphicon-refresh-animate");
               
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
                         _this.ReloadDomains(_this.PagingInfo);
               
                       // Prevent click eventpropagation
                       return false;
               };
    
                $("#table-domains-pagination-top-"+tableHolder).pagination(parseInt($("#"+tableHolder).attr("data-total-items")),
               { 
                    callback: callback,
                    items_per_page:       parseInt($("#"+tableHolder).attr("data-items-per-page")),      // Number of items per page
                    current_page:         parseInt($("#"+tableHolder).attr("data-current-page"))-1,      // Current page number
                    num_display_entries:  8,                        // Number of pagination links shown
                    num_edge_entries:     2,                        // Number of start and end points
                    prev_text:            "Prev",                   // Previous" label
                    next_text:            "Next"                   // "Next" labe
               });

               $("#table-domains-pagination-bottom-"+tableHolder).pagination(parseInt($("#"+tableHolder).attr("data-total-items")),
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

        InitHandlers: function () {
        
            $("body").on('click',".domain-select", function(){
               $(this).parent().parent().children().toggleClass("row-higlighted");
            });

            $("body").on("click",".domain-select-all-chb", function(e){
        
                if($(".domain-select-all-chb").is(':checked'))
                {         
                    $(".domain-select").prop('checked', true);
                    $(".domain-select").parent().parent().children().addClass("row-higlighted");
                }
                else
                {
                   $(".domain-select").prop('checked', false);
                   $(".domain-select").parent().parent().children().removeClass("row-higlighted");
                }
            });

           $("#add-domain").bind("click", function (e) { App.DialogGet(BaseUrl + "/GetAddDomainDialog", e); });
           $("#refresh-domains").bind("click", function (e) { _this.ReloadDomains(_this.PagingInfo, null, false);});
           $("body").on("click",".domain-edit", function (e) { App.DialogGet(BaseUrl + "/GetEditDomainDialog", e, { DomainID: parseInt($(this).attr("data-domain-id")) }); });

           $("body").on("click","#remove-domain", function (e) {
                   var _checked = [];

                    $(".domain-select").each(function(e){
                        if($(this).is(":checked"))
                            _checked.push(parseInt($(this).attr("data-domain-id")));
                    });
        
                    if(_checked.length == 0)
                    {
                        alert("Please, select domains and try again.")
                        return false;
                    }

                    App.DialogGet(BaseUrl+"/GetRemoveDomainDialog",e, _checked);
            }); 

           $("body").on("click",".domain-sort-column", function(e){
                 if($(this).index() > 0){
         
                     if(_this.PagingInfo.SortColumn == $(this).index())
                         _this.PagingInfo.SortOrderAsc = !_this.PagingInfo.SortOrderAsc
                     else
                         _this.PagingInfo.SortOrderAsc = true;
         
                     _this.PagingInfo.SortColumn = $(this).index();
                     _this.ReloadDomains(_this.PagingInfo);
                 }
            });
        } 
    }
};