<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<meta charset="ISO-8859-1">
<title>Corona Virus Status Countries wise</title>
</head>
<body>
	<style>
* {
	padding: 0;
	margin: 0;
	font-family: sans-serif;
}

.textarea {
	border: none;
	background-color: transparent;
	resize: none;
	outline: none;
}

.world-map {
	width: 100%;
	height: 500px;
	overflow: hidden;
}

.India-Map {
	width: 100%;
	height: 500px;
	overflow: hidden;
	height: 500px;
}

#stateTable #CountryTable {
	background-image: url('/css/searchicon.png');
	/* Add a search icon to input */
	background-position: 10px 12px; /* Position the search icon */
	background-repeat: no-repeat; /* Do not repeat the icon image */
	width: 100%; /* Full-width */
	font-size: 16px; /* Increase font-size */
	padding: 12px 20px 12px 40px; /* Add some padding */
	border: 1px solid #ddd; /* Add a grey border */
	margin-bottom: 12px; /* Add some space below the input */
}

#stateTable #CountryTable {
	border-collapse: collapse; /* Collapse borders */
	width: 100%; /* Full-width */
	border: 1px solid #ddd; /* Add a grey border */
	font-size: 18px; /* Increase font-size */
}

#stateTable th, #stateTable td, #CountryTable th, #CountryTable td {
	text-align: left; /* Left-align text */
	padding: 12px; /* Add padding */
}

#stateTable tr, #CountryTable tr {
	/* Add a bottom border to all table rows */
	border-bottom: 1px solid #ddd;
}

#stateTable tr.header, #stateTable tr:hover, #CountryTable tr.header,
	#CountryTable tr:hover {
	/* Add a grey background color to the table header and on hover */
	background-color: #f1f1f1;
}

table, th, td {
	border: 1px solid grey;
}

* {
	box-sizing: border-box;
}

body {
	margin: 0;
	font-family: Arial, Helvetica, sans-serif;
}

.header {
	overflow: hidden;
	background-color: #f1f1f1;
	padding: 20px 10px;
}

.header a {
	float: left;
	color: black;
	text-align: center;
	padding: 12px;
	text-decoration: none;
	font-size: 18px;
	line-height: 25px;
	border-radius: 4px;
}

.header a.logo {
	font-size: 25px;
	font-weight: bold;
}

.header a:hover {
	background-color: #ddd;
	color: black;
}

.header a.active {
	background-color: dodgerblue;
	color: white;
}

.header-right {
	float: right;
}

@media screen and (max-width: 500px) {
	.header a {
		float: none;
		display: block;
		text-align: left;
	}
	.header-right {
		float: none;
	}
}

.center {
	margin: auto;
	width: 60%;
	border: 3px solid green;
	padding: 10px;
}
</style>
	<link rel="stylesheet" href="jquery-jvectormap-2.0.5.css"
		type="text/css" media="screen" />
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
	<script src="jquery-jvectormap-2.0.5.min.js"></script>
	<script src="world.js"></script>
	<script src="indiamap.js"></script>

	<div class="header">
		<a href="#default" class="logo">Corona-Virus Tracker</a>
		<div class="header-right">
			<a class="active" onclick="buttonChangeActive(homeButton)"
				id="homeButton" href="#home">Home</a> <a
				onclick="buttonChangeActive('indiaButton')" id="indiaButton"
				href="#India-Map">India Corona-Virus Tracker</a> <a
				onclick="buttonChangeActive('worldButton')" id="worldButton"
				href="#world-map">World Corona-Virus Tracker</a>
		</div>
	</div>

	<div class="container">
		<div class="row">
			<hr>
			<p style="font-size:160%;">This is the Corona Virus Tracker which is using Real time data from Government sources and 
			from other verified Sources. All the Data shown in Table and Map is Updated in 24 Hours of Span !! </p>
			<hr>
			<div class="col">
				<h1 class="center">India Corona-virus Tracker Map View</h1>
				<br>
			</div>
		</div>
		<div class="row">
			<div class="col">
				<div class="India-Map" id="India-Map"></div>

			</div>
		</div>
		<br>
		<div class="row">

			<hr>
			<div class="col">
				<h1 class="center">India Corona-virus Tracker Table View</h1>
				<br>
			</div>

			<div class="col">
				<br> <input type="text" id="stateInput"
					style="font-size: 18pt; height: 40px; width: 1170px;"
					onkeyup="myFunction()"
					placeholder="Search Result State Name Wise...">

				<table id="stateTable" class="table table-striped">
					<br>
					<br>
					<thead class="thead-dark">
						<tr>
							<th scope="col">State Name</th>
							<th scope="col">Foreign Cases Count</th>
							<th scope="col">Indian Cases Count</th>
							<th scope="col">Discharged Count</th>
							<th scope="col">Total Deaths</th>
							<th scope="col">Total Confirmed</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${lstIndialst}" var="Indiadata"
							varStatus="loopCounter">
							<tr>
								<td><c:out value="${Indiadata.loc}" /></td>
								<td><c:out value="${Indiadata.confirmedCasesIndian}" /></td>
								<td><c:out value="${Indiadata.confirmedCasesForeign}" /></td>
								<td><c:out value="${Indiadata.discharged}" /></td>
								<td><c:out value="${Indiadata.deaths}" /></td>
								<td><c:out value="${Indiadata.totalConfirmed}" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>

		<div class="row">
			<div class="col">
				<hr>
				<div class="col">
					<h1 class="center">World Corona-virus Tracker Map View</h1>
					<br>
				</div>
				<br>

				<div class="world-map" id="world-map"></div>
			</div>
		</div>


		<div class="row">
			<div class="col">

				<hr>
				<div class="col">
					<h1 class="center">World Corona-virus Tracker Table View</h1>
					<br>
				</div>

				<br> <input type="text" id="CountryInput"
					style="font-size: 18pt; height: 40px; width: 1170px;"
					onkeyup="myFunctionCountry()"
					placeholder="Search Result Country Name Wise...">

				<table id="CountryTable" class="table table-striped">
					<br>
					<br>
					<thead class="thead-dark">
						<tr>
							<th scope="col">Country Name</th>
							<th scope="col">Total Today Cases</th>
							<th scope="col">Total Cases</th>
							<th scope="col">Today's Deaths Count</th>
							<th scope="col">Population</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${lstcountrylst}" var="CountryData"
							varStatus="loopCounter">
							<tr>
								<td><c:out value="${CountryData.country}" /></td>
								<td><c:out value="${CountryData.todayCases}" /></td>
								<td><c:out value="${CountryData.cases}" /></td>
								<td><c:out value="${CountryData.todayDeaths}" /></td>
								<td><c:out value="${CountryData.population}" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>

	</div>


	<script>
		$(function() {
			loadindiamap();
			loadmap();
		});

		function loadindiamap() {
			var size = $("#listIndia_size").val();
			var confirmedCasesIndiandic = {};
			var confirmedCasesForeigndic = {};
			var dischargeddic = {};
			var deathsdic = {};
			var totalConfirmeddic = {};

			for (var i = 1; i <= size; i++) {
				var iso2 = $("#iso2" + i).val();
				var confirmedCasesIndian = $("#confirmedCasesIndian" + i).val();
				var confirmedCasesForeign = $("#confirmedCasesForeign" + i)
						.val();
				var discharged = $("#discharged" + i).val();
				var deaths = $("#deaths" + i).val();
				var totalConfirmed = $("#totalConfirmed" + i).val();
				confirmedCasesIndiandic[iso2] = confirmedCasesIndian;
				confirmedCasesForeigndic[iso2] = confirmedCasesForeign;
				dischargeddic[iso2] = discharged;
				deathsdic[iso2] = deaths;
				totalConfirmeddic[iso2] = totalConfirmed;
				debugger
			}

			console.log(totalConfirmed);

			$('#India-Map').vectorMap(
					{
						map : 'in_merc',
						series : {
							regions : [ {
								values : totalConfirmeddic,
								scale : [ '#F9F3F2', '#B01D05' ],
								normalizeFunction : 'polynomial'
							} ]
						},
						onRegionTipShow : function(e, el, code) {
							var show = "";
							show += "</br> Total India Confirmed Cases: "
									+ confirmedCasesIndiandic[code];
							show += "</br> Total Foreign Confirmed Cases: "
									+ confirmedCasesForeigndic[code];
							show += "</br> Total Discharged: "
									+ dischargeddic[code];
							show += "</br> Total Deaths: " + deathsdic[code];
							show += "</br> Total Confirmed: "
									+ totalConfirmeddic[code];
							el.html(el.html() + show);
						}

					});
		}

		function loadmap() {
			var size = $("#size").val();

			var infectedData = {};
			var TotalDeaths = {};
			var Totalrecovered = {};

			for (var i = 1; i <= size; i++) {
				var iso2 = $("#countryiso2name" + i).val();
				var cases = $("#cases" + i).val();
				var deaths = $("#deaths" + i).val();
				var recovered = $("#recovered" + i).val();
				infectedData[iso2] = cases;
				TotalDeaths[iso2] = deaths;
				Totalrecovered[iso2] = recovered;
			}

			console.log(infectedData);

			$('#world-map').vectorMap({
				map : 'world_merc',
				series : {
					regions : [ {
						values : infectedData,
						scale : [ '#F9F3F2', '#B01D05' ],
						normalizeFunction : 'polynomial'
					} ]
				},
				onRegionTipShow : function(e, el, code) {
					var show = "";
					show += "</br> Total Cases: " + infectedData[code];
					show += "</br> Total Deaths: " + TotalDeaths[code];
					show += "</br> Total recovered: " + Totalrecovered[code];
					el.html(el.html() + show);
				}

			});
		}

		function myFunction() {
			// Declare variables
			var input, filter, table, tr, td, i, txtValue;
			input = document.getElementById("stateInput");
			filter = input.value.toUpperCase();
			table = document.getElementById("stateTable");
			tr = table.getElementsByTagName("tr");

			// Loop through all table rows, and hide those who don't match the search query
			for (i = 0; i < tr.length; i++) {
				td = tr[i].getElementsByTagName("td")[0];
				if (td) {
					txtValue = td.textContent || td.innerText;
					if (txtValue.toUpperCase().indexOf(filter) > -1) {
						tr[i].style.display = "";
					} else {
						tr[i].style.display = "none";
					}
				}
			}
		}

		function myFunctionCountry() {
			// Declare variables
			var input, filter, table, tr, td, i, txtValue;
			input = document.getElementById("CountryInput");
			filter = input.value.toUpperCase();
			table = document.getElementById("CountryTable");
			tr = table.getElementsByTagName("tr");

			// Loop through all table rows, and hide those who don't match the search query
			for (i = 0; i < tr.length; i++) {
				td = tr[i].getElementsByTagName("td")[0];
				if (td) {
					txtValue = td.textContent || td.innerText;
					if (txtValue.toUpperCase().indexOf(filter) > -1) {
						tr[i].style.display = "";
					} else {
						tr[i].style.display = "none";
					}
				}
			}
		}

		function buttonChangeActive(Id) {
			debugger
			$(".active").removeClass("active");
			$('#' + Id).addClass('active');
		}
	</script>

	<input type="hidden" id="size" value="${list_size}">
	<input type="hidden" id=listIndia_size value="${listIndia_size}">

	<c:forEach items="${lstcountrylst}" var="countrydata"
		varStatus="loopCounter">
		<tr>
			<input type="hidden" id="countryname${loopCounter.count}"
				value="${countrydata.country}">
			<input type="hidden" id="cases${loopCounter.count}"
				value="${countrydata.cases}">
			<input type="hidden" id="deaths${loopCounter.count}"
				value="${countrydata.deaths}">
			<input type="hidden" id="recovered${loopCounter.count}"
				value="${countrydata.recovered}">
			<input type="hidden" id="countryiso2name${loopCounter.count}"
				value="${countrydata.countryInfo.iso2}">

		</tr>
	</c:forEach>

	<c:forEach items="${lstIndialst}" var="IndiaData"
		varStatus="loopCounter">
		<tr>
			<input type="hidden" id="confirmedCasesIndian${loopCounter.count}"
				value="${IndiaData.confirmedCasesIndian}">
			<input type="hidden" id="confirmedCasesForeign${loopCounter.count}"
				value="${IndiaData.confirmedCasesForeign}">
			<input type="hidden" id="discharged${loopCounter.count}"
				value="${IndiaData.discharged}">
			<input type="hidden" id="deaths${loopCounter.count}"
				value="${IndiaData.deaths}">
			<input type="hidden" id="totalConfirmed${loopCounter.count}"
				value="${IndiaData.totalConfirmed}">
			<input type="hidden" id="iso2${loopCounter.count}"
				value="${IndiaData.iso2}">

		</tr>
	</c:forEach>



</body>
</html>