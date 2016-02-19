<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<ProjetDotNet.Models.Product>" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>ProductDetail</title>
    <link href="../../Content/lstProduits.css" rel="stylesheet"/>
</head>
<body>

    <li>
    <% using (Html.BeginForm("UpdateProduct", "Product", FormMethod.Post))
    { %>  
    
    <img src="<%= Model.pathImage %>" alt="Undefined"/> 
    Nom du jeu : 
    <%: Html.TextBoxFor(m => m.name, new { @class = "form-control", text = Model.name})%>
    <br />
    Description :
    <%: Html.TextBoxFor(m => m.description, new { @class = "form-control", text = Model.description})%>
    <br />
    <%: Html.HiddenFor(m => m.id, new { @class = "form-control", text = Model.id})%>
    <%: Html.HiddenFor(m => m.pathImage, new { @class = "form-control", text = Model.pathImage})%>
    <br />
    <input class="btn btn-success" type="submit" value="Sauvegarder" />
    <% } %>
    </li>
  
</body>
</html>
