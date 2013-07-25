
var socketIOReady = $.Deferred();
var socket = io.connect();

var messages = [];
var chatroom;
var username = "";

socket.on('connect', function() {
    socket.emit('joinSlider', sliderName);
});

function updateClients(current) {
    $('#clients-holder').text(current);
}

socket.on('clientOnline', function(data) {
    updateClients(data.current);
});

socket.on('clientOffline', function(data) {
    updateClients(data.current);
});

socket.on('initSlider', function(data) {
    updateClients(data.current);
    socketIOReady.resolve(data);
});

socket.on('moveSlider', function(data) {
    if (Slider) {
        Slider.moveTo(data.index);
    }
});

socket.on('updatedItemList', function(data) {
    if (Slider) {
        Slider.updateList(data.itemIndex);
    }
});

socket.on('toggleSlider', function(data) {
    if (Slider) {
        Slider.toggle(data.visible);
    }
});

socket.on('message', function(data) {
    if (data.message) {
        messages.push(data);
        updateRoom();
        if (!$("#chatbox").hasClass("active")) {
            $("#newmsg").addClass("icon-white");
        }
    } else {
        console.log("There is a problem:", data);
    }
});

function sendMsg(text) {
    if (socket) {
        var data = {message: text, username: username};
        socket.emit('send', data);
        messages.push(data);
        updateRoom();
    }
}
function chat() {
    var msg = $("#chatmsg").val();
    if (msg.length > 0) {
        sendMsg(msg);
        $("#chatmsg").val("");
    }
}

function updateRoom() {
    var html = '';
    for (var i = 0; i < messages.length; i++) {
        html += '<b>' + (messages[i].username ? messages[i].username : 'Webenter') + ': </b>';
        html += messages[i].message + '<br />';
    }
    chatroom.innerHTML = html;
    chatroom.scrollTop = chatroom.scrollHeight;  
}

function initSlider(sliderInfo, jsonData) {
    Slider.init(jsonData, sliderInfo.index);
    Slider.toggle(sliderInfo.visible);
    //Slider.toggle(true);
    Slider.updateList(sliderInfo.itemIndex);
}



$(document).ready(function() {
    hljs.tabReplace = '  ';

    var jsonReady = $.Deferred();
    var templatesReady = $.Deferred();
    var stylesReady = $.Deferred();

    $.when(socketIOReady, jsonReady, templatesReady, stylesReady).done(initSlider);

    sliderio.view.partials.importSlides(function() {
        templatesReady.resolve();
    });

    sliderio.view.partials.importStyles(function() {
        stylesReady.resolve();
    });

    sliderio.service.slider.getSlides(function(data) {
        jsonReady.resolve(data);
    });
    chatroom = document.getElementById("chatroom");
    $('#chatmsg-send').bind('click', function() {
        chat();
    });
    $("#chatmsg").keyup(function(e) {
        if (e.keyCode === 13) {
            chat();
        }
    });
    
    
    $('#chatheader > a').bind('click', function() {
        if ($("#chatbox").hasClass("active")) {
            $("#chatbox").removeClass("active");
        } else {
            if (username.length === 0) {

            }
            $("#chatbox").addClass("active");
            $("#newmsg").removeClass("icon-white");
        }
    });
    $('#setusername').bind('click', function() {
        var newUser = $("#username").val();
        if (newUser.length > 0) {
            username = newUser;
        }
        $("#tell-me-username").fadeOut('fast');
        $("#chatbox #controls, #chatbox #chatroom").show();
    });

});






