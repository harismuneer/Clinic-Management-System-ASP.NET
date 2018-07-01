 <%@ Page Language="C#" AutoEventWireup="true" UnobtrusiveValidationMode="None"  CodeBehind ="DoctorRegistrationForm.aspx.cs" Inherits="DB_Project.DoctorRegistrationForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title></title>

<style type = "text/css">
  
   

    html
    {
      background-image:url("/assets/Doctor.jpg");   
      background-size: cover;
      background-position: 0 -90px;
      background-attachment: fixed;
    }
    body {
        background: none !important;
    }
    .backstretch {
        display: none !important;
    }

    .grad{

  background: linear-gradient(to right, rgba(30, 160, 130 , 0.15),rgba(0, 148, 255 , 1)); 
  border-radius:8px;
}
 
  #space
  {
    padding-bottom:50px;
  }

    
    
    </style>

</head>
<body>
    <form id="form1" runat="server">
      
        
        <div id ="myclass">    
        
        
        
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500"/>
        <link rel="stylesheet" href="/assets/bootstrap/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="/assets/font-awesome/css/font-awesome.min.css"/>
        <link rel="stylesheet" href="/assets/css/form-elements.css"/>
        <link rel="stylesheet" href="/assets/css/style.css"/>
        

            



        <!-- Top content -->
             	                   
                      
        <div class="top-content">
       
            
            <div class="inner-bg">
            
                <div class="container grad">
                
                    

                    <div class="row">
                    
                        <div class="col-sm-8 col-sm-offset-2 text">
                        
                            <h1><strong>Medix4 Health Care</strong> Doctor Registration</h1>
                            
                            <div class="description">
                            	<p>
	                            	This is a free <strong>"Doctor registeration form"</strong> for Medix4 health Care. 
	                            	Fill out the information of the Doctor to Register 
	                            	
                                    
                            	</p>
                            
                            </div>
                        </div>

                    </div>
                    </div>
                   </div>
            </div>
        
                                    
                                    
                                    
                                    <!--  Doctor registration form start honay laga hai :)-->
                                    
                                    <div class="container myclass">

                                       
                                        <div class ="row">

                                                      
                        
                        <div class="col-sm-2"></div>
                        	
                            <div class="col-sm-8">
                        	
                            	<div class="form-box" id="spaces">
                        		<div class="form-top">
	                        		<div class="form-top-left">
	                        			<h3>Sign up now 
                                            
                                        </h3>
                                        
                                        <asp:Label ID="Msg" runat="server" ForeColor="Blue" Visible="False" Font-Bold="True" Font-Size="Large" Font-Strikeout="False" ></asp:Label>

	                        		</div>
	                            </div>
	                            <div class="form-bottom">
				                    
                                    
                                    
                                    
                                    <!-- sign up form start honay laga hai :)-->
                                    
                                    
                                        <div class="form-group">
			                                  
                                            
                                         
                                            <asp:RequiredFieldValidator ID="NameValidator" runat="server" ErrorMessage="* Required" Display="dynamic" Font-Bold="False" SetFocusOnError="True" ControlToValidate="Name" ForeColor="Red"></asp:RequiredFieldValidator>            	                                       
                                            <asp:TextBox ID="Name" runat="server" type="text" class="form-username form-control" placeholder="Name" ></asp:TextBox>
                                        
                                      
                                        </div> 
				                        <div class="form-group">
				                        	

                                            <asp:RequiredFieldValidator runat="server" ErrorMessage="*Required" ControlToValidate="BirthDate" ID="BDateReqiured" Display="Dynamic" Font-Bold="False" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>

                                            <asp:RegularExpressionValidator ID="BirthDateValidator" runat="server" ErrorMessage="Birth Date Format Not Correct" ControlToValidate="BirthDate" Display="Dynamic" ValidationExpression="((?:0[1-9])|(?:1[0-2]))\/((?:0[0-9])|(?:[1-2][0-9])|(?:3[0-1]))\/(\d{4})" ForeColor="Red" SetFocusOnError="True"></asp:RegularExpressionValidator>
                                            <asp:TextBox ID="BirthDate" runat="server" type="text" class="form-username form-control" placeholder="Birht Date (mm/dd/yyyy)" ></asp:TextBox>
           	                            
                                        </div>
				                        <div class="form-group">
				                        
                                            <asp:RegularExpressionValidator ID="EmailformatValidator" runat="server" ErrorMessage="Incorrect Email Format" Display="Dynamic" ControlToValidate="Email" SetFocusOnError="True" ValidationExpression="(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|&quot;(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*&quot;)@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4][0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9][0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])" ForeColor="Red"></asp:RegularExpressionValidator>

                                                
                                            <asp:CustomValidator runat="server" Display="Dynamic" ControlToValidate="Email"    ID="DoctorValidate"  
                                                ForeColor="Red" ErrorMessage="" OnServerValidate="ValidateDoctorEmail" SetFocusOnError="True"></asp:CustomValidator>   
                                            
                                             <asp:RequiredFieldValidator runat="server" ErrorMessage="*Required" ControlToValidate="Email" ID="RequiredFieldValidator3" Display="Dynamic" Font-Bold="False" ForeColor="Red"></asp:RequiredFieldValidator>


                                            <asp:TextBox ID="Email" runat="server" type="text" class="form-username form-control" placeholder="Email : person@example.com" ></asp:TextBox>
                                                
                                                
                                            


                                        </div>


                                        <div class="form-group">
				                        
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*Required" ControlToValidate="Password" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                   
                                    <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Passwords Do not Match " ControlToValidate="Password" ControlToCompare="cPassword" Display="Dynamic" ForeColor="Red"></asp:CompareValidator>

                                            
                                            
                                            <asp:TextBox ID="Password" runat="server" type="password" class="form-username form-control" placeholder="Enter New Password" ></asp:TextBox>

                                        </div>



                                         <div class="form-group">
                                        
                                                 
                                                <asp:TextBox ID="cPassword" runat="server" type="password" class="form-username form-control" placeholder="Confirm Password" ></asp:TextBox>

                                        </div>


                                         <div class="form-group">

                                             <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Numbers Only !" ControlToValidate="Phone" ValidationExpression='^[0-9]+$' Font-Strikeout="False" Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>
                                                <asp:TextBox ID="Phone" runat="server" type="text" class="form-username form-control" placeholder="Phone Number " ></asp:TextBox>

                                        </div>


                                             <asp:RegularExpressionValidator ID="RegularExpressionValidatorp" runat="server" ErrorMessage="Numbers Only !" ControlToValidate="Salary" ValidationExpression='^[0-9]+$' Font-Strikeout="False" Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>
                                    
                                                      <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Numbers Only !" ControlToValidate="Charges_per_visit" ValidationExpression='^[0-9]+$' Font-Strikeout="False" Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>
                                    
                             <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="Experience Range should be (0-5)" MinimumValue="0" MaximumValue="5" Type="Integer" ControlToValidate="Exp" Display="Dynamic" ForeColor="Red"></asp:RangeValidator>   



                                         <div class="form-group">

				                        
                                             
                                             <asp:TextBox ID="Salary" runat="server" type="text"  placeholder="Salary in Rupees" Width="221px" ></asp:TextBox>

                                                <asp:TextBox ID="Charges_per_visit" runat="server" type="text"  placeholder="Charges_per_visit in Rupees" Width="227px" ></asp:TextBox>
                                             <asp:TextBox ID="Exp" runat="server" type="text"  placeholder="Experience (0-5)" Width="229px" ></asp:TextBox>
                                        
                                        </div>




                                     <asp:CustomValidator runat="server" Display="Dynamic" ControlToValidate="Email"    ID="DV"  
                                                ForeColor="Red" ErrorMessage=""  OnServerValidate="DepartmentValidate" SetFocusOnError="True"></asp:CustomValidator>  

                                         <div class="form-group">

                                            
                                             <asp:DropDownList ID="Department" runat="server" Width="228px" Height="39px">
                                            
                                                 <asp:ListItem Text="Select Depatment" Value="0"></asp:ListItem>
                                                 <asp:ListItem Text="Cardiology" Value="1"></asp:ListItem>
                                                 <asp:ListItem Text="Orthopaedics" Value="2"></asp:ListItem>
                                                 <asp:ListItem Text="ENT" Value="3"></asp:ListItem>
                                                 <asp:ListItem Text="Physiotherapy" Value="4"></asp:ListItem>
                                                 <asp:ListItem Text="Neurology" Value="5"></asp:ListItem>
                                             
                                             </asp:DropDownList>
                                                                                        
                                             <asp:TextBox ID="Qualification" runat="server" type="text"  placeholder="Qualification" Width="228px" ></asp:TextBox>
                                             <asp:TextBox ID="spec" runat="server" type="text"  placeholder="Specialization" Width="228px" ></asp:TextBox>
                                                
                                             
                                        </div>


                                    
                                    
                                        <div class="form-group">
                                        
                                    
                                         <asp:TextBox ID="Address" runat="server" class="form-username form-control" type="text"  placeholder="Address" ></asp:TextBox>

                                        

                                        </div>




                                    
                                         <div class="form-group">

                                                <asp:RadioButton name="Gender"  id="Male" GroupName="Gender" runat="server" Text="Male" checked="true" value ="M" />
                                                            
                                                <asp:RadioButton name="Gender"  id="Female" GroupName="Gender" runat="server" Text="Female" value ="F" />

                                        </div>


                                    




				                        <asp:button Text ="Add"  runat="server" type="submit" class="btn btn-primary" onclick="DoctorRegister" ></asp:button>
				                <!-- onclick="signup" -->
                                        
                                    
                                <!-- sing up ends here -->
                                            
                                    
                                    

			                    
                                
                                
                                
                                
                                
                                
                                
                                </div>
                        	</div>
                        	
                        </div>
                    </div>
                    
                </div>
            </div>
            


                                    

        





            

        <!-- Footer -->
        <footer ">
        	<div class="container">
        		<div class="row">
        			
        			<div class="col-sm-8 col-sm-offset-2">
        				<div class="footer-border"></div>
        				<p style="color:darkslategrey">if You have Any Query
        					Please Feel Free to Contact US. <i class="fa fa-smile-o"></i></p>
        			
                   
                    
                    </div>
        			
        		</div>
        	</div>
        </footer>

        <!-- Javascript -->
        <script src="/assets/js/jquery-1.11.1.min.js"></script>
        <script src="/assets/bootstrap/js/bootstrap.min.js"></script>
        <script src="/assets/js/jquery.backstretch.min.js"></script>
        <script src="/assets/js/scripts.js"></script>
        
        <!--[if lt IE 10]>
            <script src="assets/js/placeholder.js"></script>
        <![endif]-->







     
    
    
    </form>
</body>
</html>
