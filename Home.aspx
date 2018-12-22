<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Home.aspx.vb" Inherits="WebApplication1.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            text-align: center;
            font-size: xx-large;
        }
        .newStyle1 {
            font-family: "Adobe Naskh Medium";
        }
        .auto-style2 {
            text-align: center;
        }
        .auto-style3 {
            width: 100%;
        }
        .auto-style4 {
            margin-top: 1px;
        }
        .newStyle2 {
            font-family: "Arial Black";
            font-size: medium;
        }
        .auto-style5 {
            font-size: small;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Bootstrap: This is the code for calling Javascript Files for Bootstrap Form
            These are called from the public servers below-->
        <script type="text/javascript" src='https://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.3.min.js'></script>
        <script type="text/javascript" src='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/js/bootstrap.min.js'></script>
        <link rel="stylesheet" href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/css/bootstrap.min.css'
        media="screen" />
   
        <!-- This line includes an external javascript file-->
        <script src="JavaScriptFuntion.js"></script>

        <!-- This Section creates the Form-->
        <div class="auto-style1">
            <span class="newStyle1">Customer Database</span></div>
        <div class="auto-style2">
            <br />
            <br />
            <br />
            <br />
            <br />
            <span class="auto-style5"><strong>STATE:</strong></span>&nbsp;
            <asp:DropDownList ID="DropDownList1" runat="server" AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="SqlDataState" DataTextField="state_code" DataValueField="state_id">
            <asp:ListItem value ="" text="Select a State" />
            </asp:DropDownList>
            <br />
            <br />

            <!-- This is the stored procedure for read/write to the Database
                This code is validate by the Server--> 

            <asp:SqlDataSource ID="SqlDataState" runat="server" ConnectionString="<%$ ConnectionStrings:Project1ConnectionString %>" SelectCommand="uspStatesList" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
            <table class="auto-style3">
                <tr>
                    <td>
                        <!-- This code lists all records from the Database-->
                        <center>
                        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" CssClass="auto-style4" DataKeyNames="person_id" DataSourceID="SqlDataPerson" ForeColor="#333333" GridLines="None">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <Columns>
                                <asp:CommandField ShowSelectButton="True" />
                                <asp:BoundField DataField="person_id" HeaderText="Person ID" InsertVisible="False" ReadOnly="True" SortExpression="person_id" />
                                <asp:BoundField DataField="first_name" HeaderText="First Name" SortExpression="first_name" />
                                <asp:BoundField DataField="last_name" HeaderText="Last Name" SortExpression="last_name" />
                                <asp:BoundField DataField="state_id" HeaderText="State ID" SortExpression="state_id" />
                                <asp:BoundField DataField="gender" HeaderText="Gender" SortExpression="gender" />
                                <asp:BoundField DataField="dob" HeaderText="Data of Birth" SortExpression="dob" />
                            </Columns>
                            <EditRowStyle BackColor="#999999" />
                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#E9E7E2" />
                            <SortedAscendingHeaderStyle BackColor="#506C8C" />
                            <SortedDescendingCellStyle BackColor="#FFFDF8" />
                            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                        </asp:GridView>
                    <!-- This is the stored procedure to read from the Database to save in a Database Control--> 

                        <asp:SqlDataSource ID="SqlDataPerson" runat="server" ConnectionString="<%$ ConnectionStrings:Project1ConnectionString %>" SelectCommand="uspPersonSearch" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="DropDownList1" DefaultValue="0" Name="State_Id" PropertyName="SelectedValue" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        </center>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
                
            </table>
            <!-- Modal: This code creates the Modal Dialog for The Web Form using Bootstrap Code -->

                <div class="modal fade" id="basicExampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" data-backdrop="static">
                <div class="modal-dialog" role="document" >
                <div class="modal-content" >
                <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                </div>
                <center><h5 class="modal-title" id="exampleModalLabel" style="font-size: large; font-weight: bold; font-style: normal; font-family: Algerian; text-align: center;">Personal Information</h5></center>
                <div class="modal-body" >
                    <td><center>
                        <!-- This code lists selected record from Person Table-->
                        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" CellPadding="4" DataKeyNames="person_id" DataSourceID="SqlDataPersonDetail" ForeColor="#333333" GridLines="None" Height="50px" Width="481px">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
                            <EditRowStyle BackColor="#999999" />
                            <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
                            <Fields>
                                <asp:BoundField DataField="person_id" HeaderText="Person ID" InsertVisible="False" ReadOnly="True" SortExpression="person_id" />
                                <asp:BoundField DataField="first_name" HeaderText="First Name" SortExpression="first_name" />
                                <asp:BoundField DataField="last_name" HeaderText="Last Name" SortExpression="last_name" />
                                <asp:BoundField DataField="state_id" HeaderText="State ID" SortExpression="state_id" />
                                <asp:BoundField DataField="gender" HeaderText="Gender" SortExpression="gender" />
                                <asp:BoundField DataField="dob" HeaderText="Dob" SortExpression="dob" />
                                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
                            </Fields>
                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        </asp:DetailsView>
                        <!--This code permits to add/edit/delete the person record.-->
                        <asp:SqlDataSource ID="SqlDataPersonDetail" runat="server" ConnectionString="<%$ ConnectionStrings:Project1ConnectionString %>" DeleteCommand="DELETE FROM [person] WHERE [person_id] = @person_id" InsertCommand="INSERT INTO [person] ([first_name], [last_name], [state_id], [gender], [dob]) VALUES (@first_name, @last_name, @state_id, @gender, @dob)" SelectCommand="SELECT * FROM [person] WHERE ([person_id] = @person_id)" UpdateCommand="UPDATE [person] SET [first_name] = @first_name, [last_name] = @last_name, [state_id] = @state_id, [gender] = @gender, [dob] = @dob WHERE [person_id] = @person_id">
                            <DeleteParameters>
                                <asp:Parameter Name="person_id" Type="Int32" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="first_name" Type="String" />
                                <asp:Parameter Name="last_name" Type="String" />
                                <asp:Parameter Name="state_id" Type="Int32" />
                                <asp:Parameter Name="gender" Type="String" />
                                <asp:Parameter Name="dob" Type="DateTime" />
                            </InsertParameters>
                            <SelectParameters>
                                <asp:ControlParameter ControlID="GridView1" DefaultValue="0" Name="person_id" PropertyName="SelectedValue" Type="Int32" />
                            </SelectParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="first_name" Type="String" />
                                <asp:Parameter Name="last_name" Type="String" />
                                <asp:Parameter Name="state_id" Type="Int32" />
                                <asp:Parameter Name="gender" Type="String" />
                                <asp:Parameter Name="dob" Type="DateTime" />
                                <asp:Parameter Name="person_id" Type="Int32" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                        </center>
                    </td>
                    </div>
                <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal" data-toggle="GridView1" data-backdrop="static">DONE</button>
                </div>
            </div>
            </div>
        </div>

       
        </div>
        <!--This code creates a Button for call the Class to open the form, wich can use to modifity the record in the Database.-->
        <center>
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#basicExampleModal" data-backdrop="static" id="btnMaintenance">OPEN</button>
        </center>

    </form>
</body>
</html>
