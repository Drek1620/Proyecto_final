using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proyecto_final
{
	public partial class TrabajadoresView : System.Web.UI.Page
	{
		private ConexionMongoDB db = new ConexionMongoDB();
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack) CargarTrabajadores();
		}

        private void CargarTrabajadores()
        {
			var trabajadores = db.ObtenerTrabajadores();

			gridTrabajadores.DataSource = trabajadores;
			gridTrabajadores.DataBind();
        }

		protected void btnAgregar_Click(object sender, EventArgs e)
		{
			Response.Redirect("TrabajadorFormView.aspx");
		}

		protected void gridTrabajadores_RowCommand(object sender, GridViewCommandEventArgs e)
		{
			if (e.CommandName == "Editar")
			{
                //Obtener indice de la fila seleccionada
                //Response.Write("ID del trabajador seleccionado: " + e.CommandArgument.ToString());
                //int rowIndex = Convert.ToInt32(e.CommandArgument);
				//GridViewRow row = gridTrabajadores.Rows[rowIndex];
				//Buscar el label con el Id dentro de la fila seleccionada
				//Label lblId = (Label)row.FindControl("lblId");
				string id = e.CommandArgument.ToString().Trim();
				//Validar que el ID no este vacio y tenga 24 caracteres
				if (!string.IsNullOrEmpty(id) && id.Length == 24 && MongoDB.Bson.ObjectId.TryParse(id, out _))
				{
					Response.Redirect($"TrabajadorformView.aspx?id={id}");
				}
				else
					System.Diagnostics.Debug.WriteLine($"Error: ID no valido al seleccionar trabajador {id}");
			}
			if (e.CommandName == "Eliminar")
			{
                string id = e.CommandArgument.ToString().Trim();
                if (!string.IsNullOrEmpty(id) && id.Length == 24 && MongoDB.Bson.ObjectId.TryParse(id, out _))
                {
					db.EliminarTrabajador(id);
					CargarTrabajadores();
                }
                else
                    System.Diagnostics.Debug.WriteLine($"Error: ID no valido al seleccionar trabajador {id}");
            }
		}

		protected void gridTrabajadores_SelectedIndexChanged(object sender, EventArgs e)
		{
			string id = gridTrabajadores.SelectedRow.Cells[0].Text; // prmera columna ID

			Response.Redirect($"TrabajadorformView.aspx?id={id}");

			if (!string.IsNullOrEmpty(id) && id.Length == 24)	
			{
                Response.Redirect($"TrabajadorformView.aspx?id={id}");
            }
		}
    }
}