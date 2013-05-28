using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InsuranceSite
{
    public partial class CustomersPolicies : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void updateOraInsurance(object sender, SqlDataSourceStatusEventArgs e)
        {
            tableGridView.DataBind();
        }

        protected void rowIndexZero(object sender, EventArgs e)
        {
            tableGridView.SelectedIndex = 0;
        }
    }
}