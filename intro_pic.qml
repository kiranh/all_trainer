import QtQuick 2.4
import QtMultimedia 5.0

Rectangle {
  id: top
  width: parent.width
  height: parent.height
  color: "#F0FFD6"
  property variant values
  property string assetHome
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
      width: top.width
      height: (parent.height*4.0)/5 - 15
      color: top.color
      Rectangle {
        width: 640
        height: 480
        anchors.centerIn: parent
        border.color: "#FF9933"
        Image {
          width: 640
          height: 480
          source: "file://" + assetHome + "/" + values.src
          fillMode: Image.PreserveAspectFit
          clip: true
        }
      }
    }
  }
  Component.onCompleted: {
    root.playFile("file://" + assetHome + "/" + values.sound);
  }
}
