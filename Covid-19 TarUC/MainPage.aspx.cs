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
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.BindGrid();
            }
        }
        private void BindGrid()
        {
            string constr = ConfigurationManager.ConnectionStrings["oem-pc.covid19.dbo"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT cs.caseID, c.nationality, cs.age,cs.gender, s.situationName," +
                    " h.hospitalName, CONVERT(VARCHAR(10), cs.confirmedDate, 103) AS confirmedDate , CONVERT(VARCHAR(10)," +
                    " cs.recoveredDate, 103) AS recoveredDate," +
                    "CONVERT(VARCHAR(10), cs.deceasedDate, 103) AS deceasedDate, cs.remark " +
                    "FROM CaseMaster cs " +
                    "LEFT JOIN CountryMaster c ON cs.countryID = c.countryID " +
                    "LEFT JOIN SituationMaster s ON cs.situationID = s.situationID " +
                    "LEFT JOIN HospitalMaster h ON cs.hospitalID = h.hospitalID " +
                    "WHERE cs.situationID IN(1, 2, 3)"))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            datagrid.DataSource = dt;
                            datagrid.DataBind();
                        }
                    }

                }
                using (SqlCommand cmd2 = new SqlCommand("Select h.hospitalName AS Hospital , s.stateName AS State FROM HospitalMaster h " +
                "LEFT JOIN StateMaster s ON h.stateID = s.stateID; "))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd2.Connection = con;
                        sda.SelectCommand = cmd2;
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            gridView1.DataSource = dt;
                            gridView1.DataBind();
                        }
                    }
                }
                try
                {
                    DataTable dt = new DataTable();
                    con.Open();
                    string q = "SELECT  (SELECT COUNT(caseID)FROM CaseMaster) AS TotalCases,(SELECT COUNT(situationID)" +
                        "FROM   CaseMaster WHERE situationID = 1) AS InTreatment,(SELECT COUNT(situationID)" +
                        "FROM   CaseMaster WHERE situationID = 2) AS Deaths,(SELECT COUNT(situationID)" +
                        "FROM   CaseMaster WHERE situationID = 3) AS Recovered; ";
                    SqlCommand query = new SqlCommand(q, con);
                    SqlDataAdapter sqlDa = new SqlDataAdapter(query);
                    sqlDa.Fill(dt);
                    if (dt.Rows.Count > 0)
                    {
                        confirmed.Text = dt.Rows[0]["TotalCases"].ToString(); //Where ColumnName is the Field from the DB that you want to display
                        treatment.Text = dt.Rows[0]["InTreatment"].ToString();
                        death.Text = dt.Rows[0]["Deaths"].ToString();
                        recovered.Text = dt.Rows[0]["Recovered"].ToString();
                    }
                    con.Close();
                }
                catch (Exception ex)
                {
                    confirmed.Text = "Error";
                }
                DataTable datat = this.GetData();
                StringBuilder html = new StringBuilder();
                html.Append("<table border = '1' class='table-state'>");
                html.Append("<tr>");
                foreach (DataColumn column in datat.Columns)
                {
                    html.Append("<th>");
                    html.Append(column.ColumnName);
                    html.Append("</th>");
                }
                html.Append("</tr>");
                foreach (DataRow row in datat.Rows)
                {
                    html.Append("<tr>");
                    foreach (DataColumn column in datat.Columns)
                    {
                        html.Append("<td>");
                        html.Append(row[column.ColumnName]);
                        html.Append("</td>");
                    }
                    html.Append("</tr>");
                }
                html.Append("</table>");
                caseState.Controls.Add(new Literal { Text = html.ToString() });

            }

        }
        private DataTable GetData()
        {
            string constr = ConfigurationManager.ConnectionStrings["oem-pc.covid19.dbo"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT s.stateName AS #, count(cs.hospitalID) TOTAL," +
                    " sum(case when cs.situationID = 2 then 1 else 0 end) DEATH FROM StateMaster s " +
                    "LEFT JOIN HospitalMaster h ON s.stateID = h.stateID " +
                    "Left join CaseMaster cs ON h.hospitalID = cs.hospitalID " +
                    "LEFT JOIN SituationMaster sm ON cs.situationID = sm.situationID " +
                    "Group by s.stateName; "))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            return dt;
                        }
                    }
                }

            }
        }
        protected void OnPaging(object sender, GridViewPageEventArgs e)
        {
            datagrid.PageIndex = e.NewPageIndex;
            this.BindGrid();
        }
        protected void OnPagingHospital(object sender, GridViewPageEventArgs e)
        {
            gridView1.PageIndex = e.NewPageIndex;
            this.BindGrid();
        }
        protected void ButtonCliked(object sender, EventArgs e)
        {

            string buttonID = "";
            if (sender is Button)
            {
                buttonID = ((Button)sender).ClientID;

                string url = "AddCases.aspx?buttonID=" + buttonID;
                Response.Redirect(url);
            }
        }


    }
}