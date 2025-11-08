import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Controls.Material


Window {
    width: 1385
    height: 650
    visible: true
    title: qsTr("Qt Quick Curvy Background 3")


    // custom curve background
    Rectangle {
        width: parent.width
        height: parent.height
        color: "lightblue"

        Canvas {
            width: parent.width
            height: 200

            onPaint: {
                var ctx = getContext("2d");

                // Set the fill color
                ctx.fillStyle = "blue";

                // Adjusted top position
                var topPosition = 100;

                // Draw the curved rectangle
                ctx.beginPath();
                ctx.moveTo(0, topPosition);
                ctx.quadraticCurveTo(width / 2, -50, width, topPosition);
                ctx.lineTo(width, height);
                ctx.lineTo(0, height);
                ctx.closePath();

                // Fill the shape
                ctx.fill();
            }
        }
        Text {
            anchors.centerIn: parent
            text: "Custom Curvy Background"
            font.pixelSize: 32
            font.bold: true
            color: "blue"
        }
    }
}
