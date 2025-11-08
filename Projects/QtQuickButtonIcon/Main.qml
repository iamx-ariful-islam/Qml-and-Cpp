import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Controls.Material



ApplicationWindow {
    width: 850
    height: 500
    visible: true
    title: qsTr("Icons in button")

    property bool isThemeModeActive: false

    Material.theme: isThemeModeActive ? Material.Dark : Material.Light


    RoundButton {
        id: btnMode
        height: 50
        width: 50
        radius: 5
        anchors.centerIn: parent
        icon.height: 50
        icon.width: 50
        icon.name: "theme_mode"
        icon.color: "transparent"
        onClicked: {
            isThemeModeActive = !isThemeModeActive
        }
        icon.source: isThemeModeActive ? "icons/light_mode.png" : "icons/dark_mode.png"
        HoverHandler {
            cursorShape: Qt.PointingHandCursor
        }
    }
}
