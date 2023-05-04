using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LoginBasico
{
    public partial class RecuperarContra : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }



       

        protected string generarCodigo()
        {
            var random = new Random();

            return random.Next(100000, 999999).ToString();

        }



        protected void btnResendCode_Click(object sender, EventArgs e)
        {


            using (SqlConnection con = Conexion.conectaSQL())
            {

                SqlCommand cmd = new SqlCommand("select ID from Usuarios where EMAIL='" + txtmail.Text + "'", con);
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    string destinatario = txtmail.Text; 
                    ScriptManager.RegisterStartupScript(this, GetType(), "startTimer", "startTimer(document.getElementById('" + btnResendCode.ClientID + "'), document.getElementById('" + lblResendTimer.ClientID + "'));", true);
                    EnviaCorreo emailService = new EnviaCorreo();
                    var recoveryCode = generarCodigo();
                    Session["RecoveryCode"] = recoveryCode;
                    Session["RecoveryUsser"] = reader.GetInt32(0).ToString();
                    emailService.SendEmail(destinatario, "Recuperación de contraseña", $"Tu código de recuperación es {recoveryCode}");
                    lblcode.Visible = true;
                    txtCode.Visible = true;
                    btnrec.Visible = true;

                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, typeof(string),
                        "MsgAlert", "alert('El correo que escribio no esta asociado a ninguna cuenta');", true);
                }


            }

           

        }
        protected void btnChangePass_Click(object sender, EventArgs e)
        {
            if (Session["RecoveryCode"].ToString() == txtCode.Text)
            {
             
                Response.Redirect("CambiarPassword.aspx");

            }

            else
            {

                ScriptManager.RegisterClientScriptBlock(this, typeof(string),
                        "MsgAlert", "alert('El código no es válido, intente nuevamente');", true);

            }



        }

    }
    }