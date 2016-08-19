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
        source: Qt.resolvedUrl("qrc:/images/back.png")
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
        source: Qt.resolvedUrl("qrc:/images/forward.png")
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

  function shuffle_array(array) {
    var currentIndex = array.length, temporaryValue, randomIndex ;

    // While there remain elements to shuffle...
    while (0 !== currentIndex) {

      // Pick a remaining element...
      randomIndex = Math.floor(Math.random() * currentIndex);
      currentIndex -= 1;

      // And swap it with the current element.
      temporaryValue = array[currentIndex];
      array[currentIndex] = array[randomIndex];
      array[randomIndex] = temporaryValue;
    }

    return array;
  }

  function getCurrentPage() {
    var currentData = Data.data[currentPage - 1];
    if(currentData.questions && (currentData.questions instanceof Array)) {
      var questions = currentData.questions;
      shuffle_array(questions);
      currentData.questions = questions;
    }

    var component = Qt.createComponent("qrc:/qml_ui/" + currentData.type + ".qml");
    if(component.status === Component.Ready) {
      return component.createObject(stackView, {"values": currentData, "assetHome": assetHome});
    } else {
      return null;
    }
  }
}
