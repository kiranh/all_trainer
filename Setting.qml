import QtQuick 2.4
import QtQuick.Controls 1.2
import QtQuick.Dialogs 1.2

Dialog {
  visible: true
  title: "Where are learning data files?"

  contentItem: Rectangle {
    anchors.centerIn: parent

    Column {
      Text {
        text: "Configure location of Data files"
      }
    }
  }
}


