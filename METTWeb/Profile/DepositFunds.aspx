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
        var MainContent = h.DivC("row pad-top-10");
        {
          var MainContainer = MainContent.Helpers.DivC("col-md-12 p-n-lr");
          {
            var PageContainer = MainContainer.Helpers.DivC("tabs-container");
            {
              var PageTab = PageContainer.Helpers.TabControl();
              {
                PageTab.Style.ClearBoth();
                PageTab.AddClass("nav nav-tabs");
                var ContainerTab = PageTab.AddTab("Transaction History");
                {
                  var RowContentDiv = ContainerTab.Helpers.DivC("row");
                  {

                    #region Left Column / Data
                    var LeftColRight = RowContentDiv.Helpers.DivC("col-md-4");
                    {
                    }
                    #endregion

                    #region Deposit Column / Filters
                    var MiddleColRight = RowContentDiv.Helpers.DivC("col-md-4");
                    {

                      var AnotherCardDiv = MiddleColRight.Helpers.DivC("ibox float-e-margins paddingBottom");
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
                      }
                    }
                    #endregion
                    #region Right Column / Data
                    var RowColRight = RowContentDiv.Helpers.DivC("col-md-4");
                    {
                    }
                    #endregion
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

  </script>
</asp:Content>
