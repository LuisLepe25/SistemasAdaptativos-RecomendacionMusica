<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMusica.Master" AutoEventWireup="true" CodeBehind="mMusica.aspx.cs" Inherits="RecomendacionMusicaZuquistrukis.mMusica" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="recomendaciones">
		<p>Todas las canciones:</p>
		<div class="listas">
            <asp:Repeater ID="rep1" runat="server" OnItemDataBound="rep1_ItemDataBound" OnItemCommand="rep1_ItemCommand">
                <HeaderTemplate>
                    <div class="seccion">
                </HeaderTemplate>   
                <ItemTemplate>
				        <div class="l01">
                            <p>Nombre: <%# Eval("Nombre") %></p>
                            <p>Artista: <%# Eval("Artista") %></p>
                            <asp:Repeater runat="server" ID="rep2">
                                <HeaderTemplate>
                                    <p>Genero(s):
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <%# Eval("Nombre") %>,
                                </ItemTemplate>
                                <FooterTemplate>
                                    </p>
                                </FooterTemplate>
                            </asp:Repeater>
                            <asp:Button runat="server" CommandName="escuchar" CommandArgument='<%# Eval("Id") %>' ID="btnCancion" Text="Escuchar" />
				        </div>
                </ItemTemplate>
                <FooterTemplate>
                    </div>
                </FooterTemplate>
            </asp:Repeater>
		</div>
	</div>
</asp:Content>
