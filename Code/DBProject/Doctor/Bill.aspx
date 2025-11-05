<%@ Page Title="Generate Bill" Language="C#" MasterPageFile="~/Doctor/doctormaster.Master"
    AutoEventWireup="true" CodeBehind="Bill.aspx.cs" Inherits="doctor.bill" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Generate Bill</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="Cp3" runat="server">
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-lg-6 col-md-8 col-sm-10">
                <div class="card shadow-lg border-0 rounded-4">
                    <div class="card-body p-5 text-center">
                        <h2 class="fw-bold mb-4 text-primary">Appointment Bill</h2>
                        
                        <p class="fs-5 text-muted mb-4">
                            Your total bill for this appointment is:
                        </p>

                        <h3 class="fw-bold text-dark mb-5">
                            ₹ <asp:Label ID="Label1" runat="server" CssClass="text-success fw-bold"></asp:Label>
                        </h3>

                        <div class="d-flex justify-content-center gap-4">
                            <asp:Button 
                                ID="Bill" 
                                runat="server" 
                                Text="Mark as Paid" 
                                CssClass="btn btn-success btn-lg px-4 shadow-sm" 
                                OnClick="bill_paid" />

                            <asp:Button 
                                ID="Button1" 
                                runat="server" 
                                Text="Mark as Unpaid" 
                                CssClass="btn btn-outline-danger btn-lg px-4 shadow-sm" 
                                OnClick="bill_Unpaid" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <style>
        body {
            background-color: #f8f9fa;
        }
        .card {
            animation: fadeInUp 0.6s ease-in-out;
        }
        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
    </style>
</asp:Content>
