using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.OleDb;

namespace InsuranceSite
{
    public partial class Procfunc : System.Web.UI.Page
    {
        OleDbConnection myOleDbConnection = null;
        OleDbDataReader myOleDbDataReader = null;
        OleDbCommand myOleDbCommand = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            myOleDbConnection = new OleDbConnection("Provider=OraOLEDB.Oracle;Data Source=localhost:1521;User Id=system;Password=123;");
            myOleDbCommand = myOleDbConnection.CreateCommand();

            if (!Page.IsPostBack)
            {
                YearList.Items.Clear();
                for (int yearsAgo = 0; yearsAgo > -60; yearsAgo--)
                {
                    string targetYear = String.Format("{0}", DateTime.Now.Year + yearsAgo);
                    YearList.Items.Add(new ListItem(targetYear, yearsAgo.ToString()));
                }
            }
        }

        protected void YearList_SelectedIndexChanged(object sender, EventArgs e)
        {
            cal_payDate.VisibleDate = DateTime.Now.AddYears(Convert.ToInt32(YearList.SelectedValue));
        }

        protected void callSumForCustomer(object sender, EventArgs e)
        {
            myOleDbCommand.CommandText = "f_sumForCustomer_Nr";
            myOleDbCommand.CommandType = CommandType.StoredProcedure;
            OleDbParameter par1 = new OleDbParameter("RETURN_VALUE", OleDbType.VarChar);
            par1.Direction = ParameterDirection.ReturnValue;
            par1.Size = 4000;
            myOleDbCommand.Parameters.Add(par1);
            OleDbParameter par2 = new OleDbParameter("i_customerID_nr", OleDbType.Numeric);
            par2.Direction = ParameterDirection.Input;
            par2.Size = 2000;
            par2.Value = Convert.ToInt32(ddl_customerID.Text);
            myOleDbCommand.Parameters.Add(par2);
            OleDbParameter par3 = new OleDbParameter("v_date_dt", OleDbType.Date);
            par3.Direction = ParameterDirection.Input;
            par3.Size = 2000;
            par3.Value = cal_payDate.SelectedDate;
            myOleDbCommand.Parameters.Add(par3);
            try
            {
                myOleDbConnection.Open();
                myOleDbDataReader = myOleDbCommand.ExecuteReader();
                DataTable dt = new DataTable();
                dt.Load(myOleDbDataReader);
                txt_result.Text = (string)myOleDbCommand.Parameters["RETURN_VALUE"].Value;
                myOleDbConnection.Close();
                myOleDbDataReader.Close();
                dt.Dispose();
            }
            catch (Exception ex)
            {
                txt_result.Text = "Error in f_sumForCustomer_Nr, error: " + ex.Message;
            }
        }

        protected void callUpdatePropertyPrice(object sender, EventArgs e)
        {
            myOleDbCommand.CommandText = "select price from policy where policy_id = " + ddl_propertyID.Text;
            myOleDbCommand.CommandType = CommandType.Text;
            myOleDbConnection.Open();
            txt_oldPrice.Text = myOleDbCommand.ExecuteScalar().ToString();
            
            myOleDbCommand.CommandText = "p_updatePropertyPrice";
            myOleDbCommand.CommandType = CommandType.StoredProcedure;
            OleDbParameter par1 = new OleDbParameter("i_basePrice_nr", OleDbType.Numeric);
            par1.Direction = ParameterDirection.Input;
            par1.Size = 2000;
            par1.Value = Convert.ToInt32(txt_basePrice.Text);
            myOleDbCommand.Parameters.Add(par1);
            OleDbParameter par2 = new OleDbParameter("i_policyID_nr", OleDbType.Numeric);
            par2.Direction = ParameterDirection.Input;
            par2.Size = 2000;
            par2.Value = Convert.ToInt32(ddl_propertyID.Text);
            myOleDbCommand.Parameters.Add(par2);
            try
            {
                myOleDbDataReader = myOleDbCommand.ExecuteReader();
                myOleDbDataReader.Close();
            }
            catch (Exception ex)
            {
                txt_oldPrice.Text = "Error in callUpdatePropertyPrice, error: " + ex.Message;
            }

            myOleDbCommand.CommandText = "select price from policy where policy_id = " + ddl_propertyID.Text;
            myOleDbCommand.CommandType = CommandType.Text;
            txt_newPrice.Text = myOleDbCommand.ExecuteScalar().ToString();
        }
    }
}