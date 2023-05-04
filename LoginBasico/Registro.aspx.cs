using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LoginBasico
{
    public partial class Registro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnIniciarSesion_Click(object sender, EventArgs e)
        {

            using (SqlConnection con = Conexion.conectaSQL())
            {

                SqlCommand cmd = new SqlCommand("SPInsertUsser", con) {CommandType = CommandType.StoredProcedure
                };

              
                cmd.Parameters.Add("@Usuario", SqlDbType.VarChar, 50).Value = txtUsuario.Text;
                cmd.Parameters.Add("@Contra", SqlDbType.VarChar, 50).Value = txtContra.Text;
                cmd.Parameters.Add("@EMAIL", SqlDbType.VarChar, 50).Value = txtemail.Text;
                cmd.Parameters.Add("@TELEFONO", SqlDbType.VarChar, 50).Value = txttelefono.Text;
                try
                {
                    cmd.ExecuteReader();
 
                    ScriptManager.RegisterClientScriptBlock(this, typeof(string),"MsgAlert", "alert('Te has registrado correctamente');window.location ='LoginBasico.aspx';", true);
                }
                catch 
                {
                  
                    ScriptManager.RegisterClientScriptBlock(this, typeof(string), "MsgAlert", "alert('Hubo un error, intentelo mas tarde');window.location ='LoginBasico.aspx';", true);

                }




            }
        }


    }
}