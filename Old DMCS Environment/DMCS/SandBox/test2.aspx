<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="test2.aspx.cs" Inherits="DMCS.SandBox.test2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    
    <div style="padding: 10px; width:100%; text-align: center;">
                    <asp:Label ID="ERROR_txt" runat="server" Text="" Font-Bold="True" ForeColor="#CC0000" BackColor="Silver"></asp:Label>
    </div>            
    <div>
                <asp:Panel ID="Place_Order_InfoHead" runat="server" ForeColor="#EFEEEF" Height="25px" BackImageUrl="~/Images/panelheader1.jpg">
                    <asp:Label ID="Place_Order_InfoHead_label" Style="padding: 10px" runat="server" Text="Place An Order" Font-Size="Large"></asp:Label>
                </asp:Panel>
                <asp:Panel ID="Place_Order_InfoBody" runat="server" Style="overflow: hidden;">
                    <div>
                         <table width="100%" bgcolor="#aaaaaa" style="font-family: 'Calibri Light'"> 
                            <tr>
                                <th colspan="2" style="padding: 5px 10px 5px 10px; background-color: #666666; width:100%" > 
                                    <label style="font-size: large; color: #E2E2E2">Assign the order to a warehouse destination</label>
                                </th> 
                            </tr>
                             <tr>
                                 <td align="left" style="padding: 5px 10px 5px 10px; background-color: #666666; width:100%; color: #E2E2E2" valign="top" width="50%">
                                     <div id="order">
                                     </div>
                                 </td>
                             </tr>
                         </table>
                        
                        <table width="100%" bgcolor="#666666" border="3" style="color: #CCCCCC;">
                            <tr>
                                <td width="25%" align="left" style="padding: 10px; font-weight: bold; height: 53px;">
                                    <asp:Label ID="Label5" ForeColor="Black" Text="CallCenter:" runat="server"></asp:Label>
                                    <br />
                                    <asp:DropDownList ID="DDL_Call_Center" runat="server" Height="23px" Width="147px"
                                    DataSourceID="CallCenters" DataValueField="Call_center_id" DataTextField="Call_center_Name" TabIndex="1">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="CallCenters" runat="server" ConnectionString="<%$ ConnectionStrings:localhost %>"
                                    SelectCommand="SP_DMCS_Get_Call_centers" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                                </td>
                                <td width="25%" align="left" style="padding: 10px; font-weight: bold; height: 53px;">
                                    <asp:Label ID="Label1" ForeColor="Black" Text="Disaster:" runat="server"></asp:Label>
                                    <br />
                                    <asp:DropDownList ID="DDL_Disaster" runat="server" Height="23px" Width="147px" TabIndex="2" DataSourceID="Disasters" DataTextField="disaster_name" DataValueField="disaster_id">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="Disasters" runat="server" ConnectionString="<%$ ConnectionStrings:localhost %>" SelectCommand="SELECT [disaster_name], [disaster_id] FROM [disaster]"></asp:SqlDataSource>
                                </td>
                                <td width="25%" align="center" style="padding: 10px; font-weight: bold; height: 53px;">
                                    <asp:Label ID="Label2" ForeColor="Black" Text="Priority Level:" runat="server"></asp:Label>
                                    <br />
                                    <asp:DropDownList ID="DDL_Priority_Lvl" runat="server" Height="23px" Width="80px" TabIndex="2">
                                        <asp:ListItem Value="1">Low</asp:ListItem>
                                        <asp:ListItem Value="2">Normal</asp:ListItem>
                                        <asp:ListItem Value="3">High</asp:ListItem>
                                        <asp:ListItem Value="4">Urgent</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td width="25%" align="center" style="padding: 10px; font-weight: bold; height: 53px;">
                                </td>
                            </tr>
                        </table>
                        <div style="margin: 0px; border-width: 0px; color: #CCCCCC;">
                            <asp:Button ID="searchByAddress_btn" Text="Search By Address" runat="server"
                            TabIndex="5" OnClick="Choose_SearchByAddress_Click" BackColor="#333333" ForeColor="White" Width="100%" Style="color: White; background-color: #333333; width: 100%; margin-top: 0px; margin-bottom: 0px; margin-right: 0px;" />
                    
                            <asp:Button ID="searchByUserLocation_btn" Text="Search By Current Location" runat="server"
                            TabIndex="5" OnClick="Choose_SearchByUserLocation_Click" ClientIDMode="Static" BackColor="#333333" ForeColor="White" Width="100%" Style="color: White; background-color: #333333; width: 100%; margin-top: 0px; margin-bottom: 0px; margin-right: 0px;" />
						</div>
                        <table width="100%" bgcolor="Silver" style=" padding: 5px 10px 5px 10px; background-color: #aaaaaa;" width="100%">
                            <tr>
                                <td width="12.5%" style="padding: 5px 10px 5px 10px;">
                                    
                                </td>
                                <td width="21%" style="padding: 5px 10px 5px 10px;">
                                    <div id="Address_DDL_DIV" runat="server">
                                        <asp:Label ID="Address_L" Text="Address:" runat="server" Visible="False"></asp:Label>
                                        <br />
                                        <asp:TextBox ID="txtSearchAddress" runat="server" Width="373px" TabIndex="3" ClientIDMode="Static" Style="margin-right: 0px" Visible="False" AutoPostBack="True"></asp:TextBox>
                                    </div>
                                    <div id="disaster_DDL_DIV" runat="server" style="display: none">
                                        <asp:Label ID="Label3" ForeColor="Black" Text="Disaster:" runat="server"></asp:Label>
                                        <br />
                                        <asp:DropDownList ID="DropDownList1" runat="server" Height="23px" Width="147px" TabIndex="2" DataSourceID="Disasters2" DataTextField="disaster_name" DataValueField="disaster_id">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="Disasters2" runat="server" ConnectionString="<%$ ConnectionStrings:localhost %>" SelectCommand="SELECT [disaster_name], [disaster_id] FROM [disaster]"></asp:SqlDataSource>
                                        </div>
                                </td>
                                <td width="8%" style="padding: 5px 10px 5px 10px;">
                                        <asp:Label ID="Radius_L" Text="Radius:" runat="server" ClientIDMode="Static" Visible="False"></asp:Label>
                                        <br />
                                        <asp:DropDownList runat="server" ID="ddlRadius" OnChange="initialize()" Visible="False" ClientIDMode="Static">
                                            <asp:ListItem Value="1">1 miles</asp:ListItem>
                                            <asp:ListItem Value="5">5 miles</asp:ListItem>
                                            <asp:ListItem Value="7">7 miles</asp:ListItem>
                                            <asp:ListItem Value="10">10 miles</asp:ListItem>
                                            <asp:ListItem Value="15">15 miles</asp:ListItem>
                                            <asp:ListItem Value="20">20 miles</asp:ListItem>
                                            <asp:ListItem Value="30">30 miles</asp:ListItem>
                                            <asp:ListItem Value="50">50 miles</asp:ListItem>
                                            <asp:ListItem Selected="True" Value="75">75 miles</asp:ListItem>
                                            <asp:ListItem Value="100">100 miles</asp:ListItem>
                                            <asp:ListItem Value="150">150 miles</asp:ListItem>
                                            <asp:ListItem Value="15000">Show All</asp:ListItem>
                                        </asp:DropDownList>
                                </td>
                                <td width="55%" align="center" nowrap="nowrap" style="border-style: none">
                                    <div>
                                        <asp:Button ID="sByALocation" Text="Search" runat="server"
                                        TabIndex="5" OnClick="searchByAddress_Click" Width="100%" Visible="False" style=" color: #FFFFFF; background-color: #EA5151; width: 100%; height: 28px;" />
                                    </div>
                                    <div>
                                        <asp:Button ID="sByCLocation" Text="Search" runat="server"
                                        TabIndex="5" Width="100%" Visible="False" OnClick="searchByUserLocation_Click" style=" color: #FFFFFF; background-color: #EA5151; width: 100%; height: 28px;"/>
    
                                    </div>
    
                                </td>
                                <td width="8%" style="padding: 5px 10px 5px 10px;">
                                        <asp:Label ID="Lat_L" Text="Lat:" runat="server" ClientIDMode="Static" Visible="False"></asp:Label>
                                        <br />
                                        <asp:TextBox ID="SendLat" runat="server" Width="62px" ClientIDMode="Static" Visible="False"></asp:TextBox>
                                </td>
                                <td width="8%" style="padding: 5px 10px 5px 10px;">
                                        <asp:Label ID="Long_L" Text="Long:" runat="server" ClientIDMode="Static" Visible="False"></asp:Label>
                                        <br />
                                        <asp:TextBox ID="SendLng" runat="server" Width="62px" ClientIDMode="Static" Visible="False"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                        <table width="100%" bgcolor="Silver" style="font-family: 'Calibri Light'; padding: 5px 10px 5px 10px; background-color: #aaaaaa;" width="100%">
                            <tr>
                                <td style="padding: 0px 0px 1px 10px;" width="100%">
                                <div id="note" style="text-align: center; background-color: #666; color: #E2E2E2">
                                    <span id="title">&raquo;Drag the order to a warehouse&laquo;</span><hr />
                                    <span class="info">Order: <span id="a" class="bool"></span></span>&larr;&diams;&rarr; <span class="info">Warehouse: <span id="b" class="bool"></span></span>
                                </div>
                                </td>
                            </tr>
                            </tr>
                        </table>
                        <div id="SelectedProduct_div" style="border-style: solid none solid solid; border-width: medium; border-color: #EA5151; overflow: auto; height: 550px; width: 33%; font-size: 11px; color: #CCCCCC; float: left; background-color: #666666; background-image: url('http://localhost:3466/Moduals/Order_Products/Images/Slate.jpg');">
                        </div>
                        <div id="map1" style="margin: 0px; border-style: solid solid none none; border-width: medium; width: auto; height: 515px; margin-bottom: 0px;margin-top: 0px;"></div>
                        <div style="text-align:center;height: 35px; border-style: none solid solid none; border-width: medium;margin-bottom: 0px;margin-top: 0px; vertical-align: bottom;">
                            <asp:Label ID="SelectViewStatus_L" runat="server" ClientIDMode="Static" Font-Size="Large"></asp:Label>
                        </div>
                        <div>
                            <asp:Button runat="server" Width="100%" Text="Place The Order" style="margin-bottom: 0px;margin-top: 0px;" BackColor="#EA5151" ForeColor="#CCCCCC" ClientIDMode="Static" ID="Final_btn" OnClientClick="sendToFinal(); return false;" BorderWidth="0"></asp:Button>                            
                        </div>
                    </div>
                </asp:Panel>
                <asp:CollapsiblePanelExtender ID="cpeOrderInfo" runat="server" 
                    CollapseControlID="Place_Order_InfoHead" 
                    CollapsedText="Place An Order" Enabled="True" 
                    ExpandControlID="Place_Order_InfoHead" 
                    ExpandedText="Place An Order" 
                    TargetControlID="Place_Order_InfoBody" 
                    TextLabelID="Place_Order_InfoHead_label"></asp:CollapsiblePanelExtender>
            </div>


</asp:Content>
