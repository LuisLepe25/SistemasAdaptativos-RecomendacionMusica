<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMusica.Master" AutoEventWireup="true" CodeBehind="mTuMusica.aspx.cs" Inherits="RecomendacionMusicaZuquistrukis.mTuMusica" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="recomendaciones">
		<p>Tus canciones:</p>
		<div class="listas">
            <asp:Repeater ID="rep1" runat="server" OnItemDataBound="rep1_ItemDataBound">
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
				        </div>
                </ItemTemplate>
                <FooterTemplate>
                    </div>
                </FooterTemplate>
            </asp:Repeater>
		</div>
	</div>
</asp:Content>
