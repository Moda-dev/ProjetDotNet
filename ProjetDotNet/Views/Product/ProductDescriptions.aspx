<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<List<ProjetDotNet.Models.Product>>" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Accueil</title>

    <link href="../../Content/bootstrap.min.css" rel="stylesheet"/>
    <link href="../../Content/Signin.css" rel="stylesheet"/>
    <link href="../../Content/carousel.css" rel="stylesheet">
</head>
<body>

 <nav class="navbar navbar-inverse navbar-fixed-top">
          <div class="container">
            <div class="navbar-header">
              <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>
              <a class="navbar-brand" href="../Account/LogOn">Doge Corp</a>

               <% if(Context.User.Identity.IsAuthenticated)
                {%>
                    <a class="navbar-brand" href="../Product/ProductDescriptions">Gestion des produits</a>

                <%}%>
            </div>
            <div id="navbar" class="navbar-collapse collapse">
             <% using (Html.BeginForm("LogOff", "Account", FormMethod.Get, new { @class = "navbar-form navbar-right" }))
         
                { %>
                <input class="btn btn-danger" type="submit" value="Déconnexion" />

                <%} %>

            </div><!--/.navbar-collapse -->
          </div>
    </nav>

    <div>
    <ul>
    <% foreach(var product in Model)
    { 
    Html.RenderPartial("ProductDetail",product);
       
   } %>
   </ul>


    </div>
   
</body>
</html>
