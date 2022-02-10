using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _10_Stored_Procedure_Banche
{
    class Program
    {
        private static readonly string CONNECTION_STRING = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=D:\Desktop\Scuola\Quinta\INFO2\info-playground-giordanopaolo-1\SQL\10_Stored_Procedure_Banche\10_Stored_Procedure_Banche\Banche.mdf;Integrated Security=True;Connect Timeout=30";

        static void Main(string[] args)
        {
            richiama1(3);
            richiama2("sassari");
        }

        private static void richiama2(string v)
        {
            using (SqlConnection con = new SqlConnection(CONNECTION_STRING))
            {
                con.Open();
                string sql = "[Visulizza]";

                using (SqlCommand cmd = new SqlCommand(sql, con))
                {
                    SqlParameter data = new SqlParameter();
                    data.ParameterName = "comune";

                    data.Value = v;
                    data.Direction = ParameterDirection.Input;
                    data.DbType = DbType.String;
                    cmd.Parameters.Add(data);

                    cmd.CommandType = CommandType.StoredProcedure;

                    SqlDataReader reader = cmd.ExecuteReader();
                    string s = "";
                    while (reader.Read())
                    {
                        

                        for (int i = 0; i < reader.FieldCount; i++)
                        {
                            s += reader.GetValue(i) + " ";
                        }
                    }
                    Console.WriteLine(s);
                }
            }
        }

        static void richiama1(int numero)
        {
            using (SqlConnection con = new SqlConnection(CONNECTION_STRING))
            {
                con.Open();
                string sql = "[Procedure]";

                using (SqlCommand cmd = new SqlCommand(sql, con))
                {
                    SqlParameter data = new SqlParameter();
                    data.ParameterName = "numero";

                    data.Value = numero;
                    data.Direction = ParameterDirection.Input;
                    data.DbType = DbType.Int32;
                    cmd.Parameters.Add(data);

                    cmd.CommandType = CommandType.StoredProcedure;

                    SqlDataReader reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        string s = "";

                        for (int i = 0; i < reader.FieldCount; i++)
                        {
                            s += reader.GetValue(i) + " ";
                        }
                    }
                }
            }
        }
    }
}
