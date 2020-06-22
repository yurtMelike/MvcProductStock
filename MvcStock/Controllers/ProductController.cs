using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MvcStock.Models.Entity;
using PagedList;
using PagedList.Mvc;

namespace MvcStock.Controllers
{
    public class ProductController : Controller
    {
        ProductDbStockEntities DbStockEntities = new ProductDbStockEntities();
        // GET: Product
        public ActionResult Index()
        {
            var product = DbStockEntities.TblProduct.ToList();
            return View(product);
        }
        [HttpGet]
        public ActionResult AddNewProduct()
        {//Yeni ürün eklerken kategori seçimi için liste oluşturuldu ve category tablosundan veriler alındı.
            List<SelectListItem> values = (from i in DbStockEntities.TblCategory.ToList()
                                           select new SelectListItem
                                           {
                                               Text = i.CategoryName,
                                               Value = i.CategoryId.ToString()
                                           }).ToList();
            ViewBag.value = values;

            return View();
        }
        [HttpPost]
        public ActionResult AddNewProduct(TblProduct newProduct)
        {
            var category = DbStockEntities.TblCategory.Where(c => c.CategoryId == newProduct.TblCategory.CategoryId).FirstOrDefault();
            newProduct.TblCategory = category;
            DbStockEntities.TblProduct.Add(newProduct);
            DbStockEntities.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult Delete(int id)
        {
            var product = DbStockEntities.TblProduct.Find(id);
            DbStockEntities.TblProduct.Remove(product);
            DbStockEntities.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult GetProduct(int id)
        {
            var product = DbStockEntities.TblProduct.Find(id);
            List<SelectListItem> values = (from i in DbStockEntities.TblCategory.ToList()
                                           select new SelectListItem
                                           {
                                               Text = i.CategoryName,
                                               Value = i.CategoryId.ToString()
                                           }).ToList();
            ViewBag.value = values;

            return View("GetProduct", product);
        }
        public ActionResult UpdateProduct(TblProduct tblProduct)
        {
            var product = DbStockEntities.TblProduct.Find(tblProduct.ProductId);
            product.ProductName = tblProduct.ProductName;
            product.Marka = tblProduct.Marka;
            product.Price = tblProduct.Price;
            var category = DbStockEntities.TblCategory.Where(c => c.CategoryId == tblProduct.TblCategory.CategoryId).FirstOrDefault();
            product.ProductCategory = category.CategoryId;
            product.Stock = tblProduct.Stock;
            DbStockEntities.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}