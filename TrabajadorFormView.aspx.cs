using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Proyecto_final;
using MongoDB.Bson;
using Proyecto_final;

namespace Proyecto_final
{
	public partial class TrabajadorFormView : System.Web.UI.Page
	{
        private ConexionMongoDB db = new ConexionMongoDB();
		private string trabajadorid = "";
        protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack && Request.QueryString["id"] != null)
			{
				trabajadorid = Request.QueryString["id"];
				if (ObjectId.TryParse(trabajadorid, out _))
				{
					ViewState["TrabajadorId"] = trabajadorid;
					CargarTrabajador(trabajadorid);
				}
			}
		}

        private void CargarTrabajador(string id)
        {
            Trabajador trabajador = db.ObtenerTrabajador(id);
			if (trabajador != null)
			{
				txtNombre.Text = trabajador.Nombre;
				txtPuesto.Text = trabajador.Puesto;
				ViewState["Pagos"] = trabajador.Pagos;
				CargarPagosGrid();
			}
        }

		private void CargarPagosGrid()
		{
			if (ViewState["Pagos"] != null)
			{
				var pagos = (List<PagoNomina>)ViewState["Pagos"];
				gridPagos.DataSource = pagos;
				gridPagos.DataBind();
			}
		}

		protected void btnGuardar_Click(object sender, EventArgs e)
		{
			Trabajador trabajador = new Trabajador
			{
				Nombre = txtNombre.Text,
				Puesto = txtPuesto.Text,
				Pagos = ViewState["Pagos"] != null ? (List<PagoNomina>)ViewState["Pagos"] : new List<PagoNomina>()
			};
			if (ViewState["TrabajadorId"] == null)
			{
				//Insertar en MongoDb y obtener el ID generado
				db.AgregarTrabajador(trabajador);
				//Guardar el ID en ViewState para permitir agregar pagos
				ViewState["TrabajadorId"] = trabajador.Id;

			}
			else
			{
				//Actualizar trabajador
				trabajador.Id = ViewState["TrabajadorId"].ToString();
				db.ActualizarTrabajador(trabajador.Id, trabajador);
			}
			Response.Redirect("TrabajadoresView.aspx");
		}

		protected void btnAgregarPago_Click(object sender, EventArgs e)
		{
            decimal monto;
            if (!decimal.TryParse(txtMontoPago.Text, out monto))
            {
                lblMensaje.InnerText = "Ingrese un monto válido.";
                return;
            }

            if (ViewState["Pagos"] == null)
				ViewState["Pagos"] = new List<PagoNomina>();

			var pagos = (List<PagoNomina>)ViewState["Pagos"];
			pagos.Add(new PagoNomina
			{
				Fecha = Convert.ToDateTime(txtFechaPago.Text),
				Monto = Convert.ToDecimal(txtMontoPago.Text),
			});

			ViewState["Pagos"] = pagos;
			CargarPagosGrid();
		}

		protected void btnVolver_Click(object sender, EventArgs e)
		{
			Response.Redirect("TrabajadoresView.aspx");
		}

    }
}