<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<html>
<head>
    <title>SELECT Operation</title>
</head>
<body>
<p><b>aggregate</b></p>
<%!
    ArrayList<String> searchArray = new ArrayList<String>();

    public class Aggregate
    {
        private void searchKeyWord(String conceptId)
        {
            searchArray.clear();
            int count;


            for(String result : conceptId.split(" "))
            {

                count=result.length();
                for(char c : result.toCharArray())
                {
                    if(Character.isUpperCase(c))
                    {
                        count--;
                        if(count==0)
                        {
                            searchArray.add(result);

                        }
                    }

                }
            }
        }

        private void searchEveryWord(String conceptId)
        {
            searchArray.clear();
            for(String result : conceptId.split(" "))
            {
                searchArray.add(result);
            }
        }

    }
%>



<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                   url="jdbc:mysql://localhost/openmrs"
                   user="root"  password="root1234"/>

<% String search = "HIV"; %>


<%
    Aggregate agg = new Aggregate();
    ArrayList<String>  resultArray = new ArrayList<String>();

%>



<!-- Checking the whole word only-->
<sql:query dataSource="${snapshot}" var="result">
    select count(`name`)
    from concept_name
    WHERE `name` LIKE "<%= search %>";
</sql:query>

<c:if test="${result.rowsByIndex[0][0]!=0}">
    <sql:query dataSource="${snapshot}" var="result">
        select `name`
        from concept_name
        WHERE `name` LIKE "<%= search %>";
    </sql:query>
</c:if>

<!-- Checking if word has been used in a statement-->
<c:if test="${result.rowsByIndex[0][0]==0}">

    <sql:query dataSource="${snapshot}" var="result">
        select count(`name`)
        from concept_name
        WHERE `name` LIKE "%<%= search %>%";
    </sql:query>

    <c:if test="${result.rowsByIndex[0][0]!=0}">
        <sql:query dataSource="${snapshot}" var="result">
            select `name`
            from concept_name
            WHERE `name` LIKE "%<%= search %>%";
        </sql:query>
    </c:if>

<!-- Checking for a key word in the statement-->
    <c:if test="${result.rowsByIndex[0][0]==0}">
        <%
            agg.searchKeyWord(search);
        %>

        <c:forEach var="myEach" items="<%= searchArray %>">
            <sql:query dataSource="${snapshot}" var="result">
                select count(`name`)
                from concept_name
                WHERE `name` LIKE "%${myEach}%";
            </sql:query>

        </c:forEach>

        <c:if test="${result.rowsByIndex[0][0]!=0}">
            <c:forEach var="myEach" items="<%= searchArray %>">
            <sql:query dataSource="${snapshot}" var="result">
                select `name`
                from concept_name
                WHERE `name` LIKE "%${myEach}%";
            </sql:query>
        </c:forEach>
        </c:if>


<!-- thorough checking-->
        <c:if test="${result.rowsByIndex[0][0]==0}">
                <%
                    agg.searchEveryWord(search);
                %>

                <c:forEach var="myEach" items="<%= searchArray %>">
                    <sql:query dataSource="${snapshot}" var="result">
                        select `name`
                        from concept_name
                        WHERE `name` LIKE "%${myEach}%";
                    </sql:query>                                                                                                                we
                </c:forEach>

                <c:if test="${result.rowsByIndex[0][0]==null}">
                       <%
                            String conceptError = "Sorry,there is no concept related to the data element!";
                       %>
                </c:if>
        </c:if>

    </c:if>

</c:if>
<c:forEach var="row" items="${result.rows}">


    <c:out value="${row.name}" />

</c:forEach>




</body>