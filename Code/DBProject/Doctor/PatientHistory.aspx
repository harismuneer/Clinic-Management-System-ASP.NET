<%@ Page Title="" Language="C#" MasterPageFile="~/Doctor/doctormaster.Master" AutoEventWireup="true" CodeBehind="PatientHistory.aspx.cs" Inherits="doctor.patienthistory" %>





<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Patient History</title>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="Cp1" runat="server">

    
    <!------------------Styling------------------>
    <link rel="stylesheet" href="/assets/css/grid-view.css"/>


     <h1><strong style="margin:25%">Today's Appointments</strong></h1>
    <br /><br />
    <div style="margin-left:150px">

    <asp:GridView ID="patientsgrid" runat="server" class = "GridView-d" CellPadding="4" ForeColor="Black" GridLines="Vertical" Width="1000px"
        EnableViewState ="False"
        AutoGenerateSelectButton="True" 
        OnRowCommand="patientsgrid_RowCommand" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px">
     
        

        <AlternatingRowStyle BackColor="White" />
        <FooterStyle BackColor="#CCCC99" />
        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
        <RowStyle BackColor="#F7F7DE" />
        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#FBFBF2" />
        <SortedAscendingHeaderStyle BackColor="#848384" />
        <SortedDescendingCellStyle BackColor="#EAEAD3" />
        <SortedDescendingHeaderStyle BackColor="#575357" />
          
    </asp:GridView>

        </div>

    
    <br />
    <br />
    <br />
    <br />
    <br />
</asp:Content>


