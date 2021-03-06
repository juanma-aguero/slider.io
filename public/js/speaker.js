
var go = {};
go.left = function() {
    Slider.moveLeft(emitMoveSlider);
};
go.right = function() {
    Slider.moveRight(emitMoveSlider);
};
go.toggle = function() {
    var isVisible = Slider.toggle();
    if (socket) {
        socket.emit('toggleSlider', {
            visible: isVisible,
            pass: (sliderio && sliderio.passcode) || ''
        });
    }
};
go.toggleDetails = function(visible) {
    if (socket)
        Slider.toggleCheatSheet(visible);
    else
        Slider.toggleComments(visible);
};

function emitMoveSlider(idx, type) {
    if (socket) {
        if (type === 'list')
            socket.emit('updatedItemList', {
                index: idx,
                pass: (sliderio && sliderio.passcode) || ''
            });
        else
            socket.emit('moveSlider', {
                index: idx,
                pass: (sliderio && sliderio.passcode) || ''
            });
    }
}

$(document).ready(function() {

    $("body").bind('keyup', function(e) {

        switch (e.keyCode || e.which) {
            case 37: //left
                go.left();
                break;
            case 39: //right
                go.right();
                break;
            case 38: //up
                go.toggleDetails(true);
                break;
            case 40: //down
                go.toggleDetails(false);
                break;
        }

    }).swipeEvents()
            .bind("swipeLeft", go.right)
            .bind("swipeRight", go.left)
            .bind("swipeUp", function() {
        go.toggleDetails(true);
    })
            .bind("swipeDown", function() {
        go.toggleDetails(false);
    });


    $("body").keydown(function(e) {
        if (e.keyCode === 83 && e.ctrlKey) {
            go.toggle();
            return false;
        }
    });

    if (socket) {
        $('#clients-holder').show();

        authenticate(function() {
        });
    }
});

