<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TrabajadorFormView.aspx.cs" Inherits="Proyecto_final.TrabajadorFormView" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Gestión de Trabajador</h2>
    
    <label>Nombre:</label>
    <asp:TextBox ID="txtNombre" runat="server" /><br/>
    
    <label>Puesto:</label>
    <asp:TextBox ID="txtPuesto" runat="server" /><br/>
    
    <asp:Button ID="btnGuardar" runat="server" Text="Guardar Trabajador" OnClick="btnGuardar_Click" />

    <hr/>


    <h3>Historial de Pagos</h3>
    
    <asp:GridView ID="gridPagos" runat="server" AutoGenerateColumns="False">
        <Columns>
            <asp:BoundField DataField="Fecha" HeaderText="Fecha" DataFormatString="{0:yyyy-MM-dd}" />
            <asp:BoundField DataField="Monto" HeaderText="Monto" DataFormatString="{0:C}" />
        </Columns>
    </asp:GridView>

    <h4>Agregar Pago</h4>

    <asp:Label runat="server" Text="Fecha:" />
    <asp:TextBox ID="txtFechaPago" runat="server" TextMode="Date" /><br/>

    <asp:Label runat="server" Text="Monto:" />
    <asp:TextBox ID="txtMontoPago" runat="server" /><br/>

    <asp:Button ID="btnAgregarPago" runat="server" Text="Agregar Pago" OnClick="btnAgregarPago_Click" />

    <asp:Button ID="btnVolver" runat="server" Text="Volver a Lista" OnClick="btnVolver_Click" />

</asp:Content>
