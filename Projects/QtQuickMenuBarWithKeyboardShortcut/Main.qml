import QtQuick
import QtQuick.Window
import QtQuick.Controls.Material
import Qt.labs.platform


Window {
    width: 850
    height: 500
    visible: true
    title: qsTr("Qt Quick MenuBar With Keyboard Shortcut")


    MenuBar {
        id: menuBar
        Menu {
            id: mnu
            title: qsTr("Menu")

            MenuItem // Next
            {
                id: nextItem
                shortcut: "Ctrl+,"
                text: qsTr("Next")
                onTriggered: {console.log("Next"); console.log(nextItem.shortcut)}

            }
            MenuItem // Previous
            {
                id: prevItem
                shortcut: "Ctrl+."
                text: qsTr("Previous")
                onTriggered: {console.log("PREV"); console.log(prevItem.shortcut)}
            }

            MenuItem // Previous
            {
                id: extraItem
                shortcut: "Ctrl+ "
                text: qsTr("Previous")
                onTriggered: {console.log("extra"); console.log(extraItem.shortcut)}
            }
        }
    }
}
