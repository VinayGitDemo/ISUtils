<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions">
	<xsl:output method="html" omit-xml-declaration="yes" indent="yes"/>
	<xsl:template match="/">
		<html>
			<head>
				<title>Continuous Code Review Report</title>
				<style>
.linesLev1 {
    font-size: 20pt;
}

.linesLev2 {
    font-size: 16pt;
}
#complexityLegend {
    float: left;
    left: 550px;
    position: relative;
    top: 40px;
}

#statusHeader {
    display: block;
    font-weight: bold;
    left: 140px;
    position: relative;
    top: 10px;
}

#breakdownHeader {
    display: block;
    font-weight: bold;
    left: 650px;
    position: relative;
    top: -5px;
}
				
#breakdownChart {
    left: 150px;
    position: relative;
}

#statusChartLegend {
    left: 200px;
    position: relative;
    top: 10px;
}

#breakdownChartLegend {
    left: 690px;
    margin-top: 20px;
    position: relative;
    top: -103px;
}


h1 {
    color: #0899CC;
    font-size: 26pt;
}		

.sub
{
    color: #000000;
    font-size: 32pt;
    position: relative;
    top: -25px;
    text-transform: uppercase;
}		

h2 {
    color: #0899CC;
    font-size: 14pt;
    text-transform: uppercase;
}

h3 {
    font-size: 12pt;
    font-weight: bolder;
}


p {
    font-size: 10pt;
    font-weight: normal;
}

a:link {
    color: #000000;
    text-decoration: none;
}

a:visited {
    color: #000000;
    text-decoration: none;

}

a:hover {
    color: #000000;
    text-decoration: underline;
}

a:active {
    color: #000000;
    text-decoration: none;
}

a.white:link {
    color: #FFFFFF;
    text-decoration: none;
}

a.white:visited {
    color: #FFFFFF;
    text-decoration: none;

}

a.white:hover {
    color: #FFFFFF;
    text-decoration: underline;
}

a.white:active {
    color: #FFFFFF;
    text-decoration: none;
}
				

tr > td:first-child {
    background-color: #a6a6a6;
    color: white;
}

.trshade {
background-color: #f2f2f2;
}

				
BODY
{
	font-family:Arial;
	font-size: 10pt;
}

.ragStatus{
width:100%;
}

.RAGGREEN
{
	width:40px;
	border-radius: 27px;
	height: 40px;
	font-size:24pt;
	border: 4px solid #008800;
	background-color: #00ff00;
	outline: none;
	color:#004400;
	text-align: center;
	line-height: 50px;
}

.RAGRED
{
	width:40px;
	border-radius: 27px;
	height: 40px;
	font-size:24pt;
	border: 4px solid #880000;
	background-color: #ff0000;
	outline: none;
	color:#440000;
	text-align: center;
	line-height: 50px;
}

.RAGAMBER
{
	width:40px;
	border-radius: 27px;
	height: 40px;
	font-size:24pt;
	border: 4px solid #9E3F00;
	background-color: #FF6A00;
	outline: none;
	color:#440000;
	text-align: center;
	line-height: 50px;
}

.RAGREDTEXT
{
	color: #880000;
    left: 50px;
    position: relative;
    top: -5px;
}

.RAGAMBERTEXT
{
	color: #9E3F00;
    left: 50px;
    position: relative;
    top: -5px;
}

.RAGGREENTEXT
{
	color: #008800;
    left: 50px;
    position: relative;
    top: -5px;
}

.RED{
	background-color:red;
	color:white;
	width:100%;
	border: 3px solid #aa0000;
}

.GREEN{
	background-color:green;
	color:white;
	width:100%;
	border: 3px solid #00aa00;
}

.AMBER{
	border: 3px solid #9E3F00;
	background-color: #FF6A00;
	color:white;
	width:100%;
}

.check
{
	margin-bottom: 50px;
}

table, td, th {
    border: 1px solid #FFFFFF;
    border-spacing: 0;
    border-collapse: collapse;
    margin-bottom:20px;
}

table {
margin-bottom: 20px;
}

th {
    background-color: #0085ad;
    color: white;
    padding-bottom: 5px;
    padding-left: 10px;
    text-align: left;
	font-size:10pt;
	padding-right:10px;
}				

TD
{
	padding-bottom: 5px;
    padding-left: 10px;
	text-align: left;
	font-size:10pt;
	padding-right:10px;
}
	
				
.checkItem
{
	background-color: #dddddd;
	box-shadow: 8px 8px 5px #222222;
	border: 1px solid #111111;
	border-radius: 25px;
	padding-top: 10px;
	padding-left: 20px;
	padding-right: 20px; 		
	margin-bottom: 20px;		
}
				
.fullwidth
{
	width: 100%;
}

@media all {
	.page-break	{ display: none; }
}

@media print {
	.page-break	{ display: block; page-break-before: always; }
}
</style>
				<xsl:variable name="col1">#F7464A</xsl:variable>
				<xsl:variable name="col2">#46BFBD</xsl:variable>
				<xsl:variable name="col3">#FDB45C</xsl:variable>
				<xsl:variable name="col4">#949FB1</xsl:variable>
				<xsl:variable name="col5">#4D5360</xsl:variable>
				<xsl:variable name="col6">#FF0000</xsl:variable>
				<xsl:variable name="col7">#00FF00</xsl:variable>
				<xsl:variable name="col8">#0000FF</xsl:variable>
				<xsl:variable name="col9">#AA00AA</xsl:variable>
				<xsl:variable name="col10">#44FF44</xsl:variable>
				<xsl:variable name="col11">#AAAA00</xsl:variable>
				<xsl:variable name="col12">#00AAAA</xsl:variable>
				<xsl:variable name="col13">#AA9999</xsl:variable>
				<xsl:variable name="col14">#CCBBBB</xsl:variable>	
				<xsl:variable name="col15">#AAAA88</xsl:variable>
				<xsl:variable name="col16">#FFaa22</xsl:variable>
				<script language="javascript">
					<xsl:text>
function doOnload()
{
</xsl:text>

<xsl:for-each select="/Review/Package">

<xsl:text>var complexitySummary_</xsl:text><xsl:value-of select="@name"/><xsl:text>=
{

    labels: ["Very Simple", "Simple", "Average", "Complex", "Very Complex"],
    datasets: [
        {
            label: "flow complexity summary",
            //fillColor: "rgba(151,187,205,0.5)",
            fillColor: "rgba(247,70,74,0.5)",
            strokeColor: "rgba(247,70,74,1)",
            pointColor: "rgba(247,70,74,1)",
            pointStrokeColor: "#fff",
            pointHighlightFill: "#fff",
            pointHighlightStroke: "rgba(151,187,205,1)",
            data: [
</xsl:text>
<xsl:value-of select="count(CodeCheckConfiguration/sensors/sensor[definition/@sensorName='CodeLines']/results[@name='complexityFactor-flow' and @value=1]/@value)"/>,
<xsl:value-of select="count(CodeCheckConfiguration/sensors/sensor[definition/@sensorName='CodeLines']/results[@name='complexityFactor-flow' and @value=2]/@value)"/>,
<xsl:value-of select="count(CodeCheckConfiguration/sensors/sensor[definition/@sensorName='CodeLines']/results[@name='complexityFactor-flow' and @value=3]/@value)"/>,
<xsl:value-of select="count(CodeCheckConfiguration/sensors/sensor[definition/@sensorName='CodeLines']/results[@name='complexityFactor-flow' and @value=4]/@value)"/>,
<xsl:value-of select="count(CodeCheckConfiguration/sensors/sensor[definition/@sensorName='CodeLines']/results[@name='complexityFactor-flow' and @value=5]/@value)"/>
					<xsl:text>            
            ]
        },
        {
            label: "Java complexity summary",
			fillColor: "rgba(070,191,189,0.5)",
			strokeColor: "rgba(070,191,189,1)",
			pointColor: "rgba(070,191,189,1)",
			pointStrokeColor: "#fff",
			pointHighlightFill: "#fff",
			pointHighlightStroke: "rgba(220,220,220,1)",
            data: [
</xsl:text>
<xsl:value-of select="count(CodeCheckConfiguration/sensors/sensor[definition/@sensorName='CodeLines']/results[@name='complexityFactor-java' and @value=1]/@value)"/>,
<xsl:value-of select="count(CodeCheckConfiguration/sensors/sensor[definition/@sensorName='CodeLines']/results[@name='complexityFactor-java' and @value=2]/@value)"/>,
<xsl:value-of select="count(CodeCheckConfiguration/sensors/sensor[definition/@sensorName='CodeLines']/results[@name='complexityFactor-java' and @value=3]/@value)"/>,
<xsl:value-of select="count(CodeCheckConfiguration/sensors/sensor[definition/@sensorName='CodeLines']/results[@name='complexityFactor-java' and @value=4]/@value)"/>,
<xsl:value-of select="count(CodeCheckConfiguration/sensors/sensor[definition/@sensorName='CodeLines']/results[@name='complexityFactor-java' and @value=5]/@value)"/>
					<xsl:text>            
            ]
        }
    ]
    
};
</xsl:text>
</xsl:for-each>


<xsl:for-each select="/Review/Package">

<xsl:text>
var complexityData_</xsl:text><xsl:value-of select="@name"/><xsl:text> =  {
</xsl:text>
labels: [<xsl:for-each select="CodeCheckConfiguration/sensors/sensor[definition/@sensorName='CodeLines']/results[starts-with(@name,'complexityFactor')]">
						<xsl:text>"</xsl:text>
						<xsl:value-of select="@item"/>
						<xsl:text>"</xsl:text>
						<xsl:if test="position()!=last()">,</xsl:if>
					</xsl:for-each>
					<xsl:text>],
    datasets: [
        {
            label: "ComplexityFactor",
            fillColor: "rgba(151,187,205,0.5)",
            strokeColor: "rgba(151,187,205,0.8)",
            highlightFill: "rgba(151,187,205,0.75)",
            highlightStroke: "rgba(151,187,205,1)",
            data: [</xsl:text>
					<xsl:for-each select="CodeCheckConfiguration/sensors/sensor[definition/@sensorName='CodeLines']/results[starts-with(@name,'complexityFactor')]">
						<xsl:value-of select="@value"/>
						<xsl:if test="position()!=last()">,</xsl:if>
					</xsl:for-each>
					<xsl:text>]
        }
    ]
};

</xsl:text>
</xsl:for-each>

<xsl:for-each select="/Review/Package">

<xsl:text>



var data2_</xsl:text><xsl:value-of select="@name"/><xsl:text> = [
</xsl:text>
					<xsl:for-each select="CodeCheckConfiguration/sensors/sensor[definition/@sensorName='totals']/results[not(starts-with(@name,'Total')) and not(starts-with(@name,'overall')) and not(@name='Folders')]">
						<xsl:text>
{
value:</xsl:text>
						<xsl:value-of select="@value"/>
						<xsl:text>,
        color:"</xsl:text>
						<xsl:if test="position()=1">
							<xsl:value-of select="$col1"/>
						</xsl:if>
						<xsl:if test="position()=2">
							<xsl:value-of select="$col2"/>
						</xsl:if>
						<xsl:if test="position()=3">
							<xsl:value-of select="$col3"/>
						</xsl:if>
						<xsl:if test="position()=4">
							<xsl:value-of select="$col4"/>
						</xsl:if>
						<xsl:if test="position()=5">
							<xsl:value-of select="$col5"/>
						</xsl:if>
						<xsl:if test="position()=6">
							<xsl:value-of select="$col6"/>
						</xsl:if>
						<xsl:if test="position()=7">
							<xsl:value-of select="$col7"/>
						</xsl:if>
						<xsl:if test="position()=8">
							<xsl:value-of select="$col8"/>
						</xsl:if>
						<xsl:if test="position()=9">
							<xsl:value-of select="$col9"/>
						</xsl:if>
						<xsl:if test="position()=10">
							<xsl:value-of select="$col10"/>
						</xsl:if>
						<xsl:if test="position()=11">
							<xsl:value-of select="$col11"/>
						</xsl:if>
						<xsl:if test="position()=12">
							<xsl:value-of select="$col12"/>
						</xsl:if>
						<xsl:if test="position()=13">
							<xsl:value-of select="$col13"/>
						</xsl:if>
						<xsl:if test="position()=14">
							<xsl:value-of select="$col14"/>
						</xsl:if>
						<xsl:if test="position()=15">
							<xsl:value-of select="$col15"/>
						</xsl:if>
						<xsl:if test="position()=16">
							<xsl:value-of select="$col16"/>
						</xsl:if>
						<xsl:text>",
        highlight: "#FF0000",
        label: "</xsl:text>
						<xsl:value-of select="@name"/>
						<xsl:text>"
},
</xsl:text>
					</xsl:for-each>
					<xsl:text>
];</xsl:text>
</xsl:for-each>


<xsl:for-each select="/Review/Package">

<xsl:text>

		var statusData_</xsl:text><xsl:value-of select="@name"/><xsl:text> = [<![CDATA[
				{
					value: ]]></xsl:text>
					<xsl:value-of select="CodeCheckConfiguration/sensors/sensor[definition/@sensorName='totals']/results[@name='TotalFailed']/@value"/>
					<xsl:text><![CDATA[,
					color:"#FF0000",
					highlight: "#FF5A5E",
					label: "Failed"
				},
				{
					value: ]]></xsl:text>
					<xsl:value-of select="CodeCheckConfiguration/sensors/sensor[definition/@sensorName='totals']/results[@name='TotalPassed']/@value"/>
					<xsl:text><![CDATA[,
					color: "#00FF00",
					highlight: "#99FF99",
					label: "Passed"
				},
				{
					value: ]]></xsl:text>
					<xsl:value-of select="CodeCheckConfiguration/sensors/sensor[definition/@sensorName='totals']/results[@name='TotalWarning']/@value"/>
					<xsl:text><![CDATA[,
					color: "#FF6A00",
					highlight: "#FFC870",
					label: "Warnings"
				}

			];
]]>
</xsl:text>
</xsl:for-each>


<xsl:for-each select="/Review/Package">
					<xsl:text>


//Finally draw all the charts!
		var ctx = document.getElementById("chart-area_</xsl:text><xsl:value-of select="@name"/><xsl:text>").getContext("2d");
		window.myPie = new Chart(ctx).Doughnut(data2_</xsl:text><xsl:value-of select="@name"/><xsl:text>);

		var ctx2 = document.getElementById("complexity-chart-area_</xsl:text><xsl:value-of select="@name"/><xsl:text>").getContext("2d");
		myBarChart = new Chart(ctx2).Bar(complexityData_</xsl:text><xsl:value-of select="@name"/><xsl:text>);	
		
		var ctx3 = document.getElementById("complexity-chart-summary_</xsl:text><xsl:value-of select="@name"/><xsl:text>").getContext("2d");
		myRadar = new Chart(ctx3).Radar(complexitySummary_</xsl:text><xsl:value-of select="@name"/><xsl:text>, {
		pointDot: true,scaleShowLabels: false});	
		
		var ctx4 = document.getElementById("status-chart-area_</xsl:text><xsl:value-of select="@name"/><xsl:text>").getContext("2d");
		myDoughnut = new Chart(ctx4).Doughnut(statusData_</xsl:text><xsl:value-of select="@name"/><xsl:text>);
</xsl:text>
</xsl:for-each>
<xsl:text>
}</xsl:text>
				</script>
				<xsl:comment>INSERT_CHART.JS</xsl:comment>
			</head>
			<body onload="doOnload();">
				<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAOEAAAAiCAYAAACpz75gAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyJpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNiAoV2luZG93cykiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6NUIxMEFCRDA5MzUzMTFFNUE3MTNCNjU3RUExRkRGQkMiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6NUIxMEFCRDE5MzUzMTFFNUE3MTNCNjU3RUExRkRGQkMiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDo1QjEwQUJDRTkzNTMxMUU1QTcxM0I2NTdFQTFGREZCQyIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDo1QjEwQUJDRjkzNTMxMUU1QTcxM0I2NTdFQTFGREZCQyIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PiN+JN8AAAs2SURBVHja7F0NlFVV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" alt="logo"/>
				<h1>
					<xsl:value-of select="/CodeCheckConfiguration/properties/packageName"/>
				</h1>
				<div class="sub">Code Review Report</div>
				<div class="date">
					<xsl:value-of select="/CodeCheckConfiguration/properties/date"/>
				</div>
				<div class="page-break"/>
				<br/>
				<h2>Contents</h2>
				<ul>
					<li>
						<a href="#1.0">1.0 Scope of Report</a>
					</li>
					
					
					<li><a href="#2.0">2.0 Executive Summary</a></li>
					<ul>
						<li><a href="#2.1">2.1 Overall Status</a></li>
						<li><a href="#2.2">2.2 Overall Quality</a></li>
						<li><a href="#2.3">2.3 Quality Leaderboard</a></li>
						<li><a href="#2.4">2.4 Overall Statistics</a></li>
					</ul>
					<li><a href="#3.0">3.0 Packages</a></li>
					<ul>
						
					<xsl:for-each select="//Package">
					<xsl:variable name="i" select="position()"/>
					<li>
						<a href="#3.{$i}">3.<xsl:value-of select="$i"/><xsl:text> </xsl:text><xsl:value-of select="@name"/></a>
						<ul>
							<li><a href="#3.{$i}.1">3.<xsl:value-of select="$i"/>.1 Result</a></li>
							<li><a href="#3.{$i}.2">3.<xsl:value-of select="$i"/>.2 Summary</a></li>
							<li><a href="#3.{$i}.3">3.<xsl:value-of select="$i"/>.3 Detail</a></li>	
							<ul>
							<xsl:for-each select="CodeCheckConfiguration/checks/check[@enabled='true']">					
							<xsl:variable name="j" select="position()"/>
								<li><a href="#3.{$i}.3.{$j}">3.<xsl:value-of select="$i"/>.3.<xsl:value-of select="$j"/><xsl:text> </xsl:text><xsl:value-of select="@name"/></a></li>
							</xsl:for-each>
							</ul>
							
						</ul>
					</li>
					</xsl:for-each>
					<xsl:if test="/Review/MulticheckSummary">
						<li><a href="#4.0">4.0 Multiple Check Summary</a></li>
						<ul>
							<xsl:for-each select="/Review/MulticheckSummary">
								<xsl:variable name="i" select="position()"/>
								<li><a href="#4.{$i}">4.<xsl:value-of select="$i"/><xsl:text> </xsl:text> <xsl:value-of select="./description"/></a></li>
							</xsl:for-each>
						</ul>
					</xsl:if>
					</ul>
				</ul>
					<!--
					<li>
						<a href="#2.0">2.0 Summary</a>
						<ul>
							<li>
								<a href="#2.1">2.1 Status</a>
								<ul>
									<li>
										<a href="#2.1.1">2.1.1 Overall Status</a>
									</li>
									<li>
										<a href="#2.1.2">2.1.2 Check Summary</a>
									</li>
								</ul>
							</li>
							<li>
								<a href="#2.2">2.2 Review Summary</a>
							</li>
							<ul>
								<li>
									<a href="#2.2.1">2.2.1 Review Summary</a>
								</li>
								<li>
									<a href="#2.2.2">2.2.2 Service Complexity Summary</a>
								</li>
								<li>
									<a href="#2.2.3">2.2.3 Service Complexity Breakdown</a>
								</li>
								<li>
									<a href="#2.2.4">2.2.4 Assets in Numbers</a>
								</li>
							</ul>
							<li>
								<a href="#2.3">2.3 Failed Checks</a>
							</li>
						</ul>
					</li>
					<li>
						<a href="#3.0">3.0 Check Results</a>
					</li>
					<ul>
						<xsl:for-each select="//check[@enabled='true']">
							<li>
								<a href="#{@id}">3.<xsl:value-of select="@index"/>
									<xsl:text><![CDATA[ ]]></xsl:text>
									<xsl:value-of select="@name"/>
								</a>
							</li>
							<ul>
								<li>
									<a href="#{@id}.1">3.<xsl:value-of select="@index"/>.1<xsl:text><![CDATA[ ]]></xsl:text>RAG Status</a>
								</li>
								<li>
									<a href="#{@id}.2">3.<xsl:value-of select="@index"/>.2<xsl:text><![CDATA[ ]]></xsl:text>Summary</a>
								</li>
								<li>
									<a href="#{@id}.3">3.<xsl:value-of select="@index"/>.3<xsl:text><![CDATA[ ]]></xsl:text>Detail</a>
								</li>
							</ul>
						</xsl:for-each>
					</ul>
				</ul>-->
				<div class="page-break"/>
				<a name="1.0"/>
				<h2>1.0 Scope of Report</h2><![CDATA[This report documents the findings of an IS Flow code review performed on the following packages ]]>
						<ul>
							<xsl:for-each select="//Package/@name">
							<li><xsl:value-of select="."/></li>
							</xsl:for-each>
						</ul>
					
				<br/><![CDATA[
PRIME is Software AG's globally standardized solution deployment methodology to deliver better Time-to-Value for Business Process Excellence.  It contains best-practice recommendations and guidelines based on the large number of webMethods implentations delivered by the services team over a number of years in order to ensure implementations are repeatable, maintainable and to the highest standards possible.]]><br/>
				<br/><![CDATA[
The code review detail provided by this report uses the PRIMEstandards as
the bench mark to which the package was compared against. Any aspects of the code which did not conform to PRIME are
highlighted and a relevant recommendation for change is provided]]><br/>
				<br/><![CDATA[
For each section, there is an explanation of the standards applied and recommended implementation, and a traffic light RAG (Red, Amber, Green) indication of the status of each item,]]><br/>
				<a name="2.0"/>
				<h2>2.0 Executive Summary</h2>
				<a name="2.1"/>				
				<h3>2.1 Overall Status</h3>
				
					<div style="margin-bottom:20px;">
						<xsl:choose>
							<xsl:when test="/Review/Summary/ragStatus=1">
								<xsl:attribute name="class">RAGGREEN</xsl:attribute>
								<span class="RAGGREENTEXT">Passed</span>
							</xsl:when>
							<xsl:when test="/Review/Summary/ragStatus=0">
								<xsl:attribute name="class">RAGAMBER</xsl:attribute>
								<span class="RAGAMBERTEXT">Warnings</span>
							</xsl:when>
							<xsl:otherwise>
								<xsl:attribute name="class">RAGRED</xsl:attribute>
								<span class="RAGREDTEXT">Failed</span>
							</xsl:otherwise>
						</xsl:choose>
					</div>
				<a name="2.2"/>	
				<h3>2.2 Overall Quality</h3>
				<xsl:value-of select="round(sum(/Review/sensors/sensor/resultsGroup[@name='qualitytable']/results/@value) div count(/Review/sensors/sensor/resultsGroup[@name='qualitytable']/results/@value))"/>%
				<a name="2.3"/>				
				<h3>2.3 Quality Leaderboard</h3>
				<![CDATA[The following table displays the quality of the packages reviewed sorted from the best quality to the least qualiy implementation.]]>
				<table>
							<tbody>
								<tr>
								<th>#</th>
								<th>Name</th>
								<th>Quality (%)</th>
								</tr>
				<xsl:for-each select="/Review/sensors/sensor/resultsGroup[@name='qualitytable']/results">
						<tr>
							<td><xsl:value-of select="@item"/></td>
							<td><xsl:value-of select="@name"/></td>
							<td><xsl:value-of select="@value"/></td>
						</tr>
					
				</xsl:for-each>				
				</tbody>
				</table>
				<a name="2.4"/>
				<h4>2.4 Overall Statistics</h4>
		
				<div>
			<table>
				<tbody>
					<tr>
						<th>Total Tests</th>
						<td>
							<span class="value">
								<xsl:value-of select="/Review/Summary/total"/>
							</span>
						</td>
					</tr>
					<tr>
						<th>Passed</th>
						<td class="trshade">
							<span class="value">
								<xsl:value-of select="/Review/Summary/pass"/>
							</span>
						</td>
					</tr>
					<tr>
						<th>Warning</th>
						<td>
							<span class="value">
								<xsl:value-of select="/Review/Summary/warn"/>
							</span>
						</td>
					</tr>
					<tr>
						<th>Failed</th>
						<td class="trshade">
							<span class="value">
								<xsl:value-of select="/Review/Summary/fail"/>
							</span>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
				<div class="page-break"/>
				<a name="3.0"/>
				<h2>3.0 Packages</h2>
				<xsl:for-each select="//Package">
					 <xsl:variable name="i" select="position()"/>
					 <xsl:variable name="packageName" select="@name"/>
					<a name="3.{$i}"/>					
					<h3>3.<xsl:value-of select="$i"/><xsl:text> </xsl:text><xsl:value-of select="@name"/></h3>
					<a name="3.{$i}.1"/>
					<h4>3.<xsl:value-of select="$i"/><xsl:text>.1 </xsl:text>Result</h4>
					<!--<a name="2.{$i}.1.1"/>
					<h4>2.<xsl:value-of select="$i"/>.1.1 Status</h4>-->

					<div style="margin-bottom:20px;">
						<xsl:choose>
							<xsl:when test="CodeCheckConfiguration/@ragStatus=1">
								<xsl:attribute name="class">RAGGREEN</xsl:attribute>
								<span class="RAGGREENTEXT">Passed</span>
							</xsl:when>
							<xsl:when test="CodeCheckConfiguration/@ragStatus=0">
								<xsl:attribute name="class">RAGAMBER</xsl:attribute>
								<span class="RAGAMBERTEXT">Warnings</span>
							</xsl:when>
							<xsl:otherwise>
								<xsl:attribute name="class">RAGRED</xsl:attribute>
								<span class="RAGREDTEXT">Failed</span>
							</xsl:otherwise>
						</xsl:choose>
					</div>

					<div id="checkSummary">
						<table>
							<tbody>
								<tr>
									<th>Test</th>
									<th>Total Tested</th>
									<th>Passed</th>
									<th>Warning</th>
									<th>Failed</th>
									<th>RAG</th>
								</tr>
								<xsl:for-each select="CodeCheckConfiguration/checks/check[@enabled='true']">
									<xsl:variable name="j" select="position()"/>
									<tr>
										<td>
											<a class="white" href="#3.{$i}.3.{$j}">3.<xsl:value-of select="$i"/>.3.<xsl:value-of select="$j"/><xsl:text> </xsl:text><xsl:value-of select="@name"/></a>
											<!--<a class="white" href="#{@id}">3.<xsl:value-of select="@index"/>
												<xsl:text> </xsl:text>
												<xsl:value-of select="@name"/>
											</a> -->
										</td>
										<td>
											<xsl:value-of select="results/Summary/total"/>
										</td>
										<td>
											<xsl:value-of select="results/Summary/pass"/>
										</td>
										<td>
											<xsl:value-of select="results/Summary/warn"/>
										</td>
										<td>
											<xsl:value-of select="results/Summary/fail"/>
										</td>
										<xsl:choose>
											<xsl:when test="results/Summary/ragStatus=-1">
												<td style="background-color:#FF0000">Failed</td>
											</xsl:when>
											<xsl:when test="results/Summary/ragStatus=0">
												<td style="background-color:#FF6A00">Warning</td>
											</xsl:when>
											<xsl:when test="results/Summary/ragStatus=1">
												<td style="background-color:#00FF00">Passed</td>
											</xsl:when>
										</xsl:choose>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</div>
					<!--
				<div id="qualityScore">
				<span>Quality Rating: </span>
				</div>
				-->
					<div class="page-break"/>
					<a name="3.{$i}.2"/>
					<h4>3.<xsl:value-of select="$i"/><xsl:text>.2 </xsl:text>Summary</h4>

					<span id="statusCountsChart">
						<canvas id="status-chart-area_{$packageName}" width="350" height="350"/>
					</span>
					<span id="breakdownChart">
						<canvas id="chart-area_{$packageName}" width="350" height="350"/>
					</span>
					<span id="statusHeader">Review Status</span>
					<span id="breakdownHeader">Review Assets</span>
					<span id="statusChartLegend">
						<table>
							<tbody>
								<tr>
									<th>Item</th>
									<th>Value</th>
								</tr>
								<tr>
									<td style="background-color:#00FF00;color:black;">Passed</td>
									<td>
										<xsl:value-of select="CodeCheckConfiguration/sensors/sensor[definition/@sensorName='totals']/results[@name='TotalPassed']/@value"/>
									</td>
								</tr>
								<tr>
									<td style="background-color:#FF6A00;;color:black;">Warning</td>
									<td>
										<xsl:value-of select="CodeCheckConfiguration/sensors/sensor[definition/@sensorName='totals']/results[@name='TotalWarning']/@value"/>
									</td>
								</tr>
								<tr>
									<td style="background-color:#FF0000;;color:black;">Failed</td>
									<td>
										<xsl:value-of select="CodeCheckConfiguration/sensors/sensor[definition/@sensorName='totals']/results[@name='TotalFailed']/@value"/>
									</td>
								</tr>
							</tbody>
						</table>
					</span>
					<span id="breakdownChartLegend">
						<xsl:variable name="col1">#F7464A</xsl:variable>
						<xsl:variable name="col2">#46BFBD</xsl:variable>
						<xsl:variable name="col3">#FDB45C</xsl:variable>
						<xsl:variable name="col4">#949FB1</xsl:variable>
						<xsl:variable name="col5">#4D5360</xsl:variable>
						<xsl:variable name="col6">#FF0000</xsl:variable>
						<xsl:variable name="col7">#00FF00</xsl:variable>
						<xsl:variable name="col8">#0000FF</xsl:variable>
						<xsl:variable name="col9">#AA00AA</xsl:variable>
						<xsl:variable name="col10">#44FF44</xsl:variable>
						<xsl:variable name="col11">#AAAA00</xsl:variable>
						<xsl:variable name="col12">#00AAAA</xsl:variable>
						<xsl:variable name="col13">#AA9999</xsl:variable>
						<xsl:variable name="col14">#CCBBBB</xsl:variable>	
						<xsl:variable name="col15">#AAAA88</xsl:variable>
						<xsl:variable name="col16">#FFaa22</xsl:variable>
						<table>
							<tbody class="fullwidthKey">
								<tr>
									<th>Item</th>
									<th>Value</th>
								</tr>
								<xsl:for-each select="CodeCheckConfiguration/sensors/sensor[definition/@sensorName='totals']/results[not(starts-with(@name,'Total')) and not(starts-with(@name,'overall')) and not(@name='Folders')]">
									<xsl:if test="@value!=0">
										<tr>
											<xsl:choose>
												<xsl:when test="@name='Folders'"/>
												<xsl:otherwise>
													<td>
														<xsl:attribute name="style"><xsl:text>color:black;background-color:</xsl:text><xsl:if test="position()=1"><xsl:value-of select="$col1"/></xsl:if><xsl:if test="position()=2"><xsl:value-of select="$col2"/></xsl:if><xsl:if test="position()=3"><xsl:value-of select="$col3"/></xsl:if><xsl:if test="position()=4"><xsl:value-of select="$col4"/></xsl:if><xsl:if test="position()=5"><xsl:value-of select="$col5"/></xsl:if><xsl:if test="position()=6"><xsl:value-of select="$col6"/></xsl:if><xsl:if test="position()=7"><xsl:value-of select="$col7"/></xsl:if><xsl:if test="position()=8"><xsl:value-of select="$col8"/></xsl:if><xsl:if test="position()=9"><xsl:value-of select="$col9"/></xsl:if><xsl:if test="position()=10"><xsl:value-of select="$col10"/></xsl:if><xsl:if test="position()=11"><xsl:value-of select="$col11"/></xsl:if><xsl:if test="position()=12"><xsl:value-of select="$col12"/></xsl:if><xsl:if test="position()=13"><xsl:value-of select="$col13"/></xsl:if><xsl:if test="position()=14"><xsl:value-of select="$col14"/></xsl:if><xsl:if test="position()=15"><xsl:value-of select="$col15"/></xsl:if><xsl:if test="position()=16"><xsl:value-of select="$col16"/></xsl:if><xsl:text>;</xsl:text></xsl:attribute>
														<xsl:value-of select="@name"/>
													</td>
													<td>
														<xsl:value-of select="@value"/>
													</td>
												</xsl:otherwise>
											</xsl:choose>
										</tr>
									</xsl:if>
								</xsl:for-each>
							</tbody>
						</table>
					</span>
					<a name="3.{$i}.2.1"/>
					<span id="complexityRadar">
						<h5>3.<xsl:value-of select="$i"/>.2.1 Service Complexity</h5>
						<canvas id="complexity-chart-summary_{$packageName}" width="400" height="400"/>
					</span>
					<span id="complexityLegend">
						<table>
							<tbody>
								<tr>
									<th>Key</th>
								</tr>
								<tr>
									<td style="background-color: #f7464a;color:black">Flow Services</td>
								</tr>
								<tr>
									<td style="background-color: #46bfbd;color:black;">Java Services</td>
								</tr>
							</tbody>
						</table>
					</span>
					<div class="page-break"/>
					<div id="complexity">
						<canvas id="complexity-chart-area_{$packageName}" width="1024" height="760"/>
						<table>
							<tbody>
								<tr>
									<th>Service</th>
									<th>Type</th>
									<th>Complexity Value</th>
								</tr>
								<xsl:for-each select="CodeCheckConfiguration/sensors/sensor[definition/@sensorName='CodeLines']/results[starts-with(@name,'complexityFactor')]">
									<xsl:sort select="@value" data-type="number" order="descending"/>
									<tr>
										<xsl:if test="(position() mod 2) = 0">
											<xsl:attribute name="class">trshade</xsl:attribute>
										</xsl:if>
										<td>
											<xsl:attribute name="style"><xsl:choose><xsl:when test="@name='complexityFactor-java'">background-color: #46bfbd;color:black;</xsl:when><xsl:otherwise>background-color: #f7464a;color:black</xsl:otherwise></xsl:choose></xsl:attribute>
											<xsl:value-of select="@item"/>
										</td>
										<td>
											<xsl:choose>
												<xsl:when test="@name='complexityFactor-java'">Java</xsl:when>
												<xsl:otherwise>Flow</xsl:otherwise>
											</xsl:choose>
										</td>
										<td>
											<xsl:choose>
												<xsl:when test="@value=1">Very Simple</xsl:when>
												<xsl:when test="@value=2">Simple</xsl:when>
												<xsl:when test="@value=3">Average</xsl:when>
												<xsl:when test="@value=4">Complex</xsl:when>
												<xsl:when test="@value=5">Very Complex</xsl:when>
												<xsl:otherwise>Unknown</xsl:otherwise>
											</xsl:choose>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</div>
					<a name="3.{$i}.2.2"/>
					<h5>3.<xsl:value-of select="$i"/>.2.2 Assets in numbers</h5>
					<div id="linesArea">
						<ul>
							<li class="linesLev1">Lines of Code: <xsl:value-of select="CodeCheckConfiguration/sensors/sensor[definition/@sensorName='CodeLines']/resultsGroup[@name='FlowCodeTotals']/results[@item='Services']/@value"/>
							</li>
							<ul>
								<li class="linesLev2">Flow: <xsl:value-of select="CodeCheckConfiguration/sensors/sensor[definition/@sensorName='CodeLines']/resultsGroup[@name='FlowCodeTotals']/results[@item='Flow']/@value"/>
								</li>
								<ul>
									<xsl:for-each select="CodeCheckConfiguration/sensors/sensor[definition/@sensorName='CodeLines']/resultsGroup[@name='FlowCodeTotals']/results[@name='Flow-breakdown']">
										<li class="linesLev3">
											<xsl:value-of select="@item"/>: <xsl:value-of select="@value"/>
										</li>
									</xsl:for-each>
								</ul>
								<li class="linesLev2">Java: <xsl:value-of select="CodeCheckConfiguration/sensors/sensor[definition/@sensorName='CodeLines']/resultsGroup[@name='FlowCodeTotals']/results[@item='Java']/@value"/>
								</li>
							</ul>
							<br/>
							<xsl:variable name="qualityScore" select="CodeCheckConfiguration/sensors/sensor[definition/@sensorName='totals']/resultsGroup[@name='SummaryTotals']/results[@name='overallQualityPct']/@value"/>
							<li class="linesLev1">Overall Quality Score: 
<xsl:choose>
									<xsl:when test="$qualityScore&lt;20"> Very poor</xsl:when>
									<xsl:when test="$qualityScore&lt;40"> Poor</xsl:when>
									<xsl:when test="$qualityScore&lt;60"> Average</xsl:when>
									<xsl:when test="$qualityScore&lt;80"> Good</xsl:when>
									<xsl:when test="$qualityScore&lt;101"> Excellent</xsl:when>
								</xsl:choose><![CDATA[ (]]><xsl:value-of select="$qualityScore"/>/100)</li>
							<xsl:variable name="max">
								<xsl:for-each select="CodeCheckConfiguration/sensors/sensor[definition/@sensorName='CodeLines']/results[starts-with(@name,'complexityFactor')]/@value">
									<xsl:sort select="." data-type="number" order="descending"/>
									<xsl:if test="position() = 1">
										<xsl:value-of select="."/>
									</xsl:if>
								</xsl:for-each>
							</xsl:variable>
							<li class="linesLev1">Overall Complexity: 
							<xsl:choose>
									<xsl:when test="$max=1">Very Simple</xsl:when>
									<xsl:when test="$max=2">Simple</xsl:when>
									<xsl:when test="$max=3">Average</xsl:when>
									<xsl:when test="$max=4">Complex</xsl:when>
									<xsl:when test="$max=5">Very Complex</xsl:when>
									<xsl:otherwise>Unknown</xsl:otherwise>
								</xsl:choose><![CDATA[ (]]><xsl:value-of select="$max"/><![CDATA[/5) ]]></li>
						</ul>
					</div>
					<div class="page-break"/>
					<a name="3.{$i}.2.3"/>
					<h5>3.<xsl:value-of select="$i"/>.2.3 Failed Checks</h5>
						<table class="fullwidth">
						<xsl:choose>
							<xsl:when test="count(CodeCheckConfiguration//Report/Test[@passed='false'])=0">
								<p>No Failed Checks</p>
							</xsl:when>
							<xsl:otherwise>
								<tbody class="fullwidth">
									<tr>
										<th>ID</th>
										<th>Rule Name</th>
										<th>Service/Item</th>
									</tr>
									<xsl:for-each select="CodeCheckConfiguration//Report/Test[@passed='false']">
										<tr>
											<xsl:choose>
												<xsl:when test="@ragStatus=1">
													<!--  Do nothing - test passed  -->
												</xsl:when>
												<xsl:when test="@ragStatus=0">
													<xsl:attribute name="class">AMBER</xsl:attribute>
												</xsl:when>
												<xsl:otherwise>
													<xsl:attribute name="class">RED</xsl:attribute>
												</xsl:otherwise>
											</xsl:choose>
											<td>
												<a class="white" href="#{substring-before(@check-id,'.')}">
													<xsl:value-of select="substring-before(@check-id,'.')"/>
												</a>
											</td>
											<td>
												<xsl:value-of select="../../../@name"/>
											</td>
											<td>
												<xsl:value-of select="Service"/>
											</td>
										</tr>
									</xsl:for-each>
								</tbody>
							</xsl:otherwise>
						</xsl:choose>
					</table>
					<div class="page-break"/>
					<a name="3.{$i}.3"/>
					<h4>3.<xsl:value-of select="$i"/>.3 Detail</h4>
					<xsl:apply-templates select="CodeCheckConfiguration/checks/check[@enabled='true']">
						<xsl:with-param name="pkgIndex" select="$i"/>
					</xsl:apply-templates>
				</xsl:for-each>
				<div class="page-break"/>
				
				
				<xsl:if test="/Review/MulticheckSummary">
					<a name="4.0"></a><h2>4.0 Multiple Check Summary</h2>
					<xsl:for-each select="/Review/MulticheckSummary">
						<xsl:variable name="i" select="position()"/>
						<a name="4.{$i}"></a><h3>4.<xsl:value-of select="$i"/><xsl:text> </xsl:text><xsl:value-of select="description"/></h3>

						<table class="fullwidth">
							<thead>
								<tr>
									<th>ID</th>
									<th>Message</th>
									<th>Passed</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="multiCheckResults">
									<tr>
										<xsl:attribute name="class">
											<xsl:choose>
												<xsl:when test="type='pass'">GREEN</xsl:when>
												<xsl:when test="type='fail'">RED</xsl:when>
												<xsl:otherwise>AMBER</xsl:otherwise>
											</xsl:choose>
										</xsl:attribute>
										<xsl:variable name="j" select="position()"/>
										<td>
											<xsl:value-of select="../@id"/>.<xsl:value-of select="$j"/>
										</td>
										<td>
											<xsl:value-of select="message"/>
										</td>
										<td>
											<xsl:value-of select="type"/>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>

					</xsl:for-each>				
					<div class="page-break"/>
				</xsl:if>
				
			</body>
		</html>
		<!-- Show only the enabled checks -->
	</xsl:template>
	<xsl:template match="check">
		<xsl:param name="pkgIndex"/>
		<a name="{@id}"/>
		<div class="check">
			<a name="3.{$pkgIndex}.3.{position()}"/>
			<h5>3.<xsl:value-of select="$pkgIndex"/>.3.<xsl:value-of select="position()"/>
				<xsl:text><![CDATA[ ]]></xsl:text>
				<xsl:value-of select="@name"/>
			</h5>
			<p>
				<xsl:value-of select="description" disable-output-escaping="yes"/>
			</p>
			<xsl:apply-templates select="results/Summary"/>
			<xsl:apply-templates select="results/Report"/>
		</div>
	</xsl:template>
	<xsl:template match="Summary">
		<div>
			<xsl:choose>
				<xsl:when test="ragStatus=1">
					<xsl:attribute name="class">RAGGREEN</xsl:attribute>
					<span class="RAGGREENTEXT">Passed</span>
				</xsl:when>
				<xsl:when test="ragStatus=0">
					<xsl:attribute name="class">RAGAMBER</xsl:attribute>
					<span class="RAGAMBERTEXT">Warnings</span>
				</xsl:when>
				<xsl:otherwise>
					<xsl:attribute name="class">RAGRED</xsl:attribute>
					<span class="RAGREDTEXT">Failed</span>
				</xsl:otherwise>
			</xsl:choose>
		</div>
		<br/>
		<div>
			<table>
				<tbody>
					<tr>
						<th>Total Tests</th>
						<td>
							<span class="value">
								<xsl:value-of select="total"/>
							</span>
						</td>
					</tr>
					<tr>
						<th>Passed</th>
						<td class="trshade">
							<span class="value">
								<xsl:value-of select="pass"/>
							</span>
						</td>
					</tr>
					<tr>
						<th>Warning</th>
						<td>
							<span class="value">
								<xsl:value-of select="warn"/>
							</span>
						</td>
					</tr>
					<tr>
						<th>Failed</th>
						<td class="trshade">
							<span class="value">
								<xsl:value-of select="fail"/>
							</span>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<br/>
	</xsl:template>
	<xsl:template match="Report">
		<xsl:choose>
			<xsl:when test="../Summary/total &gt; 0">
				<table class="fullwidth">
					<tbody class="fullwidth">
						<tr>
							<th>ID</th>
							<th>Item to be checked</th>
							<th>Value/Check</th>
							<th>Passed</th>
						</tr>
						<xsl:apply-templates select=".//Test"/>
					</tbody>
				</table>
			</xsl:when>
			<xsl:otherwise>
				<p>No assets to be tested were discovered</p>
			</xsl:otherwise>
		</xsl:choose>
		<div class="page-break"/>
	</xsl:template>
	<xsl:template match="Test">
		<tr>
			<xsl:choose>
				<xsl:when test="@ragStatus=1">
					<!--  Do nothing - test passed  -->
					<xsl:if test="(position() mod 2) = 0">
						<xsl:attribute name="class">trshade</xsl:attribute>
					</xsl:if>
				</xsl:when>
				<xsl:when test="@ragStatus=0">
					<xsl:attribute name="class">AMBER</xsl:attribute>
				</xsl:when>
				<xsl:otherwise>
					<xsl:attribute name="class">RED</xsl:attribute>
				</xsl:otherwise>
			</xsl:choose>
			<td>
				<xsl:value-of select="@check-id"/>
			</td>
			<td>
				<xsl:value-of select="Service"/>
			</td>
			<td>
				<xsl:value-of select="Value"/>
			</td>
			<td>
				<xsl:value-of select="@passed"/>
			</td>
		</tr>
	</xsl:template>
</xsl:stylesheet>
