<%@ Page Language="vb" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ASPxGridView - How to create two GroupSummaryItem for a single column </title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="dsGrid"
            KeyFieldName="ProductID" OnCustomSummaryCalculate="ASPxGridView1_CustomSummaryCalculate">
            <Columns>
                <dx:GridViewDataTextColumn FieldName="ProductID" ReadOnly="True" VisibleIndex="0">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="ProductName" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="QuantityPerUnit" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="UnitPrice" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="UnitsInStock" VisibleIndex="4" GroupIndex="0">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="UnitsOnOrder" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="ReorderLevel" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
            </Columns>
            <Settings ShowGroupFooter="VisibleIfExpanded" />
            <GroupSummary>
                <dx:ASPxSummaryItem FieldName="UnitsOnOrder" ShowInGroupFooterColumn="UnitsOnOrder"
                    SummaryType="Sum" />
                <dx:ASPxSummaryItem FieldName="UnitPrice" ShowInGroupFooterColumn="UnitPrice" SummaryType="Custom"
                    Tag="Item_A" />
                <dx:ASPxSummaryItem FieldName="UnitPrice" ShowInGroupFooterColumn="UnitPrice" SummaryType="Custom"
                    Tag="Item_B" />
            </GroupSummary>
        </dx:ASPxGridView>
        <asp:AccessDataSource ID="dsGrid" runat="server" DataFile="~/App_Data/nwind.mdb"
            SelectCommand="SELECT [ProductID], [ProductName], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel] FROM [Products]">
        </asp:AccessDataSource>
    </div>
    </form>
</body>
</html>