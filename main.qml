import QtQuick 2.4
import QtQuick.Controls 1.3
import QtMultimedia 5.0
import "content.js" as Content

Rectangle {
  id: mainRoot
  width: 1024
  height: 768
  visible: true
  property int maximumPage: Content.content.length

  Rectangle {
    id: choices
    width: mainRoot.width
    height: mainRoot.height
    color: "#F2FFD6"
    Grid {
      columns: 2
      spacing: 20
      anchors.centerIn: parent
      Repeater {
        model: maximumPage
        Rectangle {
          width: 320
          height: 320
          border.color: "#FF9933"
          Text {
            text: Content.content[index].header
          }
          MouseArea {
            anchors.fill: parent
            hoverEnabled: true
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
