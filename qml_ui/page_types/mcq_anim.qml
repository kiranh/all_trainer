import QtQuick 2.4
import QtMultimedia 5.0
import "../common.js" as Common
import "../"

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
      id: option_loader
      width: 400
      height: 400
      color: top.color
    }

  }
}
