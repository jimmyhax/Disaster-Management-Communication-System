<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="True" CodeBehind="income_source_Screen.aspx.cs" Inherits="DMCS.SandBox.Generated.income_source_Screen" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <!DOCTYPE html>
    <html>
    <head>
        <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
        <meta charset="utf-8">
        <title>TITLE NAME</title>
    </head>
    <body>
        <div style="width: 100%; height: 100%; font-family: 'Calibri Light';">
        <asp:TabContainer ID="MyAjaxTabContainer" runat="server" UseVerticalStripPlacement="false" ActiveTabIndex="2" Visible="True" BackColor="#e75050" ForeColor="#333333" BorderColor="#E75050" BorderStyle="Double" BorderWidth="10px">
                <asp:TabPanel ID="Insert_Tab_Panel" runat="server" HeaderText="Insert" Enabled="true" ScrollBars="Auto" BackColor="#EFEEEF" BorderColor="#666666" BorderStyle="Solid" EnableTheming="True">
                    <ContentTemplate>
                        <div>
                            <table width="100%" bgcolor="#e2e2e2" border="3" style="font-family: 'Calibri Light'">
                                <tr>
                                    <td width="20%" height="50px" style="border-style: none; padding: 0px 10px 0px 10px;" align="left">
                                        <asp:Label ID="Insert_Label2" runat="server" Text="Select a Disaster: " Font-Size="Large" ForeColor="Black"></asp:Label>
                                        <asp:DropDownList ID="Insert_ddlDisaster" runat="server" Height="24px" Width="240px" OnSelectedIndexChanged="Insert_ddlDisaster_SelectedIndexChanged" AutoPostBack="True" DataSourceID="Insert_SqlDataSource1" DataTextField="disaster_name" DataValueField="disaster_id" Style="margin-left: 0px" Font-Bold="True"></asp:DropDownList>
                                        <asp:SqlDataSource ID="Insert_SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:localhost %>" SelectCommand="SELECT [disaster_id], [disaster_name] FROM [disaster]"></asp:SqlDataSource>
                                    </td>
                                    <td width="80%" style="border-style: none; padding: 0px 10px 0px 10px;" align="Center">
                                        <asp:Label ID="Insert_Label1" runat="server" Text="HEADER TEXT" Font-Bold="True" Font-Size="X-Large"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                            <table width="100%" height="100%" bgcolor="#e2e2e2" border="3" style="font-family: 'Calibri Light'">
                                <tr>
                                    <td style="padding: 10px 0px 0px 0px">
                                        <asp:GridView ID="Insert_income_source_GridView" Style="border-style: solid none none none;" 
                                            Font-Size="Medium" runat="server" DataSourceID="Insert_SqlDataSource2" AutoGenerateColumns="False" 
                                            DataKeyNames="income_source_id" BackColor="#CCCCCC" BorderColor="#666666" BorderStyle="Solid" 
                                            BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="#1A1A1A" Width="100%" 
                                            OnSelectedIndexChanged="Insert_Select_Record" AllowPaging="True" Font-Bold="False" 
                                            Font-Italic="False" Font-Names="Calibri Light" Font-Overline="False" OnRowDataBound="RowDataBound"
                                            Font-Underline="False" GridLines="Horizontal" HorizontalAlign="Center">
                                            <AlternatingRowStyle BackColor="Gray" Font-Underline="False" ForeColor="White" />
                                            <Columns>
                                                <asp:CommandField ShowSelectButton="True"></asp:CommandField>
                            <asp:BoundField DataField="income_source_id" HeaderText="income_source_id" InsertVisible="False" ReadOnly="True" SortExpression="income_source_id" />
                            <asp:BoundField DataField="case_id" HeaderText="case_id" InsertVisible="False" ReadOnly="True" SortExpression="case_id" />
                            <asp:BoundField DataField="cash_amt" HeaderText="cash_amt" InsertVisible="False" ReadOnly="True" SortExpression="cash_amt" />
                            <asp:BoundField DataField="cash_on_hand" HeaderText="cash_on_hand" InsertVisible="False" ReadOnly="True" SortExpression="cash_on_hand" Visible="false" />
                            <asp:BoundField DataField="wages_stopped" HeaderText="wages_stopped" InsertVisible="False" ReadOnly="True" SortExpression="wages_stopped" Visible="false" />
                            <asp:BoundField DataField="waiting_on_income" HeaderText="waiting_on_income" InsertVisible="False" ReadOnly="True" SortExpression="waiting_on_income" Visible="false" />
                            <asp:BoundField DataField="recieving_income" HeaderText="recieving_income" InsertVisible="False" ReadOnly="True" SortExpression="recieving_income" Visible="false" />
                            <asp:BoundField DataField="no_income" HeaderText="no_income" InsertVisible="False" ReadOnly="True" SortExpression="no_income" Visible="false" />
                            <asp:BoundField DataField="currently_working" HeaderText="currently_working" InsertVisible="False" ReadOnly="True" SortExpression="currently_working" Visible="false" />
                            <asp:BoundField DataField="laid_off" HeaderText="laid_off" InsertVisible="False" ReadOnly="True" SortExpression="laid_off" Visible="false" />
                            <asp:BoundField DataField="never_worked" HeaderText="never_worked" InsertVisible="False" ReadOnly="True" SortExpression="never_worked" Visible="false" />
                            <asp:BoundField DataField="quit" HeaderText="quit" InsertVisible="False" ReadOnly="True" SortExpression="quit" Visible="false" />
                            <asp:BoundField DataField="fired" HeaderText="fired" InsertVisible="False" ReadOnly="True" SortExpression="fired" Visible="false" />
                            <asp:BoundField DataField="sick_leave" HeaderText="sick_leave" InsertVisible="False" ReadOnly="True" SortExpression="sick_leave" Visible="false" />
                            <asp:BoundField DataField="maternity_leave" HeaderText="maternity_leave" InsertVisible="False" ReadOnly="True" SortExpression="maternity_leave" Visible="false" />
                            <asp:BoundField DataField="on_strike" HeaderText="on_strike" InsertVisible="False" ReadOnly="True" SortExpression="on_strike" Visible="false" />
                            <asp:BoundField DataField="trying_to_find_work" HeaderText="trying_to_find_work" InsertVisible="False" ReadOnly="True" SortExpression="trying_to_find_work" Visible="false" />
                            <asp:BoundField DataField="ckg_acct" HeaderText="ckg_acct" InsertVisible="False" ReadOnly="True" SortExpression="ckg_acct" Visible="false" />
                            <asp:BoundField DataField="ckg_balance" HeaderText="ckg_balance" InsertVisible="False" ReadOnly="True" SortExpression="ckg_balance" Visible="false" />
                            <asp:BoundField DataField="ckg_bank" HeaderText="ckg_bank" InsertVisible="False" ReadOnly="True" SortExpression="ckg_bank" Visible="false" />
                            <asp:BoundField DataField="claims" HeaderText="claims" InsertVisible="False" ReadOnly="True" SortExpression="claims" Visible="false" />
                            <asp:BoundField DataField="claims_memo" HeaderText="claims_memo" InsertVisible="False" ReadOnly="True" SortExpression="claims_memo" Visible="false" />
                            <asp:BoundField DataField="client_id" HeaderText="client_id" InsertVisible="False" ReadOnly="True" SortExpression="client_id" Visible="false" />
                            <asp:BoundField DataField="gifts_amt" HeaderText="gifts_amt" InsertVisible="False" ReadOnly="True" SortExpression="gifts_amt" Visible="false" />
                            <asp:BoundField DataField="gifts_inc" HeaderText="gifts_inc" InsertVisible="False" ReadOnly="True" SortExpression="gifts_inc" Visible="false" />
                            <asp:BoundField DataField="investments" HeaderText="investments" InsertVisible="False" ReadOnly="True" SortExpression="investments" Visible="false" />
                            <asp:BoundField DataField="life_ins" HeaderText="life_ins" InsertVisible="False" ReadOnly="True" SortExpression="life_ins" Visible="false" />
                            <asp:BoundField DataField="other_ins" HeaderText="other_ins" InsertVisible="False" ReadOnly="True" SortExpression="other_ins" Visible="false" />
                            <asp:BoundField DataField="pension_amt" HeaderText="pension_amt" InsertVisible="False" ReadOnly="True" SortExpression="pension_amt" Visible="false" />
                            <asp:BoundField DataField="pension_inc" HeaderText="pension_inc" InsertVisible="False" ReadOnly="True" SortExpression="pension_inc" Visible="false" />
                            <asp:BoundField DataField="strike_benefits_amt" HeaderText="strike_benefits_amt" InsertVisible="False" ReadOnly="True" SortExpression="strike_benefits_amt" Visible="false" />
                            <asp:BoundField DataField="strike_benefits_inc" HeaderText="strike_benefits_inc" InsertVisible="False" ReadOnly="True" SortExpression="strike_benefits_inc" Visible="false" />
                            <asp:BoundField DataField="support_amt" HeaderText="support_amt" InsertVisible="False" ReadOnly="True" SortExpression="support_amt" Visible="false" />
                            <asp:BoundField DataField="support_inc" HeaderText="support_inc" InsertVisible="False" ReadOnly="True" SortExpression="support_inc" Visible="false" />
                            <asp:BoundField DataField="SSI_Amt" HeaderText="SSI_Amt" InsertVisible="False" ReadOnly="True" SortExpression="SSI_Amt" Visible="false" />
                            <asp:BoundField DataField="SSI_Inc" HeaderText="SSI_Inc" InsertVisible="False" ReadOnly="True" SortExpression="SSI_Inc" Visible="false" />
                            <asp:BoundField DataField="svgs_acct" HeaderText="svgs_acct" InsertVisible="False" ReadOnly="True" SortExpression="svgs_acct" Visible="false" />
                            <asp:BoundField DataField="svgs_balance" HeaderText="svgs_balance" InsertVisible="False" ReadOnly="True" SortExpression="svgs_balance" Visible="false" />
                            <asp:BoundField DataField="svgs_bank" HeaderText="svgs_bank" InsertVisible="False" ReadOnly="True" SortExpression="svgs_bank" Visible="false" />
                            <asp:BoundField DataField="wages_amt" HeaderText="wages_amt" InsertVisible="False" ReadOnly="True" SortExpression="wages_amt" Visible="false" />
                            <asp:BoundField DataField="wages_inc" HeaderText="wages_inc" InsertVisible="False" ReadOnly="True" SortExpression="wages_inc" Visible="false" />
                                            </Columns>
                                            <FooterStyle BackColor="#CCCCCC"></FooterStyle>
                                            <HeaderStyle BackColor="#EA5151" ForeColor="White" Font-Size="Medium"></HeaderStyle>
                                            <PagerStyle HorizontalAlign="Center" BackColor="#CCCCCC" ForeColor="Black"></PagerStyle>
                                            <RowStyle BackColor="#EFEEEF" Font-Size="Medium"></RowStyle>
                                            <SelectedRowStyle BackColor="#EA5151" Font-Bold="True" ForeColor="White"></SelectedRowStyle>
                                            <SortedAscendingCellStyle BackColor="#F1F1F1"></SortedAscendingCellStyle>
                                            <SortedAscendingHeaderStyle BackColor="Gray"></SortedAscendingHeaderStyle>
                                            <SortedDescendingCellStyle BackColor="#CAC9C9"></SortedDescendingCellStyle>
                                            <SortedDescendingHeaderStyle BackColor="#383838"></SortedDescendingHeaderStyle>
                                        </asp:GridView>
                    <asp:SqlDataSource runat="server" ID="Insert_SqlDataSource2" ConnectionString="<%$ ConnectionStrings:localhost %>" SelectCommand= "SELECT [income_source_id], [case_id], [cash_amt], [cash_on_hand], [wages_stopped], [waiting_on_income], [recieving_income], [no_income], [currently_working], [laid_off], [never_worked], [quit], [fired], [sick_leave], [maternity_leave], [on_strike], [trying_to_find_work], [ckg_acct], [ckg_balance], [ckg_bank], [claims], [claims_memo], [client_id], [gifts_amt], [gifts_inc], [investments], [life_ins], [other_ins], [pension_amt], [pension_inc], [strike_benefits_amt], [strike_benefits_inc], [support_amt], [support_inc], [SSI_Amt], [SSI_Inc], [svgs_acct], [svgs_balance], [svgs_bank], [wages_amt], [wages_inc] FROM [income_source]"></asp:SqlDataSource>
                                    </td>
                                </tr>
                            </table>
                            <asp:Panel ID="Insert_income_source_InfoHead" runat="server" ForeColor="#EFEEEF" Height="25px" BackImageUrl="~/Images/panelheader1.jpg">
                                <asp:Label ID="Insert_income_source_InfoHead_label" Style="padding: 10px" runat="server" Text="income_source Information" Font-Size="Large"></asp:Label>
                            </asp:Panel>
                            <asp:Panel ID="Insert_income_source_InfoBody" runat="server" style="overflow:hidden;">
                                <div>
                                    <table width="100%" height="auto" bgcolor="#666666" border="3" style="font-family: 'Calibri Light'; color: #E2E2E2;">
                                        <tr>
                                            <th colspan="4" style="padding: 5px 10px 5px 10px; background-color: #aaaaaa;" width="100%">
                                                <asp:Label ID="Insert_Label3" runat="server" Font-Bold="False" Font-Size="Large" ForeColor="#333333" Text="SECTION HEADER"></asp:Label>
                                            </th>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_case_id_lbl" runat="server" Font-Size="Large" Text="case_id:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_case_id_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_cash_amt_lbl" runat="server" Font-Size="Large" Text="cash_amt:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_cash_amt_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_cash_on_hand_lbl" runat="server" Font-Size="Large" Text="cash_on_hand:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_cash_on_hand_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_wages_stopped_lbl" runat="server" Font-Size="Large" Text="wages_stopped:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_wages_stopped_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_waiting_on_income_lbl" runat="server" Font-Size="Large" Text="waiting_on_income:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_waiting_on_income_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_recieving_income_lbl" runat="server" Font-Size="Large" Text="recieving_income:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_recieving_income_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_no_income_lbl" runat="server" Font-Size="Large" Text="no_income:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_no_income_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_currently_working_lbl" runat="server" Font-Size="Large" Text="currently_working:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_currently_working_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_laid_off_lbl" runat="server" Font-Size="Large" Text="laid_off:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_laid_off_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_never_worked_lbl" runat="server" Font-Size="Large" Text="never_worked:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_never_worked_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_quit_lbl" runat="server" Font-Size="Large" Text="quit:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_quit_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_fired_lbl" runat="server" Font-Size="Large" Text="fired:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_fired_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_sick_leave_lbl" runat="server" Font-Size="Large" Text="sick_leave:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_sick_leave_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_maternity_leave_lbl" runat="server" Font-Size="Large" Text="maternity_leave:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_maternity_leave_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_on_strike_lbl" runat="server" Font-Size="Large" Text="on_strike:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_on_strike_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_trying_to_find_work_lbl" runat="server" Font-Size="Large" Text="trying_to_find_work:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_trying_to_find_work_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_ckg_acct_lbl" runat="server" Font-Size="Large" Text="ckg_acct:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_ckg_acct_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_ckg_balance_lbl" runat="server" Font-Size="Large" Text="ckg_balance:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_ckg_balance_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_ckg_bank_lbl" runat="server" Font-Size="Large" Text="ckg_bank:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_ckg_bank_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_claims_lbl" runat="server" Font-Size="Large" Text="claims:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_claims_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_claims_memo_lbl" runat="server" Font-Size="Large" Text="claims_memo:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_claims_memo_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_client_id_lbl" runat="server" Font-Size="Large" Text="client_id:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_client_id_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_gifts_amt_lbl" runat="server" Font-Size="Large" Text="gifts_amt:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_gifts_amt_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_gifts_inc_lbl" runat="server" Font-Size="Large" Text="gifts_inc:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_gifts_inc_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_investments_lbl" runat="server" Font-Size="Large" Text="investments:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_investments_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_life_ins_lbl" runat="server" Font-Size="Large" Text="life_ins:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_life_ins_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_other_ins_lbl" runat="server" Font-Size="Large" Text="other_ins:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_other_ins_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_pension_amt_lbl" runat="server" Font-Size="Large" Text="pension_amt:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_pension_amt_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_pension_inc_lbl" runat="server" Font-Size="Large" Text="pension_inc:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_pension_inc_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_strike_benefits_amt_lbl" runat="server" Font-Size="Large" Text="strike_benefits_amt:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_strike_benefits_amt_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_strike_benefits_inc_lbl" runat="server" Font-Size="Large" Text="strike_benefits_inc:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_strike_benefits_inc_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_support_amt_lbl" runat="server" Font-Size="Large" Text="support_amt:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_support_amt_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_support_inc_lbl" runat="server" Font-Size="Large" Text="support_inc:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_support_inc_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_SSI_Amt_lbl" runat="server" Font-Size="Large" Text="SSI_Amt:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_SSI_Amt_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_SSI_Inc_lbl" runat="server" Font-Size="Large" Text="SSI_Inc:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_SSI_Inc_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_svgs_acct_lbl" runat="server" Font-Size="Large" Text="svgs_acct:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_svgs_acct_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_svgs_balance_lbl" runat="server" Font-Size="Large" Text="svgs_balance:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_svgs_balance_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_svgs_bank_lbl" runat="server" Font-Size="Large" Text="svgs_bank:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_svgs_bank_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_wages_amt_lbl" runat="server" Font-Size="Large" Text="wages_amt:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_wages_amt_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Insert_wages_inc_lbl" runat="server" Font-Size="Large" Text="wages_inc:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Insert_wages_inc_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                            </tr>
                                        </tr>
                                    </table>
                                    <table width="100%" height="auto" bgcolor="#e2e2e2" style="font-family: 'Calibri Light'">
                                        <tr>
                                            <td style="padding: 0px 0px 0px 0px" width="100%">
                                                <asp:Button ID="Insert_btn" runat="server" Font-Size="Large" Text="Insert" BackColor="#EA5151" ForeColor="#E2E2E2" Width="100%" OnClick="INSERT" CausesValidation="False" Style="margin-bottom: 0px; margin-top: 0px; border-style: solid none none none;" BorderColor="#666666" BorderWidth="3px" />
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </asp:Panel>
                            <asp:CollapsiblePanelExtender ID="Insert_cpeincome_sourceInfo" runat="server" CollapseControlID="Insert_income_source_InfoHead" CollapsedText="Show income_source Information" Enabled="True" ExpandControlID="Insert_income_source_InfoHead" ExpandedText="income_source Information" TargetControlID="Insert_income_source_InfoBody" TextLabelID="Insert_income_source_InfoHead_label"></asp:CollapsiblePanelExtender>
                        </div>
                    </ContentTemplate>
                </asp:TabPanel>
                <asp:TabPanel ID="Update_Tab_Panel" runat="server" HeaderText="Update" Enabled="true" ScrollBars="Auto" BackColor="#EFEEEF" BorderColor="#666666" BorderStyle="Solid" EnableTheming="True">
                    <ContentTemplate>
                        <div>
                            <table width="100%" bgcolor="#e2e2e2" border="3" style="font-family: 'Calibri Light'">
                                <tr>
                                    <td width="20%" height="50px" style="border-style: none; padding: 0px 10px 0px 10px;" align="left">
                                        <asp:Label ID="Update_Label2" runat="server" Text="Select a Disaster: " Font-Size="Large" ForeColor="Black"></asp:Label>
                                        <asp:DropDownList ID="Update_ddlDisaster" runat="server" Height="24px" Width="240px" OnSelectedIndexChanged="Update_ddlDisaster_SelectedIndexChanged" AutoPostBack="True" DataSourceID="Update_SqlDataSource1" DataTextField="disaster_name" DataValueField="disaster_id" Style="margin-left: 0px" Font-Bold="True"></asp:DropDownList>
                                        <asp:SqlDataSource ID="Update_SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:localhost %>" SelectCommand="SELECT [disaster_id], [disaster_name] FROM [disaster]"></asp:SqlDataSource>
                                    </td>
                                    <td width="80%" style="border-style: none; padding: 0px 10px 0px 10px;" align="Center">
                                        <asp:Label ID="Update_Label1" runat="server" Text="HEADER TEXT" Font-Bold="True" Font-Size="X-Large"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                            <table width="100%" height="100%" bgcolor="#e2e2e2" border="3" style="font-family: 'Calibri Light'">
                                <tr>
                                    <td style="padding: 10px 0px 0px 0px">
                                        <asp:GridView ID="Update_income_source_GridView" Style="border-style: solid none none none;" 
                                            Font-Size="Medium" runat="server" DataSourceID="Update_SqlDataSource2" AutoGenerateColumns="False" 
                                            DataKeyNames="income_source_id" BackColor="#CCCCCC" BorderColor="#666666" BorderStyle="Solid" 
                                            BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="#1A1A1A" Width="100%" 
                                            OnSelectedIndexChanged="Update_Select_Record" AllowPaging="True" Font-Bold="False" 
                                            Font-Italic="False" Font-Names="Calibri Light" Font-Overline="False" OnRowDataBound="RowDataBound"
                                            Font-Underline="False" GridLines="Horizontal" HorizontalAlign="Center">
                                            <AlternatingRowStyle BackColor="Gray" Font-Underline="False" ForeColor="White" />
                                            <Columns>
                                                <asp:CommandField ShowSelectButton="True"></asp:CommandField>
                            <asp:BoundField DataField="income_source_id" HeaderText="income_source_id" InsertVisible="False" ReadOnly="True" SortExpression="income_source_id" />
                            <asp:BoundField DataField="case_id" HeaderText="case_id" InsertVisible="False" ReadOnly="True" SortExpression="case_id" />
                            <asp:BoundField DataField="cash_amt" HeaderText="cash_amt" InsertVisible="False" ReadOnly="True" SortExpression="cash_amt" />
                            <asp:BoundField DataField="cash_on_hand" HeaderText="cash_on_hand" InsertVisible="False" ReadOnly="True" SortExpression="cash_on_hand" Visible="false" />
                            <asp:BoundField DataField="wages_stopped" HeaderText="wages_stopped" InsertVisible="False" ReadOnly="True" SortExpression="wages_stopped" Visible="false" />
                            <asp:BoundField DataField="waiting_on_income" HeaderText="waiting_on_income" InsertVisible="False" ReadOnly="True" SortExpression="waiting_on_income" Visible="false" />
                            <asp:BoundField DataField="recieving_income" HeaderText="recieving_income" InsertVisible="False" ReadOnly="True" SortExpression="recieving_income" Visible="false" />
                            <asp:BoundField DataField="no_income" HeaderText="no_income" InsertVisible="False" ReadOnly="True" SortExpression="no_income" Visible="false" />
                            <asp:BoundField DataField="currently_working" HeaderText="currently_working" InsertVisible="False" ReadOnly="True" SortExpression="currently_working" Visible="false" />
                            <asp:BoundField DataField="laid_off" HeaderText="laid_off" InsertVisible="False" ReadOnly="True" SortExpression="laid_off" Visible="false" />
                            <asp:BoundField DataField="never_worked" HeaderText="never_worked" InsertVisible="False" ReadOnly="True" SortExpression="never_worked" Visible="false" />
                            <asp:BoundField DataField="quit" HeaderText="quit" InsertVisible="False" ReadOnly="True" SortExpression="quit" Visible="false" />
                            <asp:BoundField DataField="fired" HeaderText="fired" InsertVisible="False" ReadOnly="True" SortExpression="fired" Visible="false" />
                            <asp:BoundField DataField="sick_leave" HeaderText="sick_leave" InsertVisible="False" ReadOnly="True" SortExpression="sick_leave" Visible="false" />
                            <asp:BoundField DataField="maternity_leave" HeaderText="maternity_leave" InsertVisible="False" ReadOnly="True" SortExpression="maternity_leave" Visible="false" />
                            <asp:BoundField DataField="on_strike" HeaderText="on_strike" InsertVisible="False" ReadOnly="True" SortExpression="on_strike" Visible="false" />
                            <asp:BoundField DataField="trying_to_find_work" HeaderText="trying_to_find_work" InsertVisible="False" ReadOnly="True" SortExpression="trying_to_find_work" Visible="false" />
                            <asp:BoundField DataField="ckg_acct" HeaderText="ckg_acct" InsertVisible="False" ReadOnly="True" SortExpression="ckg_acct" Visible="false" />
                            <asp:BoundField DataField="ckg_balance" HeaderText="ckg_balance" InsertVisible="False" ReadOnly="True" SortExpression="ckg_balance" Visible="false" />
                            <asp:BoundField DataField="ckg_bank" HeaderText="ckg_bank" InsertVisible="False" ReadOnly="True" SortExpression="ckg_bank" Visible="false" />
                            <asp:BoundField DataField="claims" HeaderText="claims" InsertVisible="False" ReadOnly="True" SortExpression="claims" Visible="false" />
                            <asp:BoundField DataField="claims_memo" HeaderText="claims_memo" InsertVisible="False" ReadOnly="True" SortExpression="claims_memo" Visible="false" />
                            <asp:BoundField DataField="client_id" HeaderText="client_id" InsertVisible="False" ReadOnly="True" SortExpression="client_id" Visible="false" />
                            <asp:BoundField DataField="gifts_amt" HeaderText="gifts_amt" InsertVisible="False" ReadOnly="True" SortExpression="gifts_amt" Visible="false" />
                            <asp:BoundField DataField="gifts_inc" HeaderText="gifts_inc" InsertVisible="False" ReadOnly="True" SortExpression="gifts_inc" Visible="false" />
                            <asp:BoundField DataField="investments" HeaderText="investments" InsertVisible="False" ReadOnly="True" SortExpression="investments" Visible="false" />
                            <asp:BoundField DataField="life_ins" HeaderText="life_ins" InsertVisible="False" ReadOnly="True" SortExpression="life_ins" Visible="false" />
                            <asp:BoundField DataField="other_ins" HeaderText="other_ins" InsertVisible="False" ReadOnly="True" SortExpression="other_ins" Visible="false" />
                            <asp:BoundField DataField="pension_amt" HeaderText="pension_amt" InsertVisible="False" ReadOnly="True" SortExpression="pension_amt" Visible="false" />
                            <asp:BoundField DataField="pension_inc" HeaderText="pension_inc" InsertVisible="False" ReadOnly="True" SortExpression="pension_inc" Visible="false" />
                            <asp:BoundField DataField="strike_benefits_amt" HeaderText="strike_benefits_amt" InsertVisible="False" ReadOnly="True" SortExpression="strike_benefits_amt" Visible="false" />
                            <asp:BoundField DataField="strike_benefits_inc" HeaderText="strike_benefits_inc" InsertVisible="False" ReadOnly="True" SortExpression="strike_benefits_inc" Visible="false" />
                            <asp:BoundField DataField="support_amt" HeaderText="support_amt" InsertVisible="False" ReadOnly="True" SortExpression="support_amt" Visible="false" />
                            <asp:BoundField DataField="support_inc" HeaderText="support_inc" InsertVisible="False" ReadOnly="True" SortExpression="support_inc" Visible="false" />
                            <asp:BoundField DataField="SSI_Amt" HeaderText="SSI_Amt" InsertVisible="False" ReadOnly="True" SortExpression="SSI_Amt" Visible="false" />
                            <asp:BoundField DataField="SSI_Inc" HeaderText="SSI_Inc" InsertVisible="False" ReadOnly="True" SortExpression="SSI_Inc" Visible="false" />
                            <asp:BoundField DataField="svgs_acct" HeaderText="svgs_acct" InsertVisible="False" ReadOnly="True" SortExpression="svgs_acct" Visible="false" />
                            <asp:BoundField DataField="svgs_balance" HeaderText="svgs_balance" InsertVisible="False" ReadOnly="True" SortExpression="svgs_balance" Visible="false" />
                            <asp:BoundField DataField="svgs_bank" HeaderText="svgs_bank" InsertVisible="False" ReadOnly="True" SortExpression="svgs_bank" Visible="false" />
                            <asp:BoundField DataField="wages_amt" HeaderText="wages_amt" InsertVisible="False" ReadOnly="True" SortExpression="wages_amt" Visible="false" />
                            <asp:BoundField DataField="wages_inc" HeaderText="wages_inc" InsertVisible="False" ReadOnly="True" SortExpression="wages_inc" Visible="false" />
                                            </Columns>
                                            <FooterStyle BackColor="#CCCCCC"></FooterStyle>
                                            <HeaderStyle BackColor="#EA5151" ForeColor="White" Font-Size="Medium"></HeaderStyle>
                                            <PagerStyle HorizontalAlign="Center" BackColor="#CCCCCC" ForeColor="Black"></PagerStyle>
                                            <RowStyle BackColor="#EFEEEF" Font-Size="Medium"></RowStyle>
                                            <SelectedRowStyle BackColor="#EA5151" Font-Bold="True" ForeColor="White"></SelectedRowStyle>
                                            <SortedAscendingCellStyle BackColor="#F1F1F1"></SortedAscendingCellStyle>
                                            <SortedAscendingHeaderStyle BackColor="Gray"></SortedAscendingHeaderStyle>
                                            <SortedDescendingCellStyle BackColor="#CAC9C9"></SortedDescendingCellStyle>
                                            <SortedDescendingHeaderStyle BackColor="#383838"></SortedDescendingHeaderStyle>
                                        </asp:GridView>
                    <asp:SqlDataSource runat="server" ID="Update_SqlDataSource2" ConnectionString="<%$ ConnectionStrings:localhost %>" SelectCommand= "SELECT [income_source_id], [case_id], [cash_amt], [cash_on_hand], [wages_stopped], [waiting_on_income], [recieving_income], [no_income], [currently_working], [laid_off], [never_worked], [quit], [fired], [sick_leave], [maternity_leave], [on_strike], [trying_to_find_work], [ckg_acct], [ckg_balance], [ckg_bank], [claims], [claims_memo], [client_id], [gifts_amt], [gifts_inc], [investments], [life_ins], [other_ins], [pension_amt], [pension_inc], [strike_benefits_amt], [strike_benefits_inc], [support_amt], [support_inc], [SSI_Amt], [SSI_Inc], [svgs_acct], [svgs_balance], [svgs_bank], [wages_amt], [wages_inc] FROM [income_source]"></asp:SqlDataSource>
                                    </td>
                                </tr>
                            </table>
                            <asp:Panel ID="Update_income_source_InfoHead" runat="server" ForeColor="#EFEEEF" Height="25px" BackImageUrl="~/Images/panelheader1.jpg">
                                <asp:Label ID="Update_income_source_InfoHead_label" Style="padding: 10px" runat="server" Text="income_source Information" Font-Size="Large"></asp:Label>
                            </asp:Panel>
                            <asp:Panel ID="Update_income_source_InfoBody" runat="server" style="overflow:hidden;">
                                <div>
                                    <table width="100%" height="auto" bgcolor="#666666" border="3" style="font-family: 'Calibri Light'; color: #E2E2E2;">
                                        <tr>
                                            <th colspan="4" style="padding: 5px 10px 5px 10px; background-color: #aaaaaa;" width="100%">
                                                <asp:Label ID="Update_Label3" runat="server" Font-Bold="False" Font-Size="Large" ForeColor="#333333" Text="SECTION HEADER"></asp:Label>
                                            </th>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_income_source_id_lbl" runat="server" Font-Size="Large" Text="income_source_id:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_income_source_id_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_case_id_lbl" runat="server" Font-Size="Large" Text="case_id:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_case_id_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_cash_amt_lbl" runat="server" Font-Size="Large" Text="cash_amt:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_cash_amt_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_cash_on_hand_lbl" runat="server" Font-Size="Large" Text="cash_on_hand:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_cash_on_hand_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_wages_stopped_lbl" runat="server" Font-Size="Large" Text="wages_stopped:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_wages_stopped_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_waiting_on_income_lbl" runat="server" Font-Size="Large" Text="waiting_on_income:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_waiting_on_income_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_recieving_income_lbl" runat="server" Font-Size="Large" Text="recieving_income:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_recieving_income_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_no_income_lbl" runat="server" Font-Size="Large" Text="no_income:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_no_income_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_currently_working_lbl" runat="server" Font-Size="Large" Text="currently_working:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_currently_working_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_laid_off_lbl" runat="server" Font-Size="Large" Text="laid_off:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_laid_off_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_never_worked_lbl" runat="server" Font-Size="Large" Text="never_worked:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_never_worked_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_quit_lbl" runat="server" Font-Size="Large" Text="quit:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_quit_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_fired_lbl" runat="server" Font-Size="Large" Text="fired:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_fired_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_sick_leave_lbl" runat="server" Font-Size="Large" Text="sick_leave:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_sick_leave_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_maternity_leave_lbl" runat="server" Font-Size="Large" Text="maternity_leave:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_maternity_leave_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_on_strike_lbl" runat="server" Font-Size="Large" Text="on_strike:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_on_strike_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_trying_to_find_work_lbl" runat="server" Font-Size="Large" Text="trying_to_find_work:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_trying_to_find_work_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_ckg_acct_lbl" runat="server" Font-Size="Large" Text="ckg_acct:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_ckg_acct_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_ckg_balance_lbl" runat="server" Font-Size="Large" Text="ckg_balance:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_ckg_balance_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_ckg_bank_lbl" runat="server" Font-Size="Large" Text="ckg_bank:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_ckg_bank_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_claims_lbl" runat="server" Font-Size="Large" Text="claims:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_claims_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_claims_memo_lbl" runat="server" Font-Size="Large" Text="claims_memo:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_claims_memo_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_client_id_lbl" runat="server" Font-Size="Large" Text="client_id:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_client_id_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_gifts_amt_lbl" runat="server" Font-Size="Large" Text="gifts_amt:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_gifts_amt_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_gifts_inc_lbl" runat="server" Font-Size="Large" Text="gifts_inc:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_gifts_inc_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_investments_lbl" runat="server" Font-Size="Large" Text="investments:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_investments_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_life_ins_lbl" runat="server" Font-Size="Large" Text="life_ins:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_life_ins_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_other_ins_lbl" runat="server" Font-Size="Large" Text="other_ins:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_other_ins_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_pension_amt_lbl" runat="server" Font-Size="Large" Text="pension_amt:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_pension_amt_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_pension_inc_lbl" runat="server" Font-Size="Large" Text="pension_inc:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_pension_inc_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_strike_benefits_amt_lbl" runat="server" Font-Size="Large" Text="strike_benefits_amt:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_strike_benefits_amt_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_strike_benefits_inc_lbl" runat="server" Font-Size="Large" Text="strike_benefits_inc:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_strike_benefits_inc_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_support_amt_lbl" runat="server" Font-Size="Large" Text="support_amt:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_support_amt_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_support_inc_lbl" runat="server" Font-Size="Large" Text="support_inc:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_support_inc_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_SSI_Amt_lbl" runat="server" Font-Size="Large" Text="SSI_Amt:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_SSI_Amt_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_SSI_Inc_lbl" runat="server" Font-Size="Large" Text="SSI_Inc:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_SSI_Inc_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_svgs_acct_lbl" runat="server" Font-Size="Large" Text="svgs_acct:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_svgs_acct_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_svgs_balance_lbl" runat="server" Font-Size="Large" Text="svgs_balance:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_svgs_balance_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_svgs_bank_lbl" runat="server" Font-Size="Large" Text="svgs_bank:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_svgs_bank_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_wages_amt_lbl" runat="server" Font-Size="Large" Text="wages_amt:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_wages_amt_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Update_wages_inc_lbl" runat="server" Font-Size="Large" Text="wages_inc:"></asp:Label>
                                                     <br />
                                                     <asp:TextBox ID="Update_wages_inc_txt" runat="server" Text="" Width="121px"></asp:TextBox>
                                                     <br />
                                                 </td>
                                            </tr>
                                        </tr>
                                    </table>
                                    <table width="100%" height="auto" bgcolor="#e2e2e2" style="font-family: 'Calibri Light'">
                                        <tr>
                                            <td style="padding: 0px 0px 0px 0px" width="100%">
                                                <asp:Button ID="Update_btn" runat="server" Font-Size="Large" Text="Update" BackColor="#EA5151" ForeColor="#E2E2E2" Width="100%" OnClick="UPDATE" CausesValidation="False" Style="margin-bottom: 0px; margin-top: 0px; border-style: solid none none none;" BorderColor="#666666" BorderWidth="3px" />
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </asp:Panel>
                            <asp:CollapsiblePanelExtender ID="Update_cpeincome_sourceInfo" runat="server" CollapseControlID="Update_income_source_InfoHead" CollapsedText="Show income_source Information" Enabled="True" ExpandControlID="Update_income_source_InfoHead" ExpandedText="income_source Information" TargetControlID="Update_income_source_InfoBody" TextLabelID="Update_income_source_InfoHead_label"></asp:CollapsiblePanelExtender>
                        </div>
                    </ContentTemplate>
                </asp:TabPanel>
                <asp:TabPanel ID="Delete_Tab_Panel" runat="server" HeaderText="Delete" Enabled="true" ScrollBars="Auto" BackColor="#EFEEEF" BorderColor="#666666" BorderStyle="Solid" EnableTheming="True">
                    <ContentTemplate>
                        <div>
                            <table width="100%" bgcolor="#e2e2e2" border="3" style="font-family: 'Calibri Light'">
                                <tr>
                                    <td width="20%" height="50px" style="border-style: none; padding: 0px 10px 0px 10px;" align="left">
                                        <asp:Label ID="Delete_Label2" runat="server" Text="Select a Disaster: " Font-Size="Large" ForeColor="Black"></asp:Label>
                                        <asp:DropDownList ID="Delete_ddlDisaster" runat="server" Height="24px" Width="240px" OnSelectedIndexChanged="Delete_ddlDisaster_SelectedIndexChanged" AutoPostBack="True" DataSourceID="Delete_SqlDataSource1" DataTextField="disaster_name" DataValueField="disaster_id" Style="margin-left: 0px" Font-Bold="True"></asp:DropDownList>
                                        <asp:SqlDataSource ID="Delete_SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:localhost %>" SelectCommand="SELECT [disaster_id], [disaster_name] FROM [disaster]"></asp:SqlDataSource>
                                    </td>
                                    <td width="80%" style="border-style: none; padding: 0px 10px 0px 10px;" align="Center">
                                        <asp:Label ID="Delete_Label1" runat="server" Text="HEADER TEXT" Font-Bold="True" Font-Size="X-Large"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                            <table width="100%" height="100%" bgcolor="#e2e2e2" border="3" style="font-family: 'Calibri Light'">
                                <tr>
                                    <td style="padding: 10px 0px 0px 0px">
                                        <asp:GridView ID="Delete_income_source_GridView" Style="border-style: solid none none none;" 
                                            Font-Size="Medium" runat="server" DataSourceID="Delete_SqlDataSource2" AutoGenerateColumns="False" 
                                            DataKeyNames="income_source_id" BackColor="#CCCCCC" BorderColor="#666666" BorderStyle="Solid" 
                                            BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="#1A1A1A" Width="100%" 
                                            OnSelectedIndexChanged="Delete_Select_Record" AllowPaging="True" Font-Bold="False" 
                                            Font-Italic="False" Font-Names="Calibri Light" Font-Overline="False" OnRowDataBound="RowDataBound"
                                            Font-Underline="False" GridLines="Horizontal" HorizontalAlign="Center">
                                            <AlternatingRowStyle BackColor="Gray" Font-Underline="False" ForeColor="White" />
                                            <Columns>
                                                <asp:CommandField ShowSelectButton="True"></asp:CommandField>
                            <asp:BoundField DataField="income_source_id" HeaderText="income_source_id" InsertVisible="False" ReadOnly="True" SortExpression="income_source_id" />
                            <asp:BoundField DataField="case_id" HeaderText="case_id" InsertVisible="False" ReadOnly="True" SortExpression="case_id" />
                            <asp:BoundField DataField="cash_amt" HeaderText="cash_amt" InsertVisible="False" ReadOnly="True" SortExpression="cash_amt" />
                            <asp:BoundField DataField="cash_on_hand" HeaderText="cash_on_hand" InsertVisible="False" ReadOnly="True" SortExpression="cash_on_hand" Visible="false" />
                            <asp:BoundField DataField="wages_stopped" HeaderText="wages_stopped" InsertVisible="False" ReadOnly="True" SortExpression="wages_stopped" Visible="false" />
                            <asp:BoundField DataField="waiting_on_income" HeaderText="waiting_on_income" InsertVisible="False" ReadOnly="True" SortExpression="waiting_on_income" Visible="false" />
                            <asp:BoundField DataField="recieving_income" HeaderText="recieving_income" InsertVisible="False" ReadOnly="True" SortExpression="recieving_income" Visible="false" />
                            <asp:BoundField DataField="no_income" HeaderText="no_income" InsertVisible="False" ReadOnly="True" SortExpression="no_income" Visible="false" />
                            <asp:BoundField DataField="currently_working" HeaderText="currently_working" InsertVisible="False" ReadOnly="True" SortExpression="currently_working" Visible="false" />
                            <asp:BoundField DataField="laid_off" HeaderText="laid_off" InsertVisible="False" ReadOnly="True" SortExpression="laid_off" Visible="false" />
                            <asp:BoundField DataField="never_worked" HeaderText="never_worked" InsertVisible="False" ReadOnly="True" SortExpression="never_worked" Visible="false" />
                            <asp:BoundField DataField="quit" HeaderText="quit" InsertVisible="False" ReadOnly="True" SortExpression="quit" Visible="false" />
                            <asp:BoundField DataField="fired" HeaderText="fired" InsertVisible="False" ReadOnly="True" SortExpression="fired" Visible="false" />
                            <asp:BoundField DataField="sick_leave" HeaderText="sick_leave" InsertVisible="False" ReadOnly="True" SortExpression="sick_leave" Visible="false" />
                            <asp:BoundField DataField="maternity_leave" HeaderText="maternity_leave" InsertVisible="False" ReadOnly="True" SortExpression="maternity_leave" Visible="false" />
                            <asp:BoundField DataField="on_strike" HeaderText="on_strike" InsertVisible="False" ReadOnly="True" SortExpression="on_strike" Visible="false" />
                            <asp:BoundField DataField="trying_to_find_work" HeaderText="trying_to_find_work" InsertVisible="False" ReadOnly="True" SortExpression="trying_to_find_work" Visible="false" />
                            <asp:BoundField DataField="ckg_acct" HeaderText="ckg_acct" InsertVisible="False" ReadOnly="True" SortExpression="ckg_acct" Visible="false" />
                            <asp:BoundField DataField="ckg_balance" HeaderText="ckg_balance" InsertVisible="False" ReadOnly="True" SortExpression="ckg_balance" Visible="false" />
                            <asp:BoundField DataField="ckg_bank" HeaderText="ckg_bank" InsertVisible="False" ReadOnly="True" SortExpression="ckg_bank" Visible="false" />
                            <asp:BoundField DataField="claims" HeaderText="claims" InsertVisible="False" ReadOnly="True" SortExpression="claims" Visible="false" />
                            <asp:BoundField DataField="claims_memo" HeaderText="claims_memo" InsertVisible="False" ReadOnly="True" SortExpression="claims_memo" Visible="false" />
                            <asp:BoundField DataField="client_id" HeaderText="client_id" InsertVisible="False" ReadOnly="True" SortExpression="client_id" Visible="false" />
                            <asp:BoundField DataField="gifts_amt" HeaderText="gifts_amt" InsertVisible="False" ReadOnly="True" SortExpression="gifts_amt" Visible="false" />
                            <asp:BoundField DataField="gifts_inc" HeaderText="gifts_inc" InsertVisible="False" ReadOnly="True" SortExpression="gifts_inc" Visible="false" />
                            <asp:BoundField DataField="investments" HeaderText="investments" InsertVisible="False" ReadOnly="True" SortExpression="investments" Visible="false" />
                            <asp:BoundField DataField="life_ins" HeaderText="life_ins" InsertVisible="False" ReadOnly="True" SortExpression="life_ins" Visible="false" />
                            <asp:BoundField DataField="other_ins" HeaderText="other_ins" InsertVisible="False" ReadOnly="True" SortExpression="other_ins" Visible="false" />
                            <asp:BoundField DataField="pension_amt" HeaderText="pension_amt" InsertVisible="False" ReadOnly="True" SortExpression="pension_amt" Visible="false" />
                            <asp:BoundField DataField="pension_inc" HeaderText="pension_inc" InsertVisible="False" ReadOnly="True" SortExpression="pension_inc" Visible="false" />
                            <asp:BoundField DataField="strike_benefits_amt" HeaderText="strike_benefits_amt" InsertVisible="False" ReadOnly="True" SortExpression="strike_benefits_amt" Visible="false" />
                            <asp:BoundField DataField="strike_benefits_inc" HeaderText="strike_benefits_inc" InsertVisible="False" ReadOnly="True" SortExpression="strike_benefits_inc" Visible="false" />
                            <asp:BoundField DataField="support_amt" HeaderText="support_amt" InsertVisible="False" ReadOnly="True" SortExpression="support_amt" Visible="false" />
                            <asp:BoundField DataField="support_inc" HeaderText="support_inc" InsertVisible="False" ReadOnly="True" SortExpression="support_inc" Visible="false" />
                            <asp:BoundField DataField="SSI_Amt" HeaderText="SSI_Amt" InsertVisible="False" ReadOnly="True" SortExpression="SSI_Amt" Visible="false" />
                            <asp:BoundField DataField="SSI_Inc" HeaderText="SSI_Inc" InsertVisible="False" ReadOnly="True" SortExpression="SSI_Inc" Visible="false" />
                            <asp:BoundField DataField="svgs_acct" HeaderText="svgs_acct" InsertVisible="False" ReadOnly="True" SortExpression="svgs_acct" Visible="false" />
                            <asp:BoundField DataField="svgs_balance" HeaderText="svgs_balance" InsertVisible="False" ReadOnly="True" SortExpression="svgs_balance" Visible="false" />
                            <asp:BoundField DataField="svgs_bank" HeaderText="svgs_bank" InsertVisible="False" ReadOnly="True" SortExpression="svgs_bank" Visible="false" />
                            <asp:BoundField DataField="wages_amt" HeaderText="wages_amt" InsertVisible="False" ReadOnly="True" SortExpression="wages_amt" Visible="false" />
                            <asp:BoundField DataField="wages_inc" HeaderText="wages_inc" InsertVisible="False" ReadOnly="True" SortExpression="wages_inc" Visible="false" />
                                            </Columns>
                                            <FooterStyle BackColor="#CCCCCC"></FooterStyle>
                                            <HeaderStyle BackColor="#EA5151" ForeColor="White" Font-Size="Medium"></HeaderStyle>
                                            <PagerStyle HorizontalAlign="Center" BackColor="#CCCCCC" ForeColor="Black"></PagerStyle>
                                            <RowStyle BackColor="#EFEEEF" Font-Size="Medium"></RowStyle>
                                            <SelectedRowStyle BackColor="#EA5151" Font-Bold="True" ForeColor="White"></SelectedRowStyle>
                                            <SortedAscendingCellStyle BackColor="#F1F1F1"></SortedAscendingCellStyle>
                                            <SortedAscendingHeaderStyle BackColor="Gray"></SortedAscendingHeaderStyle>
                                            <SortedDescendingCellStyle BackColor="#CAC9C9"></SortedDescendingCellStyle>
                                            <SortedDescendingHeaderStyle BackColor="#383838"></SortedDescendingHeaderStyle>
                                        </asp:GridView>
                    <asp:SqlDataSource runat="server" ID="Delete_SqlDataSource2" ConnectionString="<%$ ConnectionStrings:localhost %>" SelectCommand= "SELECT [income_source_id], [case_id], [cash_amt], [cash_on_hand], [wages_stopped], [waiting_on_income], [recieving_income], [no_income], [currently_working], [laid_off], [never_worked], [quit], [fired], [sick_leave], [maternity_leave], [on_strike], [trying_to_find_work], [ckg_acct], [ckg_balance], [ckg_bank], [claims], [claims_memo], [client_id], [gifts_amt], [gifts_inc], [investments], [life_ins], [other_ins], [pension_amt], [pension_inc], [strike_benefits_amt], [strike_benefits_inc], [support_amt], [support_inc], [SSI_Amt], [SSI_Inc], [svgs_acct], [svgs_balance], [svgs_bank], [wages_amt], [wages_inc] FROM [income_source]"></asp:SqlDataSource>
                                    </td>
                                </tr>
                            </table>
                            <asp:Panel ID="Delete_income_source_InfoHead" runat="server" ForeColor="#EFEEEF" Height="25px" BackImageUrl="~/Images/panelheader1.jpg">
                                <asp:Label ID="Delete_income_source_InfoHead_label" Style="padding: 10px" runat="server" Text="income_source Information" Font-Size="Large"></asp:Label>
                            </asp:Panel>
                            <asp:Panel ID="Delete_income_source_InfoBody" runat="server" style="overflow:hidden;">
                                <div>
                                    <table width="100%" height="auto" bgcolor="#666666" border="3" style="font-family: 'Calibri Light'; color: #E2E2E2;">
                                        <tr>
                                            <th colspan="4" style="padding: 5px 10px 5px 10px; background-color: #aaaaaa;" width="100%">
                                                <asp:Label ID="Delete_Label3" runat="server" Font-Bold="False" Font-Size="Large" ForeColor="#333333" Text="SECTION HEADER"></asp:Label>
                                            </th>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_income_source_id_lbl" runat="server" Font-Size="Large" Text="income_source_id:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_income_source_id_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_case_id_lbl" runat="server" Font-Size="Large" Text="case_id:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_case_id_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_cash_amt_lbl" runat="server" Font-Size="Large" Text="cash_amt:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_cash_amt_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_cash_on_hand_lbl" runat="server" Font-Size="Large" Text="cash_on_hand:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_cash_on_hand_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_wages_stopped_lbl" runat="server" Font-Size="Large" Text="wages_stopped:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_wages_stopped_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_waiting_on_income_lbl" runat="server" Font-Size="Large" Text="waiting_on_income:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_waiting_on_income_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_recieving_income_lbl" runat="server" Font-Size="Large" Text="recieving_income:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_recieving_income_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_no_income_lbl" runat="server" Font-Size="Large" Text="no_income:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_no_income_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_currently_working_lbl" runat="server" Font-Size="Large" Text="currently_working:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_currently_working_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_laid_off_lbl" runat="server" Font-Size="Large" Text="laid_off:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_laid_off_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_never_worked_lbl" runat="server" Font-Size="Large" Text="never_worked:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_never_worked_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_quit_lbl" runat="server" Font-Size="Large" Text="quit:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_quit_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_fired_lbl" runat="server" Font-Size="Large" Text="fired:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_fired_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_sick_leave_lbl" runat="server" Font-Size="Large" Text="sick_leave:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_sick_leave_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_maternity_leave_lbl" runat="server" Font-Size="Large" Text="maternity_leave:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_maternity_leave_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_on_strike_lbl" runat="server" Font-Size="Large" Text="on_strike:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_on_strike_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_trying_to_find_work_lbl" runat="server" Font-Size="Large" Text="trying_to_find_work:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_trying_to_find_work_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_ckg_acct_lbl" runat="server" Font-Size="Large" Text="ckg_acct:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_ckg_acct_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_ckg_balance_lbl" runat="server" Font-Size="Large" Text="ckg_balance:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_ckg_balance_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_ckg_bank_lbl" runat="server" Font-Size="Large" Text="ckg_bank:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_ckg_bank_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_claims_lbl" runat="server" Font-Size="Large" Text="claims:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_claims_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_claims_memo_lbl" runat="server" Font-Size="Large" Text="claims_memo:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_claims_memo_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_client_id_lbl" runat="server" Font-Size="Large" Text="client_id:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_client_id_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_gifts_amt_lbl" runat="server" Font-Size="Large" Text="gifts_amt:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_gifts_amt_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_gifts_inc_lbl" runat="server" Font-Size="Large" Text="gifts_inc:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_gifts_inc_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_investments_lbl" runat="server" Font-Size="Large" Text="investments:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_investments_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_life_ins_lbl" runat="server" Font-Size="Large" Text="life_ins:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_life_ins_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_other_ins_lbl" runat="server" Font-Size="Large" Text="other_ins:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_other_ins_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_pension_amt_lbl" runat="server" Font-Size="Large" Text="pension_amt:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_pension_amt_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_pension_inc_lbl" runat="server" Font-Size="Large" Text="pension_inc:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_pension_inc_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_strike_benefits_amt_lbl" runat="server" Font-Size="Large" Text="strike_benefits_amt:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_strike_benefits_amt_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_strike_benefits_inc_lbl" runat="server" Font-Size="Large" Text="strike_benefits_inc:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_strike_benefits_inc_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_support_amt_lbl" runat="server" Font-Size="Large" Text="support_amt:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_support_amt_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_support_inc_lbl" runat="server" Font-Size="Large" Text="support_inc:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_support_inc_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_SSI_Amt_lbl" runat="server" Font-Size="Large" Text="SSI_Amt:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_SSI_Amt_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_SSI_Inc_lbl" runat="server" Font-Size="Large" Text="SSI_Inc:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_SSI_Inc_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_svgs_acct_lbl" runat="server" Font-Size="Large" Text="svgs_acct:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_svgs_acct_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_svgs_balance_lbl" runat="server" Font-Size="Large" Text="svgs_balance:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_svgs_balance_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_svgs_bank_lbl" runat="server" Font-Size="Large" Text="svgs_bank:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_svgs_bank_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_wages_amt_lbl" runat="server" Font-Size="Large" Text="wages_amt:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_wages_amt_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="padding: 20px 10px 10px 10px">
                                                     <asp:Label ID="Delete_wages_inc_lbl" runat="server" Font-Size="Large" Text="wages_inc:"></asp:Label>
                                                     <br />
                                                     <asp:Label ID="Delete_wages_inc_txt_lbl" runat="server" Text="" Width="121px"></asp:Label>
                                                     <br />
                                                 </td>
                                            </tr>
                                        </tr>
                                    </table>
                                    <table width="100%" height="auto" bgcolor="#e2e2e2" style="font-family: 'Calibri Light'">
                                        <tr>
                                            <td style="padding: 0px 0px 0px 0px" width="100%">
                                                <asp:Button ID="Delete_btn" runat="server" Font-Size="Large" Text="Delete" BackColor="#EA5151" ForeColor="#E2E2E2" Width="100%" OnClick="DELETE" CausesValidation="False" Style="margin-bottom: 0px; margin-top: 0px; border-style: solid none none none;" BorderColor="#666666" BorderWidth="3px" />
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </asp:Panel>
                            <asp:CollapsiblePanelExtender ID="Delete_cpeincome_sourceInfo" runat="server" CollapseControlID="Delete_income_source_InfoHead" CollapsedText="Show income_source Information" Enabled="True" ExpandControlID="Delete_income_source_InfoHead" ExpandedText="income_source Information" TargetControlID="Delete_income_source_InfoBody" TextLabelID="Delete_income_source_InfoHead_label"></asp:CollapsiblePanelExtender>
                        </div>
                    </ContentTemplate>
                </asp:TabPanel>
            </asp:TabContainer>
        </div>
    </body>
    </html>
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
</asp:Content>

