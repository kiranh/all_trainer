import QtQuick 2.4
import QtQuick.Controls 1.3
import QtMultimedia 5.0
import com.codemancers.components 1.0
import Qt.WebSockets 1.0

Rectangle {
  id: mainRoot
  width: 1024
  height: 832
  visible: true
  property string currentJsFile: "content.js"

  Column {
    Rectangle {
      id: navHome
      width: mainRoot.width
      height: 64
      color: "#00A4FF"
      Image {
        id: homeButton
        width: 64
        height: 64
        source: Qt.resolvedUrl("qrc:/home.png")
        anchors.centerIn: parent
      }
      MouseArea {
        anchors.fill: parent
        onClicked: {
          showWelcomePage();
        }
      }

    }

    StackView {
      id: mainStackView
      width: mainRoot.width
      height: mainRoot.height - 64
      focus: true
      Component.onCompleted: {
        showWelcomePage();
      }
    }
  }


  MediaPlayer {
    id: player
    onError: {
      console.log("Error in playing" + errorString);
    }
    autoPlay: false
    autoLoad: false
  }

  AudioRecorder {
    id: recorder

    onRecordingChanged: {
      console.log("Recording state changed");
    }
  }

  Timer {
    id: delayedTimer
    repeat: false
    running: false
  }

  WebSocket {
    id: socket
    url: "ws://192.168.1.2:8080"
    active: true

    onTextMessageReceived: {
      console.log(message);
      if(message === "identify") {
        sendTextMessage("student");
      } else if(message === "1") {
        playCorrectSound();
      } else if(message === "2") {
        playWrongSound();
      } else if(message === "3") {
        playLastRecord();
      } else {
        console.log("Something unexpected here");
      }
    }
  }

  function playCorrectSound() {
    playFile("file://" + data_model.getDropBoxHome() + "/sounds/thats_correct.mp3");
  }

  function playWrongSound() {
    playFile("file://" + data_mode.getDropBoxHome() + "/sounds/wrong.m4a");
  }

  function record() {
    recorder.record();
  }

  function stop() {
    recorder.stop();
  }

  function playLastRecord() {
    stop();
    playFile("file://" + data_model.getDropBoxHome() + "/sounds/you_said.mp3");
    playDelayedSound("file://" + recorder.fileName, 2000);
  }

  function playFile(file) {
    if(file && file.length > 0) {
      delayedTimer.stop();
      if(player.playbackState === MediaPlayer.PlayingState) {
        player.stop();
      }
      player.source = file;
      console.log("Playing the file : " + file);
      player.play();
    }
  }

  function playDelayedSound(file, delay) {
    if(file && file.length > 0) {
      delayedTimer.stop();
      delayedTimer.interval = delay;
      delayedTimer.triggered.connect(function() {
        playFile(file);
        delayedTimer.stop();
      });
      delayedTimer.start();
    }
  }

  function playHoverSound(mouseAreaObject, file) {
    if(file && file.length > 0) {
      delayedTimer.stop();
      delayedTimer.interval = 1000;
      delayedTimer.triggered.connect(function() {
        if(mouseAreaObject.containsMouse) {
          playFile("file://" + data_model.getDropBoxHome() + "/" + file);
        }
        delayedTimer.stop();
      });
      delayedTimer.start();
    }
  }

  function showNewPage(pageName, pageJs) {
    mainRoot.currentJsFile = pageJs;
    mainStackView.push({
                         "item": getCurrentPage(pageName),
                         immediate: true, replace: true, destroyOnPop: true
                       });
  }

  function showWelcomePage() {
    mainRoot.currentJsFile = "content.js"
    mainStackView.push({
                         "item": getCurrentPage("welcome"),
                         immediate: true, replace: true, destroyOnPop: true
                       });
  }

  function getCurrentPage(pageName) {
    var component = Qt.createComponent("qrc:/" + pageName + ".qml");
    if(component.status === Component.Ready) {
      return component.createObject(mainStackView, {"assetHome": data_model.getDropBoxHome()});
    } else {
      return null;
    }
  }
}
