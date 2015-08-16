import QtQuick 2.4
import QtQuick.Controls 1.3
import QtMultimedia 5.0
import "loader.js" as Content

Rectangle {
  id: welcomePage
  width: 1024
  height: mainRoot.height - 64
  color: "#F2FFD6"
  property int maximumPage: {
    if (Content.content) {
      Content.content.length
    } else {
      0
    }
  }

  Grid {
    columns: 2
    spacing: 20
    anchors.centerIn: parent
    Repeater {
      model: maximumPage
      Rectangle {
        width: 400
        height: 80
        border.color: "#FF9933"
        property variant contentData: Content.content[index]

        Text {
          text: contentData.header
          anchors.centerIn: parent
          font.pointSize: 22
        }
        MouseArea {
          hoverEnabled: true
          anchors.fill: parent
          onClicked: {
            mainRoot.showNewPage("lesson_loader", contentData.src);
          }
          onEntered: {
            console.log("PLaying hover soubnd");
            mainRoot.playHoverSound(this, contentData.sound);
          }
        }
      }
    }
  }
}

