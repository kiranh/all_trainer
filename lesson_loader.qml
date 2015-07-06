import QtQuick 2.4
import QtQuick.Controls 1.3
import QtMultimedia 5.0
import "loader.js" as Data

Rectangle {
  id: root
  width: 1024
  height: mainRoot.height - 64
  visible: true
  property int currentPage: 1
  property int maximumPage: Data.data.length
  property string assetHome;


  Row {
    Rectangle {
      id: navBack
      width: root.width/10.0;
      height: root.height
      color: "#FF8A24"
      Image {
        id: backButton
        source: Qt.resolvedUrl("qrc:/back.png")
        anchors.centerIn: parent
      }
      MouseArea {
        anchors.fill: parent
        onClicked: {
          if(currentPage > 1) {
            currentPage = currentPage - 1
            stackView.push({"item": getCurrentPage(), immediate: true, replace: true, destroyOnPop: true});
          }
        }
      }

    }

    StackView {
      id: stackView
      width: (root.width*8)/10
      height: root.height
      focus: true
      Component.onCompleted: {
        stackView.push({"item": getCurrentPage(), immediate: true, replace: true, destroyOnPop: true});
      }
    }

    Rectangle {
      id: navForward;
      width: (root.width)/10.0
      height: root.height
      color: "#FF8A24"
      Image {
        id: forwardButton
        source: Qt.resolvedUrl("qrc:/forward.png")
        anchors.centerIn: parent
      }
      MouseArea {
        anchors.fill: parent
        onClicked: {
          if(currentPage < maximumPage) {
            currentPage += 1
            stackView.push({"item": getCurrentPage(), immediate: true, replace: true, destroyOnPop: true});
          }
        }
      }
    }
  }

  function getCurrentPage() {
    var currentData = Data.data[currentPage - 1];
    var component = Qt.createComponent("qrc:/" + currentData.type + ".qml");
    if(component.status === Component.Ready) {
      return component.createObject(stackView, {"values": currentData, "assetHome": assetHome});
    } else {
      return null;
    }
  }
}
