import QtQuick
import QtQuick.Window
import QtQuick.Controls.Material


Window {
    width: 850
    height: 500
    visible: true
    title: qsTr("Qt Quick Double Click Event")

    Rectangle {
        anchors.centerIn: parent

        width: 250
        height: 50
        color: "green"
        radius: 5
        Text {
            anchors.centerIn: parent
            text: "Double Click Me"
            font {
                weight: Font.Bold
                pointSize: 12
            }
        }
        MouseArea {
            anchors.fill: parent

            onDoubleClicked: {
                popup.open()
            }
        }
    }
    Popup {
        id: popup
        anchors.centerIn: parent
        width: 450
        height: 250
        modal: true
        focus: true
        font.bold: true
        background: Rectangle {
            radius: 10
        }
        Label {
            anchors.centerIn: parent
            text: qsTr("Popup Message Frame")
            font.pointSize: 12
        }
    }
}
