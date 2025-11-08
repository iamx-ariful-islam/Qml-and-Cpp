import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Controls.Material

import myBackend 0.1

Window {
    width: 850
    height: 500
    visible: true
    title: qsTr("Qt Quick File Create By Button Click")

    MyBackend {
        id: back
    }

    RoundButton {
        anchors.centerIn: parent
        text: qsTr("File Create")
        radius: 5
        implicitWidth: 130
        font {
            family: "Roboto"
            weight: Font.Bold
            pixelSize: 15
        }

        onClicked: {
            back.createFile()
        }
    }
    Connections {
        target: back
        function onReturnInfo(x) {
            if (x) {
                console.log("Successfully file created")
            }
            else {
                console.log("File not created")
            }
        }
    }
}
