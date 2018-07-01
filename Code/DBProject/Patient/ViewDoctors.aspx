<%@ Page Title="" Language="C#" MasterPageFile="~/Patient/PatientMaster.Master" AutoEventWireup="true" CodeBehind="ViewDoctors.aspx.cs" Inherits="DBProject.ViewDoctors" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

            <title>Doctors</title>

</asp:Content>




<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


       
    <!------------------Styling------------------>
    <link rel="stylesheet" href="/assets/css/grid-view.css"/>



    <h1><strong style="margin:23%">Select a Doctor to view his Profile</strong></h1>
    <br /><br />

    <asp:Label ID="TDoctor" runat="server"></asp:Label>
    <br /><br />

    <asp:GridView ID="TDoctorGrid" runat="server" class = "GridView-d" CellPadding="4" ForeColor="Black" GridLines="Vertical" Width="1000px"
        EnableViewState ="False"
        AutoGenerateSelectButton="True" 
        OnRowCommand="TDoctorGrid_RowCommand" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px"
     
        >

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
          
        <Columns>
            <asp:TemplateField HeaderText = "No." ItemStyle-Width="50">
                <ItemTemplate>
                    <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                </ItemTemplate>

            <ItemStyle Width="50px"></ItemStyle>
            </asp:TemplateField>
        </Columns>


    </asp:GridView>

    <br /><br />


</asp:Content>
