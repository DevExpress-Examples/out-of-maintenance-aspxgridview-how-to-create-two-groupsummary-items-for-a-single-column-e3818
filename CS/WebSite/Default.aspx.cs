using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Data;
using DevExpress.Web;

public partial class _Default : System.Web.UI.Page {
    protected void Page_Load(object sender, EventArgs e) {

    }

    decimal totalSumUnitPrice;
    decimal totalSumUnitsInStock;
    protected void ASPxGridView1_CustomSummaryCalculate(object sender, CustomSummaryEventArgs e) {
        string summaryTAG = (e.Item as ASPxSummaryItem).Tag;
        if (e.SummaryProcess == CustomSummaryProcess.Start) {
            totalSumUnitPrice = 0;
            totalSumUnitsInStock = 0;
        }
        else if (e.SummaryProcess == CustomSummaryProcess.Calculate) {
            totalSumUnitPrice += Convert.ToDecimal(e.GetValue("UnitPrice"));
            totalSumUnitsInStock += Convert.ToDecimal(e.GetValue("UnitsInStock"));
        }
        else if (e.SummaryProcess == CustomSummaryProcess.Finalize) {
            switch (summaryTAG) {
                case "Item_A":
                    e.TotalValue = totalSumUnitPrice;
                    break;
                case "Item_B":
                    e.TotalValue = totalSumUnitPrice * totalSumUnitsInStock;
                    break;
            }
        }
    }
}
