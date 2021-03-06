import QtQuick 2.4
import QtMultimedia 5.0

Rectangle {
    width: parent.width
    height: parent.height
    color: "#F0FFD6"
    property variant values
    property string assetHome

    Text {
        text: values.header
        font.pointSize: 35
        anchors.centerIn: parent
    }

    Component.onCompleted: {
        mainRoot.playFile("file://" + assetHome + "/" + values.sound);
    }
}
