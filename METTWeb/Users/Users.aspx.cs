using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MEWeb.Users
{
    public partial class Users : MEPageBase<UsersVM>
    {
    }
    public class UsersVM : MEStatelessViewModel<UsersVM>
    {

        public UsersVM()
        {

        }
        protected override void Setup()
        {
            base.Setup();
            
        }
    }
}