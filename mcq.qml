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
            Grid {
                columns: 2
                spacing: 20
                anchors.centerIn: parent
                Repeater {
                    model: 4
                    Rectangle {
                        width: 256
                        height: 256
                        border.color: "#FF9933"
                        Image {
                            width: 256
                            height: 256
                            source: "file://" + assetHome + "/" + values.questions[index].src
                            fillMode: Image.PreserveAspectFit
                            clip: true
                        }

                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                if(values.questions[index].correct) {
                                    Common.getSpriteImage(parent, "ok.png");
                                } else {
                                    Common.getSpriteImage(parent, "wrong.png");
                                }
                            }
                        }
                    }
                }
            }
        }
    }


    MediaPlayer {
        id: player
        source: "file://" + assetHome + "/" + values.sound
    }


    Component.onCompleted: {
        player.play();
    }

}

