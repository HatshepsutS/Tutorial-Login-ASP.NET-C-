using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;



namespace LoginBasico
{
    public class Conexion
    {
        public static SqlConnection conectaSQL()
        {

            SqlConnection cn = new SqlConnection(@"Data Source=nombredetuservidorlocal; initial catalog=tutorialLogin; integrated security=true");
            cn.Open();
            return cn; 
        }
    }
}