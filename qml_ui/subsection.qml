import QtQuick 2.4
import QtQuick.Controls 1.3
import QtMultimedia 5.0
import "loader.js" as Content


// subsection loads
Rectangle {
  id: root
  width: 2014
  height: mainRoot.height - 64
  visible: true
  color: "#F2FFD6"
  property int currentPage: 1
  property int maximumPage: {
    if (Content.content) {
      Content.content.length
    } else {
      0
    }
  }

  property string assetHome;
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
            var qmlFile = contentData.type || "lesson_loader";
            mainRoot.showNewPage(qmlFile, contentData.src);
          }
          onEntered: {
            mainRoot.playHoverSound(this, contentData.sound);
          }
        }
      }
    }
  }
}
