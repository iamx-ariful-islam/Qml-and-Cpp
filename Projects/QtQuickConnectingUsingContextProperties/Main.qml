import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Controls.Material


Window {
    width: 850
    height: 500
    visible: true
    title: qsTr("Qt Quick Connecting Using Context Properties")


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
                onClicked: myBackend.changeValue(1)
            }
            Button {
                text: qsTr("Button2")
                onClicked: myBackend.changeValue(2)
            }
            Button {
                text: qsTr("Button3")
                onClicked: myBackend.changeValue(3)
            }
        }
    }

    Connections {
        target: myBackend
        function onValueChanged(str) {
            lbl.text = str
        }
    }
}
