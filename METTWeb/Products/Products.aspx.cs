using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using Singular.Web;

namespace MEWeb.Products
{
    public partial class Products : MEPageBase<ProductsVM>
    {
    }
    
    public class ProductsVM : MEStatelessViewModel<ProductsVM>
    {

        public MELib.Products.ProductList ProductList { get; set; }

        

        [Singular.DataAnnotations.DropDownWeb(typeof(MELib.RO.ROProductCategoryList), UnselectedText = "Select", ValueMember = "ProductCategoryID", DisplayMember = "CategoryName")]
        [Display(Name = "Cateogry")]

        public int? ProductCategoryID { get; set; }
            

        public ProductsVM()
        {

        }
       

        protected override void Setup()
        {
            base.Setup();

            //this gets product list and displays products initially before any filtering

            ProductList = MELib.Products.ProductList.GetProductList();

        }

        // my code
        [WebCallable]
        public Result FilterProducts(int ProductCategoryID, int ResetInd)
        {
            Result sr = new Result();
            try
            {
                if(ResetInd == 0)
                {
                    sr.Data = MELib.Products.ProductList.GetProductList(ProductCategoryID);
 
                }
                else
                {
                    sr.Data = MELib.Products.ProductList.GetProductList();
                }
                sr.Success = true;

            }
            catch (Exception e)
            {
                WebError.LogError(e, "Page: Products.aspx | Method: FilterProducts", $"(int ProductCategoryID, ({ProductCategoryID})");
                sr.Data = e.InnerException;
                sr.ErrorText = "Could not filter products by category.";
                sr.Success = false;
            }
            return sr;
        }

    }

}
