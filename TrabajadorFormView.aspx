<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TrabajadorFormView.aspx.cs" Inherits="Proyecto_final.TrabajadorFormView" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <asp:LinkButton ID="btnVolver" runat="server" CssClass="button-back" OnClick="btnVolver_Click" OnClientClick="return confirm('¿Estás seguro de que quieres volver?');">
    <i class="bi bi-arrow-left"></i> Volver
    </asp:LinkButton>

    
    <h2 class="mt-3">Gestión de Trabajador</h2>
    
    <div class="forms-container">
    <div class="form-container">

        <h4>Datos del trabajador</h4>
        <label>Nombre:</label>
        <p id="lblNombre" runat="server" class="mb-0 text-danger" ClientIDMode="Static"></p>
        <asp:TextBox ID="txtNombre" runat="server" ClientIDMode="Static"/><br/>

        <label>Puesto:</label>
        <p id="lblPuesto" runat="server" class="mb-0  text-danger" ClientIDMode="Static"></p>
        <asp:TextBox ID="txtPuesto" runat="server" ClientIDMode="Static"/><br/>

        <asp:Button ID="btnGuardar" runat="server" Text="Guardar Trabajador" OnClick="btnGuardar_Click" CssClass="button" OnClientClick="return validarForm();"/>


        
    </div>

    <div class="form-container">
        <h4>Agregar Pago</h4>

        <label>Fecha:</label>
        <p id="lblFecha" runat="server" class="mb-0  text-danger" ClientIDMode="Static"></p>
        <asp:TextBox ID="txtFechaPago" runat="server" TextMode="Date" ClientIDMode="Static"/><br/>

        <asp:Label Text="Monto:" runat="server" />
        <p id="lblMonto" runat="server" class=" mb-0 text-danger" ClientIDMode="Static"></p>
        <asp:TextBox ID="txtMontoPago" runat="server" ClientIDMode="Static"/>

        <br />


        <asp:Button ID="btnAgregarPago" runat="server" Text="Agregar Pago" CssClass="button" OnClientClick="return validarPago();" OnClick="btnAgregarPago_Click"  />

        
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

    <br />
</asp:Content>


