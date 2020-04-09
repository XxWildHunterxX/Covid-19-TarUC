<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddCases.aspx.cs" Inherits="Covid_19_TarUC.AddCases" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Malaysia - Statistics | COVID-19 | Malaysia Outbreak Monitor </title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" type="text/css" href="Styles/main.css" />
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link rel="stylesheet" type="text/css" href="Styles/gridview.css" />

</head>
<body>
        <form id="form1" runat="server">
        <div class="page">
            <div class="page-main">
                <div class="headerPage">
                    <div class="container">
                        <div class="d-flex">
                            <a class ="header-brand" href="MainPage.aspx">
                                <svg class="gradient-text" fill="url(#pattern-evozi") width="8em" height="1.8em" style="vertical-align: middle;">
                                    <pattern id="pattern-evozi" patternUnits="userSpaceOnUse" width="8em" height="1.8em">
                                        <rect width="100%" height="100%" fill="url(#gradient-evozi)"></rect>
                                    </pattern>
                                    <text y="1em" font-size="1.5em" font-weight="700">Outbreak</text>
                                    <text x="8em" y="1.85em" font-size="0.8em" font-weight="400">.MY</text>
                                </svg>
                            </a>
                        
                        </div>
                        
                    </div>
                    
                </div>

                <div class="navigator">
                    <div class="container">
                        <ul class="nav">
                            <li class="nav-item">
                                <a href="MainPage.aspx" class="nav-link">
                                    <i class="fa fa-lg fa-home">
                                         Home
                                    </i>
                                    
                                </a>


                            </li>


                        </ul>


                    </div>


                </div>

                
                <div class="middlePage">
                    <div class="container">
                    <h2>Malaysia - Add Cases </h2>

                        <table class="addTable">
                            <tr>
                                <td class="addTable2">
                        <asp:Label id="age" runat="server" Text="Age:" />
                            <asp:TextBox id="txtAge" runat="server" CssClass="textInput" />

                     <asp:RegularExpressionValidator ID="rev_Age" ControlToValidate="txtAge" runat="server" ForeColor="Red"
                         ErrorMessage="*Only Numbers allowed!" ValidationExpression="\d+">
                    </asp:RegularExpressionValidator>
</td>
                                <td class="addTable2">
                        <asp:Label id="gender" runat="server" Text="Gender:" />
                            <asp:dropdownlist runat="server" id="ddlGender">
                                <asp:listitem Selected="True" text="Select" value="-"></asp:listitem>
                            <asp:listitem text="Male" value="Male"></asp:listitem>
                             <asp:listitem text="Female" value="Female"></asp:listitem>

                        </asp:dropdownlist>
                                    </td>
                                <td class="addTable2">
                        <asp:Label id="nationality" runat="server" Text="Nationality:" />
                        <asp:DropDownList ID="ddlNationality" runat="server">
                        </asp:DropDownList>
                     <asp:RequiredFieldValidator runat="server" id="rfvNationality" controltovalidate="ddlNationality" ForeColor="Red" errormessage="*Required" InitialValue="-" />
                                </td>
                                </tr>
                            <tr>
                                
                                <td class="addTable2">
                        <asp:Label id="status" runat="server" Text="Status:" />
                        <asp:DropDownList ID="ddlStatus" runat="server">
                        </asp:DropDownList>
                                    <asp:RequiredFieldValidator runat="server" id="rfvStatus" controltovalidate="ddlStatus" ForeColor="Red" errormessage="*Required" InitialValue="-" />
                                    </td>
                                <td class="addTable2">
                        <asp:Label id="hospital" runat="server" Text="Hospital:" />
                        <asp:DropDownList ID="ddlHospital" runat="server">
                        </asp:DropDownList>
                                    <asp:RequiredFieldValidator runat="server" id="rfvHospital" controltovalidate="ddlHospital" ForeColor="Red" errormessage="*Required" InitialValue="-" />
</td>
                                <td class="addTable2">
                        <asp:Label id="remark" runat="server" Text="Remark:" />
                        <asp:TextBox id="txtRemark" TextMode="multiline" Columns="50" Rows="5" runat="server" />
                                    </td>
                                </tr>
                      </table>
    </div>

                </div>
                <div class="w3-panel">
                    <asp:Label id="lblMessage" runat="server" Text=""  CssClass="font-green"/>
  <asp:Button ID="addCases" runat="server" Text="Add New Cases" OnClick="ButtonCliked" CssClass="w3-button w3-block w3-black" />
</div>
                    </div>
                
            </div>

        </form>

</body>
</html>
