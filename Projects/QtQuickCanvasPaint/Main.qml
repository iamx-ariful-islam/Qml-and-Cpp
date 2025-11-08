import QtQuick
import QtQuick.Window
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Controls.Material


Window {
    width: 850
    height: 500
    visible: true
    title: qsTr("Qt Quick Canvas Paint")

    property color colorName: "black"


    ColumnLayout {
        x: parent.width - width - 5
        anchors.verticalCenter: parent.verticalCenter
        z: canvasItem.z + 1
        spacing: 5

        Repeater {
            model: ["red", "green", "blue", "purple"]

            Rectangle {
                width: 50
                height: 45
                radius: 5
                color: modelData
                border.color: mouseArea.containsPress ? "lightgray" : "transparent"

                MouseArea {
                    id: mouseArea
                    anchors.fill: parent
                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor
                    onClicked: {
                        colorName = parent.color
                    }
                }
            }
        }

//        Rectangle {
//            width: 50
//            height: 45
//            radius: 5
//            color: "red"
//            MouseArea {
//                anchors.fill: parent
//                onClicked: colorName = "red"
//            }
//        }
//        Rectangle {
//            width: 50
//            height: 45
//            radius: 5
//            color: "green"
//            MouseArea {
//                anchors.fill: parent
//                onClicked: colorName = "green"
//            }
//        }
//        Rectangle {
//            width: 50
//            height: 45
//            radius: 5
//            color: "blue"
//            MouseArea {
//                anchors.fill: parent
//                onClicked: colorName = "blue"
//            }
//        }
    }

    RowLayout {
        anchors.horizontalCenter: parent.horizontalCenter
        z: canvasItem.z + 1

       RoundButton {
            text: qsTr("Clear")
            implicitWidth: 120
            radius: 5

            onClicked: {
                canvasItem.clear()
            }
        }
        RoundButton {
            text: qsTr("Exit")
            implicitWidth: 120
            radius: 5

            onClicked: {
                Qt.quit()
            }
        }
    }
    Canvas {
        id: canvasItem
        anchors.fill: parent

        property real lastX
        property real lastY

        function clear() {
            var ctx = getContext('2d')
            ctx.reset()
            canvasItem.requestPaint()
        }

        MouseArea {
            id: msArea
            anchors.fill: parent

            onPressed: (mouse)=> {
                canvasItem.lastX = mouseX
                canvasItem.lastY = mouseY
            }
            onPositionChanged: {
                canvasItem.requestPaint()
            }
        }
        onPaint: {
            var ctx = getContext('2d')
            ctx.lineWidth = 5
            ctx.strokeStyle = colorName
            ctx.beginPath()
            ctx.moveTo(lastX, lastY)
            lastX = msArea.mouseX
            lastY = msArea.mouseY
            ctx.lineTo(lastX, lastY)
            ctx.stroke()
        }
    }
}
