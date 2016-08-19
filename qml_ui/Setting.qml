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
        id: dataLocation
        width: 350
        placeholderText: assetHome
      }

      Button {
        text: "Select Folder"
        onClicked: {
          getCurrentPage("FileChooser");
        }
      }
    }
  }

  onAccepted: {
    console.log("Saving location to " + dataLocation.text);
    mainRoot.setDataHome(dataLocation.text);
  }

  function setSettingLocation(location) {
    console.log("Setting the location to " + location);
    dataLocation.text = location;
  }

  function getCurrentPage(pageName) {
    var component = Qt.createComponent("qrc:/" + pageName + ".qml");
    if(component.status === Component.Ready) {
      console.log("Stuff is ready");
      return component.createObject(setting_page, {"settingPage": setting_page});
    } else {
      console.log("Stuff is not ready");
      return null;
    }
  }
}


