using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Services;
using System.Configuration;
using System.Data.SqlClient;
using System.Text;

namespace Covid_19_TarUC
{
    public partial class AddCases : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.BindData();
            }
        }
        private void BindData()
        {
            string constr = ConfigurationManager.ConnectionStrings["oem-pc.covid19.dbo"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("Select * from CountryMaster;"))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            ddlNationality.DataSource = dt;
                            ddlNationality.DataTextField = "nationality";
                            ddlNationality.DataValueField = "countryID";
                            ddlNationality.DataBind();
                            ddlNationality.Items.Insert(0, new ListItem("Select", "-"));
                        }
                    }
                }
                using (SqlCommand cmd2 = new SqlCommand("select * from SituationMaster; "))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd2.Connection = con;
                        sda.SelectCommand = cmd2;
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            ddlStatus.DataSource = dt;
                            ddlStatus.DataTextField = "situationName";
                            ddlStatus.DataValueField = "situationID";
                            ddlStatus.DataBind();
                            ddlStatus.Items.Insert(0, new ListItem("Select", "-"));
                        }
                    }
                }
                using (SqlCommand cmd2 = new SqlCommand("select * from HospitalMaster; "))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd2.Connection = con;
                        sda.SelectCommand = cmd2;
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            ddlHospital.DataSource = dt;
                            ddlHospital.DataTextField = "hospitalName";
                            ddlHospital.DataValueField = "hospitalID";
                            ddlHospital.DataBind();
                            ddlHospital.Items.Insert(0, new ListItem("Select", "-"));
                        }

                    }
                }


            }

        }
        protected void ButtonCliked(object sender, EventArgs e)
        {
            string buttonID = "";
            string lblNationality= ddlNationality.SelectedValue;

            string constr = ConfigurationManager.ConnectionStrings["oem-pc.covid19.dbo"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("Add_CaseRecord",con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("age", txtAge.Text);
                    cmd.Parameters.AddWithValue("gender", ddlGender.SelectedValue);
                    cmd.Parameters.AddWithValue("nationality", ddlNationality.SelectedValue);
                    cmd.Parameters.AddWithValue("status", ddlStatus.SelectedValue);
                    cmd.Parameters.AddWithValue("hospital", ddlHospital.SelectedValue);
                    cmd.Parameters.AddWithValue("remark", txtRemark.Text);
                    con.Open();
                    int k = cmd.ExecuteNonQuery();
                    if (k != 0 && sender is Button)
                    {
                        lblMessage.Text = "Record inserted successfully!";
                        buttonID = ((Button)sender).ClientID;
                        addCases.Enabled = false;
                    }
                    con.Close();
                }
            }
        }

    }
}