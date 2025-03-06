<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TrabajadorFormView.aspx.cs" Inherits="Proyecto_final.TrabajadorFormView" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <div><asp:Button ID="btnVolver" runat="server" OnClick="btnVolver_Click" CssClass="button-back" /><i class="bi bi-arrow-left"></i></div>
    
    <h2>Gestión de Trabajador</h2>
    
    <div class="forms-container">
    <div class="form-container">

        <h4>Datos del trabajador</h4>
        <label>Nombre:</label>
        <asp:TextBox ID="txtNombre" runat="server" /><br/>

        <label>Puesto:</label>
        <asp:TextBox ID="txtPuesto" runat="server" /><br/>

        <asp:Button ID="btnGuardar" runat="server" Text="Guardar Trabajador" OnClick="btnGuardar_Click" CssClass="button" />


        
    </div>

    <div class="form-container">
        <h4>Agregar Pago</h4>

        <label>Fecha:</label>
        <asp:TextBox ID="txtFechaPago" runat="server" TextMode="Date" /><br/>

        <asp:Label Text="Monto:" runat="server" />
        <h5 id="lblMensaje" runat="server" class=" text-danger"></h5>
        <asp:TextBox ID="txtMontoPago" runat="server" />

        <br />


        <asp:Button ID="btnAgregarPago" runat="server" Text="Agregar Pago" OnClick="btnAgregarPago_Click" CssClass="button" />

        
    </div>
    </div>   
    <hr/>

    
    <h3>Historial de Pagos</h3>
    
    <asp:GridView ID="gridPagos" runat="server" AutoGenerateColumns="False" CssClass="grid-style" HeaderStyle-CssClass="header-style" RowStyle-CssClass="row-style" AlternatingRowStyle-CssClass="alt-row-style">
        <Columns>
            <asp:BoundField DataField="Fecha" HeaderText="Fecha" DataFormatString="{0:yyyy-MM-dd}" />
            <asp:BoundField DataField="Monto" HeaderText="Monto" DataFormatString="{0:C}" />
        </Columns>
    </asp:GridView>

   

</asp:Content>
