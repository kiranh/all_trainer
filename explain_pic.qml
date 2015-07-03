import QtQuick 2.4
import QtMultimedia 5.0
import "common.js" as Common

Question {
  id: top
  width: parent.width
  height: parent.height
  Column {
    Rectangle {
      width: top.width
      height: 30
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
        height: 480
        source: "file://" + assetHome + "/" + values.src
        fillMode: Image.PreserveAspectFit
        clip: true
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
      height: 300
      Text {
        font.pointSize: 32
        anchors.centerIn: parent
        text: values.text
      }
    }
  }
  Component.onCompleted: {
    //stop recording
    mainRoot.stop();
    // start recording
    mainRoot.record();
  }

  Component.onDestruction:  {
    mainRoot.stop();
  }
}
