import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Controls.Material


Window {
    width: 850
    height: 500
    visible: true
    title: qsTr("Qt Quick Right Click Option")


    Rectangle {
        anchors.centerIn: parent

        width: 250
        height: 50
        color: "green"
        radius: 5
        Text {
            anchors.centerIn: parent
            text: "Right Click Me"
            font {
                weight: Font.Bold
                pointSize: 12
            }
        }
        MouseArea {
            anchors.fill: parent
            acceptedButtons: Qt.AllButtons
            /* Problem: Parameter "mouse" is not declared. Injection of parameters into signal handlers is deprecated. Use JavaScript functions with formal parameters instead. */
            /* Solution: add (mouse)=>{} or function (mouse) {} */
            onClicked: (mouse)=> {
                           if (mouse.button === Qt.RightButton) {
                               contextMenu.popup()
                           }
                       }
            onPressAndHold: (mouse)=> {
                                if (mouse.source === Qt.MouseEventNotSynthesized) {
                                    contextMenu.popup()
                                }
                            }
        }
    }

    Menu {
        id: contextMenu
        topPadding: 0
        bottomPadding: 0

        Action {
            text: qsTr("Edit")
        }
        Action {
            text: qsTr("View")
        }
        Action {
            text: qsTr("Print")
            shortcut: qsTr("Ctrl+P")
        }
        MenuSeparator { topPadding: 0; bottomPadding: 0 }
        Action {
            id: copyAction
            text: qsTr("Copy")
            icon.name: "edit-copy"
            shortcut: qsTr("Ctrl+C")
            onTriggered: {
                // window.activeFocusItem.copy()
                console.log("copy")
                //console.log(copyAction.shortcut)
            }
        }
        Action {
            id: deleteAction
            text: qsTr("Delete")
            shortcut: qsTr("Del")
        }
        // sub menu
        //        Menu {
        //            title: qsTr("Advance")
        //            Action {
        //                text: "Paste"
        //            }
        //        }

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
