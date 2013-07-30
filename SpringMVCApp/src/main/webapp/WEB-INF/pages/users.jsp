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
            border-style:solid;
            border-color:#98bf21;
            border-style:dotted solid;
        }
        #elements{
            width: 500px;
            padding: 3px 10px;
            border-style:solid;
            border-color:#98bf21;
            border-style:dotted groove;
        }
        #concepts{
            width: 500px;
            padding: 3px 10px;
            position: relative;
            border-style:solid;
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