import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material


Popup {
    id: popup
    modal: false
    focus: false
    width: 250
    height: 65
    closePolicy: Popup.NoAutoClose // To close click the notification or wait 5 seconds

    property color bodyColor
    property color borderColor


    property var msgTypeColors: {
        "success" : ["green", "darkgreen"],
        "warning" : ["orange", "darkorange"],
        "error"   : ["red", "darkred"]
    }
    function notificationMsg(title, body, type) {
        titleText.text = title
        bodyText.text  = body

        var colors  = msgTypeColors[type.toLowerCase()] || ["blue", "darkblue"]
        bodyColor   = colors[0]
        borderColor = colors[1]

        popup.open()
    }

    Timer {
        id: timer
        interval: 5000 // wait 5000 milliseconds or 5 seconds
        running: true
        repeat: false
        onTriggered: popup.close()
    }
    contentItem: Rectangle {
        id: myrect
        implicitWidth: parent.width
        implicitHeight: parent.height
        color: bodyColor
        border.color: borderColor
        radius: 5
        opacity: 0.8

        anchors.fill: parent
        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            HoverHandler {
                cursorShape: Qt.PointingHandCursor
            }
            onEntered: timer.repeat = true
            onExited: timer.repeat = false
            onClicked: popup.close()
        }
        Row {
            Image {
                id: name
            }
            Column {
                padding: 10
                Text {
                    id: titleText
                    font {
                        weight: Font.Bold
                        pointSize: 10
                    }
                }
                Text {
                    id: bodyText
                    wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                }
            }
        }
        RoundButton {
            x: parent.width - width + 2
            y: -10
            text: 'x'
            font.bold: true
            font.pointSize: 11
            background: Rectangle {
                color: "transparent"
            }
            HoverHandler {
                cursorShape: Qt.PointingHandCursor
            }
            onClicked: popup.close()
        }
    }
    x: parent.width - width - 5
    y: 10
    onOpened: {
        timer.start()
    }
}
