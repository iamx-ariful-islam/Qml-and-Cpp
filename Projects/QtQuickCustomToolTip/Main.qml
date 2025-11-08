import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Controls.Material


Window {
    width: 850
    height: 500
    visible: true
    title: qsTr("Qt Quick Custom ToolTip")


    RoundButton {
        anchors.centerIn: parent
        text: qsTr('Custom Button')
        implicitHeight: 45
        enabled: true
        font.bold: true
        font.pointSize: 8
        leftPadding: 30
        rightPadding: 30
        radius: 5
        HoverHandler {
            cursorShape: Qt.PointingHandCursor
        }
        onClicked: {
            console.log("button clicked")
        }
        ToolTip{
            id: root
            visible: parent.hovered && parent.enabled
            delay: 1000
            timeout: 3000
            text: qsTr("Custom button")
            rightPadding: 10
            leftPadding: 10
            contentItem: Text{
                text: root.text
                font: root.font
            }
            background: Rectangle{
                color: 'lightgray'
                border.color: "#36373d"
                border.width: 1
                radius: 5
            }
        }
    }
}
