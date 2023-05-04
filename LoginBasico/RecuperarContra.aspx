<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RecuperarContra.aspx.cs" Inherits="LoginBasico.RecuperarContra" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js" integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N" crossorigin="anonymous"></script>
    <script src="https://www.google.com/recaptcha/api.js" async defer></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous"/>
    <title>Recuperación de contraseña</title>
    <script>

        function startTimer(btnResendCode, lblResendTimer) {
            alert("Correo enviado")
            var timeLeft = 30;

            var intervalId = setInterval(function () {
                if (timeLeft <= 0) {
                    clearInterval(intervalId);
                    btnResendCode.disabled = false;
                    lblResendTimer.innerHTML = '';
                } else {
                    btnResendCode.disabled = true;
                    lblResendTimer.innerHTML = 'Puedes reenviar el código en ' + timeLeft + ' segundos.';
                    timeLeft--;
                }
            }, 1000);
        }
    </script>
   
</head>
<body>
   <div class="container">
    <h1>Recuperación de contraseña</h1>
       
    <form id="form1" runat="server">
        <div>
        
<br />
<asp:Label ID="Label1" runat="server" meta:resourcekey="Label1Resource1">Introduce el correo electrónico con el que te registraste</asp:Label> 
 <asp:TextBox ID="txtmail" runat="server" meta:resourcekey="txtmailResource1"></asp:TextBox>
 <asp:Button ID="btnResendCode" runat="server" Text="Enviar código" OnClick="btnResendCode_Click" meta:resourcekey="btnResendCodeResource1" />
<asp:Label ID="lblResendTimer" runat="server" meta:resourcekey="lblResendTimerResource1"></asp:Label>
 </div>
   


        <br />
        <asp:Label ID="lblcode" runat="server" Visible="False" meta:resourcekey="lblcodeResource1">Escribe tu codigo de recuperacion</asp:Label> <asp:TextBox ID="txtCode" runat="server" Visible="False" meta:resourcekey="txtCodeResource1"></asp:TextBox><asp:Button ID="btnrec" runat="server" Text="Cambiar mi contraseña" OnClick="btnChangePass_Click" Visible="False" meta:resourcekey="btnrecResource1"/>


    </form>
         </div>
</body>
    
   
</html>
