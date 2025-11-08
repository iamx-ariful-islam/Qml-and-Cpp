import QtQuick
import QtQuick.Window
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Controls.Material


Window {
    width: 750
    height: 480
    visible: true
    title: qsTr("Qt Quick Icon Label Switch")

    Rectangle {
        anchors.centerIn: parent
        width: 300
        height: 35
        color: "lightblue"
        radius: 5

        Image {
            id: lblIcon
            x: 8
            anchors {
                verticalCenter: parent.verticalCenter
            }
            source: "images/bluetooth-signal.png"
            sourceSize.width: 18
            sourceSize.height: 18
            fillMode: Image.PreserveAspectFit
            clip: true
            opacity: lblSwitch.checked ? 1 : 0.3
        }
        Text {
            id: lblText
            text: qsTr("Bluetooth")
            anchors {
                verticalCenter: parent.verticalCenter
                left: lblIcon.right
                leftMargin: 5
            }
            font {
                family: "ubuntu"
                weight: Font.Bold
                pixelSize: 14
            }
            color: lblSwitch.checked ? "black" : "gray"
        }

        Switch {
            id: lblSwitch
            x: parent.width - width + 5
            anchors {
                verticalCenter: parent.verticalCenter
            }

            indicator: Rectangle {
                implicitWidth: 40
                implicitHeight: 20
                x: lblSwitch.leftPadding
                y: parent.height / 2 - height / 2
                radius: 10
                color: lblSwitch.checked ? "#17a81a" : "#ffffff"
                border.color: lblSwitch.checked ? "#17a81a" : "#cccccc"

                Rectangle {
                    x: lblSwitch.checked ? parent.width - width : 0
                    width: 20
                    height: 20
                    radius: 10
                    color: lblSwitch.down ? "#cccccc" : "#ffffff"
                    border.color: lblSwitch.checked ? (lblSwitch.down ? "#17a81a" : "#21be2b") : "#999999"
                }
            }
            HoverHandler {
                cursorShape: Qt.PointingHandCursor
            }
        }
    }
}
