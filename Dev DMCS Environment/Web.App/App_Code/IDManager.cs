using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

class IDManager
{

    public IDManager()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public static string SeatOrder(string str, SqlParameter parms)
    {
        //string str=Convert.ToString(TextBox1.Text);
        string[] tempstr = new string[100];
        string[] ch = new string[100];
        int[] tempint = new int[100];
        int i = 0, j, k, l, lengthstr;
        ch = str.Split(',');
        lengthstr = ch.Length;
        if (ch[lengthstr - 1] == "")
        {
            lengthstr--;
        }
        do
        {

            tempstr[i] = ch[i].Substring(0, 1);
            l = ch[i].Length;
            tempint[i] = Convert.ToInt32(ch[i].Substring(1, l - 1));
            i++;

        }
        while (i < lengthstr);
        for (j = 0; j < lengthstr; j++)
        {
            for (k = j + 1; k < lengthstr; k++)
            {
                if (tempint[j] > tempint[k])
                {
                    i = tempint[j];
                    tempint[j] = tempint[k];
                    tempint[k] = i;
                    str = tempstr[j];
                    tempstr[j] = tempstr[k];
                    tempstr[k] = str;
                }
            }
        }
        str = tempstr[0] + tempint[0];
        for (j = 1; j < lengthstr; j++)
        {
            str = str + ',' + tempstr[j] + tempint[j];
        }
        return str;
    }

    public static string getDate(string datemonth)
    {
        try
        {
            string date, month, year, Textboxvalue, Resultdate;
            string[] splitter;
            Textboxvalue = datemonth;
            splitter = Textboxvalue.Split('/');

            date = splitter[0];
            month = splitter[1];
            year = splitter[2];
            Resultdate = month + "/" + date + "/" + year;
            return Resultdate;

        }
        catch (Exception ex)
        {
            string message = ex.Message;
            throw ex;
        }
    }

    public static int CallNonQueryProcedure(string ProcudereName)
    {
        try
        {


            string ConnectionString = connection();
            SqlConnection Conn = new SqlConnection(ConnectionString);

            Conn.Open();

            SqlCommand cmd = new SqlCommand(ProcudereName, Conn);

            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.ExecuteReader();

            //cmd.CommandText =ProcudereName;
            return 0;
        }
        catch (Exception ex)
        {
            return 1;
        }

    }

    public static DataTable CallQueryProcedure(string ProcudereName)
    {
        DataTable rows = new DataTable();

        try
        {

            string ConnectionString = connection();
            SqlConnection Conn = new SqlConnection(ConnectionString);


            SqlCommand cmd = new SqlCommand(ProcudereName, Conn);

            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            Conn.Open();


            SqlDataReader rdr = cmd.ExecuteReader();

            rows.Load(rdr);

            //cmd.CommandText =ProcudereName;
            return rows;
        }
        catch (Exception ex)
        {
            return rows;
        }

    }

    public static DataTable CallQueryProcedure(string ProcudereName, string username, string PW)
    {
        DataTable rows = new DataTable();
        SqlParameter parm = new SqlParameter();
        SqlParameter parm1 = new SqlParameter();

        try
        {

            string ConnectionString = connection();
            SqlConnection Conn = new SqlConnection(ConnectionString);


            SqlCommand cmd = new SqlCommand(ProcudereName, Conn);

            parm.ParameterName = "@UserName";
            parm.Value = username;
            cmd.Parameters.Add(parm);

            parm1.ParameterName = "@password";
            parm1.Value = PW;
            cmd.Parameters.Add(parm1);

            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            Conn.Open();

            SqlDataReader rdr = cmd.ExecuteReader();

            rows.Load(rdr);

            //cmd.CommandText =ProcudereName;
            return rows;
        }
        catch (Exception ex)
        {
            return rows;
        }

    }

    public static DataTable CallQueryProcedure(string ProcudereName, SqlParameterCollection Parms)
    {
        DataTable rows = new DataTable();

        try
        {

            string ConnectionString = connection();
            SqlConnection Conn = new SqlConnection(ConnectionString);


            SqlCommand cmd = new SqlCommand(ProcudereName, Conn);

            foreach (SqlParameter parmrow in Parms)
            {
                cmd.Parameters.Add(parmrow.ParameterName, parmrow.Value);
            }

            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            Conn.Open();

            SqlDataReader rdr = cmd.ExecuteReader();

            rows.Load(rdr);

            //cmd.CommandText =ProcudereName;
            return rows;
        }
        catch (Exception ex)
        {
            return rows;
        }

    }

    public static string ConvertDateFormat(string OneWayDate)
    {
        DateTime SysOneWayDate = Convert.ToDateTime(OneWayDate);
        string SysOneWayDate1 = SysOneWayDate.ToString("MM/dd/yyyy");
        return SysOneWayDate1;
    }

    public static string connection()
    {
        string ConnectionString1 = "";
        ConnectionStringSettings cstLcal;
        cstLcal = ConfigurationManager.ConnectionStrings["DefaultConnection"];
        ConnectionString1 = cstLcal.ConnectionString;

        return ConnectionString1;
    }

}
