<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMusica.Master" AutoEventWireup="true" CodeBehind="mInicio.aspx.cs" Inherits="RecomendacionMusicaZuquistrukis.mInicio" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Aqui van los headers personalizados -->
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="contenedor-formulario">
		<div id="logsuperior">
			<p>Login</p>
		</div>
	    <div class="wrap">
	        <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                <p class="text-danger">
                    <asp:Literal runat="server" ID="FailureText" />
                </p>
            </asp:PlaceHolder>
            <div class="formulario">
	            <div class="input-group">
                    <asp:TextBox runat="server" ClientIDMode="Static" ID="email" TextMode="Email" />
                    <asp:Label runat="server" ClientIDMode="Static" ID="lblEmail" AssociatedControlID="email" CssClass="label">Email:</asp:Label>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="email" CssClass="text-danger" ErrorMessage="The email field is required." />
	            </div>
	            <div class="input-group">
	                <asp:TextBox runat="server" ID="pass" TextMode="Password" />
                    <asp:Label runat="server" AssociatedControlID="pass" CssClass="label">Contraseña:</asp:Label>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="pass" CssClass="text-danger" ErrorMessage="The password field is required." />
	            </div>
                <div class="input-group">
                    <asp:CheckBox runat="server" ID="RememberMe" />
                    <asp:Label runat="server" AssociatedControlID="RememberMe">Remember me?</asp:Label>
                </div>
                <asp:Button runat="server" ID="btnLogin" Text="Ingresar" OnClick="btnLogin_Click" />
            </div>
	  </div>
	</div>
    <script src="Js/formulario.js"></script>
</asp:Content>
