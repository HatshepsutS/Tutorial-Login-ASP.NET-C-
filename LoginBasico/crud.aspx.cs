using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LoginBasico
{
    public partial class crud : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usserin"] != null)
            {
                Label1.Text = "Bienvenido " +Session["usserin"].ToString();
            }

            else
            {
                
                Response.Redirect("LoginBasico.aspx");
            }

        }
    }
}