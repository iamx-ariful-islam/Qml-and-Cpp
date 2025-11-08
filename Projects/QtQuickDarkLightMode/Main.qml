import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Controls.Material

import themeMode 1.0

Window {
    width: 850
    height: 500
    visible: true
    title: qsTr("Qt Quick Dark Light Mode")

    readonly property color darkColor: "#218165"
    readonly property color lightColor: "#EBEBEB"

    ThemeMode {
        id: themeMode
    }

    color: themeMode.isNightMode ? darkColor : lightColor

    Column {
        anchors.centerIn: parent
        spacing: 20
        Text {
            color: themeMode.isNightMode ? lightColor : darkColor
            text: qsTr("Is night mode on? - ") + themeMode.isNightMode
        }

        Button {
            anchors.horizontalCenter: parent.horizontalCenter
            text: qsTr("Change mode")
            palette.buttonText: themeMode.isNightMode ? lightColor : darkColor
            onClicked: {
                themeMode.isNightMode = !themeMode.isNightMode
            }
        }
    }
}
