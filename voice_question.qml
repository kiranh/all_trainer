import QtQuick 2.4
import QtMultimedia 5.0
import "common.js" as Common
import Qt.WebSockets 1.0


Question {
  id: top
  width: parent.width
  height: parent.height
  Column {
    Rectangle {
      width: top.width
      height: (top.height)/5.0
      color: top.color
      Text {
        text: values.header
        font.pointSize: 35
        anchors.centerIn: parent
      }
    }
    Rectangle {
      width: top.width
      height: 10
      color: top.color
    }

    Rectangle {
      width: parent.width
      height: 380
      border.color: "#FF9933"
      Image {
        width: 640
        height: 380
        source: "file://" + assetHome + "/" + values.src
        fillMode: Image.PreserveAspectFit
        clip: true
        anchors.centerIn: parent
      }
    }
  }

  WebSocket {
    id: socket
    url: "ws://192.168.1.102:9100"
  }
}
