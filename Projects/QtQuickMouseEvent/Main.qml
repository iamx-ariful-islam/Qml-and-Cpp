import QtQuick
import QtQuick.Window
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Controls.Material


Window {
    width: 850
    height: 500
    visible: true
    title: qsTr("Qt Quick Mouse Event")


    Rectangle {
        anchors.fill: parent
        width: 120; height: 240
        color: "#4B7A4A"

        MouseArea {
            anchors.fill: parent
            acceptedButtons: Qt.AllButtons
            onClicked: (mouse)=> {
                console.log("Mouse Clicked")
                console.log("Mouse Location: <", mouseX, ",", mouseY, ">")

                if (mouse.button === Qt.RightButton)
                    parent.color = 'blue'
                if (mouse.button === Qt.LeftButton)
                    parent.color = 'red'
                if (mouse.button === Qt.MiddleButton)
                    parent.color = 'yellow'
            }
            onReleased: {
                console.log("Mouse Released")
            }
            onDoubleClicked: {
                console.log("Mouse Double Clicked")
            }
        }
    }
}
