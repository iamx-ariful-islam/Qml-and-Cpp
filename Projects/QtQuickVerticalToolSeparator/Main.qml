import QtQuick
import QtQuick.Window
import QtQuick.Layouts
import QtQuick.Controls.Material


Window {
    width: 850
    height: 500
    visible: true
    title: qsTr("Qt Quick Vertical Tool Separator")

    RowLayout {
        anchors.centerIn: parent

        Button {
            text: "Button1"
        }

        ToolSeparator {} // vertical separator

        Button {
            text: "Button2"
        }

        ToolSeparator {} // vertical separator

        Button {
            text: "Button3"
        }
        Button {
            text: "Button4"
        }
    }
}
