import QtQuick
import QtQuick.Window
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Controls.Material

import myBackend 1.0


Window {
    width: 850
    height: 500
    visible: true
    title: qsTr("Qt Quick Greeting Message")

    MyBackend {
        id: back
    }

    Component.onCompleted: {
        back.getGreetingMessage()
    }

    RowLayout {
        anchors.centerIn: parent

        Text {
            id: greetingMsg
            font {
                family: "Roboto"
                weight: Font.Bold
                pixelSize: 18
            }
            color: "blue" // if need then add multiple color
        }
        Rectangle {
            width: 40
            height: 40
            Image {
                id: eventImage
                width: 40
                height: 40
                fillMode: Image.PreserveAspectFit
            }
        }
    }

    Connections {
        target: back
        function onValueChanged(msg, event) {
            greetingMsg.text = msg
            if (event) {
                eventImage.source = "icons/light_mode.png"
            } else {
                eventImage.source = "icons/dark_mode.png"
            }
        }
    }
}
