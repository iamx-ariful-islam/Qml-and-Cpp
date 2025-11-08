import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Controls.Material


ApplicationWindow {
    visible: true
    width: 1220
    height: 650
    title: qsTr("Qt Quick Curvy Background 2")


    ColumnLayout {
        anchors.fill: parent

        RowLayout {
            spacing: 5

            // curvy background 1
            Rectangle {
                width: 300
                height: 200
                color: "lightblue"

                Canvas {
                    anchors.fill: parent
                    onPaint: {
                        var ctx = getContext("2d");
                        ctx.fillStyle = "red";

                        // quadraticCurveTo(cp1x, cp1y, x, y) // draw quadratic bezier curve
                        // cp1x (control point 1 x-coordinate)
                        // cp1y (control point 1 y-coordinate)
                        // x (end point x-coordinate)
                        // y (end point y-coordinate)

                        // moveTo(x, y) // starting point
                        // x (x-coordinate)
                        // y (y-coordinate)

                        // lineTo() // straight line
                        // x (end point x-coordinate)
                        // y (end point y-coordinate)

                        ctx.beginPath();
                        ctx.moveTo(0, height);
                        ctx.quadraticCurveTo(width, 0, width, 0)
                        ctx.lineTo(width, height);
                        ctx.lineTo(0, height);
                        ctx.fill();
                    }
                }

                Text {
                    anchors.centerIn: parent
                    text: "Curvy Background 1"
                    font.pixelSize: 16
                    font.bold: true
                    color: "red"
                }
            }

            // curvy background 2
            Rectangle {
                width: 300
                height: 200
                color: "lightblue"

                Canvas {
                    anchors.fill: parent
                    onPaint: {
                        var ctx = getContext("2d");
                        ctx.fillStyle = "green";

                        // draw a curvy top side
                        ctx.beginPath();
                        ctx.moveTo(0, height);
                        ctx.quadraticCurveTo(width/2, height/2, width/2, height/2);
                        ctx.lineTo(width, height);
                        ctx.lineTo(0, height);
                        ctx.fill();
                    }
                }

                Text {
                    anchors.centerIn: parent
                    text: "Curvy Background 2"
                    font.pixelSize: 16
                    font.bold: true
                    color: "green"
                }
            }

            // curvy background 3
            Rectangle {
                width: 300
                height: 200
                color: "lightblue"

                Canvas {
                    anchors.fill: parent
                    onPaint: {
                        var ctx = getContext("2d");
                        ctx.fillStyle = "blue";

                        // draw a curvy top side
                        ctx.beginPath();
                        ctx.moveTo(0, height);
                        ctx.quadraticCurveTo(width/2, height, width, height/2);
                        ctx.lineTo(width, height);
                        ctx.lineTo(0, height);
                        ctx.fill();
                    }
                }

                Text {
                    anchors.centerIn: parent
                    text: "Curvy Background 3"
                    font.pixelSize: 16
                    font.bold: true
                    color: "blue"
                }
            }
            // custom curve background
            Rectangle {
                width: 300
                height: 200
                color: "lightblue"

                Canvas {
                    anchors.fill: parent

                    onPaint: {
                        var ctx = getContext("2d");

                        // Set the fill color
                        ctx.fillStyle = "blue";

                        // Adjusted top position
                        var topPosition = 100;

                        // Draw the curved rectangle
                        ctx.beginPath();
                        ctx.moveTo(0, topPosition);
                        ctx.quadraticCurveTo(width / 2, 50, width, topPosition);
                        ctx.lineTo(width, height);
                        ctx.lineTo(0, height);
                        ctx.closePath();

                        // Fill the shape
                        ctx.fill();
                    }
                }
                Text {
                    text: "Custom Curvy Background"
                    font.pixelSize: 16
                    font.bold: true
                    color: "blue"
                }
            }
        }
        RowLayout {
            spacing: 5

            // curvy background 4
            Rectangle {
                width: 300
                height: 200
                color: "lightblue"

                Canvas {
                    anchors.fill: parent
                    onPaint: {
                        var ctx = getContext("2d");
                        ctx.fillStyle = "orange";

                        // draw a curvy top side
                        ctx.beginPath();
                        ctx.moveTo(0, height);
                        ctx.quadraticCurveTo(width, height/2, width, height/2);
                        ctx.lineTo(width, height);
                        ctx.lineTo(0, height);
                        ctx.fill();
                    }
                }

                Text {
                    anchors.centerIn: parent
                    text: "Curvy Background 4"
                    font.pixelSize: 16
                    font.bold: true
                    color: "orange"
                }
            }

            // curvy background 5
            Rectangle {
                width: 300
                height: 200
                color: "lightblue"

                Canvas {
                    anchors.fill: parent
                    onPaint: {
                        var ctx = getContext("2d");
                        ctx.fillStyle = "black";

                        // draw a curvy top side
                        ctx.beginPath();
                        ctx.moveTo(0, height);
                        ctx.quadraticCurveTo(width, height, width, 0);
                        ctx.lineTo(width, height);
                        ctx.lineTo(0, height);
                        ctx.fill();
                    }
                }

                Text {
                    anchors.centerIn: parent
                    text: "Curvy Background 5"
                    font.pixelSize: 16
                    font.bold: true
                    color: "black"
                }
            }

            // curvy background 6
            Rectangle {
                width: 300
                height: 200
                color: "lightblue"

                Canvas {
                    anchors.fill: parent
                    onPaint: {
                        var ctx = getContext("2d");
                        ctx.fillStyle = "yellow";

                        // draw a curvy top side
                        ctx.beginPath();
                        ctx.moveTo(0, height);
                        ctx.quadraticCurveTo(width/2, 0, width/2, 0);
                        ctx.lineTo(width, height);
                        ctx.lineTo(0, height);
                        ctx.fill();
                    }
                }

                Text {
                    anchors.centerIn: parent
                    text: "Curvy Background 6"
                    font.pixelSize: 16
                    font.bold: true
                    color: "yellow"
                }
            }
        }
        RowLayout {
            spacing: 5

            // curvy background 7
            Rectangle {
                width: 300
                height: 200
                color: "lightblue"

                Canvas {
                    anchors.fill: parent
                    onPaint: {
                        var ctx = getContext("2d");
                        ctx.fillStyle = "green";

                        // draw a curvy top side
                        ctx.beginPath();
                        ctx.moveTo(0, height);
                        ctx.quadraticCurveTo(width, height/4, width, height/4);
                        ctx.lineTo(width, height);
                        ctx.lineTo(0, height);
                        ctx.fill();
                    }
                }

                Text {
                    anchors.centerIn: parent
                    text: "Curvy Background 7"
                    font.pixelSize: 16
                    font.bold: true
                    color: "green"
                }
            }

            // curvy background 8
            Rectangle {
                width: 300
                height: 200
                color: "lightblue"

                Canvas {
                    anchors.fill: parent
                    onPaint: {
                        var ctx = getContext("2d");
                        ctx.fillStyle = "blue";

                        // draw a curvy top side
                        ctx.beginPath();
                        ctx.moveTo(0, height);
                        ctx.quadraticCurveTo(width, height/8, width, height/8);
                        ctx.lineTo(width, height);
                        ctx.lineTo(0, height);
                        ctx.fill();
                    }
                }

                Text {
                    anchors.centerIn: parent
                    text: "Curvy Background 8"
                    font.pixelSize: 16
                    font.bold: true
                    color: "blue"
                }
            }

            // curvy background 9
            Rectangle {
                width: 300
                height: 200
                color: "lightblue"

                Canvas {
                    anchors.fill: parent
                    onPaint: {
                        var ctx = getContext("2d");
                        ctx.fillStyle = "red";

                        // draw a curvy top side
                        ctx.beginPath();
                        ctx.moveTo(0, height);
                        ctx.quadraticCurveTo(width/2, height/4, width/2, height/4);
                        ctx.lineTo(width, height);
                        ctx.lineTo(0, height);
                        ctx.fill();
                    }
                }

                Text {
                    anchors.centerIn: parent
                    text: "Curvy Background 9"
                    font.pixelSize: 16
                    font.bold: true
                    color: "red"
                }
            }
        }
    }
}
