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
        width: parent.width - 20
        text: values.header
        font.pointSize: values.text_size || 35
        anchors.centerIn: parent
        wrapMode: Text.WordWrap
        anchors.margins: 10
        horizontalAlignment: Text.Center
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
          model: values.questions.length
          Rectangle {
            width: 256
            height: 256
            border.color: "#FF9933"
            property variant questionData: values.questions[index]
            Image {
              width: parent.width
              height: parent.height
              source: "file://" + assetHome + "/" + questionData.src
              fillMode: Image.PreserveAspectFit
              clip: true
            }

            Behavior on width {
              NumberAnimation {
                duration: 600
                easing.type: Easing.OutBack
              }
            }

            Behavior on height {
              NumberAnimation {
                duration: 600
                easing.type: Easing.OutBack
              }
            }

            MouseArea {
              anchors.fill: parent
              hoverEnabled: true
              onEntered: {
                mainRoot.playHoverSound(this, questionData.sound);
              }

              onClicked: handleClick(questionData, parent)
            }
          }
        }
      }
    }
  }
}
