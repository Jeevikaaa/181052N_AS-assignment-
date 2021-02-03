using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.IO;
using System.Web.Script.Serialization;
using System.Web.Services;

using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;

namespace _181052N_AS_assignment_
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ViewState["loginAttemt"] = "0";
            }
           
        }

        public bool ValidateCaptcha()
        {
            bool result = true;

            //When user submits the recaptcha form, the user gets a response POST paramaeter.
            //captchaResponse consist of the user click pattern. Behaviour analytics! AI :)
            string captchaResponse = Request.Form["g-recaptcha-response"];

            //To send a GET reponse to Google along with the response and Secret key.
            HttpWebRequest req = (HttpWebRequest)WebRequest.Create
                ("https://www.google.com/recaptcha/api/siteverify?secret=6Lfx8jwaAAAAAGcsACKT103eMev3_FDgFr3XtvAy &response=" + captchaResponse);

            try
            {
                //codes to recieve the Response in the JSON format from Google server
                using (WebResponse wResponse = req.GetResponse())
                {
                    using (StreamReader readStream = new StreamReader(wResponse.GetResponseStream()))
                    {
                        //The response in JSON format
                        string jsonResponse = readStream.ReadToEnd();

                        //To show the JSON response string for learning purpose
                        //lblJSON.Text = jsonResponse.ToString();


                        JavaScriptSerializer js = new JavaScriptSerializer();

                        //Create jsonObject to handle the response e.g success or Error
                        //Deseralize Json
                        MyObject jsonObject = js.Deserialize<MyObject>(jsonResponse);

                        //Convert the string to 'False' to bool false or 'True ' to bool true
                        result = Convert.ToBoolean(jsonObject.success);//


                    }
                }
                return result;

            }
            catch (WebException ex)
            {
                throw ex;
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {

            if (ViewState["loginAttemt"] != null)
            {
                int i = int.Parse(ViewState["loginAttemt"].ToString());
                if (i >= 3)
                {
                    //call the alert here after adding it in the login.aspx page
                    ViewState["loginAttemt"] = "0";
                    alertLabel.Text = "You have exceeded the available login attempts";

                }
                else
                {
                    i++;
               

            //string str_pwd = encrypttext.Encrypt(tb_pwd.Text, "b14ca5898a4e4133bbce2ea2315a1916");


            //string str_Dpwd = encrypttext.Decrypt(str_pwd, "b14ca5898a4e4133bbce2ea2315a1916");


            //  if (ValidateCaptcha())
            {
                //check for username and password (hard coede for this demo)
                if(tb_userid.Text.Trim() == "")
                {
                    alertLabel.Text = "Please enter user name";
                }
                else if (tb_userid.Text.Trim() == "")
                {
                    alertLabel.Text = "Please enter password";
                } 
                else 
                if (tb_userid.Text.Trim() != "" && tb_pwd.Text.Trim()!= "")
                {
                    Session["LoggedIn"] = tb_userid.Text.Trim();

                    //create a new GUID and save into the session
                    string guid = Guid.NewGuid().ToString();
                    Session["AuthToken"] = guid;

                    //now create a new cookie with this guid value
                    Response.Cookies.Add(new HttpCookie("AuthToken", guid));

                    SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Jeevi\source\repos\181052N_AS(assignment)\181052N_AS(assignment)\App_Data\SITConnect2.mdf;Integrated Security=True;Connect Timeout=30"); //insert the data into database

                    // string selecttext = "select * from registration where username = '" + tb_userid.Text + "' and password = '"+ encrypttext.Encrypt(tb_pwd.Text, "b14ca5898a4e4133bbce2ea2315a1916") + "'";

                    string selecttext = "select * from registration where username = '" + tb_userid.Text + "'";

                    SqlCommand cmd = new SqlCommand(selecttext);
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = con;
                    //open connection and execute it
                    con.Open();
                    SqlDataAdapter da = new SqlDataAdapter();
                    DataSet ds = new DataSet();
                    da.SelectCommand = cmd;
                    da.Fill(ds);
                     
                    if(ds != null && ds.Tables.Count >0 && ds.Tables[0].Rows.Count > 0)
                    {
                                ViewState["UserName"] = ds.Tables[0].Rows[0]["Username"].ToString();
                        //regis 
                        if (tb_pwd.Text == encrypttext.Decrypt(ds.Tables[0].Rows[0]["password"].ToString(), "b14ca5898a4e4133bbce2ea2315a1916"))
                        {
                            Response.Write("<script>alert('Logged in');window.location.href='Home.aspx?Username="+ tb_userid.Text+"'</script>");
                        }
                        else
                        {
                            //Error;
                            // Response.Redirect("Login.aspx");
                            alertLabel.Text = "username and password does not match";
                            tb_userid.Text = "";
                            tb_pwd.Text = "";
                        }

                        //Response.Redirect("Home.aspx");
                    }
                    else
                        {
                        //Error;
                        // Response.Redirect("Login.aspx");
                        alertLabel.Text = "username and password does not match";
                        tb_userid.Text = "";
                        tb_pwd.Text = "";
                    }
                                       con.Close();
                            ViewState["loginAttemt"] = i.ToString();
                        }
                    }
                }
            }
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }

        protected void pwdchange_Click(object sender, EventArgs e)
        {
            Response.Redirect("Password.aspx");

        }
    }

    public class MyObject { 
    public string success { get; set; }
    public List<string> ErrorMessage { get; set; }

    }

    //password for login (decrypted pw for Test1)
    //password: Test@1234

}
