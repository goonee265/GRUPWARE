<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>Google chart</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script type="text/javascript">
	var queryObject = "";
	var queryObjectLen = "";
	$.ajax({
		type : "POST",
		url : "pie3.jsp",
		dataType : 'json',
		success : function(data) {

			queryObject = eval('(' + JSON.stringify(data, null, 2) + ')');
			// stringify : 인자로 전달된 자바스크립트의 데이터(배열)를 JSON문자열로 바꾸기.   
			// eval: javascript 코드가 맞는지 검증하고 문자열을 자바스크립트 코드로 처리하는 함수 
			// queryObject.barlist[0].city ="korea"

			queryObjectLen = queryObject.barlist.length;
			// queryObject.empdetails 에는 4개의 Json 객체가 있음 

			// alert(queryObject.barlist[0].city +queryObject.barlist[0].per );
		},
		error : function(xhr, type) {
			alert('server error occoured')
		}
	});

	google.charts.load('current', {
		packages : [ 'corechart', 'bar' ]
	});

	if (<%=request.getParameter("id")%>==1) {
		google.charts.setOnLoadCallback(drawMultSeries);
		function drawMultSeries() {

			var data = new google.visualization.DataTable();

			data.addColumn('string', 'category');
			data.addColumn('number', 'c2018_11');

			//alert('data생성');
			for (var i = 0; i < queryObjectLen; i++) {

				var category = queryObject.barlist[i].category;
				var c2018_11 = queryObject.barlist[i].c2018_11;

				//alert(city + amount + per);
				data.addRows([ [ category, c2018_11 ] ]);

			}

			var options = {
				title : "Test",
				chartArea : {
					width : "500%",
					height : "500%"
				},
				hAxis : {
					title : "TEST IMPORMATION",
					minValue : 0
				},
				vAxis : {
					title : "City"
				}
			};
			var chart = new google.visualization.PieChart(document
					.getElementById("chart_div"));
			chart.draw(data, options);
		}

	}else if (<%=request.getParameter("id")%>== 2) {
		google.charts.setOnLoadCallback(drawMultSeries);

		function drawMultSeries() {

			var data = new google.visualization.DataTable();

			data.addColumn('string', 'category');
			data.addColumn('number', 'c2018_12');

			//alert('data생성');
			for (var i = 0; i < queryObjectLen; i++) {
				var category = queryObject.barlist[i].category;
				var c2018_12 = queryObject.barlist[i].c2018_12;

				//alert(city + amount + per);
				data.addRows([ [ category, c2018_12 ] ]);

			}

			var options = {
				title : "Test",
				chartArea : {
					width : "500%",
					height : "500%"
				},
				hAxis : {
					title : "TEST IMPORMATION",
					minValue : 0
				},
				vAxis : {
					title : "City"
				}
			};
			var chart = new google.visualization.PieChart(document
					.getElementById("chart_div"));
			chart.draw(data, options);
		}
	}else if (<%=request.getParameter("id")%>== 3) {
		google.charts.setOnLoadCallback(drawMultSeries);

		function drawMultSeries() {

			var data = new google.visualization.DataTable();

			data.addColumn('string', 'category');
			data.addColumn('number', 'c2019_01');

			//alert('data생성');
			for (var i = 0; i < queryObjectLen; i++) {
				var category = queryObject.barlist[i].category;
				var c2019_01 = queryObject.barlist[i].c2019_01;

				//alert(city + amount + per);
				data.addRows([ [ category, c2019_01 ] ]);

			}

			var options = {
				title : "Test",
				chartArea : {
					width : "500%",
					height : "500%"
				},
				hAxis : {
					title : "TEST IMPORMATION",
					minValue : 0
				},
				vAxis : {
					title : "City"
				}
			};
			var chart = new google.visualization.PieChart(document
					.getElementById("chart_div"));
			chart.draw(data, options);
		}
	}else if (<%=request.getParameter("id")%>== 4) {
		google.charts.setOnLoadCallback(drawMultSeries);

		function drawMultSeries() {

			var data = new google.visualization.DataTable();

			data.addColumn('string', 'category');
			data.addColumn('number', 'c2019_02');

			//alert('data생성');
			for (var i = 0; i < queryObjectLen; i++) {
				var category = queryObject.barlist[i].category;
				var c2019_02 = queryObject.barlist[i].c2019_02;

				//alert(city + amount + per);
				data.addRows([ [ category, c2019_02 ] ]);

			}

			var options = {
				title : "Test",
				chartArea : {
					width : "500%",
					height : "500%"
				},
				hAxis : {
					title : "TEST IMPORMATION",
					minValue : 0
				},
				vAxis : {
					title : "City"
				}
			};
			var chart = new google.visualization.PieChart(document
					.getElementById("chart_div"));
			chart.draw(data, options);
		}
	}else if (<%=request.getParameter("id")%>== 5) {
		google.charts.setOnLoadCallback(drawMultSeries);

		function drawMultSeries() {

			var data = new google.visualization.DataTable();

			data.addColumn('string', 'category');
			data.addColumn('number', 'c2019_03');

			//alert('data생성');
			for (var i = 0; i < queryObjectLen; i++) {
				var category = queryObject.barlist[i].category;
				var c2019_03 = queryObject.barlist[i].c2019_03;

				//alert(city + amount + per);
				data.addRows([ [ category, c2019_03 ] ]);

			}

			var options = {
				title : "Test",
				chartArea : {
					width : "500%",
					height : "500%"
				},
				hAxis : {
					title : "TEST IMPORMATION",
					minValue : 0
				},
				vAxis : {
					title : "City"
				}
			};
			var chart = new google.visualization.PieChart(document
					.getElementById("chart_div"));
			chart.draw(data, options);
		}
	}else if (<%=request.getParameter("id")%>== 6) {
		google.charts.setOnLoadCallback(drawMultSeries);

		function drawMultSeries() {

			var data = new google.visualization.DataTable();

			data.addColumn('string', 'category');
			data.addColumn('number', 'c2019_04');

			//alert('data생성');
			for (var i = 0; i < queryObjectLen; i++) {
				var category = queryObject.barlist[i].category;
				var c2019_04 = queryObject.barlist[i].c2019_04;

				//alert(city + amount + per);
				data.addRows([ [ category, c2019_04 ] ]);

			}

			var options = {
				title : "Test",
				chartArea : {
					width : "500%",
					height : "500%"
				},
				hAxis : {
					title : "TEST IMPORMATION",
					minValue : 0
				},
				vAxis : {
					title : "City"
				}
			};
			var chart = new google.visualization.PieChart(document
					.getElementById("chart_div"));
			chart.draw(data, options);
		}
	}else if (<%=request.getParameter("id")%>== 7) {
		google.charts.setOnLoadCallback(drawMultSeries);

		function drawMultSeries() {

			var data = new google.visualization.DataTable();

			data.addColumn('string', 'category');
			data.addColumn('number', 'c2019_05');

			//alert('data생성');
			for (var i = 0; i < queryObjectLen; i++) {
				var category = queryObject.barlist[i].category;
				var c2019_05 = queryObject.barlist[i].c2019_05;

				//alert(city + amount + per);
				data.addRows([ [ category, c2019_05 ] ]);

			}

			var options = {
				title : "Test",
				chartArea : {
					width : "500%",
					height : "500%"
				},
				hAxis : {
					title : "TEST IMPORMATION",
					minValue : 0
				},
				vAxis : {
					title : "City"
				}
			};
			var chart = new google.visualization.PieChart(document
					.getElementById("chart_div"));
			chart.draw(data, options);
		}
	}else if (<%=request.getParameter("id")%>== 8) {
		google.charts.setOnLoadCallback(drawMultSeries);

		function drawMultSeries() {

			var data = new google.visualization.DataTable();

			data.addColumn('string', 'category');
			data.addColumn('number', 'c2019_06');

			//alert('data생성');
			for (var i = 0; i < queryObjectLen; i++) {
				var category = queryObject.barlist[i].category;
				var c2019_06 = queryObject.barlist[i].c2019_06;

				//alert(city + amount + per);
				data.addRows([ [ category, c2019_06 ] ]);

			}

			var options = {
				title : "Test",
				chartArea : {
					width : "500%",
					height : "500%"
				},
				hAxis : {
					title : "TEST IMPORMATION",
					minValue : 0
				},
				vAxis : {
					title : "City"
				}
			};
			var chart = new google.visualization.PieChart(document
					.getElementById("chart_div"));
			chart.draw(data, options);
		}
	}else if (<%=request.getParameter("id")%>== 9) {
		google.charts.setOnLoadCallback(drawMultSeries);

		function drawMultSeries() {

			var data = new google.visualization.DataTable();

			data.addColumn('string', 'category');
			data.addColumn('number', 'c2019_07');

			//alert('data생성');
			for (var i = 0; i < queryObjectLen; i++) {
				var category = queryObject.barlist[i].category;
				var c2019_07 = queryObject.barlist[i].c2019_07;

				//alert(city + amount + per);
				data.addRows([ [ category, c2019_07 ] ]);

			}

			var options = {
				title : "Test",
				chartArea : {
					width : "500%",
					height : "500%"
				},
				hAxis : {
					title : "TEST IMPORMATION",
					minValue : 0
				},
				vAxis : {
					title : "City"
				}
			};
			var chart = new google.visualization.PieChart(document
					.getElementById("chart_div"));
			chart.draw(data, options);
		}
	}else if (<%=request.getParameter("id")%>== 10) {
		google.charts.setOnLoadCallback(drawMultSeries);

		function drawMultSeries() {

			var data = new google.visualization.DataTable();

			data.addColumn('string', 'category');
			data.addColumn('number', 'c2019_08');

			//alert('data생성');
			for (var i = 0; i < queryObjectLen; i++) {
				var category = queryObject.barlist[i].category;
				var c2019_08 = queryObject.barlist[i].c2019_08;

				//alert(city + amount + per);
				data.addRows([ [ category, c2019_08 ] ]);

			}

			var options = {
				title : "Test",
				chartArea : {
					width : "500%",
					height : "500%"
				},
				hAxis : {
					title : "TEST IMPORMATION",
					minValue : 0
				},
				vAxis : {
					title : "City"
				}
			};
			var chart = new google.visualization.PieChart(document
					.getElementById("chart_div"));
			chart.draw(data, options);
		}
	}else if (<%=request.getParameter("id")%>== 11) {
		google.charts.setOnLoadCallback(drawMultSeries);

		function drawMultSeries() {

			var data = new google.visualization.DataTable();

			data.addColumn('string', 'category');
			data.addColumn('number', 'c2019_09');

			//alert('data생성');
			for (var i = 0; i < queryObjectLen; i++) {
				var category = queryObject.barlist[i].category;
				var c2019_09 = queryObject.barlist[i].c2019_09;

				//alert(city + amount + per);
				data.addRows([ [ category, c2019_09 ] ]);

			}

			var options = {
				title : "Test",
				chartArea : {
					width : "500%",
					height : "500%"
				},
				hAxis : {
					title : "TEST IMPORMATION",
					minValue : 0
				},
				vAxis : {
					title : "City"
				}
			};
			var chart = new google.visualization.PieChart(document
					.getElementById("chart_div"));
			chart.draw(data, options);
		}
	}else if (<%=request.getParameter("id")%>== 12) {
		google.charts.setOnLoadCallback(drawMultSeries);

		function drawMultSeries() {

			var data = new google.visualization.DataTable();

			data.addColumn('string', 'category');
			data.addColumn('number', 'c2019_10');

			//alert('data생성');
			for (var i = 0; i < queryObjectLen; i++) {
				var category = queryObject.barlist[i].category;
				var c2019_10 = queryObject.barlist[i].c2019_10;

				//alert(city + amount + per);
				data.addRows([ [ category, c2019_10 ] ]);

			}

			var options = {
				title : "Test",
				chartArea : {
					width : "500%",
					height : "500%"
				},
				hAxis : {
					title : "TEST IMPORMATION",
					minValue : 0
				},
				vAxis : {
					title : "City"
				}
			};
			var chart = new google.visualization.PieChart(document
					.getElementById("chart_div"));
			chart.draw(data, options);
		}
	}
</script>
</head>
<body>
	<div id="chart_div"></div>
</body>
</html>