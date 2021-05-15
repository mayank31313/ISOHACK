<!DOCTYPE html>
<html style="height: 120px;opacity: 0.90;">
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
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>famerlogin.html</title>
    <link rel="stylesheet" href="resources/assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="resources/assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="resources/assets/css/Login-Box-En.css">
    <link rel="stylesheet" href="resources/assets/css/styles.css">
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
            <input type="hidden" name="role" value="BUYER">  
        </div>

        <div class="submit-row" style="margin-bottom:8px;padding-top:0px;"><button class="btn btn-primary btn-block box-shadow" id="submit-id-submit" type="submit">Register</button>
        </div>

    </div>
</form>
    <script src="resources/assets/js/jquery.min.js"></script>
    <script src="resources/assets/bootstrap/js/bootstrap.min.js"></script>
</body>

</html>