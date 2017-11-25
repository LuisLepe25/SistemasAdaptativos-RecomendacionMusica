<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMusica.Master" AutoEventWireup="true" CodeBehind="mRecomendacion.aspx.cs" Inherits="RecomendacionMusicaZuquistrukis.mRecomendacion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="recomendaciones">
		<p>Por las canciones que escuchaste:</p>
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

            <!--
			<div class="seccion">
				<div class="l01">aaa</div>
				<div class="l01">bbb</div>
				<div class="l01">ccc</div>
				<div class="l04">dddd</div>
				<div class="l05">fff</div>
			</div>
            -->
		</div>
	</div>
</asp:Content>
