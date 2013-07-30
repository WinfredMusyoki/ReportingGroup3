<!doctype html>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
<meta charset="utf-8">
<title>Spring MVC Application</title>

<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
         /*
            Document   : style.css
            Created on : Jul 29, 2013, 10:43:28 PM
            Author     : winfred
            Description:
                Purpose of the stylesheet follows.
        */

        root {
            display: block;
        }
        .span8 {
            width: 620px;
        }
        .offset2 {
            margin-left: 144px;
        }
        .control-group.warning .control-label,
        .control-group.warning .help-block,
        .control-group.warning .help-inline {
            color: #c09853;
        }

        .control-group.warning .checkbox,
        .control-group.warning .radio,
        .control-group.warning input,
        .control-group.warning select,
        .control-group.warning textarea {
            color: #c09853;
        }

        .control-group.warning input,
        .control-group.warning select,
        .control-group.warning textarea {
            border-color: #c09853;
            -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
            -moz-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
            box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
        }

        .control-group.warning input:focus,
        .control-group.warning select:focus,
        .control-group.warning textarea:focus {
            border-color: #a47e3c;
            -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 6px #dbc59e;
            -moz-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 6px #dbc59e;
            box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 6px #dbc59e;
        }

        .control-group.warning .input-prepend .add-on,
        .control-group.warning .input-append .add-on {
            color: #c09853;
            background-color: #fcf8e3;
            border-color: #c09853;
        }

        .control-group.error .control-label,
        .control-group.error .help-block,
        .control-group.error .help-inline {
            color: #b94a48;
        }

        .control-group.error .checkbox,
        .control-group.error .radio,
        .control-group.error input,
        .control-group.error select,
        .control-group.error textarea {
            color: #b94a48;
        }

        .control-group.error input,
        .control-group.error select,
        .control-group.error textarea {
            border-color: #b94a48;
            -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
            -moz-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
            box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
        }

        .control-group.error input:focus,
        .control-group.error select:focus,
        .control-group.error textarea:focus {
            border-color: #953b39;
            -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 6px #d59392;
            -moz-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 6px #d59392;
            box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 6px #d59392;
        }

        .control-group.error .input-prepend .add-on,
        .control-group.error .input-append .add-on {
            color: #b94a48;
            background-color: #f2dede;
            border-color: #b94a48;
        }

        .control-group.success .control-label,
        .control-group.success .help-block,
        .control-group.success .help-inline {
            color: #468847;
        }

        .control-group.success .checkbox,
        .control-group.success .radio,
        .control-group.success input,
        .control-group.success select,
        .control-group.success textarea {
            color: #468847;
        }

        .control-group.success input,
        .control-group.success select,
        .control-group.success textarea {
            border-color: #468847;
            -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
            -moz-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
            box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
        }

        .control-group.success input:focus,
        .control-group.success select:focus,
        .control-group.success textarea:focus {
            border-color: #356635;
            -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 6px #7aba7b;
            -moz-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 6px #7aba7b;
            box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 6px #7aba7b;
        }

        .control-group.success .input-prepend .add-on,
        .control-group.success .input-append .add-on {
            color: #468847;
            background-color: #dff0d8;
            border-color: #468847;
        }

        .control-group.info .control-label,
        .control-group.info .help-block,
        .control-group.info .help-inline {
            color: #3a87ad;
        }

        .control-group.info .checkbox,
        .control-group.info .radio,
        .control-group.info input,
        .control-group.info select,
        .control-group.info textarea {
            color: #3a87ad;
        }

        .control-group.info input,
        .control-group.info select,
        .control-group.info textarea {
            border-color: #3a87ad;
            -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
            -moz-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
            box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
        }

        .control-group.info input:focus,
        .control-group.info select:focus,
        .control-group.info textarea:focus {
            border-color: #2d6987;
            -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 6px #7ab5d3;
            -moz-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 6px #7ab5d3;
            box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 6px #7ab5d3;
        }

        .control-group.info .input-prepend .add-on,
        .control-group.info .input-append .add-on {
            color: #3a87ad;
            background-color: #d9edf7;
            border-color: #3a87ad;
        }
        .controls-row [class*="span"] + [class*="span"] {
            margin-left: 20px;
        }
        .form-horizontal .controls {
            margin-left: 0;
        }
        .controls-row [class*="span"],
        .row-fluid .controls-row [class*="span"] {
            float: left;
        }

        .controls-row .checkbox[class*="span"],
        .controls-row .radio[class*="span"] {
            padding-top: 5px;
        }
        .container {
            width: auto;
            margin-right: auto;
            margin-left: auto;
            *zoom: 1;
        }

        body{
            margin: 0px;
            padding: 0px;
            color: #333;
            font-family: Tahoma, Geneva, sans-serif;
            font-size: 13px;
            line-height: 1.5em;
            /*background-color: #424242;*/
        }
        h1 {
            font-size: 36px;
            font-weight: normal;
            margin: 0 0 30px 0;
            padding: 5px 0;
            color: #2d4173;
            text-align: center;
        }
        h2 {
            font-size: 28px;
            font-weight: normal;
            margin: 0 0 30px 0;
            padding: 0;
            color: #2d4173;
            text-align: center;
        }
        h3 {
            font-size: 21px;
            margin: 0 0 15px 0;
            padding: 0;
            color: #000;
            font-weight: normal;
            text-align: center;
        }
        h4 {
            font-size: 18px;
            margin: 0 0 15px 0;
            padding: 0;
            text-align: center;
        }
        h5 {
            font-size: 16px;
            margin: 0 0 10px 0;
            padding: 0;
            color: #333;
            text-align: center;
        }
        h6 {
            font-size: 14px;
            margin: 0 0 5px 0;
            padding: 0;
            color: #000;
            text-align: center;
        }
        #interface{
            float: left;
        }
        #sets{
            width:500px;
            padding: 3px 10px;
            position: relative;
            border-color:#98bf21;
            border-style:dotted solid;
        }
        #elements{
            width: 500px;
            padding: 3px 10px;
            border-color:#98bf21;
            border-style:dotted groove;
        }
        #concepts{
            width: 500px;
            padding: 3px 10px;
            position: relative;
            border-color:#98bf21;
            border-style:dotted solid;
        }
        #list{
            font-size: 14px;
            font-weight: normal;
            margin: 0 0 10px 0;
            padding: 0;
            color: #2d4173;
        }
        #list li{
            position:relative;
            display: block;
            text-align: center;
        }
        table {
            max-width: 100%;
            background-color: transparent;
            border-collapse: collapse;
            border-spacing: 0;
        }

        .table {
            width: 100%;
            margin-bottom: 20px;
        }

        .table th,
        .table td {
            padding: 8px;
            line-height: 20px;
            text-align: left;
            vertical-align: top;
            border-top: 1px solid #dddddd;
        }

        .table th {
            font-weight: bold;
        }

        .table thead th {
            vertical-align: bottom;
        }

        .table caption + thead tr:first-child th,
        .table caption + thead tr:first-child td,
        .table colgroup + thead tr:first-child th,
        .table colgroup + thead tr:first-child td,
        .table thead:first-child tr:first-child th,
        .table thead:first-child tr:first-child td {
            border-top: 0;
        }

        .table tbody + tbody {
            border-top: 2px solid #dddddd;
        }

        .table .table {
            background-color: #ffffff;
        }

        .table-condensed th,
        .table-condensed td {
            padding: 4px 5px;
        }

        .table-bordered {
            border: 1px solid #dddddd;
            border-collapse: separate;
            *border-collapse: collapse;
            border-left: 0;
            -webkit-border-radius: 4px;
            -moz-border-radius: 4px;
            border-radius: 4px;
        }

        .table-bordered th,
        .table-bordered td {
            border-left: 1px solid #dddddd;
        }

        .table-bordered caption + thead tr:first-child th,
        .table-bordered caption + tbody tr:first-child th,
        .table-bordered caption + tbody tr:first-child td,
        .table-bordered colgroup + thead tr:first-child th,
        .table-bordered colgroup + tbody tr:first-child th,
        .table-bordered colgroup + tbody tr:first-child td,
        .table-bordered thead:first-child tr:first-child th,
        .table-bordered tbody:first-child tr:first-child th,
        .table-bordered tbody:first-child tr:first-child td {
            border-top: 0;
        }

        .table-bordered thead:first-child tr:first-child > th:first-child,
        .table-bordered tbody:first-child tr:first-child > td:first-child,
        .table-bordered tbody:first-child tr:first-child > th:first-child {
            -webkit-border-top-left-radius: 4px;
            border-top-left-radius: 4px;
            -moz-border-radius-topleft: 4px;
        }

        .table-bordered thead:first-child tr:first-child > th:last-child,
        .table-bordered tbody:first-child tr:first-child > td:last-child,
        .table-bordered tbody:first-child tr:first-child > th:last-child {
            -webkit-border-top-right-radius: 4px;
            border-top-right-radius: 4px;
            -moz-border-radius-topright: 4px;
        }

        .table-bordered thead:last-child tr:last-child > th:first-child,
        .table-bordered tbody:last-child tr:last-child > td:first-child,
        .table-bordered tbody:last-child tr:last-child > th:first-child,
        .table-bordered tfoot:last-child tr:last-child > td:first-child,
        .table-bordered tfoot:last-child tr:last-child > th:first-child {
            -webkit-border-bottom-left-radius: 4px;
            border-bottom-left-radius: 4px;
            -moz-border-radius-bottomleft: 4px;
        }

        .table-bordered thead:last-child tr:last-child > th:last-child,
        .table-bordered tbody:last-child tr:last-child > td:last-child,
        .table-bordered tbody:last-child tr:last-child > th:last-child,
        .table-bordered tfoot:last-child tr:last-child > td:last-child,
        .table-bordered tfoot:last-child tr:last-child > th:last-child {
            -webkit-border-bottom-right-radius: 4px;
            border-bottom-right-radius: 4px;
            -moz-border-radius-bottomright: 4px;
        }

        .table-bordered tfoot + tbody:last-child tr:last-child td:first-child {
            -webkit-border-bottom-left-radius: 0;
            border-bottom-left-radius: 0;
            -moz-border-radius-bottomleft: 0;
        }

        .table-bordered tfoot + tbody:last-child tr:last-child td:last-child {
            -webkit-border-bottom-right-radius: 0;
            border-bottom-right-radius: 0;
            -moz-border-radius-bottomright: 0;
        }

        .table-bordered caption + thead tr:first-child th:first-child,
        .table-bordered caption + tbody tr:first-child td:first-child,
        .table-bordered colgroup + thead tr:first-child th:first-child,
        .table-bordered colgroup + tbody tr:first-child td:first-child {
            -webkit-border-top-left-radius: 4px;
            border-top-left-radius: 4px;
            -moz-border-radius-topleft: 4px;
        }

        .table-bordered caption + thead tr:first-child th:last-child,
        .table-bordered caption + tbody tr:first-child td:last-child,
        .table-bordered colgroup + thead tr:first-child th:last-child,
        .table-bordered colgroup + tbody tr:first-child td:last-child {
            -webkit-border-top-right-radius: 4px;
            border-top-right-radius: 4px;
            -moz-border-radius-topright: 4px;
        }

        .table-striped tbody > tr:nth-child(odd) > td,
        .table-striped tbody > tr:nth-child(odd) > th {
            background-color: #f9f9f9;
        }

        .table-hover tbody tr:hover > td,
        .table-hover tbody tr:hover > th {
            background-color: #f5f5f5;
        }

        table td[class*="span"],
        table th[class*="span"],
        .row-fluid table td[class*="span"],
        .row-fluid table th[class*="span"] {
            display: table-cell;
            float: none;
            margin-left: 0;
        }

        .table td.span1,
        .table th.span1 {
            float: none;
            width: 44px;
            margin-left: 0;
        }

        .table td.span2,
        .table th.span2 {
            float: none;
            width: 124px;
            margin-left: 0;
        }

        .table td.span3,
        .table th.span3 {
            float: none;
            width: 204px;
            margin-left: 0;
        }

        .table td.span4,
        .table th.span4 {
            float: none;
            width: 284px;
            margin-left: 0;
        }

        .table td.span5,
        .table th.span5 {
            float: none;
            width: 364px;
            margin-left: 0;
        }

        .table td.span6,
        .table th.span6 {
            float: none;
            width: 444px;
            margin-left: 0;
        }

        .table td.span7,
        .table th.span7 {
            float: none;
            width: 524px;
            margin-left: 0;
        }

        .table td.span8,
        .table th.span8 {
            float: none;
            width: 604px;
            margin-left: 0;
        }

        .table td.span9,
        .table th.span9 {
            float: none;
            width: 684px;
            margin-left: 0;
        }

        .table td.span10,
        .table th.span10 {
            float: none;
            width: 764px;
            margin-left: 0;
        }

        .table td.span11,
        .table th.span11 {
            float: none;
            width: 844px;
            margin-left: 0;
        }

        .table td.span12,
        .table th.span12 {
            float: none;
            width: 924px;
            margin-left: 0;
        }

        .table tbody tr.success > td {
            background-color: #dff0d8;
        }

        .table tbody tr.error > td {
            background-color: #f2dede;
        }

        .table tbody tr.warning > td {
            background-color: #fcf8e3;
        }

        .table tbody tr.info > td {
            background-color: #d9edf7;
        }

        .table-hover tbody tr.success:hover > td {
            background-color: #d0e9c6;
        }

        .table-hover tbody tr.error:hover > td {
            background-color: #ebcccc;
        }

        .table-hover tbody tr.warning:hover > td {
            background-color: #faf2cc;
        }

        .table-hover tbody tr.info:hover > td {
            background-color: #c4e3f3;
        }


    </style>

</head>

<body>

<div class="container">
    <div class="row">
        <div class="span8 offset2">
            <h1>Users</h1>
            <form:form method="post" action="add" commandName="user" class="form-horizontal">
            <div class="control-group">
                <form:label cssClass="control-label" path="Username">UserName:</form:label>
                <div class="controls">
                    <form:input path="Username"/>
                </div>
            </div>
            <div class="control-group">
                <form:label cssClass="control-label" path="password">Password:</form:label>
                <div class="controls">
                    <form:password path="password"/>
                </div>
            </div>
            <div class="control-group">
                <div class="controls">
                    <input type="submit" value="add user" class="btn"/>
                    </form:form>
                </div>
            </div>

            <c:if test="${!empty users}">
                <h3>Users</h3>
                <table class="table table-bordered table-striped">
                    <thead>
                    <tr>
                        <th>Name</th>
                        <th>url</th>

                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${users}" var="user">
                        <tr>
                            <td>${user.username}</td>
                            <td>${user.url}</td>
                            <td>
                                <form action="delete/${user.id}" method="post"><input type="submit"
                                                                                      class="btn btn-danger btn-mini"
                                                                                      value="Delete"/></form>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </c:if>
        </div>
    </div>
    <div id="interface">
        <div id="sets">
            <h1> Data sets </h1>
            <div id="list">
                <ul>
                    <li>MOH 711</li>
                    <li>MOH 710</li>
                    <li>MOH 211</li>
                </ul>
            </div>
        </div>
        <div id="elements">
            <h1> Data Elements </h1>
            <div id="list">
                <ul>
                    <li>HIV</li>
                    <li>Malaria</li>
                    <li>ANC</li>
                </ul>
            </div>
        </div>
        <div id="concepts">
            <h1> Concepts </h1>
            <div id="list">
                <ul>
                    <li>Blood pressure</li>
                    <li>Temperature</li>
                    <li>Height</li>
                </ul>
            </div>
        </div>
    </div>
</div>
</body>
</html>