import QtQuick 2.4
import QtMultimedia 5.0
import "../common.js" as Common
import "../"

Question {
  id: top
  width: parent.width
  height: parent.height
  property int index: 0

  Component.onCompleted: {
    if(values.sound) {
      loadOptionItem.bind(top);
      mainRoot.onStopPlaying(loadOptionItem);
      mainRoot.simpleFilePlay("file://" + assetHome + "/" + values.sound);
    }
  }

  Column {
    Rectangle {
      width: top.width
      height: (top.height)/5.0
      color: top.color
      Text {
        text: values.header
        font.pointSize: 35
        anchors.centerIn: parent
      }
    }

    Rectangle {
      width: top.width
      height: 10
      color: top.color
    }

    Rectangle {
      id: choices
      width: top.width
      height: top.height - 100
      color: top.color
      anchors.horizontalCenter: parent.horizontalCenter
      Loader {
        id: optionLoader
        anchors.fill: parent
        property string src
        property string snd_src
      }
    }

    Component {
      id: image_component
      Image {
        width: parent.width
        height: parent.height
        source: "file://" + assetHome + "/" + src
        fillMode: Image.PreserveAspectFit
        clip: true
      }
    }

    Component {
      id: imageGrid
      Grid {
        columns: 2
        spacing: 20
        anchors.centerIn: parent
        Repeater {
          model: values.questions.length
          Rectangle {
            width: 256
            height: 256
            border.color: "#FF9933"
            property variant questionData: values.questions[index]
            Image {
              width: parent.width
              height: parent.height
              source: "file://" + assetHome + "/" + questionData.src
              fillMode: Image.PreserveAspectFit
              clip: true
            }

            Behavior on width {
              NumberAnimation {
                duration: 600
                easing.type: Easing.OutBack
              }
            }

            Behavior on height {
              NumberAnimation {
                duration: 600
                easing.type: Easing.OutBack
              }
            }

            MouseArea {
              anchors.fill: parent
              hoverEnabled: true
              onEntered: {
                mainRoot.playHoverSound(this, questionData.sound);
              }

              onClicked: handleClick(questionData, parent)
            }
          }
        }
      }
    }
  }

  function loadOptionItem() {
    console.log("Current time is", new Date().toLocaleTimeString());
    if (top.index < 4 ) {
      optionLoader.src = values.questions[top.index].src;
      console.log("From load option index is", top.index, " and src is ", values.questions[top.index].src);
      var soundFile = values.questions[top.index].sound;
      optionLoader.sourceComponent = image_component;
      top.index++;
      mainRoot.simpleFilePlay("file://" + assetHome + "/" + soundFile);
   } else {
      optionLoader.sourceComponent = imageGrid;
    }
  }
}
