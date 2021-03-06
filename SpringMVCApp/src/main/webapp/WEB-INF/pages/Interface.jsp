<%--
  Created by IntelliJ IDEA.
  User: Winfred
  Date: 7/29/13
  Time: 9:45 PM
  To change this template use File | Settings | File Templates.
--%>
<!doctype html>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <meta charset="utf-8">
    <title>The Interface</title>

    <link href="../Style/style.css" rel="stylesheet"  type="text/css">
    <link href="../Style/bootstrap.css" rel="stylesheet" type="text/css">
    <link href="../Style/bootstrap-responsive.css" rel="stylesheet"  type="text/css">

    <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>

     <div id="list">
         <h1> Data sets </h1>
     </div>
     <div id="list2">
         <h1> Data Elements </h1>
     </div>
     <div id="list3">
         <h1> Concepts </h1>
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
</body>
</html>