<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<ProjetDotNet.Models.LogOnModel>" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
    
<html>
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
              <a class="navbar-brand" href="#">Doge Corp</a>

                <% if(Context.User.Identity.IsAuthenticated)
                {%>
                    <a class="navbar-brand" href="../Product/GetAll">Gestion des produits</a>

                <%}%>
            </div>
            <div id="navbar" class="navbar-collapse collapse">
              <% if(!Context.User.Identity.IsAuthenticated)
                {
                  
                    using (Html.BeginForm("LogOn", "Account", FormMethod.Post, new { @class = "navbar-form navbar-right" }))
                    { %>
                        <div class="form-group">
                            <%: Html.TextBoxFor(m => m.UserName, new { @class = "form-control", required = "required", placeholder ="Login" })%>
                            <%: Html.ValidationMessageFor(m => m.UserName)%>
                        </div>
                        <div class="form-group">
                            <%: Html.PasswordFor(m => m.Password, new { @class = "form-control", required = "required", placeholder ="Mot de passe" })%>
                            <%: Html.ValidationMessageFor(m => m.Password) %>
                        </div>
                        <input class="btn btn-success" type="submit" value="Se connecter" />
                        <%: Html.ValidationSummary(true, "", new { id = "WrongId", @class = "bg-danger" })%>
                    <%}
                }
                else
                {
                    using (Html.BeginForm("LogOff", "Account", FormMethod.Get, new { @class = "navbar-form navbar-right" }))
                    {%>
                        <input class="btn btn-danger" type="submit" value="Déconnexion" />
                    <%}
                }%>
            </div><!--/.navbar-collapse -->
          </div>
    </nav>
    

    <!-- Carousel
    ================================================== -->
    <div id="myCarousel" class="carousel slide" data-ride="carousel">
      <!-- Indicators -->
      <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
      </ol>
      <div class="carousel-inner" role="listbox">
        <div class="item active">
          <img class="first-slide" src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" alt="First slide">
          <div class="container">
            <div class="carousel-caption">
              <h1>Example headline.</h1>
              <p>Note: If you're viewing this page via a <code>file://</code> URL, the "next" and "previous" Glyphicon buttons on the left and right might not load/display properly due to web browser security rules.</p>
              <p><a class="btn btn-lg btn-primary" href="#" role="button">Sign up today</a></p>
            </div>
          </div>
        </div>
        <div class="item">
          <img class="second-slide" src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" alt="Second slide">
          <div class="container">
            <div class="carousel-caption">
              <h1>Another example headline.</h1>
              <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
              <p><a class="btn btn-lg btn-primary" href="#" role="button">Learn more</a></p>
            </div>
          </div>
        </div>
        <div class="item">
          <img class="third-slide" src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" alt="Third slide">
          <div class="container">
            <div class="carousel-caption">
              <h1>One more for good measure.</h1>
              <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
              <p><a class="btn btn-lg btn-primary" href="#" role="button">Browse gallery</a></p>
            </div>
          </div>
        </div>
      </div>
      <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div><!-- /.carousel -->

    

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="../../Scripts/bootstrap.min.js"></script>

</body>
</html>



