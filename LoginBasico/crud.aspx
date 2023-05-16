<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="crud.aspx.cs" Inherits="LoginBasico.crud" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Libros</title>
  

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            <asp:GridView ID="gridViewLibros" runat="server" AutoGenerateColumns="False" OnRowEditing="gridViewLibros_RowEditing" OnRowUpdating="gridViewLibros_RowUpdating" OnRowCancelingEdit="gridViewLibros_RowCancelingEdit" OnRowDeleting="gridViewLibros_RowDeleting" DataKeyNames="ID">
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" />
                    <asp:TemplateField HeaderText="Titulo">
                        <ItemTemplate>
                            <%# Eval("Titulo") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtTitulo" runat="server" Text='<%# Bind("Titulo") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Autor">
                        <ItemTemplate>
                            <%# Eval("Autor") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtAutor" runat="server" Text='<%# Bind("Autor") %>' AutoPostBack="True"></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Editorial">
                        <ItemTemplate>
                            <%# Eval("Editorial") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtEditorial" runat="server" Text='<%# Bind("Editorial") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Edicion">
                        <ItemTemplate>
                            <%# Eval("Edicion") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtEdicion" runat="server" Text='<%# Bind("Edicion") %>' AutoPostBack="True"></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" ButtonType="Link" />
                </Columns>
            </asp:GridView>
                            <asp:Button ID="btnAgregar" runat="server" Text="Agregar libro"  />

            <asp:Label ID="lblTitulo" runat="server"></asp:Label>
        </div>
    </form>
</body>
</html>
