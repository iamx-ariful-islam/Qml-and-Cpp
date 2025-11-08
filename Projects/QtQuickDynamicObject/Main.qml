import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Controls.Material


Window {
    width: 850
    height: 500
    visible: true
    title: qsTr("Qt Quick Dynamic Object")


    Rectangle {
        id: mainBackground
        color: "lightgray"
        anchors.fill: parent
    }

    Text {
        id: mainLabel
        anchors {
            horizontalCenter: parent.horizontalCenter
            top: parent.top
            topMargin: 20
        }
        color: "black"
        font.pixelSize: 18
        text: "Dynamic Object"
    }

    Button {
        id: mainButton
        anchors.centerIn: parent
        text: "Click Me"

        onClicked: secondDialog.visible = true
    }

    SecondWindow {
        id: secondDialog
    }
}
