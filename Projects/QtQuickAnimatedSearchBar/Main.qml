import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Controls.Material


Window {
    width: 750
    height: 480
    visible: true
    title: qsTr("Qt Quick Animated Search Bar")


    CustomSearchBar {
        anchors.top: parent.top
        anchors.topMargin: 50
        anchors.horizontalCenter: parent.horizontalCenter
    }

    CustomSearchBar {
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.rightMargin: 50
        anchors.topMargin: 100
    }
}
