using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Configuration;


namespace _181052N_AS_assignment_
{

    public partial class DOB : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Jeevi\source\repos\181052N_AS(assignment)\181052N_AS(assignment)\App_Data\SITConnect2.mdf;Integrated Security=True;Connect Timeout=30");
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    TextBox1.Visible = false;
                    Label1.Visible = false;
                    Label2.Visible = false;
                    DropDownList1.Visible = false;
                    DropDownList2.Visible = false;
                    Calendar1.Visible = false;

                    DataSet years = new DataSet();
                    years.ReadXml(Server.MapPath("~/Year.xml"));

                    DropDownList1.DataTextField = "Number";
                    DropDownList1.DataValueField = "Number";

                    DropDownList1.DataSource = years;
                    DropDownList1.DataBind();


                    DataSet months = new DataSet();
                    months.ReadXml(Server.MapPath("~/Month.xml"));

                    DropDownList2.DataTextField = "Name";
                    DropDownList2.DataValueField = "Number";

                    DropDownList2.DataSource = months;
                    DropDownList2.DataBind();
                }
                else
                {
                }

            }
            catch (Exception ex)
            {
                registrationlabel.Text = ex.Message.ToString();
            }
     
        }
        private void SetError(Label lblerror, string errormsg)
        {
            lblerror.Text = errormsg;
        }
        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
                try
                {
                    if (Calendar1.Visible)
                    {
                        Label1.Visible = false;
                        Label2.Visible = false;
                        DropDownList1.Visible = false;
                        DropDownList2.Visible = false;
                        Calendar1.Visible = false;

                    }
                    else
                    {
                        TextBox1.Visible = true;
                        Label1.Visible = true;
                        Label2.Visible = true;
                        DropDownList1.Visible = true;
                        DropDownList2.Visible = true;
                        Calendar1.Visible = true;
                    }
                }

                catch (Exception ex)
                {
                    registrationlabel.Text = ex.Message.ToString();
                }
    
    }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            int year = Convert.ToInt16(DropDownList1.SelectedValue);
            int months = Convert.ToInt16(DropDownList2.SelectedValue);

            Calendar1.VisibleDate = new DateTime(year, months, 1);
            Calendar1.SelectedDate = new DateTime(year, months, 1);
        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            int year = Convert.ToInt16(DropDownList1.SelectedValue);
            int months = Convert.ToInt16(DropDownList2.SelectedValue);

            Calendar1.VisibleDate = new DateTime(year, months, 1);
            Calendar1.SelectedDate = new DateTime(year, months, 1);
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            TextBox1.Text = Calendar1.SelectedDate.ToShortDateString();
            Label1.Visible = false;
            Label2.Visible = false;
            DropDownList1.Visible = false;
            DropDownList2.Visible = false;
            Calendar1.Visible = false;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            //con.Open();
            //SqlCommand cmd = con.CreateCommand();
            //cmd.CommandType = CommandType.Text;
            //cmd.CommandText = "insert into DOB values(' " + TextBox1.Text + " ')";
            //cmd.CommandText = "insert into DOB values(' " + TextBox2.Text + " ')";
            //cmd.CommandText = "insert into DOB values(' " + TextBox3.Text + " ')";
            //cmd.ExecuteNonQuery();
            //con.Close();

            //string constr = ConfigurationManager.ConnectionStrings["SITConnect"].ConnectionString;
            // set the connection to database
            //SqlConnection conn = new SqlConnection(constr);

            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Jeevi\source\repos\181052N_AS(assignment)\181052N_AS(assignment)\App_Data\SITConnect2.mdf;Integrated Security=True;Connect Timeout=30"); //insert the data into database
            string insertData = "INSERT INTO Registration VALUES (@firstname, @lastname, @dob, @creditcard, @email, @password, @username, null, null, null)";
            SqlCommand cmd = new SqlCommand(insertData);
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.AddWithValue("@firstname", TextBox2.Text);
            cmd.Parameters.AddWithValue("@lastname", TextBox3.Text);
            cmd.Parameters.AddWithValue("@dob", TextBox1.Text);
            cmd.Parameters.AddWithValue("@email", email.Text);
            cmd.Parameters.AddWithValue("@username", TextBox7.Text);
            //encrypttext.Decrypt to decrypt the credit card info
            cmd.Parameters.AddWithValue("@creditcard", encrypttext.Encrypt(TextBox6.Text, "b14ca5898a4e4133bbce2ea2315a1916"));
            //put hashing password here
            cmd.Parameters.AddWithValue("@password", encrypttext.Encrypt(tb_password.Text, "b14ca5898a4e4133bbce2ea2315a1916")); //insert the hashed password here and remove the textbox4.text

            cmd.Connection = con;

  //************************************************************************************************************************************************************************//
            //codes added here are to improve the submit event for the registration codes by proper handling of the Database Exception

            //try
            //{
            //    con.Open();
            //    cmd.ExecuteNonQuery();
            //    //con.Close();
            //}
            //catch (Exception ex)
            //{
            //    //throw new Exception(ex.ToString());
            //    lb_error1.Text = ex.ToString();
            //}
            //finally
            //{
            //    con.Close();
            //}
  //************************************************************************************************************************************************************************//
            //open connection and execute it
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox1.Text = "";
            email.Text = "";
            TextBox6.Text = "";
            TextBox7.Text = "";
            tb_password.Text = "";
            //Display success message.
            //string message = "Your details have been saved successfully.";
            //string script = "window.onload = function(){ alert('";
            //script += message;
            //script += "')};";
            //ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script, true);

            Response.Write("<script>alert('Your details have been saved successfully.');window.location.href='Login.aspx'</script>");


        }

        protected void TextBox5_TextChanged(object sender, EventArgs e)
        {

            bool exists = false;
            // create a command to check if the username exists
            con.Open();
            
            // create a command to check if the emailid exist
            using ( SqlCommand cmd = new SqlCommand("select count(*) from Registration where email = @email", con))
            {
                cmd.Parameters.AddWithValue("@email", email.Text);
                exists = (int)cmd.ExecuteScalar() > 0;
            }

            // if exists, show a message error
            if (exists)
                SetError(emailid, "This email id is already in use.");
            else
            {
                SetError(emailid, "");
            }

            con.Close();
        }

        protected void TextBox7_TextChanged(object sender, EventArgs e)
        {

            bool exists = false;
            // create a command to check if the username exists
            con.Open();
            using (SqlCommand cmd = new SqlCommand("select count(*) from Registration where UserName = @UserName", con))
            {
                cmd.Parameters.AddWithValue("@UserName", TextBox7.Text);
                exists = (int)cmd.ExecuteScalar() > 0;
            }

            // if exists, show a message error

            if (exists)
            {
                SetError(username, "This username has been using by another user.");
            }
            else
            {
                SetError(username, "");
            }

           
            con.Close();
        }
    }
}