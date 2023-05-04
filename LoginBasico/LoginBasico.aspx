<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginBasico.aspx.cs" Inherits="LoginBasico.LoginBasico" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js" integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N" crossorigin="anonymous"></script>
<script src="https://www.google.com/recaptcha/api.js" async defer></script>
</head>
<body>
    <div class="container">
    <h1>Ingreso al sistema</h1>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="lblUsuario" runat="server" CssClass="control-label col-sm-2"   Text="Usuario"></asp:Label>
            <asp:TextBox ID="txtUsuario" CssClass="form-control" runat="server" required></asp:TextBox>
            <asp:Label ID="lblContra" runat="server"  CssClass="control-label col-sm-2" Text="Contraseña" ></asp:Label>
            <asp:TextBox ID="txtContra" runat="server" CssClass="form-control" TextMode="Password" required></asp:TextBox>
            <br />
            <div class="g-recaptcha" data-sitekey="6LcPEXMlAAAAAN5JzPpgNZJ7QFn0kPncT3Fwlu54"></div>
            <asp:Button ID="btnInciarSesion" runat="server" CssClass="btn btn-info" Text="Iniciar sesión" OnClick="btnIniciarSesion_Click" />
        
            
            <asp:Button ID="Button1" runat="server" CssClass="btn btn-danger" Text="Olvidaste tu contraseña" OnClick="btnOlvidar_Click" />
            &nbsp;&nbsp;&nbsp;&nbsp;
          
        </div>
          <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click1">¿No tienes una cuenta? Registrate</asp:LinkButton>

    </form>
        </div>
</body>
</html>
