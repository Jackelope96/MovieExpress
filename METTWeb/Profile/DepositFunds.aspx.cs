using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Singular.Web;

namespace MEWeb.Profile
{
  public partial class DepositFunds : MEPageBase<DepositFundsVM>
  {
  }
  public class DepositFundsVM : MEStatelessViewModel<DepositFundsVM>
  {
    public MELib.Movies.MovieList MovieList { get; set; }

    public bool FoundUserMoviesInd { get; set; }

    public string LoggedInUserName { get; set; }

    public MELib.Movies.UserMovieList UserMovieList { get; set; }

    public MELib.Accounts.AccountList UserAccountList { get; set; }
    public MELib.Accounts.Account UserAccount { get; set; }

        // filter criteria
    public String MovieTitle { get; set; }
    public DateTime ReleaseFromDate { get; set; }
    public DateTime ReleaseToDate { get; set; }

   //[Singular.DataAnnotations.DropDownWeb(typeof(MELib.RO.ROMovieGenreList), UnselectedText = "Select", ValueMember = "MovieGenreID", DisplayMember = "Genre")]
   //[Display(Name = "Genre")]

   public int? MovieGenreID { get; set; }
   public DepositFundsVM()
   {

   }

   protected override void Setup()
   {
      base.Setup();
      MovieList = MELib.Movies.MovieList.GetMovieList();
      // On page load initiate/set your data/variables and or properties here
      // Should pass in criteria for the specific user that is viewing the page, however using current identity
      UserMovieList = MELib.Movies.UserMovieList.GetUserMovieList();
      UserAccountList = MELib.Accounts.AccountList.GetAccountList();
      UserAccount = UserAccountList.FirstOrDefault();

      if (UserMovieList.Count() > 0)
      {
         FoundUserMoviesInd = true;
      }
      else
      {
         FoundUserMoviesInd = false;
      }


      LoggedInUserName = Singular.Security.Security.CurrentIdentity.UserName;
    }

    [WebCallable(LoggedInOnly = true)]

        public Result AddBalance(int AccountID, decimal AddAmount)
        {

            Result sr = new Result();
            try
            {
                
                    MELib.Accounts.AccountList.AddBalance(AccountID, AddAmount );
                    sr.Data = MovieList;
                

                sr.Success = true;
            }
            catch (Exception e)
            {
                WebError.LogError(e, "Page: DepositFunds.aspx | Method: AddBalance", $"(int AccountID, ({AccountID})");
                sr.Data = e.InnerException;
                sr.ErrorText = "Could not add balance.";
                sr.Success = false;
            }
            return sr;
        }

        
    }
}

