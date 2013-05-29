<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Procfunc.aspx.cs" Inherits="InsuranceSite.Procfunc" %>
<asp:Content ID="mainContent" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
        function validateDate() {
            if ('<%= cal_payDate.SelectedDate==DateTime.MinValue  %>' == "True")
                alert('Please select a date.');
        }
    </script>
    <fieldset>
        <legend>Function sumForCustomer</legend>
        <p>
            This function returns the sum of the prices of a given customer's insurances at a given date.
        </p>
        <asp:Panel ID="funcPanel" runat="server" DefaultButton="submit_Customer">
        <table class="repeaterTable">
            <tr>
                <td>Customer ID: </td>
                <td>
                    <asp:DropDownList id="ddl_customerID" runat="server" AutoPostBack="True" 
                        DataSourceID="customerIDs" DataTextField="CUSTOMER_ID" 
                        DataValueField="CUSTOMER_ID">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="customerIDs" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:OraInsuranceConnection %>"        
                    ProviderName="<%$ ConnectionStrings:OraInsuranceConnection.ProviderName %>" 
                    SelectCommand="select customer_id from customer" >
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td>Date:</td>
                <td>
                    <div class="calendarClass" >
                        <div style="text-align:center">
                            <asp:DropDownList  id="YearList" runat="server" AutoPostBack="true" OnSelectedIndexChanged="YearList_SelectedIndexChanged"></asp:DropDownList>
                        </div>
                        
                        <asp:Calendar id="cal_payDate" runat="server" BackColor="White" 
                            BorderColor="#999999" Font-Names="Verdana" Font-Size="8pt" 
                            ForeColor="Black" Height="180px" Width="200px" CellPadding="4" 
                            DayNameFormat="Shortest">
                            <DayHeaderStyle Font-Bold="True" Font-Size="7pt" BackColor="#CCCCCC" />
                            <NextPrevStyle 
                                VerticalAlign="Bottom" />
                            <OtherMonthDayStyle ForeColor="#808080" />
                            <SelectedDayStyle BackColor="#666666" ForeColor="White" Font-Bold="True" />
                            <SelectorStyle BackColor="#CCCCCC" />
                            <TitleStyle BackColor="#999999" BorderColor="Black" 
                                Font-Bold="True" />
                            <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                            <WeekendDayStyle BackColor="#FFFFCC" />
                        </asp:Calendar>
                    </div>
                </td>
            </tr>
            <tr>
            <td>Submit:</td>
            <td>
                <asp:Button ID="submit_Customer" runat="server" Text="Submit" 
                    OnClientClick="javascript:validateDate();" onclick="callSumForCustomer" />
            </td>
            </tr>
            <tr>
            <td>Result:</td>
            <td>
                <asp:TextBox ID="txt_result" runat="server" ReadOnly="True"></asp:TextBox>
            </td>
            </tr>
        </table>
        </asp:Panel>
    </fieldset>

    
    <fieldset>
        <legend>Procedure updatePropertyPrice</legend>
        <p>
            This procedure updates the price of a given property policy according to a given base price, using a formula adjusting to the policy's data (property code, age of property and property value).
        </p>
        <asp:Panel ID="ProcPanel" runat="server" DefaultButton="submit_Property">
        <table class="repeaterTable">
            <tr>
                <td>Property policy ID: </td>
                <td>
                    <asp:DropDownList id="ddl_propertyID" runat="server" AutoPostBack="True" 
                        DataSourceID="propertyID" DataTextField="policy_id" 
                        DataValueField="policy_id">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="propertyID" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:OraInsuranceConnection %>"        
                    ProviderName="<%$ ConnectionStrings:OraInsuranceConnection.ProviderName %>" 
                    SelectCommand="select policy_id from property" >
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td>Base price:</td>
                <td>
                    <asp:TextBox ID="txt_basePrice" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
            <td>Submit:</td>
            <td>
                <asp:Button ID="submit_Property" runat="server" Text="Submit" 
                    onclick="callUpdatePropertyPrice" />
            </td>
            </tr>
            <tr>
            <td>Old price:</td>
            <td>
                <asp:TextBox ID="txt_oldPrice" runat="server" ReadOnly="True"></asp:TextBox>
            </td>
            </tr>
            <tr>
            <td>New price:</td>
            <td>
                <asp:TextBox ID="txt_newPrice" runat="server" ReadOnly="True"></asp:TextBox>
            </td>
            </tr>
        </table>
        </asp:Panel>
    </fieldset>
</asp:Content>