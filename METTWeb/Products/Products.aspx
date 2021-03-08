<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="MEWeb.Products.Products" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <!-- Add your page specific styles and JavaScript classes below -->
  <link href="../Theme/Singular/Custom/home.css" rel="stylesheet" />
  <link href="../Theme/Singular/Custom/customstyles.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageTitleContent" runat="server">

     <%
    using (var h = this.Helpers)
    {
      // Not used in this example
    }
  %>

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
                         var HomeContainerTab = AssessmentsTab.AddTab("Products");
                         {
                             var Row = HomeContainerTab.Helpers.DivC("row margin0");
                             {
                                 var RowColMain = Row.Helpers.DivC("col-md-12");
                                 {
                                     RowColMain.Helpers.HTML().Heading2("Snacks & Drinks");
                                     RowColMain.Helpers.HTMLTag("p").HTML = "Indulge yourself with our fine selection of food products.";
                                 }
                                 var RowColLeft = Row.Helpers.DivC("col-md-9");
                                 {
                                     var AnotherCardDiv = RowColLeft.Helpers.DivC("ibox float-e-margins paddingBottom");
                                     {
                                         var CardTitleDiv = AnotherCardDiv.Helpers.DivC("ibox-title");
                                         {
                                             CardTitleDiv.Helpers.HTML("<i class='ffa-lg fa-fw pull-left'></i>");
                                             CardTitleDiv.Helpers.HTML().Heading5("Watched Recently");
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

                                                 var ProductSection = RowContentDiv.Helpers.BootstrapTableFor<MELib.Products.Product>((c) => ViewModel.ProductList, false, false, "");
                                                 {
                                                     var ProductListRow = ProductSection.FirstRow;
                                                     {
                                                         var ProductTitle = ProductListRow.AddColumn("Title");
                                                         {
                                                             var ProductTitleText = ProductTitle.Helpers.Span(c => c.ProductName);
                                                         }

                                                         var ProductDescription = ProductListRow.AddColumn("Description");
                                                         {
                                                             var ProductTitleText = ProductDescription.Helpers.Span(c => c.ProductDescription);
                                                         }

                                                         var ProductPrice = ProductListRow.AddColumn("Price");
                                                         {
                                                            
                                                             var ProductTitleText = ProductPrice.Helpers.Span(c => "R " + c.ProductPrice);
                                                         }

                                                         var Actions = ProductListRow.AddColumn("");
                                                         {
                                                             Actions.Style.Width = "130px";

                                                             var AddToCartBtn = Actions.Helpers.Button("Add to Cart", Singular.Web.ButtonMainStyle.NoStyle, Singular.Web.ButtonSize.Normal, Singular.Web.FontAwesomeIcon.shoppingCart);

                                                             AddToCartBtn.AddClass("btn btn-primary btn-outline margin-top-10");
                                                         }
                                                     }
                                                 }

                                             }

                                         }
                                     }
                                 }
                                 var RowCol = Row.Helpers.DivC("col-md-3");
                                 {

                                     var CardDiv = RowCol.Helpers.DivC("ibox float-e-margins paddingBottom");
                                     {
                                         var CardTitleDiv = CardDiv.Helpers.DivC("ibox-title");
                                         {
                                             CardTitleDiv.Helpers.HTML("<i class='fa-lg fa-fw pull-left'></i>");
                                             CardTitleDiv.Helpers.HTML().Heading5("Product Filter");
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
                                         var ContentDiv = CardDiv.Helpers.DivC("ibox-content");
                                         {
                                             var RowContentDiv = ContentDiv.Helpers.DivC("row");
                                             {
                                                 var LeftColContentDiv = RowContentDiv.Helpers.DivC("col-md-12 text-center");
                                                 {


                                                 }
                                             }
                                         }

                                         //my code

                                         var ContentDiv2 = CardDiv.Helpers.DivC("ibox-content");
                                         {
                                             var RightRowContentDiv = ContentDiv.Helpers.DivC("row");
                                             {
                                                 var RightColContentDiv = RightRowContentDiv.Helpers.DivC("col-md-12");
                                                 {
                                                     RightColContentDiv.Helpers.LabelFor(c => ViewModel.ProductCategoryID);
                                                     var ReleaseFromDateEditor = RightColContentDiv.Helpers.EditorFor(c => ViewModel.ProductCategoryID);
                                                     ReleaseFromDateEditor.AddClass("form-control marginBottom20 ");

                                                     var FilterBtn = RightColContentDiv.Helpers.Button("Apply Filter", Singular.Web.ButtonMainStyle.Primary, Singular.Web.ButtonSize.Normal, Singular.Web.FontAwesomeIcon.None);
                                                     {
                                                         FilterBtn.AddBinding(Singular.Web.KnockoutBindingString.click, "FilterProducts($data)");
                                                         FilterBtn.AddClass("btn btn-primary btn-outline");
                                                     }

                                                     var ResetBtn = RightColContentDiv.Helpers.Button("Reset", Singular.Web.ButtonMainStyle.Primary, Singular.Web.ButtonSize.Normal, Singular.Web.FontAwesomeIcon.None);
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

      //my code

      var FilterProducts = function (obj) {


          ViewModel.CallServerMethod('FilterProducts', { ProductCategoryID: obj.ProductCategoryID(), ShowLoadingBar: true }, function (result) {
              if (result.Success) {
                  MEHelpers.Notification("Products filtered successfully.", 'center', 'info', 1000);
                  ViewModel.ProductList.Set(result.Data);
              }
              else {
                  MEHelpers.Notification(result.ErrorText, 'center', 'warning', 5000);
              }
          })
      };

      var FilterReset = function (obj) {
          ViewModel.CallServerMethod('FilterProducts', { ProductCategoryID: obj.ProductCategoryID(), ResetInd: 1, ShowLoadingBar: true }, function (result) {
              if (result.Success) {
                  MEHelpers.Notification("Products reset successfully.", 'center', 'info', 1000);
                  ViewModel.ProductList.Set(result.Data);
                  // Set Drop Down to 'Select'
              }
              else {
                  MEHelpers.Notification(result.ErrorText, 'center', 'warning', 5000);
              }
          })
      };

  </script>
</asp:Content>
