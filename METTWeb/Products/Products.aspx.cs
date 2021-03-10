using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Singular.Web;

namespace MEWeb.Products
{
    public partial class Products : MEPageBase<ProductsVM>
    {
    }
    public class ProductsVM : MEStatelessViewModel<ProductsVM>
    {
        public MELib.Products.ProductList ProductList { get; set; }

        public ProductsVM()
        {

        }
        protected override void Setup()
        {
            base.Setup();
            ProductList = MELib.Products.ProductList.GetProductList();
        }
    }
}