import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Controls.Material


Rectangle {
    id: statusBar
    height: 50
    anchors {
        left: parent.left
        top: parent.top
        right: parent.right
    }

    color: Qt.rgba(0,0,0,0)

    RowLayout {
        id: buttonRow
        height: statusBar.height
        width: statusBar.width / 4
        spacing: 5
        anchors {
            left: statusBar.left
            top: statusBar.top
        }
        Button {
            id: backButton
            text: "Back"
        }
        Button {
            id: homeButton
            text: "Home"
            onClicked: mainLoader.source = "StackViewPage.qml"

        }
        Button {
            id: favButton
            text: "Fav"
        }
    }

    Text {
        id: statusText
        anchors {
            top: parent.top
            right: parent.right
            rightMargin: 20
        }
        height: parent.height
        width: parent.width / 4
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignRight
        font.pixelSize: 20
        text: "21F 12:55 PM"
    }
}
