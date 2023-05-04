using MailKit.Security;
using MimeKit;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using MailKit.Net.Smtp;



namespace LoginBasico
{
    public class EnviaCorreo
    {

        private string _smtpServer = "smtp.office365.com";
        private int _smtpPort = 587;
        private string _username = "tutorialprogra@outlook.com";
        private string _password = "tutprog123";



        public void SendEmail(string to, string subject, string body)
        {
            var message = new MimeMessage();
            message.From.Add(new MailboxAddress("", _username));
            message.To.Add(new MailboxAddress("", to));
            message.Subject = subject;

            var builder = new BodyBuilder();
            builder.HtmlBody = $@"
        <html>
            <body>
                <p>Hola,</p>
                <p>{body}</p>
                <p>Gracias.</p>
            </body>
        </html>";

            message.Body = builder.ToMessageBody();

            using (var client = new MailKit.Net.Smtp.SmtpClient())
            {
                client.Connect(_smtpServer, _smtpPort, SecureSocketOptions.StartTls);
                client.Authenticate(_username, _password);
                client.Send(message);
                client.Disconnect(true);
            }
        }


    }
}