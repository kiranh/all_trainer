function getSpriteImage(parent, spriteName) {
    var component = Qt.createComponent("qrc:/sprite.qml");
    if(component.status === Component.Ready) {
        return component.createObject(parent,  {"source": "qrc:/" + spriteName})
    } else {
        return null;
    }
}
var globalPlayer = null;

function playSound(soundSource) {
    var component = Qt.createComponent("qrc:/player.qml");
    if(component.status === Component.Ready) {
        if(globalPlayer !== null) {
            globalPlayer.stop();
        }
        globalPlayer = component.createObject(parent,  {"source": soundSource});
        globalPlayer.play();
    } else {
        return null;
    }
}

