<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<ProjetDotNet.Models.LogOnModel>" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
    
<html>
<head id="Head1" runat="server">
    <title>Se connecter</title>
</head>
<body>
    <div>
    <p>
        Entrez un nom d'utilisateur et un mot de passe. 
    </p>
    <% using (Html.BeginForm()) { %>
        <%: Html.ValidationSummary(true, "Échec de la connexion. Corrigez les erreurs et réessayez.") %>
        <div>
            <div class="editor-label">
                    <%: Html.LabelFor(m => m.UserName) %>
                </div>
                <div class="editor-field">
                    <%: Html.TextBoxFor(m => m.UserName) %>
                    <%: Html.ValidationMessageFor(m => m.UserName) %>
                </div>
                
                <div class="editor-label">
                    <%: Html.LabelFor(m => m.Password) %>
                </div>
                <div class="editor-field">
                    <%: Html.PasswordFor(m => m.Password) %>
                    <%: Html.ValidationMessageFor(m => m.Password) %>
                </div>
                <input type="submit" value="Se connecter" />
        </div>
    <% } %>
    </div>
</body>
</html>
