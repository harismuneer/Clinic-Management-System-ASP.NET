<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="DBProject.SignUp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <title>MedicX 4 Health Care Login &amp; Register</title>


 <script type="text/javascript">


     //----------------------Function1-----------------------------//
     function validateEmail(Email)
     {
         if (Email == "") {
             alert("Email missing. Enter Email.");
             return false;
         }

         else if (Email.indexOf("@") == -1 || Email.indexOf(".com") == -1) {
             alert("Your email address seems incorrect. Please enter a new one.");
             return false;
         }

         else {
             var location = Email.indexOf("@");

             if (Email[0] == '@' || Email[location + 1] == '.') {
                 alert("Your email address seems incorrect. Please enter a new one.");
                 return false;
             }

             var emailPat = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
             var EmailmatchArray = Email.match(emailPat);

             if (EmailmatchArray == null) {
                 alert("Your email address seems incorrect. Please enter a new one.");
                 return false;
             }
         }

         return true;
     }






     //----------------------Function2-----------------------------//
     function validateS() 
     {
         var Name      = document.getElementById('<%=sName.ClientID %>').value;
         var Bdate     = document.getElementById('<%=sBirthDate.ClientID %>').value;
         var Email     = document.getElementById('<%=sEmail.ClientID %>').value;
         var phone     = document.getElementById('<%=Phone.ClientID %>').value;
         var pass      = document.getElementById('<%=sPassword.ClientID %>').value;
         var cpass     = document.getElementById('<%=scPassword.ClientID %>').value;
         
         /*now the validation code*/

         if (Name == "")
         {
             alert("Name missing. Enter Name.");
             return false;
         }


         var arrDbirth = Bdate.split("-");

         if (Bdate == "")
         {
             alert("Birth Date missing. Enter Birth Date.");
             return false;
         }

         else if ((Bdate == arrDbirth[0]) || (arrDbirth[0].length != 2) || arrDbirth[1].length != 2 || arrDbirth[2].length != 4 || !arrDbirth[0].match(/^[0-9]*$/) || !arrDbirth[1].match(/^[0-9]*$/) || !arrDbirth[2].match(/^[0-9]*$/) || Number(arrDbirth[0]) > 31 || Number(arrDbirth[1]) > 12)
         {
             alert("Birth Date Format Incorrect or out of Range.");
             return false;
         }


         if (!validateEmail(Email))
             return false;


         if (pass == "" || cpass == "")
         {
             alert("Password field is empty.");
             return false;
         }

         else if (pass != cpass)
         {
             alert("Passwords do not match.");
             return false;
         }
            

         if (phone.length != 11)
         {
             alert("Phone number should be of 11 digits.");
             return false;
         }


         if (Request.Form["Gender"] == null)
         {
             alert("Gender not selected.");
             return false;
         }
        
         return true;
     }





     //----------------------Function2-----------------------------//
     function validateL() 
     {
         var Email        = document.getElementById('<%=loginEmail.ClientID %>').value;
         var Password     = document.getElementById('<%=loginPassword.ClientID %>').value;
         
         /*now the validation code*/

         if (!validateEmail(Email))
             return false;


         if (Password == "")
         {
             alert("Password missing. Enter Password.");
             return false;
         }

         return true;
     }

     //------------------------------------------------------------------//
     //------------------------------------------------------------------//
     //------------------------------------------------------------------//

</script>


    <!-- CSS -->
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500"/>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="assets/font-awesome/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="assets/css/form-elements.css"/>
    <link rel="stylesheet" href="assets/css/style.css"/>

    <!-- Favicon and touch icons -->
    <link rel="shortcut icon" href="assets/ico/favicon.png"/>
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="assets/ico/apple-touch-icon-144-precomposed.png"/>
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="assets/ico/apple-touch-icon-114-precomposed.png"/>
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="assets/ico/apple-touch-icon-72-precomposed.png"/>
    <link rel="apple-touch-icon-precomposed" href="assets/ico/apple-touch-icon-57-precomposed.png"/>

    
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>


    <!-- Javascript -->
    <script src="assets/js/jquery-1.11.1.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/js/jquery.backstretch.min.js"></script>
    <script src="assets/js/scripts.js"></script>

</head>



<body>

    <form id="SignUpPage" runat ="server"  >
				       
        <div>    
        <!-- Top content -->
             	                                
        <div class="top-content"> 
            <div class="inner-bg">
               <div class="container">
                    
                   <div class="row">
                         <div class="col-sm-8 col-sm-offset-2 text">
                        
                            <h1><strong>MedicX 4 Health Care</strong> Login &amp; Registration Form</h1>
                            
                            <div class="description">
                            	<p>
	                            	This is a free <strong>"Login and Registration form"</strong> for Health Care Clinic. 
                            	</p>                            
                            </div>
                        </div>
                    </div>

                    
                    <div class="row">
                        <div class="col-sm-5">
                            <div class="form-box">
                                <div class="form-top">
                                    <div class="form-top-left">
	                        		
                                        <h3>Login to our Website</h3>
	                            		<p>Enter Email and Password to log in:</p>

	                        		</div>
	                        		
                                    <div class="form-top-right">
	                        			<i class="fa fa-key"></i>
	                        		</div>
	                           </div>
	                            
                                
                                
                                <div class="form-bottom">
				                    
                                <!-- login start here -->
                                            
                                <div class="form-group">
				                    		
                                    <asp:TextBox ID="loginEmail" runat="server" type="text" class="form-username form-control" placeholder="Email" ></asp:TextBox>
           
                                </div>

				                <div class="form-group">
				                        	
                                    <asp:TextBox ID="loginPassword" runat="server" type="password" class="form-username form-control" placeholder="Password"></asp:TextBox>
           
                                </div>
				                 
                                 <asp:button ID="loginUserName"  runat="server"  type="submit" Text="Login"  class="btn btn-primary" OnClientClick="return validateL();"   onclick="loginV"></asp:button>
				                   
                                   
			                    <!--login ends here -->
                                
                                </div>

		                    </div>
		                

		                	<div class="social-login">
	                        	<h3>...or login with:</h3>
	                        	<div class="social-login-buttons">
		                        	<a class="btn btn-link-1 btn-link-1-facebook" href="#">
		                        		<i class="fa fa-facebook"></i> Facebook
		                        	</a>
	                        	</div>
	                        </div>
	                        
                        </div>
                        

                        <div class="col-sm-1 middle-border"></div>
                        <div class="col-sm-1"></div>
                        	
                        <div class="col-sm-5">
                        	
                        	<div class="form-box">
                        		<div class="form-top">
	                        		<div class="form-top-left">
	                        			<h3>Sign up now</h3>
	                            		<p>Fill in the form below to get instant access:</p>
	                        		</div>
	                        		<div class="form-top-right">
	                        			<i class="fa fa-pencil"></i>
	                        		</div>
	                            </div>


	                            <div class="form-bottom">
				                    
                                    
                                    
                        <!-- sign up form start honay laga hai :)-->
                                    
                                    
                            <div class="form-group">
			               
                                <asp:TextBox ID="sName" runat="server" type="text" class="form-username form-control" placeholder="Name" ></asp:TextBox>
                                                       	                            
                            </div> 

				            <div class="form-group">
				                        	
                                <asp:TextBox ID="sBirthDate" runat="server" type="text" class="form-username form-control" placeholder="Birth Date (dd-mm-yyyy)" ></asp:TextBox>
           	                            
                            </div>

				            <div class="form-group">
				            
                                    <asp:TextBox ID="sEmail" runat="server" type="text" class="form-username form-control" placeholder="Email : person@example.com" ></asp:TextBox>

                            </div>

                            <div class="form-group">
				                        
                                    <asp:TextBox ID="sPassword" runat="server" type="password" class="form-username form-control" placeholder="Enter New Password" ></asp:TextBox>

                            </div>


                            <div class="form-group">
                                             				                        
                                    <asp:TextBox ID="scPassword" runat="server" type="password" class="form-username form-control" placeholder="Confirm Password" ></asp:TextBox>

                            </div>


                            <div class="form-group">
            
                                    <asp:TextBox ID="Phone" runat="server" type="text" class="form-username form-control" placeholder="Phone Number (11 Digits)" ></asp:TextBox>

                            </div>
                                    
                            <div class="form-group">

                                 <input type="radio" name="Gender" value="M" id="test" checked="checked" />
                                  Male
                                 <input type="radio" name="Gender" value="F" />
                                  Female

                            </div>


                            <div class="form-group">
                                				                        
                                <asp:TextBox id="Address" placeholder ="Address" TextMode="multiline" Columns="40" Rows="10" runat="server" Height="75px" Width="410px" />
        
                            </div>

				            <asp:button Text ="SignUp"  runat="server" type="submit" class="btn btn-primary" OnClientClick="return validateS();" onclick="signupV"></asp:button>
				                    
                                    
                    <!-- sign up ends here -->
                                            
                               </div>
                           </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
 

        <!-- Footer -->
        <footer>
        	<div class="container">
        		<div class="row">
        			
        			<div class="col-sm-8 col-sm-offset-2">
        				<div class="footer-border"></div>
        				<p>If you have any query, please feel free to contact us. <i class="fa fa-smile-o"></i></p>
                    </div>
        			
        		</div>
        	</div>
        </footer>

       
        </div>
    </form>


</body>
</html>
