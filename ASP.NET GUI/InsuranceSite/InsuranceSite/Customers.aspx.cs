using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InsuranceSite
{
    public partial class Customers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (rowindex > -1)
            {
                tableGridView.EditIndex = rowindex;
                rowindex = -1;
            }
        }

        protected void oninsert(object sender, DetailsViewInsertEventArgs e)
        {
            GridViewRow editItem = (GridViewRow)e.Values[0];
            rowindex = editItem.RowIndex;
        }

        protected void updateOraInsurance(object sender, SqlDataSourceStatusEventArgs e)
        {
            tableGridView.DataBind();
        }

        protected void rowIndexZero(object sender, EventArgs e)
        {
            tableGridView.SelectedIndex = 0;
        }


        int rowindex = -1;




    }
}