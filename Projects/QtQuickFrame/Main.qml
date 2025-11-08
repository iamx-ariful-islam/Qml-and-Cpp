import QtQuick
import QtQuick.Window
import QtQuick.Layouts
import QtQuick.Controls.Material



Window {
    width: 850
    height: 500
    visible: true
    title: qsTr("Qt Quick Frame")


    Frame {
        anchors.centerIn: parent
        background: Rectangle {
            radius: 10
            border.width: 1
        }

        ListView {
            implicitWidth: 250
            implicitHeight: 250

            clip: true

            model: 100
            delegate: RowLayout {
                CheckBox {}
                Label {
                    text: "Label"
                }
            }
        }
    }
}
