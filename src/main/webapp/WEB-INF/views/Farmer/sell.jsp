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
  <title>AGRIPRO | Home</title>
  <link rel="icon" href="resources/Farmer/img/core-img/favicon.ico">
  <link rel="stylesheet" href="/resources/Farmer/style.css">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  
  <script type="text/javascript">
  $(document).ready(function(){
	    console.log("LOADED")
	    $.get('restprices?district=Kurnool',  // url
	      function (data, textStatus, jqXHR) {  // success callback
	        console.log(data)
	          for (i=0;i<data.length;i++){
	            var d = data[i];
	            $("#tabId").append("<tr><td>" + d.commodity + "</td><td>"+ d.min_price +"</td><td><button data-toggle='modal' data-target='#buyers' class='btn btn-success'>Sell</button></td></tr>")
	          }
	    });
	  });
  </script>
  <style>
  td{
  padding-top:8px;
  }
  .btn-success{
  width:100px;
  }
  
  </style>
  
</head>

<body>
  <div class="preloader d-flex align-items-center justify-content-center">
    <div class="spinner"></div>
  </div>

  <%@ include file = "header.jsp" %>
  
  <div class="breadcrumb-area bg-img bg-overlay jarallax" style="background-image: url('/resources/Farmer/img/bg-img/18.jpg');">
    <div class="container h-100">
      <div class="row h-100 align-items-center">
        <div class="col-12">
          <div class="breadcrumb-text">
            <h2> Sell Crops<h2>
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
          <li class="breadcrumb-item active" aria-current="page">Crops</li>
        </ol>
      </nav>
    </div>
  </div>
	
	<div class="container-fluid">
		<div class="row text-center">
			<div class="col-12">
				<table id="tabId" cellspacing="10" cellpadding="20" style="width: 100%; border: 1px solid black">
				</table>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="buyers" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLongTitle">Buyer Info</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
			  <div class="container">
			    <div class="card card-default" id="card_contacts">
			        <div id="contacts" class="panel-collapse collapse show" aria-expanded="true">
			            <ul class="list-group pull-down" id="contact-list">
			                <li class="list-group-item">
			                    <div class="row w-100">
			                        <div class="col-12 col-sm-6 col-md-3 px-0">
			                            <img src="/resources/Farmer/img/buyerlogo.png" alt="Mike Anamendolla" class="rounded-circle mx-auto d-block img-fluid" style="width: 100px; height: 100px;">
			                        </div>
			                        <div class="col-12 col-sm-6 col-md-9 text-center text-sm-left">
			                            <label class="name lead">Mukesh rajani</label>
			                            <br> 
			                            <span class="text-muted">Address : Ahmedabad</span>
			                            <br>
			
			                            <span class="text-muted small">Mobile no : +91 435223</span>
			                            <br>
			
			                            <span class="text-muted small text-truncate">Price : 1700-1900</span>
			
			                        </div>
			                    </div>
			                </li>
			            </ul>
			        </div>
			    </div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
	        <button type="button" class="btn btn-primary" data-dismiss="modal">Select</button>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- 

     -->
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

</html>