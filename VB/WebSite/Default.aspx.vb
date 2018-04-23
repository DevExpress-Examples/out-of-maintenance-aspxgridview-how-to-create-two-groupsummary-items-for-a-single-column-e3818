Imports System
Imports System.Collections.Generic
Imports System.Linq
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports DevExpress.Data
Imports DevExpress.Web.ASPxGridView

Partial Public Class _Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)

    End Sub

    Private totalSumUnitPrice As Decimal
    Private totalSumUnitsInStock As Decimal
    Protected Sub ASPxGridView1_CustomSummaryCalculate(ByVal sender As Object, ByVal e As CustomSummaryEventArgs)
        Dim summaryTAG As String = (TryCast(e.Item, ASPxSummaryItem)).Tag
        If e.SummaryProcess = CustomSummaryProcess.Start Then
            totalSumUnitPrice = 0
            totalSumUnitsInStock = 0
        ElseIf e.SummaryProcess = CustomSummaryProcess.Calculate Then
            totalSumUnitPrice += Convert.ToDecimal(e.GetValue("UnitPrice"))
            totalSumUnitsInStock += Convert.ToDecimal(e.GetValue("UnitsInStock"))
        ElseIf e.SummaryProcess = CustomSummaryProcess.Finalize Then
            Select Case summaryTAG
                Case "Item_A"
                    e.TotalValue = totalSumUnitPrice
                Case "Item_B"
                    e.TotalValue = totalSumUnitPrice * totalSumUnitsInStock
            End Select
        End If
    End Sub
End Class
