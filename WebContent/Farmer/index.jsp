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


    <!-- ##### Header Area Start ##### -->
  <%@ include file = "header.jsp" %>
  <!-- ##### Header Area End ##### -->
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