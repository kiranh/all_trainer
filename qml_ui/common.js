function getSpriteImage(parent, spriteName) {
    var component = Qt.createComponent("qrc:/qml_ui/sprite.qml");
    if(component.status === Component.Ready) {
        return component.createObject(parent,  {"source": "qrc:/images/" + spriteName})
    } else {
        return null;
    }
}
var globalPlayer = null;

