<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CambiarPassword.aspx.cs" Inherits="LoginBasico.CambiarPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js" integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N" crossorigin="anonymous"></script>
    <script src="https://www.google.com/recaptcha/api.js" async defer></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous"/>
    <title>Cambiar contraseña</title>

</head>
<body>
    <form id="form1" runat="server">
        <div>
             <h1>Cambia tu contraseña</h1>
            <asp:Label ID="lblcode" runat="server"  >Escribe tu nueva contraseña</asp:Label> <asp:TextBox ID="txtPass" runat="server" required TextMode="Password"></asp:TextBox>
            <asp:Label ID="Label1" runat="server" >Confirma tu nueva contraseña</asp:Label> <asp:TextBox ID="txtPass2" runat="server" required TextMode="Password"></asp:TextBox>
            <asp:Button ID="btnrec" runat="server" Text="Cambiar mi contraseña" OnClick="btnChangePass_Click" Enabled="true" />
        </div>
    </form>
</body>
</html>
