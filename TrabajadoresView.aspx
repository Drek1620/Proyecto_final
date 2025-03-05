<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TrabajadoresView.aspx.cs" Inherits="Proyecto_final.TrabajadoresView" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Gestion Trabajadores</h2>

    <asp:GridView ID="gridTrabajadores" runat="server" AutoGenerateColumns="false" OnRowCommand="gridTrabajadores_RowCommand">
        <Columns>
            <asp:TemplateField HeaderText="ID" Visible="false">
                <ItemTemplate >
                    <asp:Label ID="iblId" Text='<%# Eval("Id") %>' runat="server" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Nombre" HeaderText="Nombre" />  
            <asp:BoundField DataField="Puesto" HeaderText="Puesto" />
            <asp:ButtonField ButtonType="Button" Text="Editar" CommandName="Editar"/>
        </Columns>
    </asp:GridView>
    <a href="#" class="cta-btn">Start a free trial</a>
    <asp:Button ID="btnAgregar" OnClick="btnAgregar_Click" Text="Agregar trabajador" runat="server"/>
</asp:Content>
