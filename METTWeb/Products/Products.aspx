<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="MEWeb.Products.Products" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
     <link href="../Theme/Singular/Custom/home.css" rel="stylesheet" />
  <link href="../Theme/Singular/Custom/customstyles.css" rel="stylesheet" />
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="PageTitleContent" runat="server">

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
                            var TabHeading = PageTab.AddTab("Products");
                            {
                                var MainRow = TabHeading.Helpers.DivC("row margin0");
                                {
                                    var MainCol = MainRow.Helpers.DivC("col-md-12");
                                    {
                                        MainCol.Helpers.HTML().Heading2("Food and Beverage");
                                        {
                                            var Productsdiv = MainCol.Helpers.BootstrapTableFor<MELib.Products.Product>((c) => c.ProductList, false, false, "");
                                            {
                                                var FirstRow = Productsdiv.FirstRow;
                                                {
                                                    var ProductName = FirstRow.AddColumn("Name");
                                                    {
                                                        var ProductNameText = ProductName.Helpers.Span(c => c.ProductName);
                                                        ProductName.Style.Width = "250px";
                                                    }
                                                    var ProductPrice = FirstRow.AddColumn("Price");
                                                    {
                                                        var ProductPriceText = ProductPrice.Helpers.Span(c => c.ProductPrice);
                                                        var ProductID = FirstRow.AddColumn("ID");
                                                        {
                                                            var ProductIDText = ProductID.Helpers.Span(c => c.ProductID);
                                                            var ProductCategory = FirstRow.AddColumn("Category");
                                                            {
                                                                var ProductCategoryText = ProductCategory.Helpers.Span(c => c.CategoryID);

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
        }
        %>     
</asp:Content>
