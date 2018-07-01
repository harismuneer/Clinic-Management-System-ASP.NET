<%@ Page Title="" Language="C#" MasterPageFile="~/Doctor/doctormaster.Master" AutoEventWireup="true" CodeBehind="HistoryUpdate.aspx.cs" Inherits="doctor.Historyupdate" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

<title>Update History</title>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Cp1" runat="server">

<h1>Update history  </h1>

<h4>Disease:</h4><asp:TextBox ID="Disease" runat="server"></asp:TextBox>
   <h4>Progress:</h4> <asp:TextBox ID="progress" runat="server"></asp:TextBox>
    <h4>Prescription</h4><asp:TextBox ID="Prescription" runat="server"></asp:TextBox>
    <br />
      <br />
      <br />

    <asp:Button ID="submit" runat="server" Text="Accept & Save" Onclick="saveindatabase" Font-Bold="true" />  
    <asp:Button ID="Bill" runat="server" Text="Generate Bill" OnClick="generate_bill" Font-Bold ="true" />

</asp:Content>
