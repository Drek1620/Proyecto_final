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

			}
		}
	}
}