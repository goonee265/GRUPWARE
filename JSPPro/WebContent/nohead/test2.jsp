<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>Google chart </title>
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
        url : "test.jsp",
        dataType : 'json',
        success : function(data) {
            
            queryObject = eval('(' + JSON.stringify(data,null, 2) + ')');             
            // stringify : 인자로 전달된 자바스크립트의 데이터(배열)를 JSON문자열로 바꾸기.   
            // eval: javascript 코드가 맞는지 검증하고 문자열을 자바스크립트 코드로 처리하는 함수 
            // queryObject.barlist[0].city ="korea"
 
            queryObjectLen = queryObject.barlist.length;
            // queryObject.empdetails 에는 4개의 Json 객체가 있음 
 
            alert('test' + queryObjectLen);
            // alert(queryObject.barlist[0].city +queryObject.barlist[0].per );
        },
        error : function(xhr, type) {
            alert('server error occoured')
        }
    });
 
    
    
    google.charts.load('current', {
        packages : [ 'corechart', 'bar' ]
    });
    google.charts.setOnLoadCallback(drawMultSeries);
 
    function drawMultSeries() {
        
         var data = new google.visualization.DataTable();
         data.addColumn('string', '연도');
         data.addColumn('number', 'TV');
         data.addColumn('number', '케이블TV');
         data.addColumn('number', '라디오');
         data.addColumn('number', '신문');
         data.addColumn('number', '인터넷');
         data.addColumn('number', '모바일');
         data.addColumn('number', '옥외');
         
 
        //alert('data생성');
        for (var i = 0; i < queryObjectLen; i++) {
            var year = queryObject.barlist[i].year;
            var tv = queryObject.barlist[i].tv;
            var cabletv = queryObject.barlist[i].cabletv;
            var radio = queryObject.barlist[i].radio;
            var newspaper = queryObject.barlist[i].newspaper;
            var internet = queryObject.barlist[i].internet;
            var mobile = queryObject.barlist[i].mobile;
            var outdoor = queryObject.barlist[i].outdoor;
            //alert(city + amount + per);
             data.addRows([
                            [year,tv,cabletv,radio,newspaper,internet,mobile,outdoor]
                        ]);
        }
 
        var options = {
            title : "광고 매체별 매출액(2014~2020, 단위:백만원)",
            chartArea : {
                
            },
            
            hAxis : {
                title : "광고 매체 종류",
                minValue : 0,
                titleTextStyle: {
                    fontSize: 24
                  }
            },
            vAxis : {
                title : "연도",
                	titleTextStyle: {
                        fontSize: 24
                      }
            },
            
            titleTextStyle: {
                fontSize: 24
              },
              
            bar: {groupWidth: "300%"},
            
            animation: { //차트가 뿌려질때 실행될 애니메이션 효과
                startup: true,
                duration: 1000,
                easing: 'linear' },
              annotations: {
                  textStyle: {
                    fontSize: 15,
                    bold: true,
                    italic: true,
                    color: '#871b47',
                    auraColor: '#d799ae',
                    opacity: 0.8
                  }
             }
            
        };
        var chart = new google.visualization.BarChart(document
                .getElementById("chart_div"));
        chart.draw(data, options);
    }
</script>
</head>
<body>
    <div id="chart_div" style="width:1000; height:500; display: block; margin: 0 auto;"></div> 
</body>
</html>