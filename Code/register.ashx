<%@ WebHandler Language="C#" Class="register" %>

using System;
using System.Web;

public class register : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        DBaseConnect db = new DBaseConnect();
        string sql = "";

        string id = (context.Request["id"] != null) ? context.Request["id"] : "";
        string name = (context.Request["name"] != null) ? context.Request["name"] : "";
        string phone = (context.Request["phone"] != null) ? context.Request["phone"] : "";
        string email = (context.Request["email"] != null) ? context.Request["email"] : "";
        string pass = (context.Request["pass"] != null) ? context.Request["pass"] : "";
        string address = (context.Request["address"] != null) ? context.Request["address"] : "";

        sql = "insert into Customer(CustomerID,CustomerName,Phone,Email,password,Address) values('" + id + "','" + name + "','" + phone + "','" + email + "','" + pass + "','" + address + "')";
        string msg = "";
        if (db.ExecuteSQL(sql))
        {
            msg = " the register done";
        }
        else
        {
            msg = "the Register is wrong try again ";
        }
        context.Response.Write(msg);
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}