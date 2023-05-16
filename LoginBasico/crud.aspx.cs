using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
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

                BindGrid();
            }

            else
            {
                
                Response.Redirect("LoginBasico.aspx");
            }

        }

        protected void BindGrid()
        {
           using (SqlConnection con = Conexion.conectaSQL())
            {
              
                string query = "SELECT * FROM Libros";
                SqlDataAdapter adapter = new SqlDataAdapter(query, con);
                DataTable table = new DataTable();
                adapter.Fill(table);
                gridViewLibros.DataSource = table;
                gridViewLibros.DataBind();
            }
        }

        protected void gridViewLibros_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gridViewLibros.EditIndex = e.NewEditIndex;
            BindGrid();
           

        }


        protected void gridViewLibros_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gridViewLibros.EditIndex = -1;

            BindGrid();
        }
        protected void gridViewLibros_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = gridViewLibros.Rows[e.RowIndex];
            int id = Convert.ToInt32(gridViewLibros.DataKeys[e.RowIndex].Value);
            string query = "UPDATE Libros SET Titulo=@Titulo, Autor=@Autor, Editorial=@Editorial, Edicion=@Edicion WHERE ID=@ID";

            using (SqlConnection con = Conexion.conectaSQL())
            {
                using (SqlCommand command = new SqlCommand(query, con))
                {
                    command.Parameters.AddWithValue("@ID", id);
                    command.Parameters.AddWithValue("@Titulo", e.NewValues["Titulo"].ToString());
                    command.Parameters.AddWithValue("@Autor", e.NewValues["Autor"].ToString());
                    command.Parameters.AddWithValue("@Editorial", e.NewValues["Editorial"].ToString());
                    command.Parameters.AddWithValue("@Edicion", e.NewValues["Edicion"].ToString());

                    int rowsAffected = command.ExecuteNonQuery();

                    if (rowsAffected > 0)
                    {
                        gridViewLibros.EditIndex = -1;
                        BindGrid();
                    }
                }
            }
        }


        protected void gridViewLibros_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(gridViewLibros.DataKeys[e.RowIndex].Value);

        
            string query = "DELETE FROM Libros WHERE ID=@ID";

            using (SqlConnection con = Conexion.conectaSQL())
            {
                using (SqlCommand command = new SqlCommand(query, con))
                {
                    command.Parameters.AddWithValue("@ID", id);

            
                    int rowsAffected = command.ExecuteNonQuery();
                 

                    if (rowsAffected > 0)
                    {
                        BindGrid();
                    }
                }
            }
        }


    }
    }




