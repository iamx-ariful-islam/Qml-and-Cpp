import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material


Window {
    width: 850
    height: 500
    visible: true
    title: qsTr("Qt Quick MenuBar With Keyboard Shortcut")


    Menu {
        id: contextMenu
        title: "&Help"

        Action {
            text: "Usage guide"
            shortcut: "F1"
        }
        Action {
            text: "Cut"
            shortcut: StandardKey.Copy
        }
        Action {
            text: "Copy"
            shortcut: "Ctrl+E, Ctrl+W"
        }
        Action { text: "Paste" }

        delegate: MenuItem {
            id: control

            contentItem: Item {
                anchors.centerIn: parent

                Text {
                    text: control.text
                    anchors.left: parent.left
                }

                Shortcut {
                    id: shortcutHelper
                    sequence: control.action.shortcut
                }

                Text {
                    text: shortcutHelper.nativeText
                    anchors.right: parent.right
                }
            }
        }
    }
    Component.onCompleted: contextMenu.open()
}
