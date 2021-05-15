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


<head>
  <meta charset="UTF-8">
  <meta name="description" content="">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>AGRIPRO | Report</title>

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <link rel="stylesheet" href="css/style1.css">
  <link rel="icon" href="img/core-img/favicon.ico">
  <link rel="stylesheet" href="style.css"> 
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

<script>
  $(document).ready(function(){
    console.log("LOADED")
    $.get('restprices?district=Kurnool',  // url
      function (data, textStatus, jqXHR) {  // success callback
        console.log(data)
          for (i=0;i<data.length;i++){
            var d = data[i];
            console.log(d.url)
            load(d)
          }
    });
  });
  function load(data){
    var div = document.createElement("DIV");    
    var img = document.createElement("IMG");
    img.src = data.path;
    img.className = "b"
    img.style = "width:100%; height: 100%; border: 2px orange solid"
    
    var middle_div = document.createElement("DIV");
    middle_div.className = "c";
    
    var price_div = document.createElement("DIV");
    price_div.style = "color: white; font-size: 30px;";
    price_div.innerHTML = data.commodity;
    middle_div.appendChild(price_div);
    
    price_div = document.createElement("DIV");
    price_div.style = "color: white; font-size: 15px;";
    price_div.innerHTML = "Variety: " + data.variety;
    middle_div.appendChild(price_div);
    
    var text_div = document.createElement("DIV");
    text_div.className = "d";
    text_div.innerHTML = data.modal_price;
    
    middle_div.appendChild(text_div)
    div.appendChild(img);
    div.appendChild(middle_div);
    div.className = "a col-md-3";
    var row_div = document.getElementById("test1")
    row_div.appendChild(div);
  }
</script>

<body>
  <div class="preloader d-flex align-items-center justify-content-center">
    <div class="spinner"></div>
  </div>

 <%@ include file="header.jsp" %>
  <div class="breadcrumb-area bg-img bg-overlay jarallax" style="background-image: url('img/bg-img/18.jpg');">
    <div class="container h-100">
      <div class="row h-100 align-items-center">
        <div class="col-12">
          <div class="breadcrumb-text">
            <h2> Reports<h2>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="famie-breadcrumb">
    <div class="container">
      <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="index.html"><i class="fa fa-home"></i> Home</a></li>
          <li class="breadcrumb-item active" aria-current="page">Reports</li>
        </ol>
      </nav>
    </div>
  </div>
   <div class="container-fluid" >
      <div class="row" id="test1" style="margin-left: 250px;"></div>
    </div>

  <script src="js/jquery.min.js"></script>
  <script src="js/popper.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/owl.carousel.min.js"></script>
  <script src="js/classynav.js"></script>
  <script src="js/wow.min.js"></script>
  <script src="js/jquery.sticky.js"></script>
  <script src="js/jquery.magnific-popup.min.js"></script>
  <script src="js/jquery.scrollup.min.js"></script>
  <script src="js/jarallax.min.js"></script>
  <script src="js/jarallax-video.min.js"></script>
  <script src="js/active.js"></script>
</body>

</html>