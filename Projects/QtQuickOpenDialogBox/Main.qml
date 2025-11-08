import QtQuick
import QtQuick.Window
import QtQuick.Dialogs
import QtQuick.Controls
import QtQuick.Controls.Material


ApplicationWindow {
    width: 850
    height: 500
    visible: true
    title: qsTr("Qt Quick Open DialogBox")


    Row {
        Button {
            id: myButton
            text: qsTr("Open Dialogbox")
            onClicked: {
                dialog.open()
            }
        }
        Button {
            id: myButton3
            text: qsTr("Open MessageBox")
            onClicked: {
                messageDialog.open()
            }
        }
    }

    Dialog {
        id: dialog
        anchors.centerIn: parent
        title: "Chose any options"
        standardButtons: Dialog.Ok | Dialog.Cancel

        onAccepted: {
            console.log("ok clicked")
        }
        onRejected: {
            console.log("cancel clicked")
        }
    }

    MessageDialog {
        id: messageDialog
        title: "May I have your attention please"
        text: "It's so cool that you are using Qt Quick."
        onAccepted: {
            console.log("And of course you could only agree.")
        }
        Component.onCompleted: visible = true
    }
}
