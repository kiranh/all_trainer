function getSpriteImage(parent, spriteName) {
    var component = Qt.createComponent("qrc:/sprite.qml");
    if(component.status === Component.Ready) {
        return component.createObject(parent,  {"source": "qrc:/" + spriteName})
    } else {
        return null;
    }
}

