using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _181052N_AS_assignment_
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try {
                if (Request.QueryString["UserName"] != null)
                {
                    welcomealert.Text = "Welcome " + Request.QueryString["UserName"].ToString();
                }

            }
            catch (Exception ex)
            {
                Homelabel.Text = ex.Message.ToString();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)

        {

            Response.Write("<script>alert('Successfully Logged Out');window.location.href='Login.aspx'</script>");

            //Response.Redirect("Home.aspx");
        }

    }
}