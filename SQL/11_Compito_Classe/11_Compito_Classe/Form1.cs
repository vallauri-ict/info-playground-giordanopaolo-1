using Microsoft.VisualBasic;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace _11_Compito_Classe
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }
        private static readonly string CONNECTION_STRING = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=D:\Desktop\Scuola\Quinta\INFO2\info-playground-giordanopaolo-1\SQL\11_Compito_Classe\Db.mdf;Integrated Security=True;Connect Timeout=30";

        private void Form1_Load(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(CONNECTION_STRING))
            {
                con.Open();
                string sql = "[Procedure]";
                string v = Interaction.InputBox("Dimmi la classe");
                using (SqlCommand cmd = new SqlCommand(sql, con))
                {
                    SqlParameter data = new SqlParameter();
                    data.ParameterName = "Classe";

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
                    MessageBox.Show(s);
                }
            }
        }
    }
}
