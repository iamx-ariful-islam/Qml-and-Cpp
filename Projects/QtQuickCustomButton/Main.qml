import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Controls.Material


Window {
    width: 850
    height: 500
    visible: true
    title: qsTr("Qt Quick Custom Button")


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
    }
}
