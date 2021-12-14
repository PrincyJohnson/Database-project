using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class _Default : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {



    }


    protected void btnSearch_Click(object sender, EventArgs e)
    {
        string Criteria = ddlCriteria.SelectedValue;
        string Conditions = ddlsearch.SelectedValue;
        string SearchValue = txt_Search.Text.Trim();

        searchResult(Criteria, Conditions, SearchValue);
       
    }

    public void searchResult(string PCriteria, string PConditions, string PSearchValue)
    {
        string StrQuery = "";
        StrQuery = " Select SubJID, Age_at_NpExam, Age_At_IMGExam, Gender, FDH_Respondent_Relation, FDH_Guardian_1_Relation, ";
        StrQuery += " FDH_Highest_Education,  FDH_Highest_Occupation, FDH_5_Birth_by from (";

        StrQuery += " Select P1.SubJID, P1.Age_at_NpExam, P1.Age_At_IMGExam, P1.Gender, P1.FDH_Respondent_Relation, P1.FDH_Guardian_1_Relation, ";
        StrQuery += " P2.FDH_Highest_Education, P2. FDH_Highest_Occupation , FDH_5_Birth_by ,";
        StrQuery += " FDH_40q_ADHD_Male_Sib,FDH_40q_ADHD_Fem_Sib,FDH_40b_Alcohol_prob_total,FDH_40c_drug_prob_total,FDH_40q_ADHD_Total,FDH_40r_juv_diabetes_total,FDH_40s_Brain_cancer_total ";
        StrQuery += " from tbl_Dump_P1 P1 join  tbl_Dump_P2 P2 on P1.SubJID=P2.SubjiD join tbl_Dump_P5 P5  on P2.SubjID = P5.SubjID ";
        StrQuery += " ) A Where 1=1"; 
        if ((PCriteria != "") && (PConditions != ""))
        {
            if (PConditions == "Like")
            {
                StrQuery += " And " + PCriteria + " " + PConditions + "'%" + PSearchValue + "%'";
            }
            else
            {
                StrQuery += " And " + PCriteria + " " +PConditions + "'" + PSearchValue + "'";
            }


        }

        DataTable DTInvoice = new DataTable();
        DTInvoice = GetData(StrQuery);
        GrdSearch.DataSource = DTInvoice;
        GrdSearch.DataBind();
        lblcount.Text = DTInvoice.Rows.Count.ToString();
    }
    protected void GrdSearch_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GrdSearch.PageIndex = e.NewPageIndex;
       string Criteria = ddlCriteria.SelectedValue;
        string Conditions = ddlsearch.SelectedValue;
        string SearchValue = txt_Search.Text.Trim();
        searchResult(Criteria, Conditions, SearchValue);
    }
    public DataTable GetData(string query)
    {

        string strConnString = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        using (SqlConnection con = new SqlConnection(strConnString))
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = query;
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.Connection = con;
                    sda.SelectCommand = cmd;
                    cmd.CommandTimeout = 500;
                    using (DataSet ds = new DataSet())
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        return dt;
                    }
                }
            }
        }
    }

}