<%
String name = (String)session.getAttribute("name");
%>

<html>
    <head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>  
        <script src="https://cdnjs.cloudflare.com/ajax/libs/socket.io/2.2.0/socket.io.js" ></script>          
    </head>
    <body>
        <div class="container" style="height: 100%;">
            <div class="row" style="height: 100%;">
                <div class="col-sm-3 frame" style="height: 100%;">
                    <ul style="height: 90%;"></ul>
                    <div style="max-height: 65px;">
                        <div class="msj-rta macro" style="width: inherit;">                        
                            <div class="text text-r" style="background:whitesmoke !important;width: 100%;">
                                <input class="mytext" placeholder="Type a message"/>
                            </div> 
                        </div>
                        <div style="padding:10px; width: 9rem;">
                            <button id="sendMessage"><i class="fas fa-paper-plane"></i></button>
                        </div>                
                    </div>
                </div>       
            </div>
        </div>
    </body>
</html>

<script>
$(document).ready(function(){
	const socket = io(':9092')
	console.log("Socket successfully initialised")
	
    var user = {};
    user.avatar = "https://www.jamf.com/jamf-nation/img/default-avatars/generic-user-purple.png";
    var bot = {};
    bot.avatar = "https://www.jamf.com/jamf-nation/img/default-avatars/generic-user-purple.png";

    function formatAMPM(date) {
        var hours = date.getHours();
        var minutes = date.getMinutes();
        var ampm = hours >= 12 ? 'PM' : 'AM';
        hours = hours % 12;
        hours = hours ? hours : 12; // the hour '0' should be '12'
        minutes = minutes < 10 ? '0'+minutes : minutes;
        var strTime = hours + ':' + minutes + ' ' + ampm;
        return strTime;
    }     
   
    function insertChat(who,data){
        var control = "";
        var date = formatAMPM(new Date());
        
        if (who == "me"){
            control = '<li style="width:100%;">' +
                            '<div class="msj-rta macro">' +
                                '<div class="text text-r">' +
                                    '<p class="message">'+data.msg+'</p>' +
                                    '<p><small>'+date+'</small></p>' +
                                '</div>' +
                            '<div class="avatar" style="padding:0px 0px 0px 10px !important"><img class="img-circle" style="width: 50px;" src="'+user.avatar+'" /></div>' +                                
                    '</li>';
            message = {"msg":data.msg,name:"<%=name%>"}
            socket.emit('msg', message); 
        }
        else if(who == "other"){
            li = $(document.createElement("LI")).css({
                "width":"100%" 
            })        
            div1 = $(document.createElement("div")).css({
                "max-width":"80%"
            }).addClass('msj macro')
            div1.append('<div class="avatar"> '+
            				"<p style='font-size: 10px; '>"+data.name+"</p><br><br>"+
                            '<img class="img-circle" style="width: 50px;" src="'+ bot.avatar +'" />'+
                        '</div>')

            div2 = $(document.createElement("div")).addClass('text text-l')
            
            div2.append('<p class="message">'+ data.msg +'</p>')
            

            div1.append(div2)
            div2.append('<p><small>'+date+'</small></p>');
            control = div1
        }
        
        $("ul").append(control).scrollTop($("ul").prop('scrollHeight'));   
    }

    function resetChat(){
        $("ul").empty();
        //insertChat("other",{msg: "Welcome to issue forum what are your queries ?"})
    }

    $(".mytext").on("keydown", function(e){
        if (e.which == 13){
            var text = $(this).val();
            if (text !== ""){
                insertChat("me", {"msg":text});              
                $(this).val('');
            }
        }
    });

    $("#sendMessage").click(function(){
        $(".mytext").trigger({type: 'keydown', which: 13, keyCode: 13});
    })
    resetChat();
    socket.on('chatevent',function(data){
    	console.log(data)
		insertChat("other",data)
	});  
});

</script>

<style>
*{
    margin: 0px;
    padding: 0px;
    width: 100%;
}

.message{
    font-size: 1.5rem !important;
    padding: 10px !important;
}
#sendMessage{
    background-color: #EA6625;
    border: none;
    border-radius: 30px;
    padding: 10px;
}
#sendMessage i{
    font-size: 20px;
    color: #fff;
}
.mytext{
    border: solid  2px #EA6625;
    border-radius: 50px;
    padding:10px;
    margin: 2px;
    width: 100%;
    background:whitesmoke;
}
.text{
    width:75%;
    display:flex;
    flex-direction:column;
}
.text > p:first-of-type{
    width:100%;
    margin-top:0;
    margin-bottom:auto;
    line-height: 13px;
    font-size: 12px;
}
.text > p:last-of-type{
    width:100%;
    text-align:right;
    color:silver;
    margin-bottom:-7px;
    margin-top:auto;
}
.text-l{
    float:left;
    padding-right:10px;
}        
.text-r{
    float:right;
    padding-left:10px;
}
.avatar{
    display:flex;
    justify-content:center;
    align-items:center;
    width:25%;
    float:left;
    padding-right:10px;
}
.macro{
    margin-top:5px;
    width: auto;
    height: auto;
    border-radius:5px;
    padding:5px;
    display:flex;
}
.msj-rta{
    float:right;
    background:whitesmoke;
}
.msj{
    float:left;
    background:white;
}
.frame{
    background:#e0e0de;
    height:475px;
    width: 100%;
    overflow:hidden;
    padding:0;
}
.frame > div:last-of-type{
    position:absolute;
    bottom:0;
    width:100%;
    display:flex;
}
body > div > div > div:nth-child(2) > span{
    background: whitesmoke;
    padding: 10px;
    font-size: 21px;
    border-radius: 50%;
}
body > div > div > div.msj-rta.macro{
    margin:auto;
    margin-left:1%;
}
ul {
    width:100%;
    list-style-type: none;
    padding:18px;
    position:absolute;
    bottom:47px;
    display:flex;
    flex-direction: column;
    top:0;
    overflow-y:scroll;
}
.msj:before{
    width: 0;
    height: 0;
    content:"";
    top:-5px;
    left:-14px;
    position:relative;
    border-style: solid;
    border-width: 0 13px 13px 0;
    border-color: transparent #ffffff transparent transparent;            
}
.msj-rta:after{
    width: 0;
    height: 0;
    content:"";
    top:-5px;
    left:14px;
    position:relative;
    border-style: solid;
    border-width: 13px 13px 0 0;
    border-color: whitesmoke transparent transparent transparent;           
}  
input:focus{
    outline: none;
}        
::-webkit-input-placeholder { /* Chrome/Opera/Safari */
    color: #d4d4d4;
}
::-moz-placeholder { /* Firefox 19+ */
    color: #d4d4d4;
}
:-ms-input-placeholder { /* IE 10+ */
    color: #d4d4d4;
}
:-moz-placeholder { /* Firefox 18- */
    color: #d4d4d4;
}  
</style>