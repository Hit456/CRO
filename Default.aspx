<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title></title>
    <script src="Scripts/angular.min.js"></script>
    <script src="Scripts/Script.js"></script>
    <link href="Content/EZAMasterPageStyle.css" rel="stylesheet" />
    <link href="Content/GridNew.css" rel="stylesheet" />
    <script src="Scripts/Factory.js"></script>
</head>
<body ng-app="myModule">
    <form id="form1" runat="server" ng-controller="myController">
        <div>
            {{message}}
            <br />
            {{myData}}
            <br />
            {{intervalData}}
            <br />
            {{myLocation}}
        </div>
        <br />
        <asp:TextBox runat="server" ng-model="searchText" />
        <input type="number" min="1" max="{{employees.length}}" ng-model="pageSize" />
        <div>
            <div ng-click="prevClick()" style="display: inline-block;cursor:pointer"><<</div>&nbsp;&nbsp;&nbsp;
            <div ng-click="nextClick()" style="display: inline-block;cursor:pointer">>></div>
        </div>
        <table class="Grid">
            <tr>
                <th width="20px" ng-click="showHideAll();" style="cursor:pointer;">{{!showAll?"+":"-"}}</th>
                <th width="25%" ng-click="sortClick('name')" style="cursor:pointer">Name</th>
                <th width="25%" ng-click="sortClick('gender')" style="cursor:pointer">Gender</th>
                <th width="25%" ng-click="sortClick('age')" style="cursor:pointer">Age</th>
                <th ng-click="sortClick('joinDate')" style="cursor:pointer">Join Date</th>
            </tr>
            <tr>
                <td colspan="5">
                    <div ng-repeat="employee in employees | filter: searchItem | limitTo: pageSize:itemStart | orderBy: sortColumn: reverseOrder">
                        <table width="100%" class="tbl_brdr">
                            <tr class="col_2_1">
                                <td width="15px" ng-click="showEmployeeDetails(employee)" style="cursor:pointer">{{!employee.showDetail?"+":"-"}}</td>
                                <td width="25%">{{employee.name}}                     
                                </td>
                                <td width="25%">{{employee.gender | genderFilter}}</td>
                                <td width="25%">{{employee.age}}</td>
                                <td>{{employee.joinDate}}</td>
                                </tr>
                            <tr ng-show="employee.showDetail">
                                 <td></td>
                                    <td colspan="4">
                                        <table width="100%">
                                            <tr>
                                                <th width="40%">
                                                    Name
                                                </th>
                                                <th width="40%">
                                                    Gender
                                                </th>
                                                <th>
                                                    Age
                                                </th>
                                            </tr>
                                        </table>
                                        </td>
                            </tr>
                                <tr id="{{employee.ID}}" ng-repeat="subemployee in subemployees | filter: subSearch(employee.ID)" class="col_1_1" ng-show="employee.showDetail">
                                    <td></td>
                                    <td colspan="4">
                                        <table width="100%">
                                            <tr>
                                                <td width="40%">
                                                    {{subemployee.name}}
                                                </td>
                                                <td width="40%">
                                                    {{subemployee.gender | genderFilter}}
                                                </td>
                                                <td>
                                                    {{subemployee.age}}
                                                </td>
                                            </tr>
                                        </table>
                                        </td>
                                </tr>
                        </table>
                    </div>
                </td>
            </tr>

        </table>
        <input type="button" ng-click="getResult(5,6)" value="multi"/>
       <input type="text" ng-model="result" />
    </form>
</body>
</html>
