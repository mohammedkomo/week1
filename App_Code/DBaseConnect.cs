using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
/// <summary>
/// Summary description for DBaseConnect
/// </summary>
public class DBaseConnect
{
     SqlConnection conn=new SqlConnection ();
	public DBaseConnect()
	{
       try
       {
        string connstr = @"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\water.mdf;Integrated Security=True;User Instance=True";
        //string connstr = @"Data Source=watertank.mssql.somee.com;Initial Catalog=watertank;Persist Security Info=True;User ID=komo499_SQLLogin_1;Password=xxtcbjdrgl;
           conn.ConnectionString = connstr;
        conn.Open();
       }
       catch (Exception ex) 
       { 
           Console.WriteLine(ex.Message);
       }
        
	}

    //--------------
    public bool ExecuteSQL(string sql)
    {
        bool done = false;
        try
        {
            SqlCommand cmm = new SqlCommand(sql, conn);
            cmm.ExecuteNonQuery();
            done = true;
        }
        catch (Exception ex)
        {
            Console.WriteLine(ex.Message);
        }
        return done;
    }
    //--------------
    public DataTable ExecuteData(string sql)
    {
        DataTable done = null;
        try
        {
            SqlDataAdapter da = new SqlDataAdapter(sql, conn);
            DataSet dset = new DataSet();
            da.Fill(dset);
            done = dset.Tables[0];
        }
        catch (Exception ex)
        {
            Console.WriteLine(ex.Message);
        }
        return done;
    }
}