import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Controls.Material


Window {
    width: 850
    height: 500
    visible: true
    title: qsTr("Qt Quick Custom Items")


    Column {
        id: mainColumn

        ButtonGroup {
            id: primaryGroup
            exclusive: false
        }

        CheckBox {
            text: qsTr("CheckBox 1")
            ButtonGroup.group: primaryGroup
        }

        CheckBox {
            text: qsTr("CheckBox 2")
            ButtonGroup.group: primaryGroup
        }

        CheckBox {
            text: qsTr("CheckBox 3")
            ButtonGroup.group: primaryGroup
        }
    }

    Rectangle {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: mainColumn.bottom
        anchors.topMargin: 10

        width: primaryGroupState.width + 30
        height: primaryGroupState.height + 10
        border.width: 2
        border.color: "red"
        radius: 5

        Label {
            id: primaryGroupState
            anchors.centerIn: parent

            text: qsTr("State") + " " + primaryGroup.checkState
            font {
                family: "Roboto"
                weight: Font.Bold
                pixelSize: 15
            }
        }
    }

    CheckBox {
        id: testCheckBox
        x: 10
        y: parent.height - height - 10
        text: qsTr("To check or not to check...")

        background: Rectangle {
            color: "transparent"
        }
        contentItem: Text {
            //            color: "#FFFFFF";
            text: testCheckBox.text
            verticalAlignment: Text.AlignVCenter
            leftPadding: testCheckBox.indicator.width
            font.family: "Roboto"
            font.pointSize: 10
            font.bold: true
        }
        indicator: Rectangle {
            y: testCheckBox.height / 2 - height / 2
            implicitWidth: 25
            implicitHeight: 25
            radius: 5
            border.width: 2
            border.color: "#800000"

            Rectangle {
                visible: testCheckBox.checked
                width: parent.width / 2
                height: parent.height / 2
                x: parent.width / 2 - width / 2
                y: parent.height / 2 - height / 2
                radius: 3
                color: testCheckBox.down ? "#CD5C5C" : "#B22222"
            }
        }
    }

    CheckBox {
        id: control
        x: 400
        y: parent.height - height - 10
        text: qsTr("CheckBox")
        checked: true

        indicator: Rectangle {
            implicitWidth: 26
            implicitHeight: 26
            x: control.leftPadding
            y: parent.height / 2 - height / 2
            radius: 5
            border.width: 2
            border.color: control.down ? "#17a81a" : "#21be2b"

            Rectangle {
                width: 14
                height: 14
                x: 6
                y: 6
                radius: 2
                color: control.down ? "#17a81a" : "#21be2b"
                visible: control.checked
            }
        }

        contentItem: Text {
            text: control.text
            font: control.font
            opacity: enabled ? 1.0 : 0.3
            color: control.down ? "#17a81a" : "#21be2b"
            verticalAlignment: Text.AlignVCenter
            leftPadding: control.indicator.width + control.spacing
        }
    }

    CheckDelegate {
        id: control2
        x: 10
        y: parent.height - height - 100
        text: qsTr("CheckDelegate")
        checked: true

        contentItem: Text {
            rightPadding: control2.indicator.width + control2.spacing
            text: control2.text
            font: control2.font
            opacity: enabled ? 1.0 : 0.3
            color: control2.down ? "#17a81a" : "#21be2b"
            elide: Text.ElideRight
            verticalAlignment: Text.AlignVCenter
        }

        indicator: Rectangle {
            implicitWidth: 26
            implicitHeight: 26
            x: control2.width - width - control2.rightPadding
            y: control2.topPadding + control2.availableHeight / 2 - height / 2
            radius: 3
            color: "transparent"
            border.width: 2
            border.color: control2.down ? "#17a81a" : "#21be2b"

            Rectangle {
                width: 14
                height: 14
                x: 6
                y: 6
                radius: 2
                color: control2.down ? "#17a81a" : "#21be2b"
                visible: control2.checked
            }
        }

        background: Rectangle {
            implicitWidth: 100
            implicitHeight: 40
            radius: 5
            visible: control2.down || control2.highlighted
            color: control2.down ? "#bdbebf" : "#eeeeee"
        }
    }


    DelayButton {
        id: control3
        x: 200
        y: parent.height - height - 100
        checked: true
        text: qsTr("Delay\nButton")

        contentItem: Text {
            text: control3.text
            font: control3.font
            opacity: enabled ? 1.0 : 0.3
            color: "white"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            elide: Text.ElideRight
        }

        background: Rectangle {
            implicitWidth: 100
            implicitHeight: 100
            opacity: enabled ? 1 : 0.3
            color: control3.down ? "#17a81a" : "#21be2b"
            radius: size / 2

            readonly property real size: Math.min(control3.width, control3.height)
            width: size
            height: size
            anchors.centerIn: parent

            Canvas {
                id: canvas
                anchors.fill: parent

                Connections {
                    target: control3
                    function onProgressChanged() { canvas.requestPaint(); }
                }

                onPaint: {
                    var ctx = getContext("2d")
                    ctx.clearRect(0, 0, width, height)
                    ctx.strokeStyle = "white"
                    ctx.lineWidth = parent.size / 20
                    ctx.beginPath()
                    var startAngle = Math.PI / 5 * 3
                    var endAngle = startAngle + control3.progress * Math.PI / 5 * 9
                    ctx.arc(width / 2, height / 2, width / 2 - ctx.lineWidth / 2 - 2, startAngle, endAngle)
                    ctx.stroke()
                }
            }
        }
    }

    PageIndicator {
        id: control4
        x: 350
        y: parent.height - height - 100
        count: 5
        currentIndex: 2

        delegate: Rectangle {
            implicitWidth: 8
            implicitHeight: 8

            radius: width / 2
            color: "#21be2b"

            opacity: index === control4.currentIndex ? 0.95 : pressed ? 0.7 : 0.45

            Behavior on opacity {
                OpacityAnimator {
                    duration: 100
                }
            }
        }
    }


    ProgressBar {
        id: control5
        x: 450
        y: parent.height - height - 100
        value: 0.5
        padding: 2

        background: Rectangle {
            implicitWidth: 200
            implicitHeight: 6
            color: "#e6e6e6"
            radius: 3
        }

        contentItem: Item {
            implicitWidth: 200
            implicitHeight: 4

            Rectangle {
                width: control5.visualPosition * parent.width
                height: parent.height
                radius: 2
                color: "#17a81a"
            }
        }
    }


    Switch {
        id: control6
        x: 10
        y: parent.height - height - 200
        text: qsTr("Switch")

        indicator: Rectangle {
            implicitWidth: 48
            implicitHeight: 26
            x: control6.leftPadding
            y: parent.height / 2 - height / 2
            radius: 13
            color: control6.checked ? "#17a81a" : "#ffffff"
            border.color: control6.checked ? "#17a81a" : "#cccccc"

            Rectangle {
                x: control6.checked ? parent.width - width : 0
                width: 26
                height: 26
                radius: 13
                color: control6.down ? "#cccccc" : "#ffffff"
                border.color: control6.checked ? (control6.down ? "#17a81a" : "#21be2b") : "#999999"
            }
        }

        contentItem: Text {
            text: control6.text
            font: control6.font
            opacity: enabled ? 1.0 : 0.3
            color: control6.down ? "#17a81a" : "#21be2b"
            verticalAlignment: Text.AlignVCenter
            leftPadding: control6.indicator.width + control6.spacing
        }
    }
}
