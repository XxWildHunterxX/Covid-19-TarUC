<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MainPage.aspx.cs" Inherits="Covid_19_TarUC.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Malaysia - Statistics | COVID-19 | Malaysia Outbreak Monitor </title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" type="text/css" href="Styles/main.css" />
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="Styles/gridview.css" />
    <script src="JS/mainPage.js"></script>

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
                    <h2>Malaysia - Statistics 
            <label style="padding-left:54.7%;">Search By Case: </label>
                    <input type="text" id="myInput" onkeyup="myFunction()" placeholder="Search for names.." title="Type in a name" />
     
                        
   </h2>
                        <asp:GridView ID="datagrid" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="caseID" OnPageIndexChanging="OnPaging"
                        CssClass="mydatagrid" PagerStyle-CssClass="pager" HeaderStyle-CssClass="header" RowStyle-CssClass="rows">
                            <Columns>

                                <asp:BoundField DataField="caseID" HeaderText="CASE" InsertVisible="False" ReadOnly="True" SortExpression="caseID" />
                                <asp:BoundField DataField="age" HeaderText="AGE" SortExpression="age" />
                                <asp:BoundField DataField="gender" HeaderText="GENDER" SortExpression="gender" />
                                <asp:BoundField DataField="nationality" HeaderText="NATIONALITY" SortExpression="nationality" />                             
                                <asp:BoundField DataField="situationName" HeaderText="STATUS" SortExpression="situation" />                              
                                <asp:BoundField DataField="confirmedDate" HeaderText="CONFIRMED DATE" SortExpression="confirmedDate" />
                                <asp:BoundField DataField="recoveredDate" HeaderText="RECOVERED DATE" SortExpression="recoveredDate" />
                                <asp:BoundField DataField="deceasedDate" HeaderText="DECEASED DATE" SortExpression="deceasedDate" />
                                <asp:BoundField DataField="hospitalName" HeaderText="HOSPITAL" SortExpression="hospital" />
                                <asp:BoundField DataField="remark" HeaderText="REMARK" SortExpression="remark" />
                            </Columns>
                        </asp:GridView>

    </div>

                </div>
                    </div>
                <div class="middlePageBottom">
                    <div class="container">
                        
                        
                   <div class="col-sm-12 col-lg-3">
                        <div class="col-sm-6 col-lg-3" style="width:50%; float:left;">

                            <div class="card p-3">
                                <div class="d-flex align-items-center">
                            <span class="stamp stamp-md bg-red mr-3">
                                <i class="fa fa-globe">
                                </i>
                            </span>
            <div class="stats_data">
                <h1 class="m-0">
                    <asp:Label ID="confirmed" runat="server" Text=""></asp:Label>
                    <small>Confirmed</small>

                </h1>
            </div> 
                                    </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-lg-3" style="width:50%; float:right;">

                            <div class="card p-3">
                                <div class="d-flex align-items-center">
                            <span class="stamp stamp-md bg-yellow mr-3">
                                <i class="fa fa-globe">
                                </i>
                            </span>
            <div class="stats_data">
                <h1 class="m-0">
                    <asp:Label ID="treatment" runat="server" Text=""></asp:Label>
                    <small>In Treatment</small>

                </h1>
            </div> 
                                    </div>
                            </div>
                        </div>
                       </div>
                        <div class="col-sm-12 col-lg-3" >
                        <div class="col-sm-6 col-lg-3" style="width:50%; float:left;">

                            <div class="card p-3">
                                <div class="d-flex align-items-center">
                            <span class="stamp stamp-md bg-grey mr-3">
                                <i class="fa fa-globe">
                                </i>
                            </span>
            <div class="stats_data">
                <h1 class="m-0">
                    <asp:Label ID="death" runat="server" Text=""></asp:Label>
                    <small>Death</small>

                </h1>
            </div> 
                                    </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-lg-3" style="width:50%; float:right;">

                            <div class="card p-3">
                                <div class="d-flex align-items-center">
                            <span class="stamp stamp-md bg-green mr-3">
                                <i class="fa fa-globe">
                                </i>
                            </span>
            <div class="stats_data">
                <h1 class="m-0">
                    <asp:Label ID="recovered" runat="server" Text=""></asp:Label>
                    <small>Recovered</small>

                </h1>
            </div> 
                                    </div>
                            </div>
                        </div>
                            </div>
                        <div class="col-md-7" style="float:left; width:58%;" >

                            <div class="card">
                               <div class="card-header">

                                   <h1 class="card-title">

                                       <strong>Cases by States</strong>


                                   </h1>
                                   <div class="card-options">

                                       <script> document.write(new Date().toLocaleDateString('en-GB')); </script>

                                   </div>


                                   
                               </div>

                                <asp:PlaceHolder ID="caseState" runat="server" />

                            </div>
                        



                        </div>
                        <div class="col-md-5" style="float:right; width:40%;">

                            <div class="card">
                               <div class="card-header">

                                   <h1 class="card-title">

                                       <strong>Hospital Available For Covid-19</strong>


                                   </h1>
                                   
                               </div>
                                <div class="gridView1Place" style="width:100%;">
                                <asp:GridView ID="gridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" OnPageIndexChanging="OnPagingHospital">
                                    <Columns>
                                        <asp:BoundField DataField="Hospital" HeaderText="Hospital" SortExpression="Hospital" />
                                        <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
                                    </Columns>
                                </asp:GridView>
                                    </div>
                            </div>
                        
                         <asp:Button ID="addCases" runat="server" Text="Add New Cases" OnClick="ButtonCliked" CssClass="w3-button w3-ripple w3-black" />



                        </div>


</div>
                </div>
                
            </div>

        </form>

</body>
</html>
