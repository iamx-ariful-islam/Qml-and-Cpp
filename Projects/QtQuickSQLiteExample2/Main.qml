import QtQuick
import QtQuick.Window
import QtQuick.Layouts
import QtQuick.Dialogs
import QtQuick.Controls
import Qt.labs.qmlmodels
import QtQuick.Controls.Material

import MyModule 0.1


ApplicationWindow {
    visible: true
    width: 750
    height: 480
    title: qsTr("Qt Quick SQLite Example 2")


    MyObject {
        id: db_conn;
    }

    Connections {
        target: db_conn
        function onUserDataReady(userList) {
            myModel.clear();  // Clear existing items
            for (var i = 0; i < userList.length; ++i) {
                var listItem = userList[i];
                myModel.append({text: listItem[0], description: listItem[1], extra: listItem[2], more: listItem[3]});
            }
        }
    }


    RowLayout {
        id: rowLayout
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.margins: 10

        spacing: 5

        TextField {
            id: firstName
            implicitWidth: 200
            implicitHeight: 35
            placeholderText: qsTr("Enter First Name")
        }
        TextField {
            id: lastName
            implicitWidth: 200
            implicitHeight: 35
            placeholderText: qsTr("Enter Last Name")
        }
        ComboBox {
            id: gender
            implicitWidth: 200
            implicitHeight: 46
            model: ["Male", "Female", "Others"]
        }

        Button {
            text: qsTr("Add Info")
            onClicked: {
                db_conn.insertIntoTable(firstName.text , lastName.text, gender.currentText)
                firstName.text      = ""
                lastName.text       = ""
                gender.currentIndex = 0
                db_conn.readUserData()
            }
        }
    }

    Rectangle {
        anchors.top: rowLayout.bottom
        width: parent.width
        height: 300
        anchors.margins: 10
        color: "lightgray"
        radius: 5

        ListView {
            id: myListView
            anchors.fill: parent

            model: myModel

            clip: true

            contentWidth: 500
            flickableDirection: Flickable.HorizontalFlick & Flickable.VerticalFlick

            delegate: Item {
                width: myListView.width
                height: 40

                // Add MouseArea for hover effect and value display
                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true

                    onEntered: {
                        // Implement hover effect, e.g., change background color
                        rectangle.color = "whitesmoke";
                    }
                    onExited: {
                        // Reset background color when not hovered
                        rectangle.color = "transparent";
                    }
                    acceptedButtons: Qt.AllButtons
                    /* Problem: Parameter "mouse" is not declared. Injection of parameters into signal handlers is deprecated. Use JavaScript functions with formal parameters instead. */
                    /* Solution: add (mouse)=>{} or function (mouse) {} */
                    onClicked: (mouse)=> {
                                   console.log("Clicked on item:", model.text, model.description, model.extra, model.more);
                                   if (mouse.button === Qt.RightButton) {
                                       contextMenu.popup()
                                   }
                               }
                }

                Rectangle {
                    id: rectangle
                    anchors.fill: parent
                    color: "transparent"

                    Row {
                        spacing: 10

                        Text { text: model.text }
                        Text { text: model.description }
                        Text { text: model.extra }
                        Text { text: model.more }
                    }
                }
            }
        }

        ListModel {
            id: myModel
        }
        Menu {
            id: contextMenu
            topPadding: 0
            bottomPadding: 0

            Action {
                text: qsTr("View")
            }
            Action {
                id: deleteAction
                text: qsTr("Delete")
                shortcut: qsTr("Del")
                onTriggered: {
                    dialogDelete.open()
                }
            }
            delegate: MenuItem {
                id: contextMenuItem
                implicitHeight: 32
                font.pointSize: 8
                font.bold: true

                contentItem: Item {
                    anchors.centerIn: parent

                    Text {
                        text: contextMenuItem.text
                        font: contextMenuItem.font
                        color: Material.accent
                        anchors.left: parent.left
                        anchors.verticalCenter: parent.verticalCenter
                    }
                    Shortcut {
                        id: shortcutHelper
                        sequence: contextMenuItem.action.shortcut
                        context: Qt.ApplicationShortcut
                    }
                    Text {
                        text: shortcutHelper.nativeText
                        font: contextMenuItem.font
                        color: Material.primary
                        anchors.right: parent.right
                        anchors.verticalCenter: parent.verticalCenter
                    }
                }
                HoverHandler {
                    cursorShape: Qt.PointingHandCursor
                }
            }
        }
    }

    MessageDialog {
        id: dialogDelete
        text: "The document has been modified."
        informativeText: "Do you want to save your changes?"
        buttons: MessageDialog.Ok | MessageDialog.Cancel

        onAccepted: {
            console.log("Clicked on item:", model.text, model.description, model.extra, model.more);
        }
    }
}
