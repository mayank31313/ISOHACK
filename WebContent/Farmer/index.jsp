<!DOCTYPE html>
<html lang="en">
<%
String status = (String)request.getAttribute("status");
if(status != null){
	out.println("<script>window.location = 'Farmer/index.jsp'</script>");
}
%>
<head>
  <meta charset="UTF-8">
  <meta name="description" content="">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>AGRIPRO | Home</title>
  <link rel="icon" href="img/core-img/favicon.ico">
  <link rel="stylesheet" href="style.css">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

<body>
  <div class="preloader d-flex align-items-center justify-content-center">
    <div class="spinner"></div>
  </div>

  <header class="header-area">
    
    <div class="famie-main-menu">
      <div class="classy-nav-container breakpoint-off">
        <div class="container">
          <nav class="classy-navbar justify-content-between" id="famieNav">
            <a href="index.html" class="nav-brand"><img src="img/core-img/agrilogo.png" alt=""></a>
            <div class="classy-navbar-toggler">
              <span class="navbarToggler"><span></span><span></span><span></span></span>
            </div>
            <div class="classy-menu">
              <div class="classycloseIcon">
                <div class="cross-wrap"><span class="top"></span><span class="bottom"></span></div>
              </div>
              <div class="classynav">
                <ul>
                  <li class="active"><a href="index.html">Home</a></li>
                  <li><a href="sell.html">Sell Crop</a></li>
                  <li><a href="report.html">Reports</a></li>
                  <li><a href="tutorial.html">Tutorial</a></li>
                  <li><a href="contact.html">Contact</a></li>
                  <li class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" id="navDropDownLink" 
                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Profile
                        <i class="fa fa-user" aria-hidden="true"></i>
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navDropDownLink">
                        <a class="dropdown-item" href="#">Edit Profile</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="#">Logout</a>
                    </div>
                </li>
                </li>
                </ul>
              </div>
            </div>
          </nav>
        </div>
      </div>
    </div>
  </header>
  <section class="famie-benefits-area section-padding-100-0 pb-5">
    <div class="container">
      <div class="row">
        <div class="col-12">
          <div class="benefits-thumbnail mb-50">
            <img src="img/bg-img/2.jpg" alt="">
          </div>
        </div>
      </div>
 
      <div class="row justify-content-center">
        <div class="col-12 col-sm-4 col-lg">
          <div class="single-benefits-area wow fadeInUp mb-50" data-wow-delay="100ms">
            <img src="img/core-img/digger.png" alt="">
            <h5>Services</h5>
          </div>
        </div>

        <div class="col-12 col-sm-4 col-lg">
          <div class="single-benefits-area wow fadeInUp mb-50" data-wow-delay="300ms">
            <img src="img/core-img/windmill.png" alt="">
            <h5>Price Compare</h5>
          </div>
        </div>

        <div class="col-12 col-sm-4 col-lg">
          <div class="single-benefits-area wow fadeInUp mb-50" data-wow-delay="500ms">
            <img src="img/core-img/cereals.png" alt="">
            <h5>Chat or Connect</h5>
          </div>
        </div>

        <div class="col-12 col-sm-4 col-lg">
          <div class="single-benefits-area wow fadeInUp mb-50" data-wow-delay="700ms">
            <img src="img/core-img/tractor.png" alt="">
            <h5>Reports</h5>
          </div>
        </div>

        <div class="col-12 col-sm-4 col-lg">
          <div class="single-benefits-area wow fadeInUp mb-50" data-wow-delay="900ms">
            <img src="img/core-img/sunrise.png" alt="">
            <h5>Use ?</h5>
          </div>
        </div>
      </div>
    </div>
  </section> 
 

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