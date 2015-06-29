import QtQuick 2.4
import QtMultimedia 5.0
import "common.js" as Common

Rectangle {
  id: containerRectangle
  color: "#F0FFD6"
  property variant values
  property string assetHome

  Component.onCompleted: {
    mainRoot.playFile("file://" + assetHome + "/" + values.sound);
  }

  function handleClick(questionData, parent) {
    if(questionData.correct) {
      Common.getSpriteImage(parent, "ok.png");
      mainRoot.playFile("file://" + assetHome + "/" + questionData.correct_sound);
      if(questionData.animate) {
        parent.width = 400;
        parent.height = 400;
      }
    } else {
      var wrong = Common.getSpriteImage(parent, "wrong.png");
      mainRoot.playFile("file://" + assetHome + "/sounds/wrong.m4a");
      wrong.destroy(1000);
    }
  }
}

