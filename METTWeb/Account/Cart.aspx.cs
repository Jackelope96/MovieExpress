using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Singular.Web;

namespace MEWeb.Account
{
    public partial class Cart : MEPageBase<CartVM>
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }

    public class CartVM: MEStatelessViewModel<CartVM>
    {
        public CartVM()
        {

        }
        protected override void Setup()
        {
            base.Setup();
        }
    }

}