import QtQuick
import QtQuick.Window
import QtQuick.Layouts
import QtQuick.Dialogs
import QtQuick.Controls
import QtQuick.Controls.Material


Window {
    width: 750
    height: 480
    visible: true
    title: qsTr("Qt Quick Drag Drop")

    property int margin: 16

    FileDialog {
        id: fileDialog
        title: "Choose File Attachment"
        onAccepted: {
            attachments.text += fileDialog.fileUrls + '\n'
            console.log("added attachment: " + fileDialog.fileUrls)
        }
    }

    DropArea {
        id: drop
        enabled: true
        anchors.fill: parent
        anchors.margins: margin

        Rectangle {
            anchors.fill: parent
            color: "green"
            visible: parent.containsDrag
        }

        onEntered: console.log("entered DropArea")
        onDropped:{
            attachments.text += drop.text + '\n'
            console.log("added attachment: " + drop.text)
            console.log("drag.source: " + drag.source)
        }

        GridLayout {
            id: mainLayout
            anchors.fill: parent
            anchors.margins: margin

            Label {
                text: "Drag Drop ME"
                font.pixelSize: 16
                Layout.row: 1
                Layout.column: 1
            }

            GroupBox {
                id: gridBox
                Layout.row: 2
                Layout.column: 1
                Layout.fillWidth: true

                GridLayout {
                    id: gridLayout
                    rows: 1
                    flow: GridLayout.TopToBottom
                    anchors.fill: parent

                    Label {
                        text: "Attached files"
                    }

                    TextArea {
                        id: attachments
                        Layout.fillWidth: true
                        implicitHeight: 300
                    }
                }
            }

            GroupBox {
                id: rowBox
                Layout.row: 3
                Layout.column: 1
                Layout.fillWidth: true

                Row {
                    id: rowLayout
                    anchors.right: parent.right
                    spacing: 5

                    Button {
                        id: attach_button
                        text: "Attach"
                        onClicked: fileDialog.open();

                    }
                    Button {
                        id: save_button
                        text: "Save"
                        onClicked: backend.dropaccept(attachments.text)
                    }
                    Button {
                        id: exit_button
                        text: "Exit"
                        onClicked: Qt.quit()
                    }
                }
            }
        }
    }
}
