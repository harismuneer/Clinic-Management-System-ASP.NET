<%@ Page Title="" Language="C#" MasterPageFile="~/Doctor/doctormaster.Master" AutoEventWireup="true" CodeBehind="Bill.aspx.cs" Inherits="doctor.bill" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

<title>Generate Bill</title>

</asp:Content>



<asp:Content ID="Content4" ContentPlaceHolderID="Cp3" runat="server">



    <h1>Your Bill For this Appointment is :      <asp:Label ID="Label1" runat="server" Text="Label" Font-Bold="true" Font-Size="Medium" ></asp:Label> </h1>
   
     <br />
     <br />
     <br />
     <br />
     <br />
     <br />
     <br />
     <br />
     <br />
     <br />
     <br />
     <br />
     <br />
     <br />
     <br />


    &nbsp&nbsp&nbsp&nbsp<asp:Button ID="Bill" runat="server" Text="Bill Paid" OnClick="bill_paid" Font-Bold ="true" />
   

     &nbsp&nbsp&nbsp&nbsp<asp:Button ID="Button1" runat="server" Text="Bill Unpaid" OnClick="bill_Unpaid" Font-Bold ="true" />
   




</asp:Content>
