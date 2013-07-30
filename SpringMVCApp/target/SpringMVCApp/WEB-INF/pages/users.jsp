<!doctype html>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8">
<title>reporting to dhis</title>
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
<script src="/openmrs/dwr/interface/DWRConceptService.js?v=1.9.3.f535e9" type="text/javascript" ></script>
<link href="/openmrs/scripts/jquery/dataTables/css/dataTables_jui.css?v=1.9.3.f535e9" type="text/css" rel="stylesheet" />
<script src="/openmrs/scripts/jquery/dataTables/js/jquery.dataTables.min.js?v=1.9.3.f535e9" type="text/javascript" ></script>
<script src="/openmrs/scripts/jquery-ui/js/openmrsSearch.js?v=1.9.3.f535e9" type="text/javascript" ></script>


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

<!--openmrs header ends-->

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
    zoom: 1;
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
    border-collapse: collapse;
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
                    <i>The full stack trace for this error can usually be found in your server's error logs.</i>
                    <a href="#" onclick="this.parentNode.parentNode.style.display='none'">Hide error</a>
                </div>
            </div>
            <div>
                <b class="boxHeader">Find Concept(s)</b>
                <div class="box">
                    <div class="searchWidgetContainer" id="findConcept"></div> </div>
            </div>

            <br/>
            <br/>
        </div>
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

            <table width="98%" border="3" align="center" cellpadding="1" cellspacing="1" bgcolor="#CCCCCC">
                <form>
                    <tr>
                        <td width="10%" align="center" bgcolor="#E6E6E6"><strong>Data Element</strong></td>
                        <td width="10%" align="center" bgcolor="#E6E6E6"><strong>ConceptId</strong></td>
                    </tr>
                    <%
                         for(int x=0;x<10;x++)
                         {
                            %>
                                <tr>
                                    <td align="center" bgcolor="#FFFFFF">DataElements</td>
                                    <td align="center" bgcolor="#FFFFFF"><input type="text" name="concept_name"></td>
                                </tr>
                            <%
                         }
                    %>
            </table>
            <table>
                    <tr>
                    <td class="span2"><input type="submit" value="Submit" /></td>
                    <td class="span2"><input type="submit" value="Clear" /></td>
                    </tr>

                 </form>

            </table>


    </div>
</div>
</body>
</html>