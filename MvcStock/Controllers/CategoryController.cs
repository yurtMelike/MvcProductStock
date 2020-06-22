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
    public class CategoryController : Controller
    {
        ProductDbStockEntities DbStockEntities = new ProductDbStockEntities();
        // GET: Category
        public ActionResult Index(int page=1) //int türünde değişken oluşturarak sayfa açılması halinde ilk değeri 1 olarak gönderildi.
        {
            var list = DbStockEntities.TblCategory.ToList().ToPagedList(page,7);//Dbden alınan listeyi sayfalayarak listeledim.ilk değeri 1 olarak sayfada 7veri gelmesini yazdım.
            return View(list);
        }

        [HttpGet]
        public ActionResult AddNewCategory()
        {
            return View();
        }

        [HttpPost]
        public ActionResult AddNewCategory(TblCategory newCategory)
        {
            DbStockEntities.TblCategory.Add(newCategory);//tblCategory örneği oluşturdum.Verileri AddNewCategoryden post işlemi olarak aldım.
            DbStockEntities.SaveChanges();//Veritabanına kaydını gerçekleştirdim.
            return RedirectToAction("Index");//İşlemin tamamlanması halinde Index sayfasına yönlendirdim.
        }

        public ActionResult Delete(int id)// değerine göre veri tabanından veriyi çekip oluşturduğumuz değişkene aktarıldı.
        {
            var category = DbStockEntities.TblCategory.Find(id);
            DbStockEntities.TblCategory.Remove(category);//değişken tablodan metod ile kaldırılmasısağlandı.
            DbStockEntities.SaveChanges();//Değişiklikler kaydedildi
            return RedirectToAction("Index");//Index sayfasına yönlendirildi.
        }

        public ActionResult GetCategory(int id)
        {
            var getCategory = DbStockEntities.TblCategory.Find(id);//Id ye ait olan veriler veri tabanından bulundu.Ve değişkene akratıldı.
            return View("GetCategory",getCategory);//Değişken GetCategory View içerisinde görüntülenmesi sağlandı.
        }
       
        public ActionResult UpdateCategory(TblCategory tblCategory)
        {
            var category = DbStockEntities.TblCategory.Find(tblCategory.CategoryId);//Güncellenmek istenen kategory Id değerine göre bulundu.Ve category değişkenine aktarıldı.
            category.CategoryName = tblCategory.CategoryName;//Var olan kategori alanında yapılan güncelleme oluşturulan değişken değerine atandı. 
            DbStockEntities.SaveChanges();//Veri tabanı değişiklikleri kaydedildi.
            return RedirectToAction("Index");//Index Viewine yönlendirildi.
        }


    }
}