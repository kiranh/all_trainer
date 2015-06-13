import QtQuick 2.4
import QtQuick.Controls 1.3
import "data.js" as Data
import QtMultimedia 5.0

Rectangle {
    id: root
    width: 1024
    height: 768
    visible: true
    property int currentPage: 1
    property int maximumPage: Data.data.length


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

    MediaPlayer {
        id: player
        onError: {
            console.log("Error in playing" + errorString);
        }
        autoPlay: false
        autoLoad: false
    }

    function playFile(file) {
        if(player.playbackState === MediaPlayer.PlayingState) {
            player.stop();
        }
        player.source = file;
        console.log("Playing the file : " + file);
        player.play();
    }

    function getCurrentPage() {
        var currentData = Data.data[currentPage - 1];
        var component = Qt.createComponent("qrc:/" + currentData.type + ".qml");
        if(component.status === Component.Ready) {
            return component.createObject(stackView, {"values": currentData, "assetHome": data_model.getDropBoxHome()});
        } else {
            return null;
        }
    }
}
