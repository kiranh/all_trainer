import QtQuick 2.4
import QtQuick.Dialogs 1.2

FileDialog {
  id: fileChooser
  visible: true
  title: "Please choose settings directory"
  property variant settingPage
  folder: shortcuts.home
  selectFolder: true

  onAccepted: {
    console.log("File selected")
    settingPage.setSettingLocation(fileChooser.fileUrls[0]);
  }

  onRejected: {
    console.log("No location selected")
  }
}
