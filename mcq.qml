import QtQuick 2.4
import QtMultimedia 5.0

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
            border.color: "black"
            Text {
                text: values.header
                font.pointSize: 35
                anchors.centerIn: parent
            }
        }
        Rectangle {
            id: choices
            width: top.width
            height: top.height - 100
            color: top.color
            Grid {
                columns: 2
                spacing: 5
                Image {
                    width: choices.width/2
                    height: choices.height/2
                    source: "file://" + assetHome + "/" + values.questions[0].src
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            if(values.questions[0].correct) {

                            }
                        }
                    }
                }
                Image {
                    width: choices.width/2
                    height: choices.height/2
                    source: "file://" + assetHome + "/" + values.questions[1].src
                }

                Image {
                    width: choices.width/2
                    height: choices.height/2
                    source: "file://" + assetHome + "/" + values.questions[2].src
                }
                Image {
                    width: choices.width/2
                    height: choices.height/2
                    source: "file://" + assetHome + "/" + values.questions[3].src
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

