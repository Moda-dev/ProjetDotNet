using System;
using System.Collections.Generic;
using System.Diagnostics.CodeAnalysis;
using System.Linq;
using System.Security.Principal;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using System.Web.Security;

namespace ProjetDotNet.Controllers
{

    [HandleError]
    public class AccountController : Controller
    {
        //
        // GET: /Account/

        public ActionResult Index()
        {
            return View();


        }
        [HttpGet]
        public ActionResult LogOn()
        {
            return View();
        }

        [HttpPost]
        public ActionResult LogOn(String username, String passWord)
        {
            if (username == "Julien" && passWord == "azerty")
            {
                FormsAuthentication.SetAuthCookie(username, true);
                return RedirectToAction("Index", "Index");
            }
            else
            {
                ModelState.AddModelError("", "Le nom d'utilisateur ou mot de passe fourni est incorrect.");
                return View();
            }
        }

        public ActionResult LogOff()
        {
            FormsAuthentication.SignOut();
            return RedirectToAction("LogOn", "Account");
        }

    }
}
