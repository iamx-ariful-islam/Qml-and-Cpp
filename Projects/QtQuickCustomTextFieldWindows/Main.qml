import QtQuick
import QtQuick.Window
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Controls.Material


Window {
    width: 950
    height: 500
    visible: true
    title: qsTr("Qt Quick Custom TextField Windows")


    Rectangle {
        width: parent.width * 0.8
        height: parent.height * 0.7
        anchors.centerIn: parent

        WindowsTextField {
            anchors.centerIn: parent
            placeText: "Enter your name"
        }
    }
}
