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
    public class CustomerController : Controller
    {
        ProductDbStockEntities DbStockEntities = new ProductDbStockEntities();
        // GET: Customer
        public ActionResult Index(int page=1)
        {
            var customer = DbStockEntities.TblCustomer.ToList().ToPagedList(page,7);
            return View(customer);
        }

        public ActionResult AddNewCustomer()
        {
            return View();
        }

        [HttpPost]
        public ActionResult AddNewCustomer(TblCustomer newCustomer)
        {
            DbStockEntities.TblCustomer.Add(newCustomer);
            DbStockEntities.SaveChanges();
            return RedirectToAction("Index");
        }
        public ActionResult Delete(int id)
        {
            var delete = DbStockEntities.TblCustomer.Find(id);
            DbStockEntities.TblCustomer.Remove(delete);
            DbStockEntities.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult GetCustomer(int id)
        {
            var customer = DbStockEntities.TblCustomer.Find(id);
            return View("GetCustomer",customer);
        }


        public ActionResult UpdateCustomer(TblCustomer customer)
        {
            var updatecustomer = DbStockEntities.TblCustomer.Find(customer.CustomerId);
            updatecustomer.CustomerName = customer.CustomerName;
            updatecustomer.CustomerSurname = customer.CustomerSurname;
            DbStockEntities.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}