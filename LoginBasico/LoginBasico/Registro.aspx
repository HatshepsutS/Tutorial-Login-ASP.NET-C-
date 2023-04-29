<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="LoginBasico.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Registro</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js" integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N" crossorigin="anonymous"></script>

</head>
<body>
    <div class="container">
    <h1>Registro de usuario</h1>
    <form id="form1" runat="server">
        <div>

            <div>
            <asp:Label ID="lblUsuario" runat="server" CssClass="control-label col-sm-2"   Text="Usuario"></asp:Label>
            <asp:TextBox ID="txtUsuario" CssClass="form-control" runat="server" placeholder="Ingresa tu usuario" required></asp:TextBox>
            <asp:Label ID="lblContra" runat="server"  CssClass="control-label col-sm-2" Text="Contraseña"></asp:Label>
            <asp:TextBox ID="txtContra" runat="server"  CssClass="form-control" TextMode="Password" ViewStateMode="Enabled" placeholder="Ingresa tu contraseña" required></asp:TextBox>
            <br />
            <asp:Button ID="btnInciarSesion" type="submit" runat="server" CssClass="btn btn-info" Text="Registrate" OnClick="btnRegistro_Click"/> 
       

        </div>
        </div>
    </form>
        </div>
</body>
</html>
