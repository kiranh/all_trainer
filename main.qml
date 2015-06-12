import QtQuick 2.4
import QtQuick.Controls 1.3
import "data.js" as Data

Rectangle {
    id: root
    width: 1024
    height: 768
    visible: true
    property int currentPage: 1
    property int maximumPage: 2


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
                        stackView.push({"item": getCurrentPage(), immediate: true, replace:true});
                    }
                }
            }

        }

        StackView {
            id: stackView
            width: (root.width*8)/10
            height: root.height
            focus: true
            initialItem: {"item": getCurrentPage() }
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
                        stackView.push({"item": getCurrentPage(), immediate: true, replace: true});
                    }
                }
            }
        }
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
