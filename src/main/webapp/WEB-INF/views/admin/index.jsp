<!DOCTYPE html>
<html lang="en">
<style type="text/css">
<!--
#goog-gt-tt {display:none !important;}
.goog-te-banner-frame {display:none !important;}
.goog-te-menu-value:hover {text-decoration:none !important;}
.goog-te-gadget-icon {background-image:url(//gtranslate.net/flags/gt_logo_19x19.gif) !important;background-position:0 0 !important;}
body {top:0 !important;}
-->
</style>
<div id="google_translate_element"></div>
<script type="text/javascript">
function googleTranslateElementInit() {new google.translate.TranslateElement({pageLanguage: 'en', layout: google.translate.TranslateElement.InlineLayout.SIMPLE,autoDisplay: false, includedLanguages: ''}, 'google_translate_element');}
</script><script type="text/javascript" src="https://translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>

<head>
  <meta charset="UTF-8">
  <meta name="description" content="">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>AGRIPRO | Home</title>
  <link rel="icon" href="/resources/Farmer/img/core-img/favicon.ico">
  <link rel="stylesheet" href="/resources/Farmer/style.css">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  
  <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
  

</head>

<body>
  <div class="preloader d-flex align-items-center justify-content-center">
    <div class="spinner"></div>
  </div>


    <!-- ##### Header Area Start ##### -->
  <%@ include file = "header.jsp" %>
  <!-- ##### Header Area End ##### -->
  <div id="container_" style="width: 100%; height:100%;">
  </div>

  <script src="/resources/Farmer/js/jquery.min.js"></script>
  <script src="/resources/Farmer/js/popper.min.js"></script>
  <script src="/resources/Farmer/js/bootstrap.min.js"></script>
  <script src="/resources/Farmer/js/owl.carousel.min.js"></script>
  <script src="/resources/Farmer/js/classynav.js"></script>
  <script src="/resources/Farmer/js/wow.min.js"></script>
  <script src="/resources/Farmer/js/jquery.sticky.js"></script>
  <script src="/resources/Farmer/js/jquery.magnific-popup.min.js"></script>
  <script src="/resources/Farmer/js/jquery.scrollup.min.js"></script>
  <script src="/resources/Farmer/js/jarallax.min.js"></script>
  <script src="/resources/Farmer/js/jarallax-video.min.js"></script>
  <script src="/resources/Farmer/js/active.js"></script>
</body>

<script type="text/javascript">
      google.charts.load("current", {packages:["corechart"]});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
    	  var States = [
    		  "Andaman and Nicobar Islands",
          "Gujarat",
          "Karnataka",
          "Madhya Pradesh",
          "Odisha",
          "Punjab"
    	  ]
    	  for(var j in States){
          axios
            .get("/admin/productionReport?state="+States[j])
            .then(response => {
              console.log(response.data);
              var array = [['Crop', 'Production']]
              for(var i in response.data){
                array.push([response.data[i].crop, response.data[i].production/100])
              }
              console.log(array)
              var data = google.visualization.arrayToDataTable(array);

              var options = {
                title: response.data[0].state,
                is3D: true,
              };

              var chartDiv = $('<div id="'+response.data[i].id+'" style="display: inline-block; width: 40%; height: 500px;"></div>')
              $("#container_").append(chartDiv)

              var chart = new google.visualization.PieChart(document.getElementById(response.data[i].id));
              chart.draw(data, options); 
            })
            .catch(error => console.error(error));
            }
      }      
    </script>

</html>