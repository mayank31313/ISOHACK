 <%
	Object obj = session.getAttribute("ID");
 	if(obj == null){
 		out.println("<script>window.location = '/ISO-HACK/logout'</script>");
 	}
 %>
 
 <header class="header-area"> 
    <!-- Navbar Area -->
    <div class="famie-main-menu">
      <div class="classy-nav-container breakpoint-off">
        <div class="container">
          <!-- Menu -->
          <nav class="classy-navbar justify-content-between" id="famieNav">
            <!-- Nav Brand -->
            <a href="index.jsp" class="nav-brand"><img src="img/core-img/agrilogo.png" alt=""></a>
            <!-- Navbar Toggler -->
            <div class="classy-navbar-toggler">
              <span class="navbarToggler"><span></span><span></span><span></span></span>
            </div>
            <!-- Menu -->
            <div class="classy-menu">
              <!-- Close Button -->
              <div class="classycloseIcon">
                <div class="cross-wrap"><span class="top"></span><span class="bottom"></span></div>
              </div>
              <!-- Navbar Start -->
              <div class="classynav">
                <ul>
                  <li class="active"><a href="index.jsp">Home</a></li>
                  <li><a href="sell.jsp">Sell Crop</a></li>
                  <!-- <li><a href="#">Services</a>
                    <ul class="dropdown">
                      <li><a href="farmerlogin.html">Sell Crop</a></li>
                      <li><a href="buyerlogin.html">Buy Crop</a></li>
                    </ul>
                  </li> -->
                  <li><a href="report.jsp">Reports</a></li>
                  <li><a href="tutorial.jsp">Tutorial</a></li>                  
                  <li><a href="contact.jsp">Contact</a></li>
                  <li class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" id="navDropDownLink" 
                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Profile
                        <i class="fa fa-user" aria-hidden="true"></i>
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navDropDownLink">
                        <a class="dropdown-item" href="#">Edit Profile</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="/ISO-HACK/logout">Logout</a>
                    </div>
                </li>
                  <!-- <li><a href="#">Profile&nbsp;<i class="fa fa-user" aria-hidden="true"></i></a>
                  <ul class="dropdown">
                    <li><a href="farmerlogin.html">Farmer</a></li>
                    <li><a href="buyerlogin.html">Buyer</a></li>
                  </ul>
                </li> -->
                </ul>
                <!-- Search Icon -->
              </div>
              <!-- Navbar End -->
            </div>
          </nav>
        </div>
      </div>
    </div>
  </header>
 