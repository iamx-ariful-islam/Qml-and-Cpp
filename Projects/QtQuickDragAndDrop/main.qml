import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Controls.Material


Window {
    width: 850
    height: 500
    visible: true
    title: qsTr("Qt Quick Drag And Drop")

    property int minWidth: 30
    property int minHeight: 20
    property bool resizing: false

    Rectangle {
        id: textField
        width: 100
        height: 30
        color: "lightblue"
        border.color: "black"
        z: 2

        Text {
            text: "Text Field"
            anchors.centerIn: parent
        }

        // Drag to move the rectangle
        MouseArea {
            id: dragArea
            anchors.fill: parent
            drag.target: parent
            enabled: !resizeArea.containsMouse && !resizing // avoid drag while resizing
        }

        // Invisible area in bottom-right corner for resizing
        MouseArea {
            id: resizeArea
            width: 20
            height: 20
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            hoverEnabled: true
            cursorShape: Qt.SizeFDiagCursor

            onPressed: resizing = true
            onReleased: resizing = false

            onPositionChanged: {
                if (pressed) {
                    textField.width = Math.max(minWidth, textField.width + mouse.x)
                    textField.height = Math.max(minHeight, textField.height + mouse.y)
                }
            }
        }
    }

    // drop area for report format design
    Rectangle {
        id: reportDesignArea
        width: 600
        height: 400
        anchors.centerIn: parent
        color: "white"
        border.color: "black"
        z: 1

        property int rows: 13
        property int columns: 12
        property real cellWidth: width / columns
        property real cellHeight: height / rows

        DropArea {
            anchors.fill: parent
            onDropped: {
                drag.source.parent = reportDesignArea;
            }
        }

        Canvas {
            anchors.fill: parent

            onPaint: {
                var ctx = getContext("2d");
                ctx.clearRect(0, 0, width, height);
                ctx.strokeStyle = "#E0E0E0";
                ctx.lineWidth = 1;

                // Vertical lines (columns)
                for (var x = 0; x <= width; x += reportDesignArea.cellWidth) {
                    ctx.beginPath();
                    ctx.moveTo(x, 0);
                    ctx.lineTo(x, height);
                    ctx.stroke();
                }
                // Horizontal lines (rows)
                for (var y = 0; y <= height; y += reportDesignArea.cellHeight) {
                    ctx.beginPath();
                    ctx.moveTo(0, y);
                    ctx.lineTo(width, y);
                    ctx.stroke();
                }
            }
            onWidthChanged: requestPaint()
            onHeightChanged: requestPaint()
        }
    }

    RoundButton {
        text: "Save Format"
        anchors.bottom: parent.bottom
        implicitWidth: 120
        implicitHeight: 42
        radius: 5
        onClicked: {
            console.log("Save format button clicked")
        }
    }
}
