<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Curd_Operation.Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
  <link href="css/bootstrap.min.css" rel="stylesheet" />
  <link href="CSS.css" rel="stylesheet" />
  <scrpt src="js/bootstrap.min.js"></scrpt>
      <script src="https://your-site-or-cdn.com/fontawesome/v6.1.1/js/all.js" data-auto-replace-svg="nest"></script>

    
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                
        <div>


<!-- Navbar -->
            <div class="navbar navbar-dark bg-dark">
  <h1 style="color: white; padding-left:150px;">Manage Employees</h1>
  <div class="form-inline" style="padding-right:150px">
    <asp:Button ID="delete" runat="server" CssClass="btn  btn-danger my-2 my-sm-0" Text="Delete"></asp:Button>
      
    <asp:Button ID="add" runat="server" CssClass="btn btn-success my-2 my-sm-0" Text="Add New Employee" />
    
  </div>
</div>

<!-- Modals for Delete Button -->

<asp:Panel ID="Panel1" runat="server" CssClass="modalPopup" Style="display: none"  >
      <div style="background-color: white; width: 400px">
        <h2 class="shift">Delete Employee</h2>
          <hr />
    
        <p class="shift">Are you sure want to delete all records?</p>

          <p class="shift" style="color:orange">the action can not</p>
    
      <div class="footer">
          <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
          <asp:Button runat="server" ID="cancelDel" CssClass="btn btn-light bt" Text="Cancel"  OnClick="cancelDel_Click"/>
          <asp:Button Id="dlt" runat="server" CssClass="btn btn-danger bt1" Text="Delete"  OnClick="dlt_Click"/>
       </ContentTemplate></asp:UpdatePanel>
      </div>
 </div>

    </asp:Panel>
            <ajaxtoolkit:modalpopupextender runat="server" TargetControlID="delete" PopupControlID="Panel1" BackgroundCssClass="modalBackground"></ajaxtoolkit:modalpopupextender>


<!-- Modals for Add Button -->

            <asp:Panel ID="Panel2" runat="server" CssClass="modalPopup" Style="display: none">
      <div style="background-color: white; width: 400px">
        <h2 class="shift">Add Employee</h2>
          <hr />
          
  <div class="form-group">
    <asp:Label runat="server" CssClass="shift" Text="Name"></asp:Label>
    <asp:TextBox  runat="server" class="form-control txt" ID="TextName" placeholder="Enter Name" Width="200"></asp:TextBox>
  </div>

      <div class="form-group">
    <asp:Label runat="server" CssClass="shift" Text="Email"></asp:Label>
    <asp:TextBox  runat="server" class="form-control txt" ID="TextEmail" placeholder="Enter email" Width="200"/>

        
  <div class="form-group">
    <asp:Label runat="server" CssClass="shift" Text="Address"></asp:Label>
    <asp:TextBox  runat="server" class="form-control txt" ID="TextAddress" placeholder="Enter Address" Width="200"></asp:TextBox>
  </div>

  </div>
  <div class="form-group">
    <asp:Label runat="server" CssClass="shift" Text="Phone"></asp:Label>
    <asp:TextBox  runat="server" class="form-control txt" ID="TextPhone" placeholder="Enter Phone" Width="200"></asp:TextBox>
  </div>
          <hr />
      <div class="footer">
          <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                    <ContentTemplate>
          <asp:Button runat="server" ID="cancelAdd" CssClass="btn btn-light bt" Text="Cancel"  OnClick="cancelAdd_Click"/>
          <asp:Button Id="addnew" runat="server" CssClass="btn btn-success bt1" Text="Add"   OnClick="addnew_Click"/>
       </ContentTemplate></asp:UpdatePanel>
      </div>
 </div>
</div>
    </asp:Panel>
            <ajaxtoolkit:modalpopupextender runat="server" TargetControlID="add" PopupControlID="Panel2" BackgroundCssClass="modalBackground"></ajaxtoolkit:modalpopupextender>

 <!-- Display Data -->
        
            <div class="table table-hover">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
             
                     <asp:GridView ID="GridView1" runat="server" class="table table-hover"  AutoGenerateColumns="false" AlternatingRowStyle-BackColor="#cccccc" OnRowEditing="GridView1_RowEditing" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowUpdating="GridView1_RowUpdating" OnRowDeleting="GridView1_RowDeleting">
                         <HeaderStyle Font-Bold="true" Font-Size="Medium" BackColor="#9999FF" />
                         <Columns>
                         <asp:TemplateField HeaderText="">
                    <ItemTemplate>
                        <asp:Label ID="id" runat="server" Text='<%# Eval("id") %>' Visible="false"></asp:Label>
                    </ItemTemplate>
                             </asp:TemplateField>
                             <asp:TemplateField HeaderText="NAME">
                    <ItemTemplate>
                        <asp:Label ID="Name" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtName" runat="server" Text='<%# Eval("Name") %>' Width="140"></asp:TextBox>
                    </EditItemTemplate>
                                 </asp:TemplateField>

                              <asp:TemplateField HeaderText="EMAIL">
                    <ItemTemplate>
                        <asp:Label ID="Email" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtEmail" runat="server" Text='<%# Eval("Email") %>' Width="140"></asp:TextBox>
                    </EditItemTemplate>
                                 </asp:TemplateField>

                              <asp:TemplateField HeaderText="ADDRESS">
                    <ItemTemplate>
                        <asp:Label ID="Addrress" runat="server" Text='<%# Eval("Addrress") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtAddress" runat="server" Text='<%# Eval("Addrress") %>' Width="140"></asp:TextBox>
                    </EditItemTemplate>
                                 </asp:TemplateField>

                              <asp:TemplateField HeaderText="PHONE">
                    <ItemTemplate>
                        <asp:Label ID="Phone" runat="server" Text='<%# Eval("Phone") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtPhone" runat="server" Text='<%# Eval("Phone") %>' Width="140"></asp:TextBox>
                    </EditItemTemplate>
                                 </asp:TemplateField>

                              <asp:TemplateField HeaderText="ACTIONS">
                    <ItemTemplate>
                        <asp:ImageButton class="dis"  runat="server" ImageUrl="/images/pencil.png" CommandName="Edit" ToolTip="Edit" Height="30px" Width="30px"/>
                        <asp:ImageButton class="dis" runat="server" ImageUrl="/images/delete.png" CommandName="Delete" ToolTip="Delete" Height="30px" Width="30px"/>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:ImageButton class="dis" runat="server" ImageUrl="/images/save.png" CommandName="Update" ToolTip="Update" Height="30px" Width="30px"/>
                        <asp:ImageButton class="dis" runat="server" ImageUrl="/images/cancel.png" CommandName="Cancel" ToolTip="Cancel" Height="30px" Width="30px"/>
                      
                    </EditItemTemplate>
                                 </asp:TemplateField>

                         </Columns>
                     </asp:GridView>
                                    
                          </ContentTemplate></asp:UpdatePanel>
                        </div>

            
                
        </div>
    </form>
</body>
</html>
