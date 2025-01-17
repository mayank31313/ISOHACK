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
	const socket = io(':9092/');
	console.log("Socket successfully initialised")

    var user = {};
    user.avatar = "https://www.jamf.com/jamf-nation/img/default-avatars/generic-user-purple.png";
    var bot = {};
    bot.avatar = "https://cdn-images-1.medium.com/max/1600/1*OiKXrkvrsUqA105iY9iAwg.png";

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
   
    function insertChat(who, text,data){
        var control = "";
        var date = formatAMPM(new Date());
        
        if (who == "me"){
            control = '<li style="width:100%;">' +
                            '<div class="msj-rta macro">' +
                                '<div class="text text-r">' +
                                    '<p class="message">'+text+'</p>' +
                                    '<p><small>'+date+'</small></p>' +
                                '</div>' +
                            '<div class="avatar" style="padding:0px 0px 0px 10px !important"><img class="img-circle" style="width: 50px;" src="'+user.avatar+'" /></div>' +                                
                    '</li>';
            message = {"message":data.text,session_id:socket.id}
            socket.emit('user_uttered', message); 
        }
        else if(who == "bot"){
            li = $(document.createElement("LI")).css({
                "width":"100%" 
            })        
            div1 = $(document.createElement("div")).css({
                "max-width":"80%"
            }).addClass('msj macro')
            div1.append('<div class="avatar"> '+
                            '<img class="img-circle" style="width: 50px;" src="'+ bot.avatar +'" />'+
                        '</div>')

            div2 = $(document.createElement("div")).addClass('text text-l')
            try{
                json = JSON.parse(text)
                console.log("JSON")
                console.log(json)
                div3 = $(document.createElement("DIV"))
                div3.append("<h4>" + json.name + "</h4>")
                div3.append("<span>Distance: " + json.distance + "</span><br>")
                div3.append("Ratings: " + json.ratings + "<br>")
                div2.append(div3)
            }
            catch(err){
                div2.append('<p class="message">'+ text +'</p>')
            }

            div1.append(div2)
            if(data && data["quick_replies"]){
                data_type = data["quick_replies"][0].payload

                if(data_type == "combobox"){
                    select = $(document.createElement("select")).css({
                        'padding':'5px',
                        'margin-top': '10px',
                        'max-width': '70%',
                        'border-radius': '20px',
                        'font-size': '15px'                      
                    }) 
                    
                    select.append("<option>Select One</option>")
                    for(i=1;i<data["quick_replies"].length;i++){
                        select.append("<option value="+data["quick_replies"][i].payload+">" + data["quick_replies"][i].title + "</option>")
                    }
                    

                    $(select).change(function(){
                        insertChat('me',this.value,{"text":this.value})
                        //$(".mytext").val(this.value)
                        //$(".mytext").trigger({type: 'keydown', which: 13, keyCode: 13});
                        $(this).off('change')
                    });

                    div2.append(select)
                }

                if(data_type == "buttons"){
                    button_group = $(document.createElement("div"))
                    for(i=1;i<data["quick_replies"].length;i++){
                        button = $(document.createElement("button")).css({
                            "width":"40px",
                            "min-height": "30px",
                            "padding": "5px",
                            "margin": "10px",
                            "color": "white",
                            "background": "#EA6625",
                            "border" :"none",
                            "border-radius":"20px"
                        })
                        button.val(data["quick_replies"][i].payload)
                        button.html(data["quick_replies"][i].title)

                        $(button).click(function(){
                            insertChat('me',this.innerHTML,{"text":this.value})
                            //$(".mytext").val(this.innerHTML)
                            //$(".mytext").trigger({type: 'keydown', which: 13, keyCode: 13});
                            $(this).off('click')
                        })
                        button_group.append(button)
                    }  
                    div2.append(button_group)                
                }
            }
            div2.append('<p><small>'+date+'</small></p>');
            control = div1
        }
        
        $("ul").append(control).scrollTop($("ul").prop('scrollHeight'));   
    }

    function resetChat(){
        $("ul").empty();
        insertChat("bot","Hello! I am Restaurent Bot, ready your your Order. What would you like to have?",null)
        
        /*insertChat("me","call me Mayank",null)*/
    }

    $(".mytext").on("keydown", function(e){
        if (e.which == 13){
            var text = $(this).val();
            if (text !== ""){
                insertChat("me", text,{"text":text});              
                $(this).val('');
            }
        }
    });

    $("#sendMessage").click(function(){
        $(".mytext").trigger({type: 'keydown', which: 13, keyCode: 13});
    })
    resetChat();
    socket.on('bot_uttered',function(data){
		//console.log(data);
		insertChat("bot",data.text,data)
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