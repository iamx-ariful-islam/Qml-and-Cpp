import QtQuick
import QtQuick.Window
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Controls.Material


Window {
    width: 850
    height: 550
    visible: true
    title: qsTr("Qt Quick Dashboard Label Design")


    Rectangle {
        anchors.centerIn: parent
        width: 450
        height: 250
        color: "whitesmoke"
        radius: 10

        ColumnLayout {
            anchors.centerIn: parent
            spacing: 5

            Label {
                text: qsTr("Google Pixel")
                font {
                    family: "ubuntu"
                    weight: Font.Bold
                    pixelSize: 15
                }
            }
            Label {
                text: qsTr("Google")
                font {
                    family: "ubuntu"
                    weight: Font.Bold
                }
                color: "gray"
            }
            Rectangle {
                width: 150
                height: 2
                radius: 5
                color: "gray"
            }
            Label {
                text: qsTr("MacBook Air")
                font {
                    family: "ubuntu"
                    weight: Font.Bold
                    pixelSize: 15
                }
            }
            Label {
                text: qsTr("Apple")
                font {
                    family: "ubuntu"
                    weight: Font.Bold
                }
                color: "gray"
            }
            Rectangle {
                width: 150
                height: 2
                radius: 5
                color: "gray"
            }
            Label {
                text: qsTr("Microsoft Edge")
                font {
                    family: "ubuntu"
                    weight: Font.Bold
                    pixelSize: 15
                }
            }
            Label {
                text: qsTr("Microsoft")
                font {
                    family: "ubuntu"
                    weight: Font.Bold
                }
                color: "gray"
            }
        }
    }
}
