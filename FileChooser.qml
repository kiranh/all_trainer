import QtQuick 2.4
import QtQuick.Dialogs 1.2

FileDialog {
  id: fileChooser
  title: "Please choose settings directory"
  folder: shortcuts.home
  selectFolder: true

  onAccepted: {
    console.log("File selected")
  }

  onRejected: {
    console.log("No location selected")
  }
}
