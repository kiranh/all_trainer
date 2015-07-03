import QtQuick 2.4
import QtMultimedia 5.0
import "common.js" as Common

Question {
  id: top
  width: parent.width
  height: parent.height
  Image {
    width: parent.width
    height: 640
    anchors.centerIn: parent
    source: "file://" + assetHome + "/" + values.src
    fillMode: Image.PreserveAspectFit
    clip: true
  }
  Component.onCompleted: {
    mainRoot.playLastRecordNow();
  }
}
