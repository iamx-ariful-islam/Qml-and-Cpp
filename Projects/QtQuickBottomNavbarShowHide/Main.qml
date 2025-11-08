import QtQuick
import QtQuick.Window
import QtQuick.Layouts
import QtQuick.Controls.Material


Window {
    width: 850
    height: 480
    visible: true
    title: qsTr("Qt Quick Bottom Navbar Show Hide")


    property bool isExpanded: false

    Rectangle {
        id: rect1
        implicitHeight: 20
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        color: "green"
        Rectangle {
            height: parent.height
            width: 30 // btnAction.width
            anchors.right: parent.right
            // anchors.rightMargin: 10
            color: "gray"
            Text {
                id: btnAction
                text: isExpanded ? qsTr("y") : qsTr("x")
                font.pixelSize: 15
                font.bold: true
                anchors.centerIn: parent
            }
            MouseArea {
                anchors.fill: parent
                HoverHandler {
                    cursorShape: Qt.PointingHandCursor
                }
                onClicked: {
                    isExpanded = !isExpanded
                    numAnimation.to = isExpanded ? 200 : 0
                    numAnimation.running = true
                }
            }
        }
    }

    Rectangle {
        id: rect2
        implicitHeight: 0
        anchors.bottom: rect1.top
        anchors.left: parent.left
        anchors.right: parent.right
        color: "red"
    }

    NumberAnimation {
        id: numAnimation
        target: rect2
        property: "height"
        duration: 200
        from: rect2.height
        to: 200
        easing.type: Easing.InOutQuad
    }
}
