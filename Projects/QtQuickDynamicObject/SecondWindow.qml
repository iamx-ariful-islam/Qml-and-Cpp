import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material


Rectangle {
    id: secondDialog
    visible: false
    width: parent.width / 2
    height: parent.height / 2
    anchors.centerIn: parent
    color: "blue"

    Button {
        id: hideWindowButton
        anchors.centerIn: parent
        text: "Hide me!"
        onClicked: secondDialog.visible = false
    }
}
