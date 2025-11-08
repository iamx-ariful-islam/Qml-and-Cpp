import QtQuick
import QtQuick.Window
import QtQuick.Layouts
import QtQuick.Controls.Material



Window {
    width: 850
    height: 500
    visible: true
    title: qsTr("Qt Quick Q_Property Macro")


    ColumnLayout {
        anchors.centerIn: parent
        spacing: 10

        Text {
            id: text1
            text: cppObject.property
            color: "green"
            font {
                weight: Font.Bold
                pixelSize: 14
            }
        }
        Text {
            id: text2
            text: cppObject.property
            color: "blue"
            font {
                weight: Font.Bold
                pixelSize: 14
            }
        }
        Text {
            id: text3
            text: cppObject.property
            color: "red"
            font {
                weight: Font.Bold
                pixelSize: 14
            }
        }
        Button {
            id: btn
            text: qsTr("Click me")
            font {
                weight: Font.Bold
                pixelSize: 14
            }
            onClicked: {
                cppObject.property++
            }
        }
    }
}
