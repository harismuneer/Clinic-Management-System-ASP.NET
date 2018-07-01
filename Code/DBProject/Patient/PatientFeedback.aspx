<%@ Page Title="" Language="C#" MasterPageFile="~/Patient/PatientMaster.Master" AutoEventWireup="true" CodeBehind="PatientFeedback.aspx.cs" Inherits="DBProject.PatientFeedback" %>





<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <title>Feedback</title>

</asp:Content>





<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <h1><strong style="margin:37%">Feedback</strong></h1>
    <br /><br />

    <div style="margin-left: 70px">

    <asp:Label ID="Feedback" runat="server"  Font-Bold="true" Font-Size="Medium"></asp:Label>
    <br /><br />

    <asp:Label ID="FDoctor" runat="server" Font-Bold="true" Font-Size="Medium"></asp:Label>
    <br /><br />

    <asp:Label ID="FTimings" runat="server"  Font-Bold="true" Font-Size="Medium"></asp:Label>
    <br /><br />

    <br /><br />
    <asp:Label ID="Message" runat="server" Visible="false"  Font-Bold="true" Font-Size="Medium">Dear Patient, How was your treatment experience with our specialized Doctor on a rating of 1 - 5:</asp:Label>


    <div  style="margin-left: 790px">
        <asp:DropDownList ID="List"  runat="server" Visible="false" Font-Bold ="true"  >
            <asp:ListItem>1</asp:ListItem>
            <asp:ListItem>2</asp:ListItem>
            <asp:ListItem>3</asp:ListItem>
            <asp:ListItem>4</asp:ListItem>
            <asp:ListItem>5</asp:ListItem>
        </asp:DropDownList>

        <br /><br />

        <asp:Button ID="button1" runat="server" Visible="false" OnClick="giveFeedback"  Text ="Give Feedback" Font-Bold ="true" />
       
        <br /><br />
        <asp:Label ID="F" runat="server" Font-Bold="true" Font-Size="Medium"></asp:Label>

     </div>


     <br /><br />
    </div>

</asp:Content>
