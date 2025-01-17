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
<%
String msg = (String)request.getAttribute("msg");
if(msg != null){
	out.println("<script>alert('"+msg+"')</script>");
}
%>
<body style="height: 700px;margin: 120px;">
<form action="login" method="POST">
    <div class="d-flex flex-column justify-content-center" id="login-box" style="opacity: 1;filter: brightness(91%) grayscale(0%) hue-rotate(5deg) invert(0%) saturate(129%);">
        <div class="login-box-header">
            <h6 style="color: #000000;margin-bottom: 0px;font-weight: 400;font-size: 27px;"><strong>LOGIN</strong></h6>
        </div>
        <div class="login-box-content">
            <div class="fb-login box-shadow"><a class="d-flex flex-row align-items-center social-login-link" href="#"><i class="fa fa-facebook" style="margin-left:0px;padding-right:20px;padding-left:22px;width:56px;"></i>Login with Facebook</a></div>
            <div class="gp-login box-shadow"><a class="d-flex flex-row align-items-center social-login-link" style="margin-bottom:10px;" href="#"><i class="fa fa-google" style="color:rgb(255,255,255);width:56px;"></i>Login with Google+</a></div>
        </div>
        <div class="d-flex flex-row align-items-center login-box-seperator-container">
            <div class="login-box-seperator"></div>
            <div class="login-box-seperator-text">
                <p style="margin-bottom:0px;padding-left:10px;padding-right:10px;font-weight:400;color:rgb(201,201,201);">or</p>
            </div>
            <div class="login-box-seperator"></div>
        </div>
        <div class="email-login" style="background-color: #ffffff;">
            <input type="text" class="email-imput form-control" style="margin-top:10px;" name="username" required="" placeholder="Mobile No." minlength="10">
            <input type="password" class="password-input form-control" name="password" style="margin-top:10px;" required="" placeholder="Password"
                minlength="6">
            <input type="hidden" name="type" value="farmer">
            </div>

        <div class="submit-row" style="margin-bottom:8px;padding-top:0px;"><button class="btn btn-primary btn-block box-shadow" id="submit-id-submit" type="submit">Login</button>
    </form>           
            <div class="d-flex justify-content-between">
                <div class="form-check form-check-inline" id="form-check-rememberMe"><input class="form-check-input" type="checkbox" id="formCheck-1" for="remember" style="cursor:pointer;" name="check"><label class="form-check-label" for="formCheck-1"><span class="label-text">Remember Me</span></label></div><a id="forgot-password-link"
                    href="#">Forgot Password?</a></div>
        </div>
        <div id="login-box-footer" style="padding:10px 20px;padding-bottom:23px;padding-top:18px;">
            <p style="margin-bottom:0px;">Don't you have an account?</p>
            <p style="margin-bottom:0px;">Register as a farmer<a id="register-link" href="/fsignup">Sign Up!</a></p>
            <p style="margin-bottom:0px;">Register as a Buyer<a id="register-link" href="/bsignup">Sign Up!</a></p>
        </div>
    </div>
    <script src="resources/assets/js/jquery.min.js"></script>
    <script src="resources/assets/bootstrap/js/bootstrap.min.js"></script>
</body>

</html>