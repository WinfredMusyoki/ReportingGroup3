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

    <link href="../Style/bootstrap.css" rel="stylesheet" type="text/css">
    <link href="../Style/style.css" rel="stylesheet"  type="text/css">
    <link href="../Style/bootstrap-responsive.css" rel="stylesheet"  type="text/css">

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
                    <form:input path="password"/>
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
                                <form action="delete/${user.id}" method="post"><input type="submit" class="btn btn-danger btn-mini" value="Delete"/></form>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </c:if>
        </div>
    </div>

</div>
<div id="interface">
    <div id="sets">
        <h1> Data sets </h1>
        <div id="list">
            <ul>
                <li>MOH711</li>
                <li>MOH710</li>
                <li> </li>
             </ul>
        </div> <br> <br>
    <div id="elements">
        <h1> Data Elements </h1>
        <div id="list">
            <ul>
                <li>HIV</li>
                <li>Malaria</li>
                <li>ANC</li>
            </ul>
        </div>
    </div> <br> <br>
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

</body>
</html>