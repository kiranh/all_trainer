import QtQuick 2.4
import QtMultimedia 5.0
import "common.js" as Common

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
      id: choices
      width: top.width
      height: top.height - 100
      color: top.color
      Grid {
        columns: 2
        spacing: 20
        anchors.centerIn: parent
        Repeater {
          model: 4
          Rectangle {
            width: 256
            height: 256
            border.color: "#FF9933"
            property variant questionData: values.questions[index]
            Image {
              width: 256
              height: 256
              source: "file://" + assetHome + "/" + questionData.src
              fillMode: Image.PreserveAspectFit
              clip: true
            }

            MouseArea {
              anchors.fill: parent
              hoverEnabled: true
              onEntered: {
                root.playHoverSound(this, questionData.sound);
              }

              onClicked: {
                if(values.questions[index].correct) {
                  Common.getSpriteImage(parent, "ok.png");
                  root.playFile("file://" + assetHome + "/" + questionData.correct_sound);
                } else {
                  Common.getSpriteImage(parent, "wrong.png");
                  root.playFile("file://" + assetHome + "/sounds/wrong.m4a");
                }
              }
            }
          }
        }
      }
    }
  }

  Component.onCompleted: {
    root.playFile("file://" + assetHome + "/" + values.sound);
  }

}

