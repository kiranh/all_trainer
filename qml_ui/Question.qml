import QtQuick 2.4
import QtMultimedia 5.0
import "common.js" as Common

Rectangle {
  id: containerRectangle
  color: "#F0FFD6"
  property variant values
  property string assetHome

  Component.onCompleted: {
    if(values.sound)
      mainRoot.playFile("file://" + assetHome + "/" + values.sound);
  }

  function handleClick(questionData, parent) {
    if(questionData.correct) {
      root.disableNavigation = false;
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

  function loadImage(imageSrc, parent, properties) {
    if(imageSrc.match(/\.gif$/)) {
      return getQmlImageLoader("GifImage", parent, properties);
    } else {
      return getQmlImageLoader("sprite", parent, properties);
    }
  }

  function getQmlImageLoader(pageName, parent, properties) {
    var component = Qt.createComponent("qrc:/qml_ui/" + pageName + ".qml");
    if(component.status === Component.Ready) {
      return component.createObject(parent, properties);
    } else {
      console.log(component.errorString());
      return null;
    }
  }
}
