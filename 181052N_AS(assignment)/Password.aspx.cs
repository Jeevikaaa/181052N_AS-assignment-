using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;

namespace _181052N_AS_assignment_
{
    public partial class Password : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
            updatePassword(txtUsername.Text, tbPassword.Text);

             }
        private void updatePassword(string userName, string password)
        {
            try
            {
                if (tbPassword.Text == tbPassword2.Text)
                {
                    bool flag = true;

                    SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Jeevi\source\repos\181052N_AS(assignment)\181052N_AS(assignment)\App_Data\SITConnect2.mdf;Integrated Security=True;Connect Timeout=30"); //insert the data into database

                    string selecttext = "select *, datediff(mi, LastPasswordChanged, getdate()) MinDiff from registration where username = '" + userName + "'";

                    SqlCommand cmd = new SqlCommand(selecttext);
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = con;
                    //open connection and execute it
                    con.Open();
                    SqlDataAdapter da = new SqlDataAdapter();
                    DataSet ds = new DataSet();
                    da.SelectCommand = cmd;
                    da.Fill(ds);

                    if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                    {
                        if (((ds.Tables[0].Rows[0]["password1"] != null && ds.Tables[0].Rows[0]["password1"].ToString() != "")
                        && password == encrypttext.Decrypt(ds.Tables[0].Rows[0]["password1"].ToString(), "b14ca5898a4e4133bbce2ea2315a1916"))
                           ||
                           ((ds.Tables[0].Rows[0]["password2"] != null && ds.Tables[0].Rows[0]["password2"].ToString() != "")
                        && password == encrypttext.Decrypt(ds.Tables[0].Rows[0]["password2"].ToString(), "b14ca5898a4e4133bbce2ea2315a1916"))
                       ||
                        ((ds.Tables[0].Rows[0]["password"] != null && ds.Tables[0].Rows[0]["password"].ToString() != "")
                        && password == encrypttext.Decrypt(ds.Tables[0].Rows[0]["password"].ToString(), "b14ca5898a4e4133bbce2ea2315a1916"))

                        )
                        {

                            lblError.Text = "Cannot use the last 2 password";
                            flag = false;
                        }
                        if (ds.Tables[0].Rows[0]["MinDiff"] != null && ds.Tables[0].Rows[0]["MinDiff"].ToString() != "" && int.Parse(ds.Tables[0].Rows[0]["MinDiff"].ToString()) <15)
                        {
                            lblError.Text = "Cannot change password now, Please try after 15 mins";
                            flag = false;
                        }
                        
                    }



                    if (flag)
                    {
                        // string selecttext = "select * from registration where username = '" + tb_userid.Text + "' and password = '"+ encrypttext.Encrypt(tb_pwd.Text, "b14ca5898a4e4133bbce2ea2315a1916") + "'";

                        string updateText = "update registration  set password = '" + encrypttext.Encrypt(password, "b14ca5898a4e4133bbce2ea2315a1916") + "', password1 = password, password2 = password1, LastPasswordChanged = getdate() where username = '" + userName + "'";

                        cmd = new SqlCommand(updateText);
                        cmd.CommandType = CommandType.Text;
                        cmd.Connection = con;
                        //open connection and execute it

                        cmd.ExecuteNonQuery();

                        //lblError.Text = "Password changed";
                        Response.Write("<script>alert('Your new password has been saved successfully.');window.location.href='Login.aspx'</script>");

                    }
                    con.Close();
                }
                else
                {
                    lblError.Text = "Password not matched";
                }
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message.ToString();
            }
        }
    }
}