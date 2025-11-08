import QtQuick
import QtQuick.Window
import QtQuick.Layouts
import QtQuick.Controls.Material


Window {
    width: 850
    height: 500
    visible: true
    title: qsTr("Qt Quick Top Bottom Bar")



    Rectangle {
        height: 25
        color: "#282C34"
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right

        Label {
            color: "#5f6a82"
            text: qsTr("Application top description")
            anchors.left: parent.left
            verticalAlignment: Text.AlignVCenter
            anchors.leftMargin: 10
        }

        Label {
            color: "#5f6a82"
            text: qsTr("| HOME")
            anchors.right: parent.right
            verticalAlignment: Text.AlignVCenter
            anchors.rightMargin: 10
        }
    }
    Rectangle {
        height: 25
        color: "#282C34"
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.left: parent.left

        Label {
            color: "#5f6a82"
            text: qsTr("Application bottom description")
            anchors.left: parent.left
            verticalAlignment: Text.AlignVCenter
            anchors.leftMargin: 10
        }

        MouseArea {
            x: parent.width - width
            y: 0
            width: 25
            height: 25
            opacity: 0.5
            anchors.right: parent.right
            anchors.rightMargin: 0
            cursorShape: Qt.SizeFDiagCursor

            DragHandler{
                target: null
                onActiveChanged: if (false){
                    mainWindow.startSystemResize(Qt.RightEdge | Qt.BottomEdge)
                }
            }
        }
    }
}
