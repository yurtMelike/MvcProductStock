using MvcStock.Models.Entity;
using PagedList;
using System.Linq;
using System.Web.Mvc;

namespace MvcStock.Controllers
{
    public class SaleController : Controller
    {
        ProductDbStockEntities DbStockEntities = new ProductDbStockEntities();
        // GET: Sale
        public ActionResult Index()
        {
            return View();
        }

        [HttpGet]
        public ActionResult NewSale()
        {
            return View();
        }
        [HttpPost]
        public ActionResult NewSale(TblSale tblSale)
        {
            DbStockEntities.TblSale.Add(tblSale);
            DbStockEntities.SaveChanges();
            return View("Index");
        }

        public ActionResult GetSaleList(int page = 1)
        {

            var sales = DbStockEntities.TblSale.ToList().ToPagedList(page, 7); ;
            return View(sales);
        }

        public ActionResult GetSaleListS(string search)
        {
            var result = from f in DbStockEntities.TblSale select f;

            if (!string.IsNullOrEmpty(search))//Eğer search değişkenim boş değilse yapılacak işlem
            {
                result = result.Where(r => r.TblCustomer.CustomerName.Contains(search));//customer tablosunun customername alanının içerisinde search den gelen ifadeyi içerenler result değişkenine aktarıldı.(result=Sipariş tablosunda arandı.)
            }
            else
            {
                return View(result.ToList());
            }

            return View(result.ToList());
        }
    }
}