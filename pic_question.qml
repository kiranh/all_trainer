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
      id: choices
      width: top.width
      height: top.height - 520
      color: top.color
      Grid {
        columns: 2
        spacing: 20
        anchors.centerIn: parent
        Repeater {
          model: values.questions.length
          Rectangle {
            width: 256
            height: 64
            border.color: "#FF9933"
            property variant questionData: values.questions[index]
            Text {
              text: questionData.text
              anchors.centerIn: parent
              font.pointSize: 26
            }

            MouseArea {
              anchors.fill: parent
              hoverEnabled: true
              onEntered: {
                mainRoot.playHoverSound(this, questionData.sound);
              }

              onClicked: {
                if(values.questions[index].correct) {
                  Common.getSpriteImage(parent, "ok.png");
                  mainRoot.playFile("file://" + assetHome + "/" + questionData.correct_sound);
                } else {
                  var wrong = Common.getSpriteImage(parent, "wrong.png");
                  wrong.destroy(1500);
                  mainRoot.playFile("file://" + assetHome + "/sounds/wrong.m4a");
                }
              }
            }
          }
        }
      }
    }
  }

  Component.onCompleted: {
    mainRoot.playFile("file://" + assetHome + "/" + values.sound);
  }

}

