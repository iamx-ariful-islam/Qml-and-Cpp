import QtQuick
import QtQuick.Window
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Controls.Material



ApplicationWindow {
    id: window
    width: 850
    height: 500
    visible: true
    title: qsTr("Qt Quick Styling")


    Material.theme: themeSwitch.checked ? Material.Dark : Material.Light
    Material.primary: Material.Blue
    Material.accent: Material.Blue


    header: ToolBar {
        RowLayout {
            anchors.fill: parent
            ToolButton {
                font.pixelSize: 20
                text: qsTr("‹")
            }
            Label {
                font.pixelSize: 20
                text: "My app"
                elide: Label.ElideRight
                horizontalAlignment: Qt.AlignHCenter
                verticalAlignment: Qt.AlignVCenter
                Layout.fillWidth: true
            }
            Switch {
                id: themeSwitch
                text: themeSwitch.checked ? "Light" : "Dark"
            }
            ToolButton {
                font.pixelSize: 20
                text: qsTr("⋮")
            }
        }
    }

    Button{
        text: qsTr("????")
        highlighted: true
    }
}
