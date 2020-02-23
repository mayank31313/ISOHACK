<!DOCTYPE html>
<html style="height: 120px;opacity: 0.90;">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>famerlogin.html</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="assets/css/Login-Box-En.css">
    <link rel="stylesheet" href="assets/css/styles.css">
</head>

<body style="height: 700px;margin: 120px;">
<form action="register" method="POST">
    <div class="d-flex flex-column justify-content-center" id="login-box" style="opacity: 1;filter: brightness(91%) grayscale(0%) hue-rotate(5deg) invert(0%) saturate(129%);">
        <div class="login-box-header">
            <h6 style="color: #000000;margin-bottom: 0px;font-weight: 400;font-size: 27px;"><strong>Register</strong></h6>
        </div>
        <div class="d-flex flex-row align-items-center login-box-seperator-container">
            <div class="login-box-seperator"></div>
          
            <div class="login-box-seperator"></div>
        </div>
        <div class="email-login" style="background-color: #ffffff;"><input type="text" name="name" class="email-imput form-control" style="margin-top:10px;" required="" placeholder="Name">
            <input type="text" name="phone" class="email-imput form-control" style="margin-top:10px;" required="" placeholder="Mobile No." minlength="10">
            <input type="password" name="password" class="password-input form-control" style="margin-top:10px;" required="" placeholder="Password"
                minlength="6">

                <input type="text" name="district" class="email-imput form-control" style="margin-top:10px;" required="" placeholder="District" >
            <input type="text" name="state" class="email-imput form-control" style="margin-top:10px;" required="" placeholder="State">
            <input type="hidden" name="type" value="buyer">
        </div>

        <div class="submit-row" style="margin-bottom:8px;padding-top:0px;"><button class="btn btn-primary btn-block box-shadow" id="submit-id-submit" type="submit">Register</button>
        </div>

    </div>
</form>
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>

</html>