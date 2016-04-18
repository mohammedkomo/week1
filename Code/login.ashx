<%@ WebHandler Language="C#" Class="login" %>

using System;
using System.Web;
using System.Data;
public class login : IHttpHandler, System.Web.SessionState.IRequiresSessionState
 {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        DBaseConnect db = new DBaseConnect();
        string sql = "";

        string id = (context.Request["id"] != null) ? context.Request["id"] : "";
        string pass = (context.Request["pass"] != null) ? context.Request["pass"] : "";


        sql = "Select * From Customer where CustomerID='" + id + "' and password='" + pass + "'";
        string msg = "";
        DataTable tb = db.ExecuteData(sql);
        
        if (tb!= null && tb.Rows.Count >0)
        {
            msg = "1//welcome " + tb.Rows[0]["CustomerName"].ToString();
            context.Session["id"] = id;
            context.Session["name"] = tb.Rows[0]["CustomerName"].ToString();
        }
        else
        {
             msg = "0//the user id or password is wrong";
        }
        context.Response.Write(msg);  
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}