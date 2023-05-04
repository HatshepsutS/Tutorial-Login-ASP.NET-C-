using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Net;
using System.IO;
using Newtonsoft.Json.Linq;
using System.Web.SessionState;



namespace LoginBasico
{
    public partial class LoginBasico : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public bool IsReCaptchValid()
        {
            var result = false;
            var captchaResponse = Request.Form["g-recaptcha-response"];
            var secretKey = System.Configuration.ConfigurationManager.AppSettings["SecretKey"];
            var apiUrl = "https://www.google.com/recaptcha/api/siteverify?secret={0}&response={1}";
            var requestUri = string.Format(apiUrl, secretKey, captchaResponse);
            var request = (HttpWebRequest)WebRequest.Create(requestUri);

            using (WebResponse response = request.GetResponse())
            {
                using (StreamReader stream = new StreamReader(response.GetResponseStream()))
                {
                    JObject jResponse = JObject.Parse(stream.ReadToEnd());
                    var isSuccess = jResponse.Value<bool>("success");
                    result = (isSuccess);
                }
            }
            return result;
        }

      

        protected void btnIniciarSesion_Click(object sender, EventArgs e)
        {
           
            using (SqlConnection con = Conexion.conectaSQL())
            {

                SqlCommand cmd = new SqlCommand("Select *  from Usuarios where Usuario ='" +txtUsuario.Text + "' and  Contra='" + txtContra.Text + "'", con);
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                   
                    if (IsReCaptchValid())
                    {

                        ScriptManager.RegisterStartupScript(this, GetType(), "show alert", "alert('Bienvenido ')", true);
                        Session["usserin"] = txtUsuario.Text;
                        Response.Redirect("crud.aspx");
                    }
                    else
                    {
                        ScriptManager.RegisterClientScriptBlock(this, typeof(string),
                            "MsgAlert", "alert('Validación Captcha incorrecta');window.location ='LoginBasico.aspx';", true);
                    }

                }
                else
                {
                 
                    ScriptManager.RegisterClientScriptBlock(this, typeof(string),
                        "MsgAlert", "alert('Usuario incorrecto');window.location ='LoginBasico.aspx';", true);
                }

            }
        }


        protected void LinkButton1_Click1(object sender, EventArgs e)
        {
            Response.Redirect("Registro.aspx");
        }


        protected void  btnOlvidar_Click(object sender, EventArgs e)
        {
            Response.Redirect("RecuperarContra.aspx");
        }
    }
}