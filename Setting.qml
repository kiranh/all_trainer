import QtQuick 2.4
import QtQuick.Controls 1.2
import QtQuick.Dialogs 1.2

Dialog {
  id: setting_page
  visible: true
  width: 480
  height: 200
  title: "Where are learning data files?"
  property string assetHome
  standardButtons: StandardButton.Save | StandardButton.Cancel
  Column {
    spacing: 10
    width: parent.width
    anchors.top: parent.top
    anchors.topMargin: 40

    Text {
      text: "Configure location of data files"
    }

    Row {
      TextField {
        width: 350
        placeholderText: qsTr("Data file location")
      }

      Button {
        text: "Select Folder"
      }
    }

  }
}


