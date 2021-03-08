using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using Singular.Web;
using Singular.Web.Data;

namespace MEWeb.Products
{
    public partial class ProductPaged : PageBase<ProductPagedVM>
    {
    
    }

    public class ProductPagedVM : MEStatelessViewModel<ProductPagedVM>
    {
        public MELib.RO.ROProductPagedList ROProductPagedList { get; set; }
        public MELib.RO.ROProductPagedList.Criteria ROProductPagedListCriteria { get; set; }
        public PagedDataManager<ProductPagedVM> ROProductPagedListManager { get; set; }

        public ProductPagedVM()
        {

        }
        protected override void Setup()
        {
            ROProductPagedListCriteria = new MELib.RO.ROProductPagedList.Criteria();
            ROProductPagedListManager = new PagedDataManager<ProductPagedVM>((c) => c.ROProductPagedList, (c) => c.ROProductPagedListCriteria, "ProductName", 1, true);
            ROProductPagedList = (MELib.RO.ROProductPagedList)this.ROProductPagedListManager.GetInitialData(ROProductPagedListCriteria);

            base.Setup();
        }

    }
}