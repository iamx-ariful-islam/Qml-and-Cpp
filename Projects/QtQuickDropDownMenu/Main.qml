import QtQuick
import QtQuick.Window
import QtQuick.Controls


Window {
    width: 850
    height: 500
    visible: true
    title: qsTr("Qt Quick Dropdown Menu")

    Button {
        id: openMenu
        width: 45
        height: 28
        text: qsTr("File")
        onClicked: {
            menu.open()
        }
    }

    Label {
        id: showText
        anchors.centerIn: parent
        text: qsTr("No button clicked!")
        font.pointSize: 30
        font.bold: true
    }

    Menu {
        id: menu
        y: openMenu.height

        MenuItem {
            id: newFile
            text: qsTr("New")
            onClicked: {
                showText.text = qsTr(newFile.text + " button clicked!")
            }
        }

        MenuItem {
            id: openFile
            text: qsTr("Open")
            onClicked: {
                showText.text = qsTr(openFile.text + " button clicked!")
            }
        }

        MenuItem {
            id: saveFile
            text: qsTr("Save")
            onClicked: {
                showText.text = qsTr(saveFile.text + " button clicked!")
            }
        }
        MenuItem {
            text: qsTr("Exit")
            onClicked: {
                Qt.quit()
            }
        }
    }
}
