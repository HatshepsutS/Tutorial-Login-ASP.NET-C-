<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="LoginBasico.Registro" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js" integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N" crossorigin="anonymous"></script>

    <title>Registro</title>
</head>
<body>
     <div class="container">
    <h1>Registro de Usuarios</h1>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="lblUsuario" runat="server" CssClass="control-label col-sm-2"   Text="Usuario"></asp:Label>
            <asp:TextBox ID="txtUsuario" CssClass="form-control" runat="server" required></asp:TextBox>
            <asp:Label ID="lblContra" runat="server"  CssClass="control-label col-sm-2" Text="Contraseña" ></asp:Label>
            <asp:TextBox ID="txtContra" runat="server" CssClass="form-control" TextMode="Password" required></asp:TextBox>
             <asp:Label ID="Label1" runat="server"  CssClass="control-label col-sm-2" Text="Correo Electronico" ></asp:Label>
            <asp:TextBox ID="txtemail" runat="server" CssClass="form-control" TextMode="Email" required></asp:TextBox>
              <asp:Label ID="Label2" runat="server"  CssClass="control-label col-sm-2" Text="Telefono" ></asp:Label>
            <asp:TextBox ID="txttelefono" runat="server" CssClass="form-control" TextMode="Phone" required></asp:TextBox>
             
            
            <br /> 

            <asp:Button ID="btnInciarSesion" runat="server" CssClass="btn btn-info" Text="Registrarse" OnClick="btnIniciarSesion_Click"/>
      

        </div>

    </form>
         </div>
</body>
</html>
