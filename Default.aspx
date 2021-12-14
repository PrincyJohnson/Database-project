<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent">
        <script src="Scripts/bootstrap-3.1.1.min.js"></script>
    <link href="Styles/bootstrap-3.1.1.min.css" rel="stylesheet" />
    <script src="Script/jquery.min.js"></script>
    <script src="Script/jquery-ui.js"></script>
    <link href="Styles/jquery-ui.css" rel="stylesheet" />
    <section class="featured">
        <div class="content-wrapper">
            <hgroup class="title">
              
                <h1>Enhanced Search.</h1>
            </hgroup>
            <p>
                
            </p>
        </div>
    </section>

</asp:Content>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">

     <div>

        
          <div class="col-md-3">
                   <p>
                       <label >Search Criteria</label>
                   
                        <asp:DropDownList ID="ddlCriteria" runat="server" CssClass="form-control" >

                            <asp:ListItem Value="">--Select Criteria--</asp:ListItem>
                                        <asp:ListItem Value="SubjID"> SubjID </asp:ListItem>
                                        <asp:ListItem Value="FDH_40q_ADHD_Male_Sib"> FDH_40q_ADHD_Male_Sib </asp:ListItem>
                                        <asp:ListItem Value="FDH_40q_ADHD_Fem_Sib">FDH_40q_ADHD_Fem_Sib</asp:ListItem>
                                        <asp:ListItem Value="FDH_40b_Alcohol_prob_total">FDH_40b_Alcohol_prob_total</asp:ListItem>
                                        <asp:ListItem Value="FDH_40c_drug_prob_total">FDH_40c_drug_prob_total</asp:ListItem>
                                        <asp:ListItem Value="FDH_40q_ADHD_Total">FDH_40q_ADHD_Total</asp:ListItem>
                                        <asp:ListItem Value="FDH_40r_juv_diabetes_total">FDH_40r_juv_diabetes_total</asp:ListItem>
                                        <asp:ListItem Value="FDH_40s_Brain_cancer_total">FDH_40s_Brain_cancer_total</asp:ListItem>
                                         <asp:ListItem Value="Gender"> Gender </asp:ListItem>
                                      
                        </asp:DropDownList>
                   </p>
                </div>

         <div class="col-md-3"> 
                   <p>
                       <label >Condition</label>
                   
                        <asp:DropDownList ID="ddlsearch" runat="server"  CssClass="form-control">

                           <asp:ListItem Value="">--Select Conditions--</asp:ListItem>
                                        <asp:ListItem Value=" >= "> Greater than or Equal to </asp:ListItem>
                                        <asp:ListItem Value="<=">Less than or Equal to </asp:ListItem>
                                        
                                        <asp:ListItem Value="=">Equals to</asp:ListItem>
                                        <asp:ListItem Value="Like">Like</asp:ListItem>
                                       
                        </asp:DropDownList>
                   </p>
                </div>

           
          <div class="col-md-3">
                    <p>
                        <label>Search Value</label>
                        <asp:TextBox ID="txt_Search" runat="server" Width="80%" CssClass="form-control"></asp:TextBox>
                    </p>
                </div>
               
                <br />
                <br />
            </div>
    <div align="center">
                <p>
                    <br />
                    <asp:Button ID="btnSearch" OnClick="btnSearch_Click" OnClientClick="return validatesearch" runat="server" class="btn btn-primary" Text="Show Results" />
                    
                   
                </p>
            </div>

    <div id="Table17">

       <h4> <label >Count : </label>
        <asp:Label ID="lblcount" Text ="" runat="server"  ></asp:Label></h4>


                        <asp:GridView ID="GrdSearch" AutoPostBack="true" runat="server" AutoGenerateColumns="False"
                            AllowPaging="true" PageSize="10"  EmptyDataRowStyle-ForeColor="Black"
                            EmptyDataText="No Records Found" ToolTip="Enter Financial Details"  OnPageIndexChanging="GrdSearch_PageIndexChanging"
                            class="table table-bordered" BackColor="Gainsboro" BorderColor="Black">
                            <PagerStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#0275d3" ForeColor="White" />
                            <Columns>
                                <asp:BoundField HeaderText="SubJID" DataField="SubJID" ItemStyle-HorizontalAlign="Left" />
                                           
                                <asp:BoundField HeaderText="Age_at_NpExam" DataField="Age_at_NpExam" ItemStyle-HorizontalAlign="Right" />
                                <asp:BoundField HeaderText="Age_At_IMGExam" DataField="Age_At_IMGExam" ItemStyle-HorizontalAlign="Right" />
                                <asp:BoundField HeaderText="Gender" DataField="Gender" ItemStyle-HorizontalAlign="Right" />
                                   <asp:BoundField HeaderText="FDH_Respondent_Relation" DataField="FDH_Respondent_Relation" ItemStyle-HorizontalAlign="Right" />
                                   <asp:BoundField HeaderText="FDH_Guardian_1_Relation" DataField="FDH_Guardian_1_Relation" ItemStyle-HorizontalAlign="Right" />
                                  
                                <asp:BoundField HeaderText="FDH_5_Birth_by" DataField="FDH_5_Birth_by" ItemStyle-HorizontalAlign="Right" />
                                
                            </Columns>
                        </asp:GridView>
                                   
                                  
                                </div>
   
</asp:Content>