<!doctype html>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8">
<title>reporting to dhis</title>

<<<<<<< HEAD

<!--openmrs header-->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>

<script src="/openmrs/openmrs.js?v=1.9.3.f535e9" type="text/javascript" ></script>
<script src="/openmrs/scripts/openmrsmessages.js?v=1.9.3.f535e9&locale=en" type="text/javascript" ></script>
<link href="/openmrs/openmrs.css?v=1.9.3.f535e9" type="text/css" rel="stylesheet" />
<link href="/openmrs/openmrs_green.css" type="text/css" rel="stylesheet" />
<link href="/openmrs/style.css?v=1.9.3.f535e9" type="text/css" rel="stylesheet" />
<script src="/openmrs/dwr/engine.js?v=1.9.3.f535e9" type="text/javascript" ></script>
<script src="/openmrs/dwr/interface/DWRAlertService.js?v=1.9.3.f535e9" type="text/javascript" ></script>

<script src="/openmrs/scripts/jquery/jquery.min.js?v=1.9.3.f535e9" type="text/javascript" ></script>
<script src="/openmrs/scripts/jquery-ui/js/jquery-ui.custom.min.js?v=1.9.3.f535e9" type="text/javascript" ></script>
<script src="/openmrs/scripts/jquery-ui/js/jquery-ui-timepicker-addon.js?v=1.9.3.f535e9" type="text/javascript" ></script>
<script src="/openmrs/scripts/jquery-ui/js/jquery-ui-datepicker-i18n.js?v=1.9.3.f535e9" type="text/javascript" ></script>
<script src="/openmrs/scripts/jquery-ui/js/jquery-ui-timepicker-i18n.js?v=1.9.3.f535e9" type="text/javascript" ></script>
<link href="/openmrs/scripts/jquery-ui/css/green/jquery-ui.custom.css" type="text/css" rel="stylesheet" />

<link rel="shortcut icon" type="image/ico" href="/openmrs/images/openmrs-favicon.ico">
<link rel="icon" type="image/png" href="/openmrs/images/openmrs-favicon.png">


<script type="text/javascript">

    var $j = jQuery.noConflict();

    /* variable used in js to know the context path */
    var openmrsContextPath = '/openmrs';
    var dwrLoadingMessage = 'Loading...';
    var jsDateFormat = 'mm/dd/yyyy';
    var jsTimeFormat = 'hh:mm TT';
    var jsLocale = 'en';

    /* prevents users getting false dwr errors msgs when leaving pages */
    var pageIsExiting = false;
    if (typeof(jQuery) != "undefined")
        jQuery(window).bind('beforeunload', function () { pageIsExiting = true; } );

    var handler = function(msg, ex) {
        if (!pageIsExiting) {
            var div = document.getElementById("openmrs_dwr_error");
            div.style.display = ""; // show the error div
            var msgDiv = document.getElementById("openmrs_dwr_error_msg");
            msgDiv.innerHTML = 'A javascript error has occurred:' + " <b>" + msg + "</b>";
        }

    };
    dwr.engine.setErrorHandler(handler);
    dwr.engine.setWarningHandler(handler);
</script>


<!--openmrs headeer ends-->







<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

</head>

<body>
<div style="float:right;width:50%;height:100%;" id="search">

    <div id="pageBody">

        <div id="userBar">


					<span id="userLoggedInAs" class="firstChild">
						Currently logged in as Super User
					</span>
					<span id="userLogout">
4						<a href='/openmrs/logout'>Log out</a>
					</span>
					<span>
						<a href="/openmrs/options.form">My Profile</a>
					</span>




			<span id="userHelp">
				<a href='/openmrs/help.htm'>Help</a>
			</span>

        </div>

        <div id="banner">
            <a href="http://openmrs.org">
                <div id="logosmall"><img src="/openmrs/images/openmrs_logo_text_small.gif" alt="OpenMRS Logo" border="0"/></div>
            </a>
            <table id="bannerbar">
                <tr>
                    <td id="logocell"> <img src="/openmrs/images/openmrs_logo_white.gif" alt="" class="logo-reduced61" />
                    </td>
                    <td id="barcell">
                        <div class="barsmall">
                            <img align="left" src="/openmrs/images/openmrs_green_bar.gif" alt="" class="bar-round-reduced50"/>

                            <ul class="navList">	<li id="homeNavLink" class="firstChild">
                                <a href="/openmrs/">Home</a>
                            </li>

                                <li id="findPatientNavLink">
                                    <a href="/openmrs/findPatient.htm">

                                        Find/Create Patient


                                    </a>
                                </li>


                                <li id="dictionaryNavLink">
                                    <a href="/openmrs/dictionary">Dictionary</a>
                                </li>




                                <li>
                                    <a href="/openmrs/module/reporting/dashboard/index.form">Reporting</a>
                                </li>




                                <li id="administrationNavLink">
                                    <a href="/openmrs/admin">Administration</a>
                                </li>



                            </ul>

                        </div>
                    </td>
                </tr>
            </table>
        </div>



        <div id="content">





            <div id="openmrs_dwr_error" style="display:none" class="error">
                <div id="openmrs_dwr_error_msg"></div>
                <div id="openmrs_dwr_error_close" class="smallMessage">
                    <i>The full stacktrace for this error can usually be found in your server's error logs.</i>
                    <a href="#" onclick="this.parentNode.parentNode.style.display='none'">Hide error</a>
                </div>
            </div>








            <script src="/openmrs/dwr/interface/DWRConceptService.js?v=1.9.3.f535e9" type="text/javascript" ></script>
            <link href="/openmrs/scripts/jquery/dataTables/css/dataTables_jui.css?v=1.9.3.f535e9" type="text/css" rel="stylesheet" />
            <script src="/openmrs/scripts/jquery/dataTables/js/jquery.dataTables.min.js?v=1.9.3.f535e9" type="text/javascript" ></script>
            <script src="/openmrs/scripts/jquery-ui/js/openmrsSearch.js?v=1.9.3.f535e9" type="text/javascript" ></script>

            <script type="text/javascript">
                var lastSearch;
                $j(document).ready(function() {
                    new OpenmrsSearch("findConcept", true, doConceptSearch, doSelectionHandler,
                            [{fieldName:"name", header:" "}, {fieldName:"preferredName", header:" "}],
                            {searchLabel: 'Find a concept by typing in its name or Id:',
                                searchPlaceholder:'Enter concept name or id',
                                includeVoidedLabel: 'Include Retired',
                                columnRenderers: [nameColumnRenderer, null],
                                columnVisibility: [true, false],
                                searchPhrase:'',
                                showIncludeVerbose: true,
                                verboseHandler: doGetVerbose
                            });
                });

                function doSelectionHandler(index, data) {
                    //document.location = "dictionary/concept.htm?conceptId=" + data.conceptId;
                    $.get("http://localhost:8080/openmrs/dictionary/concept.htm?conceptId="+ data.conceptId,function(data)
                    {
                        $("#search").html(data);

                    });

                }

                //searchHandler
                function doConceptSearch(text, resultHandler, getMatchCount, opts) {
                    DWRConceptService.findCountAndConcepts(text, opts.includeVoided, null, null, null, null, opts.start, opts.length, getMatchCount, resultHandler);
                }

                //custom render, appends an arrow and preferredName it exists
                function nameColumnRenderer(oObj){
                    if(oObj.aData[1] && $j.trim(oObj.aData[1]) != '')
                        return "<span>"+oObj.aData[0]+"</span><span class='otherHit'> &rArr; "+oObj.aData[1]+"</span>";

                    return "<span>"+oObj.aData[0]+"</span>";
                }

                //generates and returns the verbose text
                function doGetVerbose(index, data){
                    if(!data)
                        return "";
                    return "#"+data.conceptId+": "+data.description;
                }
            </script>
=======
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
>>>>>>> 5cf3b5208ae22f7bc64e287a4e0b9414cd3f3dcc



            <div>
                <b class="boxHeader">Find Concept(s)</b>
                <div class="box">
                    <div class="searchWidgetContainer" id="findConcept"></div> </div>
            </div>

            <br/>
            <br/>
        </div>
    </div>
<<<<<<< HEAD





</div>

</div>

=======
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
>>>>>>> 5cf3b5208ae22f7bc64e287a4e0b9414cd3f3dcc
</body>
</html>