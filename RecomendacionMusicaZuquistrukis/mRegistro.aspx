<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMusica.Master" AutoEventWireup="true" CodeBehind="mRegistro.aspx.cs" Inherits="RecomendacionMusicaZuquistrukis.mRegistro" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="Js/actualizar.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="contenedor-formulario">
		<div id="logsuperior">
			<p>Registro para cuenta</p>
		</div>
    <div class="wrap">
        <p class="text-danger">
            <asp:Literal runat="server" ID="ErrorMessage" />
        </p>
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
                <asp:TextBox runat="server" ID="pass2" TextMode="Password" />
                <asp:Label runat="server" AssociatedControlID="pass2" CssClass="label">Repetir Contraseña:</asp:Label>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="pass2" CssClass="text-danger" ErrorMessage="The password field is required." />
	        </div>	        
	        <div class="input-group checkbox">
	            <input type="checkbox" name="terminos" id="terminos" value="true">
	            <label for="terminos">Acepto los Terminos y Condiciones</label>
	        </div>
	        <asp:Button runat="server" ID="btnRegistrar" Text="Register" CssClass="btn btn-default" OnClick="btnRegistrar_Click" />
	      </div>
	  </div>
	</div>
	
	<script src="Js/formulario.js"></script>
</asp:Content>
