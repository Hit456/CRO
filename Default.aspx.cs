using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    [WebMethod]
    public static Dictionary<string, string> getData()
    {
        Dictionary<string,string> dctData = new Dictionary<string,string>();
        dctData.Add("name","Hitesh");
        dctData.Add("surname","Prajapati");
        return dctData;
        //Comment
        //Branch Comment
    }
}
