using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MEWeb.Products
{
    public partial class ProductCategories : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }

    public class ProductCategoriesVM : MEStatelessViewModel<ProductCategoriesVM>
    {
        public MELib.Categories.CategoryList MyCategoriesList { get; set; }

        public ProductCategoriesVM()
        {

        }

        protected override void Setup()
        {
            base.Setup();

            MyCategoriesList = MELib.Categories.CategoryList.GetCategoryList();
        }

    }


}