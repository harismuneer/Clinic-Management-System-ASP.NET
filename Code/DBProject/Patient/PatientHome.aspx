<%@ Page Title="" Language="C#" MasterPageFile="~/Patient/PatientMaster.Master" AutoEventWireup="true" CodeBehind="PatientHome.aspx.cs" Inherits="DBProject.PatientHome" %>




<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

<title>Patient's Home</title>

</asp:Content>




<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    
    <div style="background-image:url(/assets/img/backgrounds/PatientHome.jpg); background-position:center; background-size:20px">

        <br />
        <h1><strong style="margin:37%">Your Information</strong></h1>
        <br /><br />

        <div style="margin-left: 70px">

            <h4><strong>Name: </strong></h4>
            <asp:Label ID="PName" runat="server" Font-Bold="true" Font-Size="Medium"></asp:Label>
            <br /><br />

            <h4><strong>Phone: </strong></h4>
            <asp:Label ID="PPhone" runat="server"  Font-Bold="true" Font-Size="Medium"></asp:Label>
            <br /><br />

            <h4><strong>Birth Date: </strong></h4>
            <asp:Label ID="PBirthDate" runat="server"  Font-Bold="true" Font-Size="Medium"></asp:Label>
            <br /><br />

            <h4><strong>Age: </strong></h4>
            <asp:Label ID="PatientAge" runat="server" Font-Bold="true" Font-Size="Medium"></asp:Label>
            <br /><br />

            <h4><strong>Gender:</strong></h4>
            <asp:Label ID="PGender" runat="server" Font-Bold="true" Font-Size="Medium"></asp:Label>
            <br /><br />

            <h4><strong>Address: </strong></h4>
            <asp:Label ID="PAddress" runat="server"  Font-Bold="true" Font-Size="Medium"></asp:Label>
            <br /><br />

        </div>

    </div>

</asp:Content>
