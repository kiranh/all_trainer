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

    Rectangle {
      width: parent.width
      height: 128
      border.color: "red"
      Image {
        id: playButton
        width: 128
        height: 128
        source: "qrc:/record.png"
        fillMode: Image.PreserveAspectFit
        clip: true
        anchors.centerIn: parent

        MouseArea {
          anchors.fill: parent

          onClicked: {
            mainRoot.record();
            playText.text = "Stop";
            playButton.visible = false;
            stopButton.visible = true;
          }
        }
      }


      Image {
        id: stopButton
        width: 128
        height: 128
        source: "qrc:/stop.png"
        fillMode: Image.PreserveAspectFit
        clip: true
        anchors.centerIn: parent
        visible: false

        MouseArea {
          anchors.fill: parent

          onClicked: {
            playButton.visible = true;
            stopButton.visible = false;
            mainRoot.playLastRecord();
            playText.text = "Play";
          }
        }
      }
      Text {
        id: playText
        font.pointSize: 20
        anchors.centerIn: parent
        text: "Play"
        color: "white"
      }
    }
  }

}
