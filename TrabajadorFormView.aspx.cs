using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Proyecto_final;
using MongoDB.Bson;
using Proyecto_final;
using System.Text.RegularExpressions;

namespace Proyecto_final
{
	public partial class TrabajadorFormView : System.Web.UI.Page
	{
        private ConexionMongoDB db = new ConexionMongoDB();
		private string trabajadorid = "";
        protected void Page_Load(object sender, EventArgs e)
		{
			//Es el encargado de enlazar el archivo de js a la pagina
            string script = "<script src='Scripts/validaciones.js'></script>";
            ClientScript.RegisterStartupScript(this.GetType(), "scriptKey", script, false);
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
			//Limpia los mensajes de error
            lblNombre.InnerText = "";
            lblPuesto.InnerText = "";
            //Verificacion del lado del servidor sobre si el nombre es valido
            if (txtNombre.Text == null || Regex.IsMatch(txtNombre.Text, @"/^[a-zA-Z\s]+$/"))
            {
                lblNombre.InnerText = "Ingrese un nombre valido"; //Muestra el mensaje de error
                return; // Cancela la operacion 
            }
            //Verificacion del lado del servidor sobre si el Puesto es valido
            if (txtPuesto.Text == null || Regex.IsMatch(txtPuesto.Text, @"/^[a-zA-Z\s]+$/"))
            {
                lblPuesto.InnerText = "Ingrese un nombre valido";
                return;
            }

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
			//Limpia los mensajes de error
            lblFecha.InnerText = "";
            lblMonto.InnerText = "";
			decimal monto;
			//comparo si el numero escrito en el textbox es un numero al intentar pasarlo a decimal
			if (!decimal.TryParse(txtMontoPago.Text, out monto) || monto <= 0)
			{
				lblMonto.InnerText = "Ingrese un monto válido.";
				return;
			}
			//Compara si el textbox de la fecha esta vacio al o tambien para verificar que es una fecha valida
			if (!DateTime.TryParse(txtFechaPago.Text, out _))
			{
				lblFecha.InnerText = "Agregue una fecha";
				return;
			}

			if (ViewState["Pagos"] == null)
				ViewState["Pagos"] = new List<PagoNomina>();

			var pagos = (List<PagoNomina>)ViewState["Pagos"];
			//A la lista de pagos le agregamos un nuevo elemento con los datos del formulario de pagos
			pagos.Add(new PagoNomina
			{
				Fecha = Convert.ToDateTime(txtFechaPago.Text),
				Monto = Convert.ToDecimal(txtMontoPago.Text),
			});
			//Carga al ViewState la nueva lista de pagos
			ViewState["Pagos"] = pagos;
			txtFechaPago.Text = "";
			txtMontoPago.Text = "";
			CargarPagosGrid(); //llama al metodo para actualizar los pagos
		}

		protected void btnVolver_Click(object sender, EventArgs e)
		{
			Response.Redirect("TrabajadoresView.aspx"); //Te regresa a la pagina trabajadores
		}

    }
}