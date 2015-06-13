function getSpriteImage(parent, spriteName) {
    var component = Qt.createComponent("qrc:/sprite.qml");
    if(component.status === Component.Ready) {
        return component.createObject(parent,  {"source": "qrc:/" + spriteName})
    } else {
        return null;
    }
}

function playSound(soundSource) {
    var component = Qt.createComponent("qrc:/player.qml");
    if(component.status === Component.Ready) {
        var player = component.createObject(parent,  {"source": soundSource});
        player.play();
    } else {
        return null;
    }
}

