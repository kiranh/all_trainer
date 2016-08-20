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

  Video {
    id: video
    source: "file://" + assetHome + "/" + values.src
    autoPlay: false
    width: parent.width
    height: parent.height - 100
    anchors.centerIn: parent
  }

  Timer {
    id: cartoonTimer
    repeat: false
    running: false
  }

  Component.onCompleted: {
    console.log("I am completed");
    var seekPosition = (parseFloat(values.position)*60*1000).toFixed();
    var duration = (parseFloat(values.duration)*60*1000).toFixed();
    video.seek(seekPosition);
    cartoonTimer.interval = duration;
    cartoonTimer.triggered.connect(function(){
      video.stop();
      cartoonTimer.stop();
    });
    cartoonTimer.start();
    video.play();
  }
}

