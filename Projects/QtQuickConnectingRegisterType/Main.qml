import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Controls.Material

import myBackend 1.0

Window {
    width: 850
    height: 500
    visible: true
    title: qsTr("Qt Quick Connecting Using Register Type")

    MyBackend {
        id: back
    }

    Column {
        anchors.centerIn: parent
        spacing: 10

        Label {
            id: lbl
            font.pointSize: 12
            font.bold: true
            text: qsTr("Click any Button")
        }

        Row {
            spacing: 10

            Button {
                text: qsTr("Button1")
                onClicked: back.changeValue(1)
            }
            Button {
                text: qsTr("Button2")
                onClicked: back.changeValue(2)
            }
            Button {
                text: qsTr("Button3")
                onClicked: back.changeValue(3)
            }
        }
    }

    Connections {
        target: back
        function onValueChanged(str) {
            lbl.text = str
        }
    }
}
