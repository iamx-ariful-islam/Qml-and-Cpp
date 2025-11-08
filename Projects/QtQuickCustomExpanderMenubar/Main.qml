import QtQuick
import QtQuick.Window
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Controls.Material


Window {
    width: 950
    height: 550
    visible: true
    title: qsTr("Qt Quick Cutom Expander Menubar")


    CustomExpanderMenubar {
        anchors.centerIn: parent
    }
}
