using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using GameServices;
using ProjetDotNet.Models;
using GameServices.Entities;

namespace ProjetDotNet.Controllers
{
    public class ProductController : Controller
    {
        //
        // GET: /Product/

        public ActionResult Get(int id)
        {
            var repository = new ProductRepository();
            var game = repository.GetById(id);

            return View("ProductDescription", CreateP(game));
        }

        private Product CreateP(GameEntity g)
        {
            var product = new Product();
            product.name = g.Name;
            product.description = g.Description;
            product.id = g.Id;

            return product;
        }

        [Authorize]
        public ActionResult GetAll()
        {
            var repository = new ProductRepository();
            var games = repository.GetGames();

            List<Product> products = new List<Product>();
            foreach (var game in games)
            {
                var product = new Product();
                product.name = game.Name;
                product.description = game.Description;
                product.id = game.Id;

                products.Add(product);
            }
            return View("ProductDescriptions", products);
        }

        [HttpGet]
        public ActionResult CreateProduct()
        {
            return View();
        }

        [HttpPost]
        public ActionResult CreateProduct(String Id, String Name, String Description)
        {
            ProductRepository rep = new ProductRepository();
            rep.CreateEntity(
                Convert.ToInt32(Id),
                Name,
                Description);

            return RedirectToAction("GetAll");
        }

    }
}
