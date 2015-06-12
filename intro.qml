import QtQuick 2.4
import QtMultimedia 5.0

Rectangle {
    width: parent.width
    height: parent.height
    color: "#F0FFD6"
    Text {
        text: header
        font.pointSize: 35
        anchors.centerIn: parent
    }

    MediaPlayer {
        id: player
        source: Qt.resolvedUrl(source)
    }

    Component.onCompleted: {
        player.play();
    }
}
