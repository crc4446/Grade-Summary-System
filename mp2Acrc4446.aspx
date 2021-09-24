<%@ Page Title="" Language="C#" MasterPageFile="~/MIS316/MasterPagecrc4446.master" AutoEventWireup="true" CodeFile="mp2Acrc4446.aspx.cs" Inherits="MIS316_mp2Acrc4446" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            font-size: xx-large;
        }
        .auto-style3 {
            font-size: large;
        }
        .auto-style5 {
            text-decoration: underline;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p class="auto-style1">
        <strong>Grade Summary System</strong></p>
    <asp:Panel ID="pnlContinue" runat="server">
        <table>
            <tr>
                <td>First Name:</td>
                <td>
                    <asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" ControlToValidate="txtFirstName" Display="Dynamic" ErrorMessage="* required" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>Last Name:</td>
                <td>
                    <asp:TextBox ID="txtLastName" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvLastName" runat="server" ControlToValidate="txtLastName" Display="Dynamic" ErrorMessage="* required" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>Major:</td>
                <td>
                    <asp:DropDownList ID="ddlMajor" runat="server">
                        <asp:ListItem Selected="True"></asp:ListItem>
                        <asp:ListItem>BA</asp:ListItem>
                        <asp:ListItem>IT</asp:ListItem>
                        <asp:ListItem>MIS</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfvMajor" runat="server" ControlToValidate="ddlMajor" Display="Dynamic" ErrorMessage="* required" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </td>
            </tr>
        </table>
        <br />
        <asp:Button ID="btnContinue" runat="server" OnClick="btnContinue_Click" Text="Continue" />
    </asp:Panel>
    <asp:Panel ID="pnlStartOver" runat="server" Visible="False" Width="1259px">
        <strong><span>
        <asp:Label ID="lblName" runat="server" CssClass="auto-style3" style="font-weight: 700"></asp:Label>
        &nbsp;<asp:Label ID="lblMajor" runat="server" CssClass="auto-style3"></asp:Label>
        </span><span class="auto-style5">
        <br />
        </span></strong>
        <br />
        <table aria-dropeffect="none" aria-expanded="undefined">
            <tr>
                <td aria-orientation="horizontal" style="vertical-align: top"><span class="auto-style5"><strong>Course History</strong></span> (<asp:LinkButton ID="lbAddANewCourse" runat="server" OnClick="lbAddANewCourse_Click">Add a New Course</asp:LinkButton>)
                    <asp:RadioButtonList ID="rblCourseHistory" runat="server" AutoPostBack="True" OnSelectedIndexChanged="rblCourseHistory_SelectedIndexChanged" RepeatColumns="1">
                    </asp:RadioButtonList>
                    <br />
                    <br />
                    <br />
                    <asp:Button ID="btnRemoveSelected" runat="server" Text="Remove Selected" Visible="False" Width="120px" OnClick="btnRemoveSelected_Click" />
                </td>
                <td aria-orientation="horizontal" style="vertical-align: top">
                    <asp:Panel ID="pnlAddANewCourse" runat="server" BackColor="#FFFFCC" Visible="False">
                        <table>
                            <tr>
                                <td>Course Prefix:</td>
                                <td>
                                    <asp:TextBox ID="txtCoursePrefix" runat="server" MaxLength="3"></asp:TextBox>
                                    &nbsp;<asp:RequiredFieldValidator ID="rfvCoursePrefix" runat="server" ControlToValidate="txtCoursePrefix" Display="Dynamic" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>Course Number:</td>
                                <td>
                                    <asp:TextBox ID="txtCourseNumber" runat="server" MaxLength="3"></asp:TextBox>
                                    &nbsp;<asp:RequiredFieldValidator ID="rfvCourseNumber" runat="server" ControlToValidate="txtCourseNumber" Display="Dynamic" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>Grade Earned:</td>
                                <td>
                                    <asp:DropDownList ID="ddlGradeEarned" runat="server" AutoPostBack="True">
                                        <asp:ListItem></asp:ListItem>
                                        <asp:ListItem Value="4.00">A</asp:ListItem>
                                        <asp:ListItem Value="3.67">A-</asp:ListItem>
                                        <asp:ListItem Value="3.33">B+</asp:ListItem>
                                        <asp:ListItem Value="3.00">B</asp:ListItem>
                                        <asp:ListItem Value="2.67">B-</asp:ListItem>
                                        <asp:ListItem Value="2.33">C+</asp:ListItem>
                                        <asp:ListItem Value="2.00">C</asp:ListItem>
                                        <asp:ListItem Value="1.67">C-</asp:ListItem>
                                        <asp:ListItem Value="1.33">D+</asp:ListItem>
                                        <asp:ListItem Value="1.00">D</asp:ListItem>
                                        <asp:ListItem Value="0.67">D-</asp:ListItem>
                                        <asp:ListItem Value="0.00">F</asp:ListItem>
                                    </asp:DropDownList>
                                    &nbsp;<asp:RequiredFieldValidator ID="rfvGradeEarned" runat="server" ControlToValidate="ddlGradeEarned" Display="Dynamic" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="Submit" />
                        &nbsp;<asp:Button ID="btnCancel" runat="server" OnClick="btnCancel_Click" Text="Cancel" CausesValidation="False" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </asp:Panel>
                </td>
            </tr>
            <tr>
                <td aria-orientation="horizontal"><span class="auto-style5"><strong>Summary</strong></span><table class="auto-style4">
                    <tr>
                        <td>Number of Courses:</td>
                        <td>
                            <asp:Label ID="lblNumberOfCourses" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>Current GPA:</td>
                        <td>
                            <asp:Label ID="lblCurrentGpa" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>Total Credits:</td>
                        <td>
                            <asp:Label ID="lblTotalCredits" runat="server"></asp:Label>
                        </td>
                    </tr>
                    </table>
                    *assuming all courses are 3 credits<br />
                    <br />
                    <asp:LinkButton ID="lbStartOver" runat="server" OnClick="lbStartOver_Click">Start Over</asp:LinkButton>
                    <br />
                </td>
            </tr>
        </table>
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
    </asp:Panel>
    <p>
    </p>
    <p>
    </p>
    <p>
    </p>
    <p>
    </p>
    <p>
    </p>
    <p>
    </p>
    <p>
    </p>
    <p>
    </p>
    <p>
    </p>
    <p>
    </p>
    <p>
    </p>
    <p>
    </p>
    <p>
    </p>
    <p>
    </p>
    <p>
    </p>
</asp:Content>

