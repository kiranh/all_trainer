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
      id: choices
      width: top.width
      height: top.height - 100
      color: top.color

      Grid{
        columns: 2
        spacing: 20
        anchors.centerIn: parent

        Repeater {
          model: values.questions.length
          Rectangle {
            property variant questionData: values.questions[index]
            width: { questionData.big ? 324 : 156 }
            height: { questionData.big ? 324 : 156 }
            border.color: "#FF9933"

            Image {
              width: parent.width
              height: parent.height
              source: "file://" + assetHome + "/" + questionData.src
              fillMode: Image.PreserveAspectFit
              clip: true
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
