using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace Curd_Operation
{
    
    public partial class Default : System.Web.UI.Page
    {
        SqlConnection connection = new SqlConnection("Data Source=DESKTOP-KAEBEC0\\SQLEXPRESS;Initial Catalog=Curdsystem;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                ShowData();
            }
        }


        //display data in gridview
        public void ShowData()
        {
            if(connection.State==ConnectionState.Open)
            {
                connection.Close();
            }
            connection.Open();

            SqlCommand GetVal = new SqlCommand("select * from [user]", connection);
            // GetVal.ExecuteNonQuery();
           
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = GetVal;
            da.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
            connection.Close();

        }


        //click edit button in gridview
        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            ShowData();
        }


        //cancel edit in gridview
        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            ShowData();
        }


        //update row in gridview
        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            Label id = GridView1.Rows[e.RowIndex].FindControl("id") as Label;
            TextBox txtName = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtName");
            TextBox txtEmail = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtEmail");
            TextBox txtAddress = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtAddress");
            TextBox txtPhone = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtPhone");
            connection.Open();
            SqlCommand UpdateVal = new SqlCommand("Update [user] set Name=@Name,Email=@Email,Addrress=@Address,Phone=@Phone where id=@id", connection);

            UpdateVal.Parameters.AddWithValue("@Name", txtName.Text);
            UpdateVal.Parameters.AddWithValue("@id", Convert.ToInt32(id.Text));
            UpdateVal.Parameters.AddWithValue("@Email", txtEmail.Text);
            UpdateVal.Parameters.AddWithValue("@Address", txtAddress.Text);
            UpdateVal.Parameters.AddWithValue("@Phone", txtPhone.Text);

            UpdateVal.ExecuteNonQuery();
            GridView1.EditIndex = -1;
            ShowData();
            connection.Close();
        }


        // delete row from gridview
        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Label id = GridView1.Rows[e.RowIndex].FindControl("id") as Label;
            connection.Open();
            SqlCommand DeleteVal = new SqlCommand("Delete from [user] where id=@id", connection);
            DeleteVal.Parameters.AddWithValue("@id", Convert.ToInt32(id.Text));

            DeleteVal.ExecuteNonQuery();
            ShowData();
            connection.Close();

        }

     
        // delete button
        protected void dlt_Click(object sender, EventArgs e)
        {
            connection.Open();
            SqlCommand DeleteAll = new SqlCommand("Delete from [user]", connection);
           

            DeleteAll.ExecuteNonQuery();
            ShowData();
            connection.Close();
        }


       //cancel delete button
        protected void cancelDel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }


        // cancel the add button
        protected void cancelAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }

        // add new record...  
        protected void addnew_Click(object sender, EventArgs e)
        {
            connection.Open();
            SqlCommand addVal = new SqlCommand("INSERT into [user](Name,Email,Addrress,Phone) values(@Name,@Email,@Addrress,@Phone)", connection);

            addVal.Parameters.AddWithValue("@Name", TextName.Text);
            addVal.Parameters.AddWithValue("@Email", TextEmail.Text);
            addVal.Parameters.AddWithValue("@Addrress", TextAddress.Text);
            addVal.Parameters.AddWithValue("@Phone", TextPhone.Text);

            addVal.ExecuteNonQuery();
            TextName.Text = "";
            TextEmail.Text = "";
            TextAddress.Text = "";
            TextPhone.Text = "";

            Response.Redirect("Default.aspx");
            ShowData();
        }

        /** protected void delete_Click(object sender, EventArgs e)
         {
             ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "$('#adddtl').modal();", true);
         }**/
    }
}