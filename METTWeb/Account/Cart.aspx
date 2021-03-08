<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="MEWeb.Account.Cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">

  <!-- Add page specific styles and JavaScript classes below -->
  <link href="../Theme/Singular/Custom/home.css" rel="stylesheet" />
  <link href="../Theme/Singular/Custom/customstyles.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageTitleContent" runat="server">
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
                        var HomeContainerTab = AssessmentsTab.AddTab("Cart");
                        {
                            var Row = HomeContainerTab.Helpers.DivC("row margin0");
                            {
                                var RowColMain = Row.Helpers.DivC("col-md-12");
                                {
                                    RowColMain.Helpers.HTML().Heading2("Your Cart");
                                    RowColMain.Helpers.HTMLTag("p").HTML = "View and Confirm the purchase of products below:";
                                }
                                var RowColLeft = Row.Helpers.DivC("col-md-9");
                                {
                                    var AnotherCardDiv = RowColLeft.Helpers.DivC("ibox float-e-margins paddingBottom");
                                    {
                                        var CardTitleDiv = AnotherCardDiv.Helpers.DivC("ibox-title");
                                        {
                                            CardTitleDiv.Helpers.HTML("<i class='ffa-lg fa-fw pull-left'></i>");
                                            CardTitleDiv.Helpers.HTML().Heading5("Products");
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

                                                //var ProductSection = RowContentDiv.Helpers.BootstrapTableFor<MELib.Products.Product>((c) => ViewModel.ProductList, false, false, "");
                                                //{
                                                //    var ProductListRow = ProductSection.FirstRow;
                                                //    {
                                                //        var ProductTitle = ProductListRow.AddColumn("Title");
                                                //        {
                                                //            var ProductTitleText = ProductTitle.Helpers.Span(c => c.ProductName);
                                                //        }

                                                //        var ProductDescription = ProductListRow.AddColumn("Description");
                                                //        {
                                                //            var ProductTitleText = ProductDescription.Helpers.Span(c => c.ProductDescription);
                                                //        }

                                                //        var ProductPrice = ProductListRow.AddColumn("Price");
                                                //        {

                                                //            var ProductTitleText = ProductPrice.Helpers.Span(c => "R " + c.ProductPrice);
                                                //        }

                                                //        var Actions = ProductListRow.AddColumn("");
                                                //        {
                                                //            Actions.Style.Width = "130px";

                                                //            var AddToCartBtn = Actions.Helpers.Button("Add to Cart", Singular.Web.ButtonMainStyle.NoStyle, Singular.Web.ButtonSize.Normal, Singular.Web.FontAwesomeIcon.shoppingCart);

                                                //            AddToCartBtn.AddClass("btn btn-primary btn-outline margin-top-10");
                                                //        }
                                                //    }
                                                //}

                                            }

                                        }
                                    }
                                }
                                //var RowCol = Row.Helpers.DivC("col-md-3");
                                //{

                                //    var CardDiv = RowCol.Helpers.DivC("ibox float-e-margins paddingBottom");
                                //    {
                                //        var CardTitleDiv = CardDiv.Helpers.DivC("ibox-title");
                                //        {
                                //            CardTitleDiv.Helpers.HTML("<i class='fa-lg fa-fw pull-left'></i>");
                                //            CardTitleDiv.Helpers.HTML().Heading5("Product Filter");
                                //        }
                                //        var CardTitleToolsDiv = CardTitleDiv.Helpers.DivC("ibox-tools");
                                //        {
                                //            var aToolsTag = CardTitleToolsDiv.Helpers.HTMLTag("a");
                                //            aToolsTag.AddClass("collapse-link");
                                //            {
                                //                var iToolsTag = aToolsTag.Helpers.HTMLTag("i");
                                //                iToolsTag.AddClass("fa fa-chevron-up");
                                //            }
                                //        }
                                //        var ContentDiv = CardDiv.Helpers.DivC("ibox-content");
                                //        {
                                //            var RowContentDiv = ContentDiv.Helpers.DivC("row");
                                //            {
                                //                var LeftColContentDiv = RowContentDiv.Helpers.DivC("col-md-12 text-center");
                                //                {


                                //                }
                                //            }
                                //        }

                                //        //my code

                                //        var ContentDiv2 = CardDiv.Helpers.DivC("ibox-content");
                                //        {
                                //            var RightRowContentDiv = ContentDiv.Helpers.DivC("row");
                                //            {
                                //                var RightColContentDiv = RightRowContentDiv.Helpers.DivC("col-md-12");
                                //                {
                                //                    //RightColContentDiv.Helpers.LabelFor(c => ViewModel.ProductCategoryID);
                                //                    //var ReleaseFromDateEditor = RightColContentDiv.Helpers.EditorFor(c => ViewModel.ProductCategoryID);
                                //                    //ReleaseFromDateEditor.AddClass("form-control marginBottom20 ");

                                //                    //var FilterBtn = RightColContentDiv.Helpers.Button("Apply Filter", Singular.Web.ButtonMainStyle.Primary, Singular.Web.ButtonSize.Normal, Singular.Web.FontAwesomeIcon.None);
                                //                    //{
                                //                    //    FilterBtn.AddBinding(Singular.Web.KnockoutBindingString.click, "FilterProducts($data)");
                                //                    //    FilterBtn.AddClass("btn btn-primary btn-outline");
                                //                    //}

                                //                    //var ResetBtn = RightColContentDiv.Helpers.Button("Reset", Singular.Web.ButtonMainStyle.Primary, Singular.Web.ButtonSize.Normal, Singular.Web.FontAwesomeIcon.None);
                                //                    //{
                                //                    //    ResetBtn.AddBinding(Singular.Web.KnockoutBindingString.click, "FilterReset($data)");
                                //                    //    ResetBtn.AddClass("btn btn-primary btn-outline");
                                //                    //}

                                //                }
                                //            }
                                //        }
                                //    }
                                //}
                            }
                        }
                    }
                }
            }
        }
    }
  %>


<script type = "text/javascript">
 // place page specific javascript here or in a JS file and include in the headcontent

    Singular.OnPageLoad(function () {

    });
</script>

</asp:Content>
