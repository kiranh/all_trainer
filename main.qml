import QtQuick 2.4
import QtQuick.Controls 1.3

Rectangle {
    width: 640
    height: 480
    visible: true

    StackView {
       id: navStack
       initialItem: Rectangle {
           anchors.fill: parent
           Text {
               text: data_model.getDropBoxHome()
           }
       }
    }
}
