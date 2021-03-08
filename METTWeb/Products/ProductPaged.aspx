<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProductPaged.aspx.cs" Inherits="MEWeb.Products.ProductPaged"%>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageTitleContent" runat="server">
    
<%
    using (var h = this.Helpers)
    {
        var toolbar = h.Toolbar();
        {
            toolbar.Helpers.HTML().Heading2("Previous Menus");
        }

        var MainDiv = h.DivC("Row");
        {
            var MenusPagedList = MainDiv.Helpers.PagedGridFor<MELib.RO.ROProductPagedList>(c => c.ROProductPagedListManager, c => c.ROProductPagedList, false, false);
            {
                MenusPagedList.AddClass("table-Responsive table-striped table table-bordered");
                var MenuRow = MenusPagedList.FirstRow;
                {
                    //var StartDate = MenuRow.AddReadOnlyColumn(c => c.StartDate);
                    //var ProductCategoryName = MenuRow.AddReadOnlyColumn(c => c.ProductCategoryName);
                    //var ProductName = MenuRow.AddReadOnlyColumn(c => c.ProductName);
                }
            }
        }
    }

%>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
</asp:Content>
