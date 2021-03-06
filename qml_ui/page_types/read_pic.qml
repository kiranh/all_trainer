import QtQuick 2.4
import QtMultimedia 5.0
import "../common.js" as Common
import "../"

Question {
  id: top
  width: parent.width
  height: parent.height
  Component.onCompleted: {
    var image = loadImage(values.src, top, {
                            width: 640,
                            height: 480,
                            source: "file://" + assetHome + "/" + values.src,
                            fillMode: Image.PreserveAspectFit,
                            clip: true,
                            "anchors.centerIn": top
                          });
    mainRoot.playLastRecordNow();
  }
}
