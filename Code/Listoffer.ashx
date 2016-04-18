<%@ WebHandler Language="C#" Class="Listoffer" %>

using System;
using System.Web;
using System.Data;
public class Listoffer : IHttpHandler, System.Web.SessionState.IRequiresSessionState
{
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        DBaseConnect db = new DBaseConnect();
        string sql = "";
        string oid = context.Session["id"].ToString();
        string id = (context.Request["id"] != null) ? context.Request["id"] : "";
        string command = (context.Request["command"] != null) ? context.Request["command"] : "";
        string msg = "";
        if (command == "reservation")
        {
            sql = "insert into CustomerOrder(CustomerID,schID) values('" + oid + "','" + id + "')";
            if (db.ExecuteSQL(sql))
            {
                msg = " the add  done";
            }
            else
            {
                msg = "the add is wrong try again ";
            }
        }

        sql = "select * From Schfree where free>0 and schDate>='" + DateTime.Now.Date.ToString("MM/dd/yyyy") + "'";
        DataTable dt = db.ExecuteData(sql);
        if (dt != null)
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                msg += "//" + dt.Rows[i]["SchID"].ToString();
                msg += "++" +DateTime.Parse( dt.Rows[i]["schDate"].ToString()).Date.ToString("MM/dd/yyyy");
                msg += "++" + dt.Rows[i]["price"].ToString();
                msg += "++" + dt.Rows[i]["AreaName"].ToString();
                msg += "++" + dt.Rows[i]["TypeName"].ToString();
                msg += "++" + dt.Rows[i]["IntervalName"].ToString();
                
            }
        }
        context.Response.Write(msg);
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}