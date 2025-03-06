<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TrabajadoresView.aspx.cs" Inherits="Proyecto_final.TrabajadoresView" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="content">
        <h2>Gestion Trabajadores</h2>

        <asp:GridView ID="gridTrabajadores" runat="server" AutoGenerateColumns="false" OnRowCommand="gridTrabajadores_RowCommand" CssClass="grid-style" HeaderStyle-CssClass="header-style" RowStyle-CssClass="row-style" AlternatingRowStyle-CssClass="alt-row-style">
        <Columns>
            <asp:TemplateField HeaderText="ID" Visible="false">
                <ItemTemplate>
                    <asp:Label ID="lblId" Text='<%# Eval("Id") %>' runat="server" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
            <asp:BoundField DataField="Puesto" HeaderText="Puesto" />
            <asp:TemplateField HeaderText="Acciones">
                <ItemTemplate>
                    <asp:Button ID="btnEditar" runat="server" Text="Editar" CommandName="Editar" CssClass="btn-editar" CommandArgument='<%# Eval("Id") %>' />
                    <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" CommandName="Eliminar" CssClass="btn-eliminar" OnClientClick="return confirm('¿Estás seguro de eliminar este registro?');" CommandArgument='<%# Eval("Id") %>'/>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        </asp:GridView>
        <asp:Button ID="btnAgregar" CssClass="btn-primary2" OnClick="btnAgregar_Click" Text="Agregar trabajador" runat="server"/>
    </div>
    <br />
    <br />
    <br />
    <br />
</asp:Content>
