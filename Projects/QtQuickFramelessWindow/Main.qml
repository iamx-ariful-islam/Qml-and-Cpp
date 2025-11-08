import QtQuick
import QtQuick.Window
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Controls.Material


Window {
    width: 850
    height: 500
    visible: true
    title: qsTr("Qt Quick Frameless Window")
    color: "lightgreen"


    // remove title bar
    flags: Qt.Window | Qt.FramelessWindowHint

    RoundButton {
        x: parent.width - width
        y: 0 // -5
        text: "x"
        onClicked: Qt.quit()
    }
}
