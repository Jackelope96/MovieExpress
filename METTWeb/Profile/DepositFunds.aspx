<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DepositFunds.aspx.cs" Inherits="MEWeb.Profile.DepositFunds" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
  <!-- Add page specific styles and JavaScript classes below -->
  <link href="../Theme/Singular/Custom/home.css" rel="stylesheet" />
  <link href="../Theme/Singular/Custom/customstyles.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="PageTitleContent" runat="server">
  <!-- Placeholder not used in this example -->
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
  <%
      using (var h = this.Helpers)
      {
          var MainHDiv = h.DivC("row pad-top-10");
          {
              var PanelContainer = MainHDiv.Helpers.DivC("col-md-12 p-n-lr");
              {
                  var HomeContainer = PanelContainer.Helpers.DivC("tabs-container");
                  {
                      var AssessmentsTab = HomeContainer.Helpers.TabControl();
                      {
                          AssessmentsTab.Style.ClearBoth();
                          AssessmentsTab.AddClass("nav nav-tabs");
                          var HomeContainerTab = AssessmentsTab.AddTab("Deposit");
                          {
                              var Row = HomeContainerTab.Helpers.DivC("row margin0");
                              {
                                 

                                  var RowColRight = Row.Helpers.DivC("col-md-3");
                                  {

                                      var AnotherCardDiv = RowColRight.Helpers.DivC("ibox float-e-margins paddingBottom");
                                      {
                                          var CardTitleDiv = AnotherCardDiv.Helpers.DivC("ibox-title");
                                          {
                                              CardTitleDiv.Helpers.HTML("<i class='ffa-lg fa-fw pull-left'></i>");
                                              CardTitleDiv.Helpers.HTML().Heading5("Deposit Funds");
                                          }
                                          var CardTitleToolsDiv = CardTitleDiv.Helpers.DivC("ibox-tools");
                                          {
                                              var aToolsTag = CardTitleToolsDiv.Helpers.HTMLTag("a");
                                              aToolsTag.AddClass("collapse-link");
                                              {
                                                  var iToolsTag = aToolsTag.Helpers.HTMLTag("i");
                                                  iToolsTag.AddClass("fa fa-chevron-up");
                                              }
                                          }
                                          var ContentDiv = AnotherCardDiv.Helpers.DivC("ibox-content");
                                          {
                                              var RowContentDiv = ContentDiv.Helpers.DivC("row");
                                              {
                                                  var ColContentDiv = RowContentDiv.Helpers.DivC("col-md-12");
                                                  {
                                                      var MovieTitleContentDiv = RowContentDiv.Helpers.DivC("col-md-12");
                                                      {
                                                          MovieTitleContentDiv.Helpers.HTML("<p>Current Balance</p>");
                                                          var MovieTitleEditor = MovieTitleContentDiv.Helpers.ReadOnlyFor(c => c.UserAccount.Balance);
                                                          MovieTitleEditor.AddClass("form-control marginBottom20 filterBox");
                                                          //MovieTitleEditor.AddBinding(Singular.Web.KnockoutBindingString.id, "MovieTitle");
                                                      }
                                                  }
                                                  var MovieGenreContentDiv = RowContentDiv.Helpers.DivC("col-md-12");
                                                  {

                                                      MovieGenreContentDiv.Helpers.HTML("<p>Deposit Amount</p>");
                                                      //var ReleaseFromDateEditor = MovieGenreContentDiv.Helpers.EditorFor(c => ViewModel.AddBalance);
                                                      //ReleaseFromDateEditor.AddClass("form-control marginBottom20 ");

                                                      var FilterBtn = MovieGenreContentDiv.Helpers.Button("Confirm Deposit", Singular.Web.ButtonMainStyle.Primary, Singular.Web.ButtonSize.Normal, Singular.Web.FontAwesomeIcon.None);
                                                      {

                                                          FilterBtn.AddBinding(Singular.Web.KnockoutBindingString.click, "AddBalance($data)");
                                                          FilterBtn.AddClass("btn btn-primary btn-outline");
                                                      }
                                                      var ResetBtn = MovieGenreContentDiv.Helpers.Button("Reset", Singular.Web.ButtonMainStyle.Primary, Singular.Web.ButtonSize.Normal, Singular.Web.FontAwesomeIcon.None);
                                                      {
                                                          ResetBtn.AddBinding(Singular.Web.KnockoutBindingString.click, "FilterReset($data)");
                                                          ResetBtn.AddClass("btn btn-primary btn-outline");
                                                      }
                                                  }
                                              }
                                          }
                                      }
                                  }
                              }
                          }
                      }
                  }
              }
          }
      }
  %>
  <script type="text/javascript">
    // Place page specific JavaScript here or in a JS file and include in the HeadContent section
    Singular.OnPageLoad(function () {
      $("#menuItem1").addClass('active');
      $("#menuItem1 > ul").addClass('in');
    });

      var AddBalance = function (obj) {
          ViewModel.CallServerMethod('AddBalance', { AccountID: obj.AccountID(), AddAmount: obj.AddAmount(), ShowLoadingBar: true }, function (result) {
    if (result.Success) {
        MEHelpers.Notification("Balance added successfully.", 'center', 'info', 1000);
        ViewModel.AddBalance.Set(result.Data);
     }
     else {
     MEHelpers.Notification(result.ErrorText, 'center', 'warning', 5000);
        }
     })
   };

  </script>
</asp:Content>
