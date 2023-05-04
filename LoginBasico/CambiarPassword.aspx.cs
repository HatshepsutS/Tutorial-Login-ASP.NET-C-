using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LoginBasico
{
    public partial class CambiarPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["RecoveryUsser"] == null)
            { 
                Response.Redirect("RecuperarContra.aspx");

            }
        }
        protected void btnChangePass_Click(object sender, EventArgs e)
        {

            if (txtPass.Text==txtPass2.Text)
            {
                using (SqlConnection con = Conexion.conectaSQL())
            {
                try
                {
                SqlCommand cmd = new SqlCommand("update Usuarios set Contra =@nuevacontra where ID=@usuario  ", con);
                cmd.Parameters.AddWithValue("@nuevacontra", txtPass.Text);
                cmd.Parameters.AddWithValue("@usuario", Session["RecoveryUsser"]);
                cmd.ExecuteNonQuery();
                    ScriptManager.RegisterClientScriptBlock(this, typeof(string),
                       "MsgAlert", "alert('Contraseña actualizada correctamente');window.location ='LoginBasico.aspx';", true);
                }


                catch
                {
                    ScriptManager.RegisterClientScriptBlock(this, typeof(string),
                       "MsgAlert", "alert('Ocurrió un error')", true);
                }
            }
            }

            else
            {
                ScriptManager.RegisterClientScriptBlock(this, typeof(string),
                       "MsgAlert", "alert('Las contraseñas no coinciden')", true);
            }
        }
    }
}