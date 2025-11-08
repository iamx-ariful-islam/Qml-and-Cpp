import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Controls.Material


ApplicationWindow {
    width: 850
    height: 500
    visible: true
    title: qsTr("Qt Quick Canvas Example")


    Rectangle {
        anchors.centerIn: parent
        width: parent.width * 0.9
        height: parent.height * 0.8
        border.color: "lightslategray"
        radius: 10

        Canvas {
            anchors.fill: parent

            onPaint: {
                var ctx = getContext("2d");
                ctx.fillStyle = "lightslategray"

                ctx.beginPath();
                ctx.fillRect(10, 10, 80, 50);

                ctx.beginPath();
                ctx.fillRect(120, 10, 70, 70);

                ctx.beginPath();
                ctx.ellipse(230, 10, 90, 70);
                ctx.fill();

                ctx.beginPath();
                ctx.ellipse(10, 110, 70, 70);
                ctx.fill();

                ctx.beginPath();
                ctx.roundedRect(120, 110, 70, 70, 10, 10);
                ctx.fill();

                ctx.beginPath();
                ctx.moveTo(230, 110);
                ctx.arc(230, 110, 70, 0, Math.PI * 0.5, false);
                ctx.fill();

            }
        }
    }
}
