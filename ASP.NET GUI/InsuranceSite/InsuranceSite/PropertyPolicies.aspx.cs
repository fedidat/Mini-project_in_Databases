using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Common;

namespace InsuranceSite
{
    public partial class PropertyPolicies : System.Web.UI.Page
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

        protected void SqlStreams_OnUpdating(object sender, SqlDataSourceCommandEventArgs e)
        {
            foreach (DbParameter param in e.Command.Parameters)
                param.ParameterName = param.ParameterName + "_";
        }
    }
}