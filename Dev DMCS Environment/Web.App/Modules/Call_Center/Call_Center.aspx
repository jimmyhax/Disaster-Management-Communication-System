<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Call_Center.aspx.cs" Inherits="Web.App.Modules.Call_Center.Call_Center" EnableEventValidation="True" ValidateRequest="True" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

        <table width="100%">
           <tr align="center">
             <td>
                 <asp:Label ID="Label87" runat="server" Text="Call Center" CssClass="header"></asp:Label>
             </td>
           </tr>
         </table>
        <table>
           <tr>
             <td>
               <asp:Label ID="dmcslabel1"  Text="Call Center:" runat="server"></asp:Label> 
             </td>
             <td align="left">
               <asp:DropDownList ID="DDL_Call_Center" runat="server" Height="23px" Width="147px"
                DataSourceID="CallCenters" DataValueField="Call_center_id" DataTextField="Call_center_Name" TabIndex="0">
               </asp:DropDownList>
               <asp:SqlDataSource ID="CallCenters" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
                 SelectCommand="SP_DMCS_Get_Call_centers" SelectCommandType="StoredProcedure">
               </asp:SqlDataSource>
             </td>
             <td>
                 <asp:Label ID="Label134"  Text="Disaster:" runat="server"></asp:Label> 
             </td>
             <td align="left">     
                <asp:DropDownList ID="DDlDisasters" runat="server" Height="23px" Width="147px"
                DataSourceID="sqldisasters" DataValueField="disaster_id" DataTextField="disaster_Name" TabIndex="1">
               </asp:DropDownList>
               <asp:SqlDataSource ID="sqldisasters" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
                 SelectCommand="SP_DMCS_Get_disasters" SelectCommandType="StoredProcedure">
               </asp:SqlDataSource></td> 
              <td align="right">
                  &nbsp;</td>
            </tr>
            <tr>
              <td>
                <asp:Label ID="DMCSLabel3"  Text="First Name:" runat="server"></asp:Label> 
              </td>
              <td> 
                 <asp:TextBox ID="txtfirstname" runat="server" Width="177px" TabIndex="2"></asp:TextBox>
              </td>
              <td align="right">
                <asp:Label ID="DMCSLabel4"  Text="Last Name:" runat="server"></asp:Label> 
              </td>
              <td align="left"> 
                 <asp:TextBox ID="txtlastname" runat="server" Width="177px" TabIndex="3"></asp:TextBox>
              </td>
              <td align="right">
                 <asp:Button ID="BtnNameSearch" Text="Search By Name" runat="server" 
                      onclick="BtnNameSearch_Click" TabIndex="4"/>
              </td>
            </tr>
            <tr>
              <td align="center" colspan="5">
                 <asp:Label ID="lblSearchErrormsg" runat="server"></asp:Label>
              </td>
            </tr>
         </table>
        <table>
           <tr>
             <td>
                <asp:GridView ID="gvClientSearchresult" runat="server" 
                     AutoGenerateSelectButton="true" AutoGenerateColumns="false"
                     onselectedindexchanged="gvClientSearchresult_SelectedIndexChanged"
                     onpageindexchanging ="gvClientSearchresult_PageIndexChanging"
                      DataKeyNames="Person_id" AllowPaging="true" >
                     <Columns>
                            <asp:BoundField DataField="Person_id" Visible="false" />
                            <asp:BoundField DataField="f_name" HeaderText="First Name" SortExpression="First Name" />
                            <asp:BoundField DataField="m_Initial" HeaderText="Initial" SortExpression="Initial" />
                            <asp:BoundField DataField="l_name" HeaderText="Last Name" SortExpression="Last Name" />
                            <asp:BoundField DataField="Phone_Primary" HeaderText="Phone" SortExpression="Phone" />
                            <asp:BoundField DataField="Phone_Secondary" HeaderText="Alt Phone" SortExpression="Alt Phone" />
                            <asp:BoundField DataField="email" HeaderText="Email" SortExpression="Email" />
                            <asp:BoundField DataField="ssn" HeaderText="Social Security #" SortExpression="Social Security #" />
                            <asp:BoundField DataField="Driver_State_ID" HeaderText="Driver/State ID" SortExpression="Driver/State ID" />
                     </Columns>
                 </asp:GridView>
             </td>
           </tr>
           <tr>
             <td>
                 <asp:GridView ID="GVcases" runat="server" 
                     AutoGenerateSelectButton="true" AutoGenerateColumns="false"
                     DataKeyNames="Case_id" AllowPaging="true"
                     onselectedindexchanged="GVcases_SelectedIndexChanged"
                     onpageindexchanging ="GVcases_PageIndexChanging">
                     <Columns>
                            <asp:BoundField DataField="Case_id" HeaderText="Case number" />
                            <asp:BoundField DataField="applic_start_date_time" HeaderText="Case open Date" />
                            <asp:BoundField DataField="applic_end_date_time" HeaderText="Case Close Date" />
                     </Columns>
                    </asp:GridView>
             </td>
           </tr>
         </table>
        <div id="WDW_TabbedPanels" class="TabbedPanels">  
  <div class="TabbedPanelsContentGroup">
    <cc1:TabContainer ID="NAME" runat="server" ActiveTabIndex="0" TabStripPlacement="top" UseVerticalStripPlacement="false" VerticalStripWidth="135px">
    <cc1:TabPanel ID="T1" runat="server" TabIndex="1" HeaderText="Client Info" >
                <ContentTemplate>
           <table id="tblClientInfo" width="100%" style="font-family: Tahoma" cellspacing="10">          
               <tr align="left" style="font-weight: bold">
                  <td>&nbsp;</td>
                  <td colspan="1">
                      <asp:Label ID="Label2" runat="server" Text="Client Status:"></asp:Label>
                  </td>
                  <td colspan="1">
                        <asp:DropDownList ID="ddl_client_status" runat="server" Width="100%" TabIndex="5">
                            <asp:ListItem Value="A">Active</asp:ListItem>
                            <asp:ListItem Value="M">Missing</asp:ListItem>
                            <asp:ListItem Value="D">Deceased</asp:ListItem>
                        </asp:DropDownList>
                  </td>
                  <td align="right">
                      <asp:Label ID="Label98" runat="server" Text="Case #"></asp:Label>
                   </td>
                  <td>
                      <asp:Label ID="LblCasenum" runat="server" Text=""></asp:Label>
                  </td>
                  <td>&nbsp;</td>
               </tr>
               <tr align="left" style="font-weight: bold">
                  <td>&nbsp;</td>
                  <td colspan="1">
                      <asp:Label ID="Label3" runat="server" Text="Last Name:"></asp:Label>
                  </td>
                  <td colspan="1">
                      <asp:Label ID="Label4" runat="server" Text="First Name:"></asp:Label>
                  </td>
                  <td>
                      <asp:Label ID="Label5" runat="server" Text="MI:"></asp:Label>
                  </td>
                  <td>
                      <asp:Label ID="Label6" runat="server" Text="Maiden Name (Opt):"></asp:Label></td>
                  <td>&nbsp;</td>
               </tr>
               <tr>
                  <td>&nbsp;</td>
                  <td colspan="1">
                      <asp:TextBox ID="txt_L_Name" runat="server" Width="100%" Columns="30" TabIndex="6"></asp:TextBox>
                  </td>
                  <td colspan="1">
                      <asp:TextBox ID="txt_F_Name" runat="server" Width="100%" Columns="30" TabIndex="7"></asp:TextBox>
                  </td>
                  <td>
                      <asp:TextBox ID="txt_M_Initial" runat="server" Width="100%" MaxLength="1" TabIndex="8"></asp:TextBox>
                  </td>
                  <td> 
                      <asp:TextBox ID="txt_Maiden_Name" runat="server" Width="100%" MaxLength="30" 
                            Columns="30" TabIndex="9"></asp:TextBox></td>
                  <td>&nbsp;</td>
               </tr>
               <tr align="left" style="font-weight: bold">
                  <td>&nbsp;</td>
                  <td>
                      <asp:Label ID="Label7" runat="server" Text="Gender:"></asp:Label>
                  </td>
                  <td colspan="1">
                      <asp:Label ID="Label9" runat="server" Text="Social Security # (Opt):"></asp:Label>
                  </td>
                  <td>
                      <asp:Label ID="Label8" runat="server" Text="Driver Lic # (Opt):"></asp:Label>
                  </td>
                  <td colspan="2">
                      <asp:Label ID="Label10" runat="server" Text="Date of Birth:"></asp:Label>
                  </td>
               </tr>
               <tr>
                  <td>&nbsp;</td>
                  <td>
                     <asp:DropDownList runat="server" ID="ddl_Gender" Width="100%" TabIndex="10">
                            <asp:ListItem Value="m">Male</asp:ListItem>
                            <asp:ListItem Value="f">Female</asp:ListItem>                          
                     </asp:DropDownList>
                  </td>
                  <td colspan="1">
                        <asp:TextBox ID="txt_SSN" runat="server" Width="100%" MaxLength="9" TabIndex="11"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="revssn" runat="server" ControlToValidate="txt_SSN" ValidationExpression="[0-9]+" ErrorMessage="Please enter a valid numeric value"></asp:RegularExpressionValidator>

                  </td>
                  <td colspan="1">
                        <asp:TextBox ID="txt_DrvLic" runat="server" Width="100%" Columns="11" TabIndex="12"></asp:TextBox>
                  </td>
                  <td colspan="2">
                        <asp:TextBox ID="txt_Birthdate" runat="server" Width="100%" Columns="11" TabIndex="13"></asp:TextBox>
                        <cc1:CalendarExtender runat="server" ID="calbirthdate" FirstDayOfWeek="Sunday" Format="MM/dd/yyyy"
                              TargetControlID="txt_Birthdate">
                        </cc1:CalendarExtender>
                  </td>
               </tr>
               <tr align="left" style="font-weight: bold">
                  <td>&nbsp;</td>
                  <td colspan="2">
                      <asp:Label ID="Label11" runat="server" Text="Primary Phone Number:"></asp:Label>
                  </td>
                  <td colspan="2">
                      <asp:Label ID="Label12" runat="server" Text="Secondary Phone Number:"></asp:Label>
                  </td>
                  <td>&nbsp;</td>
               </tr>
               <tr>
                  <td>&nbsp;</td>
                  <td colspan="2">
                       <asp:TextBox ID="txt_Phone_Primary" runat="server" Width="100%" TabIndex="14">
                        </asp:TextBox>
                  </td>
                  <td colspan="2">
                        <asp:TextBox ID="txt_Phone_Secondary" runat="server" Width="100%" TabIndex="15">
                        </asp:TextBox>
                  </td>
                  <td>&nbsp;</td>
               </tr>
               <tr style="font-weight: bold">
                  <td> 
                      <asp:Label ID="Label124" runat="server" Text="Email: "></asp:Label>
                  </td>
                  <td colspan="4" align="left">
                      <asp:TextBox ID="txt_email" runat="server" Width="554px" TabIndex="16"></asp:TextBox>
                  </td>
                  <td colspan="2">
                     &nbsp;
                  </td>
               </tr>
               <tr>
                 <td colspan="7">
                     <hr />
                 </td>
               </tr>
               <tr style="font-weight: bold">
                 <td>&nbsp;</td>
                 <td>
                   <asp:Label ID="Label13" runat="server" Text="Marital status"></asp:Label>
                 </td>
                 <td>
                    <asp:DropDownList ID="ddl_Marital_Status" runat="server" Width="100%" TabIndex="17">
                        <asp:ListItem Value="S">Single</asp:ListItem>
                        <asp:ListItem Value="M">Married</asp:ListItem>
                        <asp:ListItem Value="D">Divorced</asp:ListItem>
                        <asp:ListItem Value="X">Separated</asp:ListItem>
                        <asp:ListItem Value="W">Widowed</asp:ListItem>
                    </asp:DropDownList>
                 </td>
                 <td>&nbsp;</td>
                 <td>&nbsp;</td>
                 <td>&nbsp;</td>
               </tr>
                <tr style="font-weight: bold">
                 <td>&nbsp;</td>
                 <td>
                     <asp:Label ID="Label14" runat="server" Text="Citizenship status"></asp:Label>
                 </td>
                 <td>
                    <asp:DropDownList ID="ddl_CitizenShip" runat="server" Width="100%" TabIndex="18">
                        <asp:ListItem Value="C">Citizen</asp:ListItem>
                        <asp:ListItem Value="R">Resident Alien</asp:ListItem>
                        <asp:ListItem Value="P">Permenent Resident Alien</asp:ListItem>
                        <asp:ListItem Value="I">Illigial Alien</asp:ListItem>
                    </asp:DropDownList>
                 </td>
                 <td align="right">
                      <asp:Label ID="Label102" runat="server" Text="Visa Type"></asp:Label>
                 </td>
                 <td>
                    <asp:DropDownList ID="ddl_visaTypes" runat="server" Width="100%" TabIndex="19">
                        <asp:ListItem Value="">U.S. Citizen</asp:ListItem>
                        <asp:ListItem Value="B1">Business (B-1)</asp:ListItem>
                        <asp:ListItem Value="B2">Medical Treatment (B-2)</asp:ListItem>
                        <asp:ListItem Value="K1">Fiance of citizen (K-1)</asp:ListItem>
                        <asp:ListItem Value="K3">Nonimmigrant (K-3)</asp:ListItem>
                        <asp:ListItem Value="L1">Managers/Excutives (L-1)</asp:ListItem>
                        <asp:ListItem Value="L2">Dependent of L-1 (L-2)</asp:ListItem>
                        <asp:ListItem Value="H4">Dependent to H1B (H-4)</asp:ListItem>
                        <asp:ListItem Value="F1">Foreign Student(F-1)</asp:ListItem>
                        <asp:ListItem Value="J1">Exchange Visitor (J-1)</asp:ListItem>
                        <asp:ListItem Value="M1">Vocational Student (M-1)</asp:ListItem>
                        <asp:ListItem Value="H1B">Special Occupation (H-1B)</asp:ListItem>
                        <asp:ListItem Value="H2B">Seasonal NonAgricultural (H-2B)</asp:ListItem>
                        <asp:ListItem Value="B_2">Tourism (B_2)</asp:ListItem>
                    </asp:DropDownList>
                 </td>
                 <td>&nbsp;</td>
               </tr>
                <tr style="font-weight: bold">
                 <td>&nbsp;</td>
                 <td>
                     <asp:Label ID="Label34" runat="server" Text="Visa Issue Date"></asp:Label>
                </td>
                 <td>
                     <asp:Label ID="Label84" runat="server" Text="Visa Experation Date"></asp:Label>
                 </td>
                 <td>
                      <asp:Label ID="Label100" runat="server" Text="USCIS Number"></asp:Label>
                 </td>
                 <td>
                      <asp:Label ID="Label101" runat="server" Text="'A' Number"></asp:Label>
                     
                 </td>
                 <td>&nbsp;</td>
               </tr>
                <tr>
                 <td>&nbsp;</td>
                 <td>
                    <asp:TextBox ID="TxtVisaIssDate" runat="server" TabIndex="20"></asp:TextBox>
                     <cc1:CalendarExtender runat="server" ID="CEVisaIssDate" FirstDayOfWeek="Sunday" Format="MM/dd/yyyy"
                              TargetControlID="TxtVisaIssDate">
                     </cc1:CalendarExtender>
                 </td>
                 <td>
                    <asp:TextBox ID="TxtVisaExpDate" runat="server" TabIndex="21"></asp:TextBox>
                     <cc1:CalendarExtender runat="server" ID="CEVisaExpDate" FirstDayOfWeek="Sunday" Format="MM/dd/yyyy"
                              TargetControlID="TxtVisaExpDate">
                     </cc1:CalendarExtender>
                 </td>
                 <td align="right">
                     <asp:TextBox ID="TxtUSCISNum" runat="server" TabIndex="22"></asp:TextBox>
                     <asp:RegularExpressionValidator ID="revUSCISNum" runat="server" ControlToValidate="TxtUSCISNum" ValidationExpression="[0-9]+" ErrorMessage="Please enter a valid numeric value"></asp:RegularExpressionValidator>
                    </td>
                 <td>
                     <asp:TextBox ID="TxtANumber" runat="server" TabIndex="23"></asp:TextBox>
                     <asp:RegularExpressionValidator ID="RevANum" runat="server" ControlToValidate="TxtANumber" ValidationExpression="[0-9]+" ErrorMessage="Please enter a valid numeric value"></asp:RegularExpressionValidator>
                    </td>
                 <td>&nbsp;</td>
               </tr>
                <tr style="font-weight: bold">
                 <td>&nbsp;</td>
                 <td>
                     <asp:Label ID="Label103" runat="server" Text="Resident Date"></asp:Label>
                 </td>
                 <td>
                    <asp:Label ID="Label86" runat="server" Text="Resident Exp. Date"></asp:Label>
                 </td>
                 <td align="right">
                     <asp:Label ID="Label104" runat="server" Text="Country of Birth"></asp:Label>
                    </td>
                 <td>
                    <asp:Label ID="Label99" runat="server" Text="Category"></asp:Label>
                    </td>
                 <td>&nbsp;</td>
               </tr>
                <tr>
                 <td>&nbsp;</td>
                 <td>
                    <asp:TextBox ID="TxtresDate" runat="server" TabIndex="24"></asp:TextBox>
                    <cc1:CalendarExtender runat="server" ID="CEResDate" FirstDayOfWeek="Sunday" Format="MM/dd/yyyy"
                              TargetControlID="TxtresDate">
                     </cc1:CalendarExtender>
                 </td>
                 <td>
                    <asp:TextBox ID="TxtResExpDate" runat="server" TabIndex="25"></asp:TextBox>
                    <cc1:CalendarExtender runat="server" ID="CEResExpDate" FirstDayOfWeek="Sunday" Format="MM/dd/yyyy"
                              TargetControlID="TxtResExpDate">
                     </cc1:CalendarExtender>
                 </td>
                 <td align="right">
                     <asp:TextBox ID="TxtCountryOfBirth" runat="server" TabIndex="26"></asp:TextBox>
                    </td>
                 <td>
                     <asp:TextBox ID="TxtCategory" runat="server" TabIndex="27"></asp:TextBox>
                    </td>
                 <td>&nbsp;</td>
               </tr>
               <tr>
                 <td colspan="7">
                     <hr />
                 </td>
               </tr>
               <tr align="left" style="font-weight: bold">
                 <td>&nbsp;</td>
                 <td colspan="3">
                      <asp:Label ID="Label15" runat="server" Text="Current Street Address, Apt.#/P.O. Box:"></asp:Label>
                 </td>
                 <td colspan="2" align="right">
                      <asp:Label ID="Label97" runat="server" Text="Date of Occupency"></asp:Label>
                 </td>
                 <td>&nbsp;</td>
               </tr>
               <tr>
                 <td>&nbsp;</td>
                 <td colspan="3">
                      <asp:TextBox ID="txtCurr_str_addr" runat="server" Width="100%" TabIndex="28"></asp:TextBox>
                 </td>
                 <td colspan="2" align="right">
                     <asp:TextBox ID="TxtCurr_addr_date_ocup" runat="server" TabIndex="29"></asp:TextBox>
                     <cc1:CalendarExtender runat="server" ID="CalCurAddrOcupDate" FirstDayOfWeek="Sunday" Format="MM/dd/yyyy"
                              TargetControlID="TxtCurr_addr_date_ocup">
                     </cc1:CalendarExtender>
                 </td>
                 <td>&nbsp;</td>
               </tr>
                <tr>
                 <td>&nbsp;</td>
                 <td colspan="3">
                      <asp:TextBox ID="TxtCurr_str_addr2" runat="server" Width="100%" TabIndex="30"></asp:TextBox>
                 </td>
                 <td colspan="2">
                     
                 </td>
                 <td>&nbsp;</td>
               </tr>
               <tr align="left" style="font-weight: bold">
                 <td>&nbsp;</td>
                 <td colspan="2">
                     <asp:Label ID="Label93" runat="server" Text="City:"></asp:Label>
                 </td>
                 <td>
                     <asp:Label ID="Label17" runat="server" Text="State:"></asp:Label>
                 </td>
                 <td>
                     <asp:Label ID="Label18" runat="server" Text="Zip:"></asp:Label>
                 </td>
                 <td>&nbsp;</td>
                 <td>&nbsp;</td>
               </tr>
               <tr>
                 <td>&nbsp;</td>
                 <td colspan="2">
                     <asp:TextBox ID="txtCurr_city" runat="server" Width="100%" TabIndex="31"></asp:TextBox>
                 </td>
                 <td>
                     <asp:DropDownList ID="ddlCurr_st" runat="server" Width="100%" TabIndex="32">
                        </asp:DropDownList>
                 </td>
                 <td>
                     <asp:TextBox ID="txtCurr_zip" runat="server" Width="100%" TabIndex="33"></asp:TextBox>
                      <asp:RegularExpressionValidator ID="RegcurrZip" runat="server" ControlToValidate="txtCurr_zip" ValidationExpression="[0-9]+" ErrorMessage="Please enter a valid numeric value"></asp:RegularExpressionValidator>
                 </td>
                 <td>&nbsp;</td>
                 <td>&nbsp;</td>
               </tr>
                <tr align="left" style="font-weight: bold">
                 <td>&nbsp;</td>
                 <td colspan="2">
                     <asp:Label ID="Label94" runat="server" Text="Country"></asp:Label>
                 </td>
                 <td colspan="2">
                     <asp:Label ID="Label16" runat="server" Text="County/Township"></asp:Label>
                 </td>
                 <td>&nbsp;</td>
                 <td align="center">
                      <asp:Label ID="Label107" runat="server" Text="Number of Minors"></asp:Label>
                   </td>
               </tr>
               <tr>
                 <td>&nbsp;</td>
                 <td colspan="2">
                     <asp:TextBox ID="TxtCurr_Country" runat="server" Width="100%" TabIndex="34"></asp:TextBox>
                 </td>
                 <td colspan="2">
                     <asp:TextBox ID="TxtCurr_CountyTownship" runat="server" Width="100%" TabIndex="35"></asp:TextBox>
                 </td>
                 <td>&nbsp;</td>
                 <td align="center">
                    <asp:TextBox ID="TxtNumMinors" runat="server" Width="50%" TabIndex="36"></asp:TextBox>
                   <asp:RegularExpressionValidator ID="revminors" runat="server" ControlToValidate="TxtNumMinors" ValidationExpression="[0-9]+" ErrorMessage="Please enter a valid numeric value"></asp:RegularExpressionValidator>
                 </td>
               </tr>
               <tr>
                 <td colspan="7">
                     <hr />
                 </td>
               </tr>
               <tr align="left" style="font-weight: bold">
                 <td>&nbsp;</td>
                 <td colspan="3">
                     <asp:Label ID="Label19" runat="server" Text="Previous Street Address, Apt.#/P.O. Box:"></asp:Label>
                 </td>
                 <td colspan="2" align="right">
                     <asp:Label ID="Label96" runat="server" Text="Date of Occupency"></asp:Label>
                   </td>
                 <td>&nbsp;</td>
               </tr>
               <tr>
                 <td>&nbsp;</td>
                 <td colspan="3">
                        <asp:TextBox ID="txtPrev_str_addr" runat="server" Width="100%" TabIndex="37"></asp:TextBox>
                 </td>
                 <td colspan="2" align="right">
                        <asp:TextBox ID="TxtPrev_addr_date_ocup" runat="server" TabIndex="38"></asp:TextBox>
                        <cc1:CalendarExtender runat="server" ID="CalPevAddrOcupDate" FirstDayOfWeek="Sunday" Format="MM/dd/yyyy"
                              TargetControlID="TxtPrev_addr_date_ocup">
                        </cc1:CalendarExtender>
                   </td>
                 <td>&nbsp;</td>
               </tr>
               <tr>
                 <td>&nbsp;</td>
                 <td colspan="3">
                      <asp:TextBox ID="txtPrev_str_addr2" runat="server" Width="100%" TabIndex="39"></asp:TextBox>
                 </td>
                 <td colspan="2">
                     
                 </td>
                 <td>&nbsp;</td>
               </tr>
               <tr align="left" style="font-weight: bold">
                 <td>&nbsp;</td>
                 <td colspan="2">
                     <asp:Label ID="Label21" runat="server" Text="City:"></asp:Label>
                 </td>
                 <td>
                     <asp:Label ID="Label22" runat="server" Text="State:"></asp:Label>
                 </td>
                 <td>
                     <asp:Label ID="Label23" runat="server" Text="Zip:"></asp:Label>
                 </td>
                 <td>&nbsp;</td>
                 <td>&nbsp;</td>
               </tr>
               <tr>
                 <td>&nbsp;</td>
                 <td colspan="2">
                        <asp:TextBox ID="txtPrev_city" runat="server" Width="100%" TabIndex="40"></asp:TextBox>
                 </td>
                 <td>
                        <asp:DropDownList ID="ddlPrev_st" runat="server" Width="100%" TabIndex="41" >
                        </asp:DropDownList>
                 </td>
                 <td>
                    <asp:TextBox ID="txtPrev_zip" runat="server" Width="100%" TabIndex="42"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="revprevzip" runat="server" ControlToValidate="txtPrev_zip" 
                     ValidationExpression="[0-9]+" ErrorMessage="Please enter a valid numeric value"></asp:RegularExpressionValidator>
                 </td>
                 <td>&nbsp;</td>
                 <td>&nbsp;</td>
              </tr>
               <tr align="left" style="font-weight: bold">
                 <td>&nbsp;</td>
                 <td colspan="2">
                     <asp:Label ID="Label20" runat="server" Text="Country"></asp:Label>
                 </td>
                 <td colspan="2">
                     <asp:Label ID="Label95" runat="server" Text="County/Township"></asp:Label>
                 </td>
                 <td>&nbsp;</td>
                 <td>&nbsp;</td>
               </tr>
               <tr>
                 <td>&nbsp;</td>
                 <td colspan="2">
                     <asp:TextBox ID="TxtPrev_Country" runat="server" Width="100%" TabIndex="43"></asp:TextBox>
                 </td>
                 <td>
                     <asp:TextBox ID="TxtPrev_countyTownship" runat="server" Width="100%" TabIndex="44"></asp:TextBox>
                 </td>
                 <td>&nbsp;</td>
                 <td>&nbsp;</td>
               </tr>
           </table>
                    </ContentTemplate>
            </cc1:TabPanel>
    <cc1:TabPanel ID="TabPanel2" runat="server" TabIndex="2" HeaderText="Case Info">
                <ContentTemplate> 
       <table id="CaseInfo" width="100%" style="font-family: Tahoma" cellspacing="10">
          <tr align="left" >
             <td>&nbsp;</td>
             <td colspan="1" style="font-weight: bold" align="right">
                   <asp:Label ID="Label59" runat="server" Text="Reason for asking for Trustee help?"></asp:Label>
             </td>
             <td colspan="1" >
                 <asp:CheckBox ID="CbNoIncome" runat="server" Text="No Income" TabIndex="45"/>
             </td>
             <td>
                  <asp:CheckBox ID="CbNotenoughIncome" runat="server" Text="Not Enough Income" TabIndex="46"/>
             </td>
             <td>
                  <asp:CheckBox ID="CbStolanincome" runat="server" Text="Income Stolen" TabIndex="47"/>
             </td>
             <td>  
                  <asp:CheckBox ID="CBEmgEvent" runat="server" Text="Emergency Event" TabIndex="48"/> 
             </td>
             <td>&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
          </tr>
          <tr align="left" style="font-weight: bold">
             <td>&nbsp;</td>
             <td colspan="5">
                 <asp:Label ID="Label60" runat="server" Text="Explanation of emergency or extraordinary circumstances, if any:"></asp:Label>
             </td>
             <td>&nbsp;</td>
         </tr>
         <tr>
             <td>&nbsp;</td>
             <td colspan="5">
                    <asp:TextBox ID="txt_Circum_Memo" runat="server" Width="100%" Height="1in" 
                        TextMode="multiLine" TabIndex="49"></asp:TextBox>
             </td>
             <td>&nbsp;</td>
         </tr>
         <tr>
            <td>&nbsp;</td>
          </tr>
         <tr align="left" style="font-weight: bold">
             <td>&nbsp;</td>
             <td colspan="5">
                 <asp:Label ID="Label61" runat="server" Text="Specific help being requested:"></asp:Label>
             </td>
             <td>&nbsp;</td>
         </tr>
         <tr>
             <td>&nbsp;</td>
             <td colspan="5">
                    <asp:TextBox ID="txt_Circum_Help_Request_Memo" runat="server" Width="100%" Height="1in" 
                        TextMode="multiLine" TabIndex="50"></asp:TextBox>
             </td>
             <td>&nbsp;</td>
         </tr>
         <tr>
            <td>&nbsp;</td>
          </tr>
          <tr align="left" style="font-weight: bold">
             <td>&nbsp;</td>
             <td colspan="5">
                 <asp:Label ID="Label83" runat="server" Text="Has anyone in the household been terminated from, refused or had AFDC payments reduced? If yes Explain"></asp:Label>
             </td>
             <td colspan="2">&nbsp;</td>
          </tr>
          <tr>
             <td>&nbsp;</td>
             <td colspan="5"">
                 <asp:TextBox ID="txt_AFDC_denial_memo" runat="server" Width="100%" 
                     TextMode="multiLine" Height="108px" TabIndex="51"></asp:TextBox>
             </td>
             <td>&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
          </tr>
          <tr align="left" style="font-weight: bold">
             <td>&nbsp;</td>
             <td colspan="5">
                <asp:Label ID="Label85" runat="server" Text="Has anyone in the household ever been convicted of welfare fraud under IC 35-43-5-7? If yes Explain"></asp:Label>
            </td>
           <td colspan="1">&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td colspan="5"">
                <asp:TextBox ID="txt_welfr_fraud_memo" runat="server" Width="100%" 
                    TextMode="multiLine" Height="108px" TabIndex="52"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
       </table>   
                    </ContentTemplate>
            </cc1:TabPanel>
    <cc1:TabPanel ID="TabPanel3" runat="server" TabIndex="3" HeaderText="Pet Info">
                <ContentTemplate> 
       <table width="100%">
         <tr>
            <td class="style6" style="width: 168px">
                <asp:Label ID="Label125" runat="server" Text="Pet Name"></asp:Label>
            </td>
            <td>
                <asp:Label ID="Label126" runat="server" Text="Pet Age"></asp:Label>
            </td>
            <td>
                <asp:Label ID="Label127" runat="server" Text="Pet Type"></asp:Label>
            </td>
            <td>
                <asp:Label ID="Label128" runat="server" Text="Pet gender"></asp:Label>
            </td>
         </tr>
          <tr>
            <td class="style6" style="width: 168px">
                <asp:TextBox ID="TxtPetName" runat="server" Width="227px" TabIndex="53"></asp:TextBox>
            </td>
            <td>
                <asp:TextBox ID="TxtPetAge" runat="server" Width="45px" TabIndex="54"></asp:TextBox>
                <asp:RegularExpressionValidator ID="revpetage" runat="server" ControlToValidate="TxtPetAge" 
                ValidationExpression="[0-9]+" ErrorMessage="Please enter a valid numeric value"></asp:RegularExpressionValidator>
            </td>
            <td>
                <asp:DropDownList ID="DDL_PetType" runat="server"
                    DataSourceID="PetTypes" DataValueField="pet_Type_id" DataTextField="pet_type" TabIndex="55">
                </asp:DropDownList>
                <asp:SqlDataSource ID="PetTypes" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
                    SelectCommand="SP_DMCS_Get_Pet_Types_ddl" SelectCommandType="StoredProcedure">
               </asp:SqlDataSource>
            </td>
            <td>
                 <asp:DropDownList ID="DDL_PetGender" runat="server" TabIndex="56">
                     <asp:ListItem Value=""> </asp:ListItem>
                     <asp:ListItem Value="m">Male</asp:ListItem>
                     <asp:ListItem Value="f">Female</asp:ListItem>    
                </asp:DropDownList>
            </td>
         </tr>
         <tr>
            <td align="center" class="style6" style="width: 168px">
                <asp:Label ID="Label129" runat="server" Text="Pet Color"></asp:Label>
            </td>
            <td>
                <asp:Label ID="Label130" runat="server" Text="License tag"></asp:Label>
            </td>
            <td>
                <asp:Label ID="Label131" runat="server" Text="Pet Tatoo Number"></asp:Label>
            </td>
            <td>
                <asp:Label ID="Label132" runat="server" Text="Spayed or Nuetered"></asp:Label>
            </td>
         </tr>
          <tr>
            <td class="style6" style="width: 168px">
                <asp:TextBox ID="TxtPetColor" runat="server" Width="154px" TabIndex="56"></asp:TextBox>
            </td>
            <td>
                <asp:TextBox ID="TxtLiscTag" runat="server" Width="157px" TabIndex="57"></asp:TextBox>
            </td>
            <td>
                <asp:TextBox ID="TxtTatooNum" runat="server" Width="227px" TabIndex="58"></asp:TextBox>
      
            </td>
            <td>
                 <asp:DropDownList ID="DDL_Spay_neuter" runat="server" Height="20px" 
                     Width="117px" TabIndex="59">
                     <asp:ListItem Value=""> </asp:ListItem>
                     <asp:ListItem Value="Y">Yes</asp:ListItem>
                     <asp:ListItem Value="N">No</asp:ListItem>    
                </asp:DropDownList>
            </td>
         </tr>
         <tr>
           <td>
           </td>
           <td>
               <asp:Label ID="Label142" runat="server" Text="Pet Status"></asp:Label>
           </td>
           <td>
               <asp:Label ID="Label143" runat="server" Text="Pet Chip ID"></asp:Label>
           </td>
           <td>
           </td>
         </tr>
         <tr>
            <td>
            </td>
            <td>
             <asp:DropDownList ID="DDLPetStatus" runat="server" Height="16px" Width="172px" TabIndex="60">
                  <asp:ListItem Value=""> </asp:ListItem>
                  <asp:ListItem Value="A">Alive</asp:ListItem>
                  <asp:ListItem Value="D">Deceased</asp:ListItem> 
                  <asp:ListItem Value="M">Missing</asp:ListItem>
             </asp:DropDownList>
            </td>
            <td>
                <asp:TextBox ID="TxtPetChipID" runat="server" Width="226px" TabIndex="61"></asp:TextBox>
            </td>
            <td>
            </td>
         </tr>
         <tr>
             <td align="right">
                 <asp:Label ID="Label133" runat="server" Text="Description"></asp:Label>
                 &nbsp;</td>
             <td colspan="3"  align="left">
                 <asp:TextBox ID="txtPetdesc" runat="server" TextMode="MultiLine" 
                     style="margin-left: 0px" Width="478px" Height="89px" TabIndex="62"></asp:TextBox>
             </td>
         </tr>
         <tr>
            <td colspan="4" align="center">
                <asp:Button ID="BtnAddPets" runat="server" Text="Add Pet" 
                    onclick="BtnAddPets_Click" TabIndex="63" />
            </td>
         </tr>
         <tr>
           <td>
              &nbsp;
           </td>
         </tr>
          <tr style="font-weight: bold">
               <td colspan="4" align="center">
              
                             <asp:GridView ID="GVpetInfo" runat="server" AutoGenerateColumns="False" 
                         AutoGenerateDeleteButton="true" OnRowDeleting="GVpetInfo_RowDeleting"
                          DataKeyNames="pet_record_id">
                        <Columns>
                            <asp:BoundField DataField="Pet_Name" HeaderText="Name" SortExpression="Name" />
                            <asp:BoundField DataField="Pet_Age" HeaderText="Age" SortExpression="Age" />
                            <asp:BoundField DataField="Pet_Description" HeaderText="Description" SortExpression="Description" />
                            <asp:BoundField DataField="Pet_Type" HeaderText="Type" SortExpression="Type" />
                            <asp:BoundField DataField="Pet_Gender" HeaderText="Gender" SortExpression="Gender" />
                            <asp:BoundField DataField="Pet_Color" HeaderText="Color" SortExpression="Color" />
                            <asp:BoundField DataField="Pet_tag" HeaderText="Tag #" SortExpression="Tag #" />
                            <asp:BoundField DataField="Pet_tatoo" HeaderText="Tatoo #" SortExpression="Tatoo #" />
                            <asp:BoundField DataField="Pet_spay_nuet" HeaderText="spay/nuet" SortExpression="spay/nuet" />
                            <asp:BoundField DataField="Pet_Record_id" HeaderText="Pet_id"/>
                            <asp:BoundField DataField="Pet_Status" HeaderText="Pet Status"/>
                            <asp:BoundField DataField="Pet_Chip_id" HeaderText="Pet Chip ID"/>
                        </Columns>
                    </asp:GridView>
                    
               </td>
            </tr>
       </table>
    </ContentTemplate>
            </cc1:TabPanel>
    <cc1:TabPanel ID="TabPanel4" runat="server" TabIndex="4" HeaderText="Employer Info">
                <ContentTemplate> 

       <table width="100%">
           <tr>
             <td>
                 &nbsp;
             </td>
             <td colspan="2" align="left">
                 <asp:Label ID="Label109" runat="server" Text="Employer Name"></asp:Label>
             </td>
             <td  align="left">
                 <asp:Label ID="Label115" runat="server" Text="Employer Phone"></asp:Label>
             </td>
             <td  colspan="2">
                 &nbsp;
             </td>
           </tr>
           <tr>
             <td>
                 &nbsp;
             </td>
             <td colspan="2"  align="left">
                 <asp:TextBox ID="TxtEmplr_Name" runat="server" Width="100%" TabIndex="64"></asp:TextBox>
             </td>
             <td  align="left">
                <asp:TextBox ID="TxtEmplr_Phone" runat="server" Width="120px" TabIndex="65"></asp:TextBox>
             </td>
             <td  colspan="2">
                 &nbsp;
             </td>
           </tr>
           <tr>
               <td>
                   &nbsp;
               </td>
               <td colspan="2">
                   <asp:Label ID="Label108" runat="server" 
                       Text="Employer Street Address:"></asp:Label>
               </td>
               <td align="right" colspan="2">
                   &nbsp;
               </td>
               <td>
                   &nbsp;
               </td>
           </tr>
           <tr>
               <td>
                   &nbsp;
               </td>
               <td colspan="2">
                   <asp:TextBox ID="txtempr_str_addr" runat="server" Width="100%" TabIndex="66"></asp:TextBox>
               </td>
               <td align="right" colspan="2">
                   &nbsp;
               </td>
               <td>
                   &nbsp;
               </td>
           </tr>
           <tr>
               <td>
                   &nbsp;
               </td>
               <td colspan="2">
                   <asp:TextBox ID="Txtempr_str_addr2" runat="server" Width="100%" TabIndex="67"></asp:TextBox>
               </td>
               <td colspan="2">
                  &nbsp;
               </td>
               <td>
                   &nbsp;
              </td>
           </tr>
           <tr>
               <td>
                   &nbsp;</td>
               <td>
                   <asp:Label ID="Label110" runat="server" Text="City:"></asp:Label>
               </td>
               <td>
                   <asp:Label ID="Label111" runat="server" Text="State:"></asp:Label>
               </td>
               <td>
                   <asp:Label ID="Label112" runat="server" Text="Zip:"></asp:Label>
               </td>
               <td>
                   &nbsp;</td>
               <td>
                   &nbsp;</td>
           </tr>
           <tr>
               <td>
                   &nbsp;</td>
               <td>
                   <asp:TextBox ID="txtempr_city" runat="server" Width="100%" TabIndex="68"></asp:TextBox>
               </td>
               <td>
                   <asp:DropDownList ID="ddlempr_st" runat="server" Width="84%" TabIndex="69">
                   </asp:DropDownList>
               </td>
               <td>
                   <asp:TextBox ID="txtempr_zip" runat="server" Width="27%" TabIndex="70"></asp:TextBox>
                   <asp:RegularExpressionValidator ID="REVemprZip" runat="server" ControlToValidate="txtempr_zip" ValidationExpression="[0-9]+" ErrorMessage="Please enter a valid numeric value"></asp:RegularExpressionValidator>
               </td>
               <td>
                   &nbsp;</td>
               <td>
                   &nbsp;</td>
           </tr>
           <tr>
               <td>
                   &nbsp;</td>
               <td>
                   <asp:Label ID="Label113" runat="server" Text="Country"></asp:Label>
               </td>
               <td colspan="2">
                   <asp:Label ID="Label114" runat="server" Text="County/Township"></asp:Label>
               </td>
               <td>
                   &nbsp;
               </td>
               <td align="center">
                   &nbsp;
               </td>
           </tr>
           <tr>
               <td>
                   &nbsp;</td>
               <td>
                   <asp:TextBox ID="TxtEmpr_Country" runat="server" Width="100%" TabIndex="71"></asp:TextBox>
               </td>
               <td colspan="2">
                   <asp:TextBox ID="Txtempr_CountyTownship" runat="server" Width="39%" TabIndex="72"></asp:TextBox>
               </td>
               <td>
                   &nbsp;
               </td>
               <td align="center">
                    &nbsp;
               </td>
           </tr>
            <tr>
               <td>
                   &nbsp;</td>
               <td align="left">
                   <asp:Label ID="Label116" runat="server" Text="Start Date"></asp:Label>
               </td>
               <td align="left">
                   <asp:Label ID="Label117" runat="server" Text="End Date"></asp:Label>
               </td>
               <td>
                   &nbsp;
               </td>
               <td colspan="3">
                    &nbsp;
               </td>
           </tr>
           <tr>
              <td>
                   &nbsp;</td>
               <td align="left">
                   <asp:TextBox ID="TxtEmpSrtDate" runat="server" Width="48%" TabIndex="73"></asp:TextBox>
                   <cc1:CalendarExtender runat="server" ID="ceempstrdate" FirstDayOfWeek="Sunday" Format="MM/dd/yyyy"
                              TargetControlID="TxtEmpSrtDate">
                        </cc1:CalendarExtender>
               </td>
               <td align="left">
                   <asp:TextBox ID="TxtEmpEndDate" runat="server" Width="70%" TabIndex="74"></asp:TextBox>
                   <cc1:CalendarExtender runat="server" ID="ceempenddate" FirstDayOfWeek="Sunday" Format="MM/dd/yyyy"
                              TargetControlID="TxtEmpEndDate">
                        </cc1:CalendarExtender>
               </td>
               <td>
                   &nbsp;
               </td>
               <td colspan="3">
                    &nbsp;
               </td>
           </tr>
       </table>
       <table>
          <tr>
               <td>
                   &nbsp;
               </td>
              <td align="right">
                  <asp:Label ID="Label118" runat="server" Text="Reason for Leaving:"></asp:Label>
              </td>
              <td align="left" colspan="5">
                  <asp:TextBox ID="TxtTermReas" runat="server" TextMode="MultiLine" Height="61px" 
                      style="margin-left: 0px" Width="750px" TabIndex="75"></asp:TextBox>
              </td>
           </tr>
       </table>
                    </ContentTemplate>
            </cc1:TabPanel>
    <cc1:TabPanel ID="TabPanel5" runat="server" TabIndex="5" HeaderText="Income Info">
        <ContentTemplate> 
           <table id="tblFinancialInfo" width="100%" style="font-family: Tahoma" cellspacing="10">
              <tr align="left" style="font-weight: bold">
                  <td style="height: 44px"></td>
                  <td colspan="1" style="width: 272px; height: 44px;" valign="bottom">
                      <asp:Label ID="Label25" runat="server" Text="What is your housing status?"></asp:Label>
                  </td>
                 
                  <td colspan="2" style="height: 44px" valign="bottom">
                      <asp:Label ID="Label26" runat="server" Text=" What is your income status?"></asp:Label> 
                  </td>
                  <td>&nbsp;</td>
                  <td colspan="2" align="left" style="height: 44px"  valign="bottom">
                      <asp:Label ID="Label27" runat="server" Text="What is your employment status?"></asp:Label>
                  </td>
              </tr>
              <tr align="left" style="font-weight: bold">
                  <td>&nbsp;</td>
                  <td colspan="1" valign="top">
                    <asp:DropDownList ID="ddlHousingStatus" runat="server" Width="49%" Height="24px" TabIndex="76">
                        <asp:ListItem>Own</asp:ListItem>
                        <asp:ListItem>Buying</asp:ListItem>
                        <asp:ListItem>Renting</asp:ListItem>
                        <asp:ListItem>Homeless</asp:ListItem>
                        <asp:ListItem>Other</asp:ListItem>
                    </asp:DropDownList>
                  </td>
                  <td colspan="2" valign="top">
                    <asp:DropDownList ID="ddlIncomeStatus" runat="server" Width="102%" Height="24px" TabIndex="77">
                        <asp:ListItem Value="0">Wages Stopped</asp:ListItem>
                        <asp:ListItem Value="1">Waiting on Income</asp:ListItem>
                        <asp:ListItem Value="2">Receiving Income</asp:ListItem>
                        <asp:ListItem Value="3">No Income</asp:ListItem>
                        </asp:DropDownList>
                  </td>
                  <td>&nbsp;</td>
                  <td colspan="2" align="left" valign="top">
                    <asp:DropDownList ID="ddlEmpStatus" runat="server" Width="79%" Height="24px" TabIndex="78">
                        <asp:ListItem>Currently Working</asp:ListItem>
                        <asp:ListItem>Laid-off</asp:ListItem>
                        <asp:ListItem>Never Worked</asp:ListItem>
                        <asp:ListItem>Quit</asp:ListItem>
                        <asp:ListItem>Fired</asp:ListItem>
                        <asp:ListItem>Sick Leave</asp:ListItem>
                        <asp:ListItem>Maternity Leave</asp:ListItem>
                        <asp:ListItem>On Strike</asp:ListItem>
                        <asp:ListItem>Trying to Find Work</asp:ListItem>
                        </asp:DropDownList>
                  </td>
                   <td>&nbsp;</td>
              </tr>
              <tr>
                 <td colspan="7">
                     <hr />
                 </td>
               </tr>
              <tr align="center">
                  <td colspan="7">
                      <asp:Label ID="Label28" runat="server" Text="WAGES AND OTHER PUBLIC ASSISTANCE" CssClass="header"></asp:Label>
                  </td>
              </tr>
              <tr style="font-weight:bold">
                 <td>&nbsp;</td>
                 <td colspan="5" align="center">
                     <asp:Label ID="Label29" runat="server" Text="Are you receiving or have you applied for the following"></asp:Label>
                 </td>
                 <td>&nbsp;</td>
              </tr>
              <tr>
                 <td>&nbsp;</td>
                 <td colspan="4" align="right">&nbsp;</td>
                 <td align="center" style="font-weight:bold">
                     <asp:Label ID="Label81" runat="server" Text="Amount"></asp:Label>
                 </td>
                 <td align="center" style="font-weight:bold">
                     <asp:Label ID="Label82" runat="server" Text="Date"></asp:Label>
                 </td>
                 <td>&nbsp;</td>
              </tr>
              <tr>
                 <td>&nbsp;</td>
                 <td colspan="3" align="right">
                     <asp:Label ID="Label30" runat="server" Text="Wages:"></asp:Label> 
                 </td>
                 <td>     
                     <asp:DropDownList ID="cbl_inc_src_wages" runat="server" TabIndex="79">
                         <asp:ListItem Value="0">No</asp:ListItem>
                         <asp:ListItem Value="1">Yes</asp:ListItem>
                      </asp:DropDownList>
                 </td>
                 <td>
                     <asp:TextBox ID="txt_Wages_Amt" runat="server" Width="100%" TabIndex="80"></asp:TextBox>
                     <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txt_Wages_Amt" 
                        ValidationExpression="^(?!0$|0\d)\d{1,6}(\.\d{1,2})?$|^$" ErrorMessage="Please enter a valid amount"></asp:RegularExpressionValidator>
                 </td>
                 <td>&nbsp;</td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td colspan="3" align="right">
                    <asp:Label ID="Label31" runat="server" Text="Strike Benefits:"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="cbl_inc_StrikeBen" runat="server" TabIndex="81">
                        <asp:ListItem Value="0">No</asp:ListItem>
                        <asp:ListItem Value="1">Yes</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:TextBox ID="txt_Strike_Benefits_Amt" runat="server" Width="100%" TabIndex="82"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txt_Strike_Benefits_Amt" 
                     ValidationExpression="^(?!0$|0\d)\d{1,6}(\.\d{1,2})?$|^$" ErrorMessage="Please enter a valid amount"></asp:RegularExpressionValidator>
                </td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td colspan="3" align="right">
                    <asp:Label ID="Label32" runat="server" Text="Pension:"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="cbl_inc_src_Pension" runat="server" TabIndex="83">
                            <asp:ListItem Value="0">No</asp:ListItem>
                            <asp:ListItem Value="1">Yes</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:TextBox ID="txt_Pension_Amt" runat="server" Width="100%" TabIndex="84"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txt_Pension_Amt" 
                    ValidationExpression="^(?!0$|0\d)\d{1,6}(\.\d{1,2})?$|^$" ErrorMessage="Please enter a valid amount"></asp:RegularExpressionValidator>
                </td>
                <td >&nbsp;</td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td colspan="3" align="right">
                    <asp:Label ID="Label33" runat="server" Text="Support:"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="ddlSupport" runat="server" TabIndex="85">
                        <asp:ListItem Value="0">No</asp:ListItem>
                        <asp:ListItem Value="1">Yes</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:TextBox ID="txt_Support_Amt" runat="server" Width="100%" TabIndex="86"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txt_Support_Amt" 
                     ValidationExpression="^(?!0$|0\d)\d{1,6}(\.\d{1,2})?$|^$" ErrorMessage="Please enter a valid amount"></asp:RegularExpressionValidator>
                </td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td colspan="3" align="right">
                    <asp:Label ID="Label35" runat="server" Text="Utility Allotment:"></asp:Label> 
                </td>
                <td>
                    <asp:DropDownList ID="ddlUtilall" runat="server" TabIndex="87">
                       <asp:ListItem Value="0">No</asp:ListItem>
                       <asp:ListItem Value="1">Yes</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                   <asp:TextBox ID="TxtutilallAmt" runat="server" Width="100%" TabIndex="88"></asp:TextBox>
                   <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="TxtutilallAmt" 
                        ValidationExpression="^(?!0$|0\d)\d{1,6}(\.\d{1,2})?$|^$" ErrorMessage="Please enter a valid amount"></asp:RegularExpressionValidator>
                </td>
                <td>
                   <asp:TextBox ID="TxtutilallDate" runat="server" TabIndex="89"></asp:TextBox>
                   <cc1:CalendarExtender runat="server" ID="CalUtilAllDate" FirstDayOfWeek="Sunday"
                       Format="MM/dd/yyyy" TargetControlID="TxtutilallDate">
                   </cc1:CalendarExtender>
                </td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td colspan="3" align="right">
                    <asp:Label ID="Label36" runat="server" Text="Food Stamps:"></asp:Label> 
                </td>
                <td>
                    <asp:DropDownList ID="ddlFoodstmp" runat="server" TabIndex="90">
                         <asp:ListItem Value="0">No</asp:ListItem>
                         <asp:ListItem Value="1">Yes</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:TextBox ID="TxtFoodstmpAmt" runat="server" Width="100%" TabIndex="91"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="TxtFoodstmpAmt" 
                        ValidationExpression="^(?!0$|0\d)\d{1,6}(\.\d{1,2})?$|^$" ErrorMessage="Please enter a valid amount"></asp:RegularExpressionValidator>
                </td>
                <td>
                   <asp:TextBox ID="TxtFoodstmpDate" runat="server" TabIndex="92"></asp:TextBox>
                   <cc1:CalendarExtender runat="server" ID="CalFoodStmpDate" FirstDayOfWeek="Sunday"
                       Format="MM/dd/yyyy" TargetControlID="TxtFoodstmpDate">
                   </cc1:CalendarExtender>
                </td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td colspan="3" align="right">
                    <asp:Label ID="Label37" runat="server" Text="AFDC Welfare:"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="ddlAFDC" runat="server" TabIndex="93">
                        <asp:ListItem Value="0">No</asp:ListItem>
                        <asp:ListItem Value="1">Yes</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                  <asp:TextBox ID="TxtAFDCAmt" runat="server" Width="100%" TabIndex="94"></asp:TextBox>
                  <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ControlToValidate="TxtAFDCAmt" 
                        ValidationExpression="^(?!0$|0\d)\d{1,6}(\.\d{1,2})?$|^$" ErrorMessage="Please enter a valid amount"></asp:RegularExpressionValidator>
                </td>
                <td>
                  <asp:TextBox ID="TxtAFDCDate" runat="server" TabIndex="95"></asp:TextBox>
                  <cc1:CalendarExtender runat="server" ID="CalAFDCDate" FirstDayOfWeek="Sunday"
                       Format="MM/dd/yyyy" TargetControlID="TxtAFDCDate">
                   </cc1:CalendarExtender>
                </td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td colspan="3" align="right">
                    <asp:Label ID="Label38" runat="server" Text="Other Trustee Office:"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="ddlTrustOff" runat="server" TabIndex="96">
                        <asp:ListItem Value="0">No</asp:ListItem>
                        <asp:ListItem Value="1">Yes</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                   <asp:TextBox ID="TxtTrustOffAmt" runat="server" Width="100%" TabIndex="97"></asp:TextBox>
                   <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" ControlToValidate="TxtTrustOffAmt" 
                        ValidationExpression="^(?!0$|0\d)\d{1,6}(\.\d{1,2})?$|^$" ErrorMessage="Please enter a valid amount"></asp:RegularExpressionValidator>
                </td>
                <td>
                  <asp:TextBox ID="TxtTrustOffDate" runat="server" TabIndex="98"></asp:TextBox>
                  <cc1:CalendarExtender runat="server" ID="CalTrustOffDate" FirstDayOfWeek="Sunday"
                       Format="MM/dd/yyyy" TargetControlID="TxtTrustOffDate">
                   </cc1:CalendarExtender>
                </td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td colspan="3" align="right">
                    <asp:Label ID="Label39" runat="server" Text="Social Security (any type):"></asp:Label>
                </td>
                <td>
                   <asp:DropDownList ID="ddlSS" runat="server" TabIndex="99">
                      <asp:ListItem Value="0">No</asp:ListItem>
                      <asp:ListItem Value="1">Yes</asp:ListItem>
                  </asp:DropDownList>
                </td>
                <td>
                    <asp:TextBox ID="txtssAmt" runat="server" Width="100%" TabIndex="100"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator9" runat="server" ControlToValidate="txtssAmt" 
                        ValidationExpression="^(?!0$|0\d)\d{1,6}(\.\d{1,2})?$|^$" ErrorMessage="Please enter a valid amount"></asp:RegularExpressionValidator>
                </td>
                <td>
                    <asp:TextBox ID="txtssDate" runat="server" TabIndex="101"></asp:TextBox>
                    <cc1:CalendarExtender runat="server" ID="CalSSDate" FirstDayOfWeek="Sunday"
                       Format="MM/dd/yyyy" TargetControlID="txtssDate">
                   </cc1:CalendarExtender>
                </td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td colspan="3" align="right">
                    <asp:Label ID="Label40" runat="server" Text="V.A. Benefits (any time):"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="ddlVA" runat="server" TabIndex="102">
                        <asp:ListItem Value="0">No</asp:ListItem>
                        <asp:ListItem Value="1">Yes</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:TextBox ID="txtVAAmt" runat="server" Width="100%" TabIndex="103"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator10" runat="server" ControlToValidate="txtVAAmt" 
                        ValidationExpression="^(?!0$|0\d)\d{1,6}(\.\d{1,2})?$|^$" ErrorMessage="Please enter a valid amount"></asp:RegularExpressionValidator>
                </td>
                <td>
                   <asp:TextBox ID="txtVADate" runat="server" TabIndex="104"></asp:TextBox>
                   <cc1:CalendarExtender runat="server" ID="CalVADate" FirstDayOfWeek="Sunday"
                       Format="MM/dd/yyyy" TargetControlID="txtVADate">
                   </cc1:CalendarExtender>
                </td>
              </tr>
              <tr>
                 <td colspan="4" align="right">
                     <asp:Label ID="Label41" runat="server" Text="EAP Utility Assistance:"></asp:Label> 
                 </td>
                 <td>
                     <asp:DropDownList ID="ddlEAP" runat="server" TabIndex="105">
                         <asp:ListItem Value="0">No</asp:ListItem>
                         <asp:ListItem Value="1">Yes</asp:ListItem>
                     </asp:DropDownList>
                 </td>
                 <td>
                     <asp:TextBox ID="txtEAPAmt" runat="server" Width="100%" TabIndex="106"></asp:TextBox>
                     <asp:RegularExpressionValidator ID="RegularExpressionValidator11" runat="server" ControlToValidate="txtEAPAmt" 
                        ValidationExpression="^(?!0$|0\d)\d{1,6}(\.\d{1,2})?$|^$" ErrorMessage="Please enter a valid amount"></asp:RegularExpressionValidator>
                 </td>
                 <td>
                     <asp:TextBox ID="txtEAPDate" runat="server" TabIndex="107"></asp:TextBox>
                     <cc1:CalendarExtender runat="server" ID="CalEAPDate" FirstDayOfWeek="Sunday"
                       Format="MM/dd/yyyy" TargetControlID="txtEAPDate">
                   </cc1:CalendarExtender>
                 </td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td colspan="3" align="right">
                    <asp:Label ID="Label42" runat="server" Text="FEMA Funds:"></asp:Label> 
                </td>
                <td>
                    <asp:DropDownList ID="ddlFema" runat="server" TabIndex="108">
                        <asp:ListItem Value="0">No</asp:ListItem>
                        <asp:ListItem Value="1">Yes</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:TextBox ID="TxtFemaAmt" runat="server" Width="100%" TabIndex="109"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator12" runat="server" ControlToValidate="TxtFemaAmt" 
                        ValidationExpression="^(?!0$|0\d)\d{1,6}(\.\d{1,2})?$|^$" ErrorMessage="Please enter a valid amount"></asp:RegularExpressionValidator>
                </td>
                <td>
                    <asp:TextBox ID="TxtFEMADate" runat="server" TabIndex="110"></asp:TextBox>
                    <cc1:CalendarExtender runat="server" ID="CalFemaDate" FirstDayOfWeek="Sunday"
                       Format="MM/dd/yyyy" TargetControlID="TxtFEMADate">
                   </cc1:CalendarExtender>
                </td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td colspan="3" align="right">
                    <asp:Label ID="Label43" runat="server" Text="Unemployment Benefits:"></asp:Label> 
                </td>
                <td>
                    <asp:DropDownList ID="ddlUnemployment" runat="server" TabIndex="111">
                       <asp:ListItem Value="0">No</asp:ListItem>
                       <asp:ListItem Value="1">Yes</asp:ListItem>
                    </asp:DropDownList>
               </td>
               <td>
                   <asp:TextBox ID="txtUnemplAmt" runat="server" Width="100%" TabIndex="112"></asp:TextBox>
                   <asp:RegularExpressionValidator ID="RegularExpressionValidator13" runat="server" ControlToValidate="txtUnemplAmt" 
                        ValidationExpression="^(?!0$|0\d)\d{1,6}(\.\d{1,2})?$|^$" ErrorMessage="Please enter a valid amount"></asp:RegularExpressionValidator>
               </td>
               <td>
                  <asp:TextBox ID="txtUnemplDate" runat="server" TabIndex="113"></asp:TextBox>
                  <cc1:CalendarExtender runat="server" ID="CalUnempLDate" FirstDayOfWeek="Sunday"
                       Format="MM/dd/yyyy" TargetControlID="txtUnemplDate">
                   </cc1:CalendarExtender>
               </td>
             </tr>
              <tr>
               <td>&nbsp;</td>
               <td colspan="3" align="right">
                   <asp:Label ID="Label44" runat="server" Text="Grants/Loans:"></asp:Label>
               </td>
               <td>  
                   <asp:DropDownList ID="ddlGrantloan" runat="server" TabIndex="114">
                      <asp:ListItem Value="0">No</asp:ListItem>
                      <asp:ListItem Value="1">Yes</asp:ListItem>
                   </asp:DropDownList>
               </td>
               <td>
                   <asp:TextBox ID="txtGrantLoanAmt" runat="server" Width="100%" TabIndex="115"></asp:TextBox>
                   <asp:RegularExpressionValidator ID="RegularExpressionValidator14" runat="server" ControlToValidate="txtGrantLoanAmt" 
                        ValidationExpression="^(?!0$|0\d)\d{1,6}(\.\d{1,2})?$|^$" ErrorMessage="Please enter a valid amount"></asp:RegularExpressionValidator>
              </td>
              <td>
                   <asp:TextBox ID="txtGrantLoanDate" runat="server" TabIndex="116"></asp:TextBox>
                   <cc1:CalendarExtender runat="server" ID="CalgrantloanDate" FirstDayOfWeek="Sunday"
                       Format="MM/dd/yyyy" TargetControlID="txtGrantLoanDate">
                   </cc1:CalendarExtender>
              </td>
             </tr>
              <tr>
                <td>&nbsp;</td>
                <td colspan="3" align="right">
                    <asp:Label ID="Label45" runat="server" Text="Any Other Type of Help:"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="ddlOtherhelp" runat="server" TabIndex="117">
                       <asp:ListItem Value="0">No</asp:ListItem>
                       <asp:ListItem Value="1">Yes</asp:ListItem>
                   </asp:DropDownList>
                </td>
                <td>
                    <asp:TextBox ID="TxtotherhelpAmt" runat="server" Width="100%" TabIndex="118"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator15" runat="server" ControlToValidate="TxtotherhelpAmt" 
                        ValidationExpression="^(?!0$|0\d)\d{1,6}(\.\d{1,2})?$|^$" ErrorMessage="Please enter a valid amount"></asp:RegularExpressionValidator>
                </td>
                <td>
                     <asp:TextBox ID="TxtotherhelpDate" runat="server" Width="100%" TabIndex="119"></asp:TextBox>
                     <cc1:CalendarExtender runat="server" ID="CalOherHelpDate" FirstDayOfWeek="Sunday"
                       Format="MM/dd/yyyy" TargetControlID="TxtotherhelpDate">
                    </cc1:CalendarExtender>
                </td>
              </tr>
              <tr>
                 <td colspan="7">
                     <hr />
                 </td>
               </tr>
              <tr>
                <td colspan="2" style="font-weight:bold" align="right">
                    <asp:Label ID="Label46" runat="server" Text="Do you have life insurance?"></asp:Label> 
                </td>
                <td>
                    <asp:DropDownList ID="ddl_Life_Ins" runat="server" TabIndex="120">
                        <asp:ListItem Value="N">No</asp:ListItem>
                        <asp:ListItem Value="Y">Yes</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
              <tr>
                <td colspan="2" style="font-weight:bold" align="right">
                   <asp:Label ID="Label47" runat="server" Text="Do you have any investments? (Stocks, Bonds, CD's, IRA's)"></asp:Label> 
                </td>
                <td>
                   <asp:DropDownList ID="ddl_Investments" runat="server" TabIndex="121">
                        <asp:ListItem Value="N">No</asp:ListItem>
                        <asp:ListItem Value="Y">Yes</asp:ListItem>
                   </asp:DropDownList></td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
              <tr>
                <td colspan="2" style="font-weight:bold" align="right" >
                    <asp:Label ID="Label48" runat="server" Text="Do you have any cash on hand?"></asp:Label>  
                </td>
                <td>
                    <asp:DropDownList ID="ddl_Cash_on_Hand" runat="server" TabIndex="122">
                        <asp:ListItem Value="N">No</asp:ListItem>
                        <asp:ListItem Value="Y">Yes</asp:ListItem>
                    </asp:DropDownList></td>
                <td>
                    <asp:Label ID="Label49" runat="server" Text="Amount:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txt_Cash_Amt" runat="server" TabIndex="123"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator16" runat="server" ControlToValidate="txt_Cash_Amt" 
                        ValidationExpression="^(?!0$|0\d)\d{1,6}(\.\d{1,2})?$|^$" ErrorMessage="Please enter a valid amount"></asp:RegularExpressionValidator>
                </td>
                <td>&nbsp;</td>
            </tr>
              <tr>
                <td colspan="2" style="font-weight:bold"  align="right" >
                    <asp:Label ID="Label50" runat="server" Text="Do you have checking accounts?"></asp:Label>
                </td>
                <td> 
                    <asp:DropDownList ID="ddl_Ckg_Acct" runat="server" Font-Bold="false" TabIndex="124">
                        <asp:ListItem Value="N">No</asp:ListItem>
                        <asp:ListItem Value="Y">Yes</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td colspan="1" align="center">
                    <asp:Label ID="Label51" runat="server" Text="Name of Bank"></asp:Label>
                </td>
                <td colspan="2">
                    <asp:TextBox ID="txt_Ckg_Bank" runat="server" Width="100%" TabIndex="125"></asp:TextBox>
                </td>
                <td>
                    <asp:Label ID="Label52" runat="server" Text="Current Balance:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txt_Ckg_Balance" runat="server" TabIndex="126"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator18" runat="server" ControlToValidate="txt_Ckg_Balance" 
                        ValidationExpression="^(?!0$|0\d)\d{1,6}(\.\d{1,2})?$|^$" ErrorMessage="Please enter a valid amount"></asp:RegularExpressionValidator>

                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
              <tr>
                <td colspan="2" style="font-weight:bold" align="right">
                    <asp:Label ID="Label53" runat="server" Text="Do you have savings accounts?"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="ddl_Svgs_Acct" runat="server" Font-Bold="false" TabIndex="127">
                        <asp:ListItem Value="N">No</asp:ListItem>
                        <asp:ListItem Value="Y">Yes</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
              </tr>
              <tr>
               <td colspan="1" align="center">
                   <asp:Label ID="Label54" runat="server" Text="Name of Bank"></asp:Label>
               </td>
               <td colspan="2">
                    <asp:TextBox ID="txt_Svgs_Bank" runat="server" Width="100%" TabIndex="128"></asp:TextBox>
               </td>
               <td>
                   <asp:Label ID="Label55" runat="server" Text="Current Balance:"></asp:Label>
               </td>
               <td>
                    <asp:TextBox ID="txt_Svgs_Balance" runat="server" TabIndex="129"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator17" runat="server" ControlToValidate="txt_Svgs_Balance" 
                        ValidationExpression="^(?!0$|0\d)\d{1,6}(\.\d{1,2})?$|^$" ErrorMessage="Please enter a valid amount"></asp:RegularExpressionValidator>

                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
             </tr>
              <tr>
                <td colspan="7">
                 <hr />
                </td>
              </tr>
              <tr>
               <td>&nbsp;</td>
               <td colspan="5" style="font-weight:bold" align="right">
                   <asp:Label ID="Label56" runat="server" Text="Do you have any claims, including lawsuits, against a person, insurance company, employer, or government agency from which you expect to receive a recovery (money)?"></asp:Label> 
               </td>
               <td align="left">
                    <asp:DropDownList ID="ddl_Claims" runat="server" TabIndex="130">
                        <asp:ListItem Value="N">No</asp:ListItem>
                        <asp:ListItem Value="Y">Yes</asp:ListItem>
                    </asp:DropDownList>
               </td>
             </tr>
             <tr>
               <td>&nbsp;</td>
             </tr>
             <tr>
                 <td>&nbsp;</td>
                 <td colspan="5" align="left">
                    <asp:Label ID="Label57" runat="server" Text="Explanation"></asp:Label>
               </td>
             </tr>
              <tr>
               <td>&nbsp;</td>
               <td colspan="6" >
                    <asp:TextBox ID="txt_Claims_Memo" runat="server" TextMode="MultiLine" 
                        Width="100%" Height="141px" TabIndex="131"></asp:TextBox>
               </td>
            </tr>
              <tr>
                <td colspan="7">
                 <hr />
                </td>
             </tr>
           </table>
    </ContentTemplate>
    </cc1:TabPanel>
    <cc1:TabPanel ID="TabPanel6" runat="server" TabIndex="6" HeaderText="Expense Info">
		<ContentTemplate> 
        <table id="TblExepense" width="100%" style="font-family: Tahoma" cellspacing="10" >
            <tr style="font-weight:bold">
               <td>&nbsp;</td>
               <td colspan="7" align="center">
                   <asp:Label ID="Label68" runat="server" Text="What do you owe today on your household expenses"></asp:Label>
               </td>
               <td>&nbsp;</td>
            </tr>
            <tr>
               <td>&nbsp;</td>
               <td colspan="2" align="right">
                   <asp:Label ID="Label69" runat="server" Text="Rent/Mortgage: $"></asp:Label>
               </td>
               <td>
                   <asp:TextBox ID="txt_Mtg_Amt_Owed_Today" runat="server" TabIndex="132"></asp:TextBox>
                   <asp:RegularExpressionValidator ID="RegularExpressionValidator19" runat="server" ControlToValidate="txt_Mtg_Amt_Owed_Today" 
                        ValidationExpression="^(?!0$|0\d)\d{1,6}(\.\d{1,2})?$|^$" ErrorMessage="Please enter a valid amount"></asp:RegularExpressionValidator>
               </td>
               <td colspan="3">&nbsp;</td>
            </tr>
            <tr>
               <td>&nbsp;</td>
               <td colspan="2" align="right">
                   <asp:Label ID="Label70" runat="server" Text="Electricity: $"></asp:Label>
               </td>
               <td>
                   <asp:TextBox ID="txt_Electric_Amt_Owed_Today" runat="server" TabIndex="133"></asp:TextBox>
                   <asp:RegularExpressionValidator ID="RegularExpressionValidator20" runat="server" ControlToValidate="txt_Electric_Amt_Owed_Today" 
                        ValidationExpression="^(?!0$|0\d)\d{1,6}(\.\d{1,2})?$|^$" ErrorMessage="Please enter a valid amount"></asp:RegularExpressionValidator>
               </td>
               <td colspan="3">&nbsp;</td>
            </tr>
            <tr>
               <td>&nbsp;</td>
               <td colspan="2" align="right">
                   <asp:Label ID="Label71" runat="server" Text="Gas/Heating: $"></asp:Label>
               </td>
               <td>
                   <asp:TextBox ID="txt_Gas_or_Heating_Amt_Owed_Today" runat="server" TabIndex="134"></asp:TextBox>
                   <asp:RegularExpressionValidator ID="RegularExpressionValidator21" runat="server" ControlToValidate="txt_Gas_or_Heating_Amt_Owed_Today" 
                        ValidationExpression="^(?!0$|0\d)\d{1,6}(\.\d{1,2})?$|^$" ErrorMessage="Please enter a valid amount"></asp:RegularExpressionValidator>
               </td>
               <td colspan="3">&nbsp;</td>
            </tr>
            <tr>
               <td>&nbsp;</td>
               <td colspan="2" align="right">
                   <asp:Label ID="Label72" runat="server" Text="Water: $"></asp:Label>
               </td>
               <td>
                   <asp:TextBox ID="txt_Water_Amt_Owed_Today" runat="server" TabIndex="135"></asp:TextBox>
                   <asp:RegularExpressionValidator ID="RegularExpressionValidator22" runat="server" ControlToValidate="txt_Water_Amt_Owed_Today" 
                        ValidationExpression="^(?!0$|0\d)\d{1,6}(\.\d{1,2})?$|^$" ErrorMessage="Please enter a valid amount"></asp:RegularExpressionValidator>
               </td>
               <td colspan="3">&nbsp;</td>
            </tr>
            <tr>
               <td>&nbsp;</td>
               <td colspan="2" align="right">
                   <asp:Label ID="Label73" runat="server" Text="Cable: $"></asp:Label>
               </td>
               <td>
                   <asp:TextBox ID="txt_Cable_Amt_Owed_Today" runat="server" TabIndex="136"></asp:TextBox>
                   <asp:RegularExpressionValidator ID="RegularExpressionValidator23" runat="server" ControlToValidate="txt_Cable_Amt_Owed_Today" 
                        ValidationExpression="^(?!0$|0\d)\d{1,6}(\.\d{1,2})?$|^$" ErrorMessage="Please enter a valid amount"></asp:RegularExpressionValidator>
               </td>
               <td colspan="3">&nbsp;</td>
            </tr>
            <tr>
               <td>&nbsp;</td>
               <td colspan="2" align="right">
                   <asp:Label ID="Label74" runat="server" Text="Telephone: $"></asp:Label>
               </td>
               <td>
                   <asp:TextBox ID="txt_Telephone_Amt_Owed_Today" runat="server" TabIndex="137"></asp:TextBox>
                   <asp:RegularExpressionValidator ID="RegularExpressionValidator24" runat="server" ControlToValidate="txt_Telephone_Amt_Owed_Today" 
                        ValidationExpression="^(?!0$|0\d)\d{1,6}(\.\d{1,2})?$|^$" ErrorMessage="Please enter a valid amount"></asp:RegularExpressionValidator>
               </td>
               <td colspan="3">&nbsp;</td>
            </tr>
            <tr>
               <td>&nbsp;</td>
               <td colspan="2" align="right">
                   <asp:Label ID="Label75" runat="server" Text="Sewer: $"></asp:Label>
               </td>
               <td>
                   <asp:TextBox ID="txt_Sewage_Amt_Owed_Today" runat="server" TabIndex="138"></asp:TextBox>
                   <asp:RegularExpressionValidator ID="RegularExpressionValidator25" runat="server" ControlToValidate="txt_Sewage_Amt_Owed_Today" 
                        ValidationExpression="^(?!0$|0\d)\d{1,6}(\.\d{1,2})?$|^$" ErrorMessage="Please enter a valid amount"></asp:RegularExpressionValidator>
               </td>
               <td colspan="3">&nbsp;</td>
            </tr>
            <tr>
               <td>&nbsp;</td>
               <td colspan="2" align="right">
                   <asp:Label ID="Label76" runat="server" Text="Trash Removal: $"></asp:Label>
               </td>
               <td>
                   <asp:TextBox ID="txt_Trash_Removal_Amt_Owed_Today" runat="server" TabIndex="139"></asp:TextBox>
                   <asp:RegularExpressionValidator ID="RegularExpressionValidator26" runat="server" ControlToValidate="txt_Trash_Removal_Amt_Owed_Today" 
                        ValidationExpression="^(?!0$|0\d)\d{1,6}(\.\d{1,2})?$|^$" ErrorMessage="Please enter a valid amount"></asp:RegularExpressionValidator>
               </td>
                <td colspan="3">
               </td>
            </tr>
            <tr>
               <td colspan="7">
                 <hr />
               </td>
            </tr>
            <tr style="font-weight:bold">
              
               <td colspan="7" align="center">
                   <asp:Label ID="Label77" runat="server" Text="List below any payments made to any source in the last thirty (30) days"></asp:Label>
               </td>
            </tr>
            <tr>
               <td  colspan="2">
                   <asp:Label ID="Label78" runat="server" Text="Payment Amount:"></asp:Label>
               </td>
               <td>
                   <asp:TextBox ID="txt_Expense_Amt_Paid" runat="server" Width="100%" TabIndex="140"></asp:TextBox>
                   <asp:RegularExpressionValidator ID="RegularExpressionValidator27" runat="server" ControlToValidate="txt_Expense_Amt_Paid" 
                        ValidationExpression="^(?!0$|0\d)\d{1,6}(\.\d{1,2})?$|^$" ErrorMessage="Please enter a valid amount"></asp:RegularExpressionValidator>
               </td>
               <td colspan="4">&nbsp;</td>
            </tr>
            <tr>
               <td colspan="2">
                   <asp:Label ID="Label80" runat="server" Text="Paid To:"></asp:Label>
               </td>
               <td>
                  <asp:TextBox ID="txt_Expense_Amt_Paid_To" runat="server" Width="100%" TabIndex="141"></asp:TextBox>
               </td>
               <td colspan="4">&nbsp;</td>
            </tr>
            <tr>
               <td colspan="2">
                   <asp:Label ID="Label79" runat="server" Text="Date Paid:"></asp:Label>
               </td>
               <td>
                   <asp:TextBox ID="txt_Date_Paid" runat="server" Width="100%" TabIndex="142"></asp:TextBox>
                   <cc1:CalendarExtender runat="server" ID="CalDatePaid" FirstDayOfWeek="Sunday"
                       Format="MM/dd/yyyy" TargetControlID="txt_Date_Paid">
                    </cc1:CalendarExtender>
               </td>
            <td colspan="4">&nbsp;</td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:Button ID="BtnPaymntSave" runat="server" Text="Save" 
                    onclick="BtnPaymntSave_Click" TabIndex="143"/>
           </td>
        </tr>
       </table>
        <table>
           <tr align="center">
              <td colspan="7" align="center">
                   <asp:GridView ID="Gvpayment" runat="server" AutoGenerateColumns="False" 
                         AutoGenerateDeleteButton="true" OnRowDeleting="Gvpayment_RowDeleting"
                        DataKeyNames="expense_id">
                      <Columns>
                            <asp:BoundField DataField="Date_paid" HeaderText="Date Paid" SortExpression="Date_paid" />
                            <asp:BoundField DataField="Expense_amt_paid" HeaderText="Amount" SortExpression="Expense_amt_paid" />
                            <asp:BoundField DataField="Expense_amt_paid_to" HeaderText="Paid TO" SortExpression="Expense_amt_paid_to" />
                            <asp:BoundField DataField="expense_id" HeaderText="expense id" />
                        </Columns>
                  </asp:GridView>
               </td>
           </tr>
       </table>
       <table  width="100%">
         <tr>
            <td colspan="7">
                 <hr />
            </td>
         </tr>
         <tr align="center">
           <td align="center" colspan="7">
               <asp:Label ID="Label141" runat="server" Text="Enter Any Debt Information" 
                   style="font-weight: 700; font-size: medium"></asp:Label>
           </td>
         </tr>
         <tr>
           <td align="center" colspan="7">
           </td>
         </tr>
         <tr>
            <td>
            </td>
            <td>
                <asp:Label ID="Label135" runat="server" Text="Creditor Name"></asp:Label>
            </td>
            <td>
            </td>
             <td>
                <asp:Label ID="Label136" runat="server" Text="Amount"></asp:Label>
            </td>
            <td>
            </td>
             <td>
                <asp:Label ID="Label137" runat="server" Text="Item"></asp:Label>
            </td>
            <td>
            </td>
         </tr>
         <tr>
         <td>
            </td>
           <td>
             <asp:TextBox ID="Txt_Creditor_Name" runat="server" Width="245px" TabIndex="144"></asp:TextBox>
           </td>
           <td>
            </td>
           <td>
             <asp:TextBox ID="Txt_debt_amount" runat="server" TabIndex="145"></asp:TextBox>
             <asp:RegularExpressionValidator ID="RegularExpressionValidator28" runat="server" ControlToValidate="Txt_debt_amount" 
              ValidationExpression="^(?!0$|0\d)\d{1,6}(\.\d{1,2})?$|^$" ErrorMessage="Please enter a valid amount"></asp:RegularExpressionValidator>
           </td>
           <td>
            </td>
           <td>
             <asp:TextBox ID="Txt_item" runat="server" Width="386px"></asp:TextBox>
           </td>
           <td>
            </td>
         </tr>
         <tr>
           <td colspan="7">
           
           </td>
         </tr>
        <tr>
            <td>
            </td>
            <td>
                <asp:Label ID="Label138" runat="server" Text="Last Payment Date"></asp:Label>
            </td>
            <td>
            </td>
             <td>
                <asp:Label ID="Label139" runat="server" Text="Purchase Date"></asp:Label>
            </td>
            <td>
            </td>
             <td>
                <asp:Label ID="Label140" runat="server" Text="Value"></asp:Label>
            </td>
            <td>
            </td>
         </tr>
         <tr>
         <td>
            </td>
           <td>
             <asp:TextBox ID="Txt_lst_pymnt_date" runat="server" Width="245px" TabIndex="146"></asp:TextBox>
             <cc1:CalendarExtender runat="server" ID="CEDebtlstPayDate" FirstDayOfWeek="Sunday"
                       Format="MM/dd/yyyy" TargetControlID="Txt_lst_pymnt_date">
                    </cc1:CalendarExtender>
           </td>
           <td>
            </td>
           <td>
             <asp:TextBox ID="Txt_Purch_date" runat="server" TabIndex="147"></asp:TextBox>
             <cc1:CalendarExtender runat="server" ID="CEPurchDate" FirstDayOfWeek="Sunday"
                       Format="MM/dd/yyyy" TargetControlID="Txt_Purch_date">
                    </cc1:CalendarExtender>
           </td>
           <td>
            </td>
           <td>
             <asp:TextBox ID="Txt_value" runat="server" Width="386px" TabIndex="148"></asp:TextBox>
             <asp:RegularExpressionValidator ID="RegularExpressionValidator29" runat="server" ControlToValidate="Txt_value" 
              ValidationExpression="[0-9]+." ErrorMessage="Please enter a valid numeric value"></asp:RegularExpressionValidator>
           </td>
           <td>
            </td>
         </tr>
         <tr>
            <td colspan="7">
            
            </td>
         </tr>
         <tr>    
            <td colspan="7" align="center">
                   <asp:Button ID="BtnAddDebt" runat="server" Text="Add" 
                       onclick="BtnAddDebt_Click" TabIndex="149"/>
             </td>
         </tr>
         <tr style="font-weight: bold">
               <td colspan="7" align="center">
                  <asp:GridView ID="GVDebt" runat="server"  AutoGenerateColumns="False" 
                         AutoGenerateDeleteButton="true" OnRowDeleting="GVDebt_RowDeleting"
                          DataKeyNames="debt_id">
                        <Columns>
                            <asp:BoundField DataField="creditor_name" HeaderText="Name" SortExpression="Name" />
                            <asp:BoundField DataField="Debt_amt" HeaderText="Amount" SortExpression="Amount" />
                            <asp:BoundField DataField="Item_Purchased" HeaderText="Item Purchased" SortExpression="Item Purchased" />
                            <asp:BoundField DataField="last_payment_Date" HeaderText="Last Payment Date" SortExpression="Last Payment Date" />
                            <asp:BoundField DataField="purchase_date" HeaderText="Purchased Date" SortExpression="Purchased Date" />
                            <asp:BoundField DataField="Value_amt" HeaderText="Value Amount" SortExpression="Value Amount" />
                            <asp:BoundField DataField="debt_id" HeaderText="debt id"/>
                        </Columns>
                    </asp:GridView>
               </td>
            </tr>
            <tr>
              <td colspan="7">
              
              </td>
            </tr>
       </table>
        </ContentTemplate>
	  </cc1:TabPanel>
    <cc1:TabPanel ID="TabPanel7" runat="server" TabIndex="7" HeaderText="Vehicle Info">
		<ContentTemplate> 
        <table id="TableVehicle" width="100%" style="font-family: Tahoma" cellspacing="10">
            <tr align="left" style="font-weight: bold">
                <td colspan="7" align="center">
                    <asp:Label ID="Label63" runat="server" Text="List all motorized vehicles that you own"></asp:Label>
                </td>
            </tr>
            <tr>
            <td style="width: 37px">&nbsp;</td>
                <td style="font-weight:normal; width: 49px;" align="right">
                    <asp:Label ID="Label64" runat="server" Text="Type:"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="ddl_v_type" runat="server" Width="116%" Height="16px" TabIndex="150">
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem>Car</asp:ListItem>
                        <asp:ListItem>Truck</asp:ListItem>
                        <asp:ListItem>Boat</asp:ListItem>
                        <asp:ListItem>Motorcycle</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td style="width: 178px">
                </td>
                <td class="style6" style="width: 189px">&nbsp;</td>
                <td style="width: 123px">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 37px">
                   &nbsp;
                </td>
                <td align="right" style="width: 49px">
                    <asp:Label ID="Label65" runat="server" Text="Year:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txt_v_year" runat="server" Width="114%" TabIndex="151"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator30" runat="server" ControlToValidate="txt_v_year" 
                      ValidationExpression="[0-9]+" ErrorMessage="Please enter a valid numeric value"></asp:RegularExpressionValidator>
                </td>
                <td align="right" style="width: 178px">
                   <asp:Label ID="Label119" runat="server" Text="Model:"></asp:Label>
                </td>
                <td class="style6" style="width: 189px">
                    <asp:TextBox ID="Txt_v_model" runat="server" Width="100%" TabIndex="152"></asp:TextBox>
                </td>
                <td align="right" style="width: 123px">
                    <asp:Label ID="Label120" runat="server" Text="Make:"></asp:Label>
                </td>
                <td align="left">
                    <asp:TextBox ID="Txt_v_Make" runat="server" Width="89%" TabIndex="153"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 37px; height: 34px"></td>
                <td  align="right" style="width: 49px; height: 34px">
                    <asp:Label ID="Label67" runat="server" Text="Vin:"></asp:Label>
                </td>
                <td style="height: 34px">
                    <asp:TextBox ID="txt_v_Vin" runat="server" Width="100%" TabIndex="154"></asp:TextBox>
                </td>
                <td  align="right" style="height: 34px; width: 178px">
                    <asp:Label ID="Label121" runat="server" Text="Plate #:"></asp:Label>
                </td>
                <td class="style6" style="width: 189px; height: 34px">
                    <asp:TextBox ID="Txt_v_Plate" runat="server" Width="100%" TabIndex="155"></asp:TextBox>
                </td>
                <td style="height: 34px; width: 123px">
                    <asp:Label ID="Label122" runat="server" Text="is Vehicle Insured:"></asp:Label>
                </td>
                <td style="height: 34px" align="left" TabIndex="156">
                    <asp:DropDownList ID="ddl_V_ins" runat="server">
                        <asp:ListItem Value="N">No</asp:ListItem>
                        <asp:ListItem Value="Y">Yes</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td style="width: 37px; height: 34px"></td>
                <td  align="right" style="width: 49px; height: 34px">
                    <asp:Label ID="Label123" runat="server" Text="Vehicle Description:"></asp:Label>
                </td>
                <td style="height: 34px" colspan="3">
                    <asp:TextBox ID="Txt_v_desc" runat="server" Width="101%" TextMode="MultiLine" 
                        MaxLength="50" Height="64px" TabIndex="157"></asp:TextBox>
                </td>
            </tr>
            <tr>    
                <td colspan="7" align="center">
                   <asp:Button ID="BtnAddVeh" runat="server" Text="Add" 
                        onclick="BtnAddVeh_Click"  TabIndex="158"/>
                </td>
            </tr>
            <tr style="font-weight: bold">
               <td colspan="7" align="center">
                    <asp:GridView ID="GVVehicle" runat="server"  AutoGenerateColumns="False" 
                         AutoGenerateDeleteButton="true" OnRowDeleting="GVVehicle_RowDeleting"
                          DataKeyNames="vehicle_id">
                        <Columns>
                            <asp:BoundField DataField="vehicle_Type" HeaderText="Type" SortExpression="Type" />
                            <asp:BoundField DataField="vehicle_Make" HeaderText="Make" SortExpression="Make" />
                            <asp:BoundField DataField="vehicle_Model" HeaderText="Model" SortExpression="Model" />
                            <asp:BoundField DataField="vehicle_Year" HeaderText="Year" SortExpression="Year" />
                            <asp:BoundField DataField="Vin" HeaderText="Vin #" SortExpression="Vin #" />
                            <asp:BoundField DataField="PlateNumber" HeaderText="Plate #" SortExpression="Plate #" />
                            <asp:BoundField DataField="Insured" HeaderText="Insured" SortExpression="Insured" />
                            <asp:BoundField DataField="vehicle_Desc" HeaderText="Description" SortExpression="Description" />
                            <asp:BoundField DataField="vehicle_id" HeaderText="vehicle id" />
                        </Columns>
                    </asp:GridView>
               </td>
            </tr>
        </table>
        </ContentTemplate>
	  </cc1:TabPanel>
    <cc1:TabPanel ID="TabPanel8" runat="server" TabIndex="8" HeaderText="Military Info">
		<ContentTemplate> 
        <table id="Table1" width="100%" style="font-family: Tahoma" cellspacing="10">
            <tr>
               <td>
                   <asp:Label ID="Label89" runat="server" Text="Military Branch"></asp:Label>
               </td>
               <td>
                   <asp:TextBox ID="TxtMilbranch" runat="server" TabIndex="159"></asp:TextBox>
               </td>
                <td>
                   <asp:Label ID="Label90" runat="server" Text="Serial Number"></asp:Label>
               </td>
               <td>
                   <asp:TextBox ID="Txtmilserialnum" runat="server" MaxLength="10" TabIndex="160"></asp:TextBox>
               </td>
            </tr>
            <tr>
               <td>
                   <asp:Label ID="Label91" runat="server" Text="Enlistment Date"></asp:Label>
               </td>
               <td>
                   <asp:TextBox ID="TxtmilEnlistdATE" runat="server" TabIndex="161"></asp:TextBox>
                   <cc1:CalendarExtender runat="server" ID="CalMilEnlistDate" FirstDayOfWeek="Sunday"
                       Format="MM/dd/yyyy" TargetControlID="TxtmilEnlistdATE">
                    </cc1:CalendarExtender>
               </td>
                <td>
                   <asp:Label ID="Label92" runat="server" Text="Discharge Date"></asp:Label>
               </td>
               <td>
                   <asp:TextBox ID="TxtmildschrgDate" runat="server" TabIndex="162"></asp:TextBox>
                   <cc1:CalendarExtender runat="server" ID="CalMilDschrgDate" FirstDayOfWeek="Sunday"
                       Format="MM/dd/yyyy" TargetControlID="TxtmildschrgDate">
                    </cc1:CalendarExtender>
                   
               </td>
            </tr>
        </table>
        </ContentTemplate>
	  </cc1:TabPanel>
    </cc1:TabContainer>
  </div>
</div>
        <table width="100%">
          <tr align="center">
             <td colspan="7">
                 <asp:Button ID="BtnClear" runat="server" Text="Clear" 
                     onclick="BtnClear_Click" />
                 <asp:Button ID="BtnSave" runat="server" Text="Save" onclick="BtnSave_Click" TabIndex="163"/>
                 <asp:Button ID="BtnBack" runat="server" Text="Back" onclick="BtnBack_Click" TabIndex="164"/>
                 <asp:Button ID="BtnClose" runat="server" Text="Close Case" onclick="BtnClose_Click" TabIndex="165"/>
             </td>
          </tr>
        </table>
</asp:Content>