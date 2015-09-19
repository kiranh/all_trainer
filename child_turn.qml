import QtQuick 2.4
import QtMultimedia 5.0
import "common.js" as Common

Question {
  id: top
  width: parent.width
  height: parent.height
  Column {
    Rectangle {
      id: picContainer
      width: parent.width
      height: 500
      border.color: "#FF9933"
    }

    Rectangle {
      width: top.width
      height: 10
      color: top.color
    }

    Rectangle {
      width: parent.width
      height: 300
      color: "#68bffb"
      Text {
        font.pointSize: 20
        anchors.centerIn: parent
        text: values.text
      }
    }
  }
  Component.onCompleted: {
    var image = loadImage(values.src, picContainer, {
                            width: 640,
                            height: 480,
                            source: "file://" + assetHome + "/" + values.src,
                            fillMode: Image.PreserveAspectFit,
                            clip: true,
                            "anchors.centerIn": picContainer
                          });
    // stop playing any existing sound
    mainRoot.stopPlaying();
    //stop recording
    mainRoot.stopRecording();
    if(values.sound)
      mainRoot.playFile("file://" + assetHome + "/" + values.sound);
  }
}
