import QtQuick
import QtQuick.Window
import QtQuick.Dialogs
import QtQuick.Controls.Material


Window {
    width: 950
    height: 600
    visible: true
    title: qsTr("Qt Quick Color Dialog")


    ColorDialog {
        id: colorDialog
        title: "Please choose a color"

        onAccepted: {
            console.log("You chose: " + colorDialog.color)
            Qt.quit()
        }
        onRejected: {
            console.log("Canceled")
            Qt.quit()
        }
        Component.onCompleted: visible = true
    }
}
