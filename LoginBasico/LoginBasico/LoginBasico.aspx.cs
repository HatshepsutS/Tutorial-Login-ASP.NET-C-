using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace LoginBasico
{
    public partial class LoginBasico : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        public static string evaluarResultado(string contra, string inputUsuario)
        {
            if (contra == inputUsuario)
                return ("Bienvenido!");
            else
                return ("Usuario / Contraseña incorrecto");


        }


        protected void btnIniciarSesion_Click(object sender, EventArgs e)
        {
            string contra="";
            using (SqlConnection con = Conexion.conectaSQL())
            {

                SqlCommand cmd = new SqlCommand("Select Contra from Usuarios where Usuario ='" +txtUsuario.Text +"'",con);
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {
                    reader.Read();
                    contra = reader.GetString(0);

                }
                reader.Close();
                con.Close();
            }

            string resultado = evaluarResultado(contra, txtContra.Text);

            ScriptManager.RegisterStartupScript(this, GetType(), "show alert", "alert('"+resultado +"')", true );






        }




    }
}