using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions; // for Regular expression
using System.Drawing; // for change of color
using System.Security.Cryptography;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Net;
using System.IO;
using System.Web.Script.Serialization;
using System.Web.Services;

namespace AppSecAss2
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        string MYDBConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["MYDBConnection"].ConnectionString;
        static string finalHash;
        static string salt;
        byte[] Key;
        byte[] IV;
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        private int checkPassword(string password)
        {
            int score = 0;
            if (password.Length < 8)
            {
                return 1; 
            }
            else
            {
                score = 1;
            }
            if (Regex.IsMatch(password, "[a-z]"))
            {
                score++;
            }
            if (Regex.IsMatch(password, "[A-Z]"))
            {
                score++;
            }
            if (Regex.IsMatch(password, "[0-9]"))
            {
                score++;
            }
            if (Regex.IsMatch(password, "[!@#$%^&*]"))
            {
                score++;
            }

            return score;
        }

        protected void btn_checkPassword_Click(object sender, EventArgs e)
        {
            // implement codes for the button event
            // Extract data from textbox
            int scores = checkPassword(tbPassword.Text);
            string status = "";
            switch (scores)
            {
                case 1:
                    status = "Very Weak";
                    break;
                case 2:
                    status = "Weak";
                    break;
                case 3:
                    status = "Medium";
                    break;
                case 4:
                    status = "Strong";
                    break;
                case 5:
                    status = "Very Strong";
                    break;
                default:
                    break;
            }
            lblPasswordchecker.Text = "Status : " + status;
            if (scores < 4)
            {
                lblPasswordchecker.ForeColor = Color.Red;
                return;
            }
            lblPasswordchecker.ForeColor = Color.Green;

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (String.IsNullOrEmpty(tbFname.Text))
            {
                lblFnamechecker.ForeColor = Color.Red;
                lblFnamechecker.Text = "Please fill in your first name!";
                return;
            }
            if (String.IsNullOrEmpty(tbEmail.Text))
            {
                lblEmailchecker.ForeColor = Color.Red;
                lblEmailchecker.Text = "Please fill in your Email!";
                return;
            }
            if (String.IsNullOrEmpty(tbDob.Text))
            {
                lblDobchecker.ForeColor = Color.Red;
                lblDobchecker.Text = "Please fill in your birthdate!";
                return;
            }
            if (String.IsNullOrEmpty(tbCreditcard.Text))
            {
                lblCreditchecker.ForeColor = Color.Red;
                lblCreditchecker.Text = "Please fill in your credit card number!";
                return;
            }
            if (String.IsNullOrEmpty(tbPassword.Text))
            {
                lblPasswordchecker3.ForeColor = Color.Red;
                lblPasswordchecker3.Text = "Please fill in your password!";
                return;
            }
            if (String.IsNullOrEmpty(tbPasswordconfirm.Text))
            {
                lblPasswordconfirm2.ForeColor = Color.Red;
                lblPasswordconfirm2.Text = "Please confirm your password!";
                return;
            }
            else
            {
                lblFnamechecker.Text = "";
                lblEmailchecker.Text = "";
                lblDobchecker.Text = "";
                lblCreditchecker.Text = "";
                lblPasswordchecker3.Text = "";
                lblPasswordconfirm2.Text = "";
                //string pwd = get value from your Textbox
                string pwd = tbPassword.Text.ToString().Trim(); ;
                //Generate random "salt"
                RNGCryptoServiceProvider rng = new RNGCryptoServiceProvider();
                byte[] saltByte = new byte[8];
                //Fills array of bytes with a cryptographically strong sequence of random values.
                rng.GetBytes(saltByte);
                salt = Convert.ToBase64String(saltByte);
                SHA512Managed hashing = new SHA512Managed();
                string pwdWithSalt = pwd + salt;
                byte[] plainHash = hashing.ComputeHash(Encoding.UTF8.GetBytes(pwd));
                byte[] hashWithSalt = hashing.ComputeHash(Encoding.UTF8.GetBytes(pwdWithSalt));
                finalHash = Convert.ToBase64String(hashWithSalt);
                RijndaelManaged cipher = new RijndaelManaged();
                cipher.GenerateKey();
                Key = cipher.Key;
                IV = cipher.IV;
                createAccount();
                Session["LoggedIn"] = tbEmail.Text.Trim();
                Response.Redirect("Home.aspx");
            }
        }

        public void createAccount()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(MYDBConnectionString))
                {
                    using (SqlCommand cmd = new SqlCommand("INSERT INTO Account VALUES(@Email, @FirstName, @LastName, @DOB, @CreditCard, @PasswordHash, @PasswordSalt, @EmailVerified)"))
                {
                        using (SqlDataAdapter sda = new SqlDataAdapter())
                        {
                            cmd.CommandType = CommandType.Text;
                            cmd.Parameters.AddWithValue("@Email", tbEmail.Text.Trim());
                            cmd.Parameters.AddWithValue("@FirstName", tbFname.Text.Trim());
                            cmd.Parameters.AddWithValue("@LastName", tbLname.Text.Trim());
                            cmd.Parameters.AddWithValue("@DOB", tbDob.Text.Trim());
                            cmd.Parameters.AddWithValue("@CreditCard", encryptData(tbCreditcard.Text.Trim()));
                            cmd.Parameters.AddWithValue("@PasswordHash", finalHash);
                            cmd.Parameters.AddWithValue("@PasswordSalt", salt);
                            cmd.Parameters.AddWithValue("@EmailVerified", DBNull.Value);
                            cmd.Connection = con;
                            con.Open();
                            cmd.ExecuteNonQuery();
                            con.Close();
                        }
                    }
                }

            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
        }

        protected byte[] encryptData(string data)
        {
            byte[] cipherText = null;
            try
            {
                RijndaelManaged cipher = new RijndaelManaged();
                cipher.IV = IV;
                cipher.Key = Key;
                ICryptoTransform encryptTransform = cipher.CreateEncryptor();
                //ICryptoTransform decryptTransform = cipher.CreateDecryptor();
                byte[] plainText = Encoding.UTF8.GetBytes(data);
                cipherText = encryptTransform.TransformFinalBlock(plainText, 0,
               plainText.Length);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            finally { }
            return cipherText;
        }

        /* public class MyObject
        {
            public string success { get; set; }
            public List<string> ErrorMessage { get; set; }
        }
        public bool ValidateCaptcha()
        {
            bool result = true;
            string captchaResponse = Request.Form["g-recaptcha-response"];
            HttpWebRequest req = (HttpWebRequest)WebRequest.Create("https://www.google.com/recaptcha/api/siteverify?secret=6LfNCksaAAAAALf40ZGDO3vuFaC4sB3W7UADxzPZ &response=" + captchaResponse);

            try
            {
                using (WebResponse wResponse = req.GetResponse())
                {
                    using (StreamReader readStream = new StreamReader(wResponse.GetResponseStream()))
                    {
                        string jsonResponse = readStream.ReadToEnd();
                        lbl_gScore.Text = jsonResponse.ToString();
                        JavaScriptSerializer js = new JavaScriptSerializer();
                        MyObject myObject = js.Deserialize<MyObject>(jsonResponse);
                        result - Convert.ToBoolean(jsonObject.success);
                    }
                }
                return result;
            }
            catch (WebException ex)
            {
                throw ex;
            }
        }*/







    }
}