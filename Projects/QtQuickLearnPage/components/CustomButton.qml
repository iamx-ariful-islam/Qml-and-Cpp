import QtQuick
import QtQuick.Effects
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Controls.Material

Button {
    id: root

    property string btnText: ""


    contentItem: Text {
        text: root.btnText
        font {
            family: "ubuntu"
            weight: Font.Bold
        }
        color: "#3F51B5"
    }
    background: Rectangle {
        implicitWidth: 110
        implicitHeight: 32
        color: "transparent"
        radius: 5

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            cursorShape: Qt.PointingHandCursor

            onEntered: parent.color = "whitesmoke"
            onExited: parent.color = "transparent"
        }
    }
}
