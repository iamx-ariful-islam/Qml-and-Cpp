import QtQuick
import QtQuick.Window
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Controls.Material


Window {
    width: 850
    height: 500
    visible: true
    title: qsTr("Qt Quick Text Format")

    Column {
        anchors.centerIn: parent
        spacing: 10

        Row {
            spacing: 5

            Text {
                text: "Google"
                font {
                    family: "Roboto"
                    weight: Font.Bold
                    pixelSize: 15
                }
                color: "gray"
            }
            Text {
                text: "Google Pixel"
                font {
                    family: "Roboto"
                    weight: Font.Bold
                    pixelSize: 15
                }
                color: Qt.Dark
            }
        }

        Column {
            spacing: 0

            Text {
                text: "Apple"
                font {
                    family: "Roboto"
                    weight: Font.Bold
                    pixelSize: 13
                }
                color: "gray"
            }
            Text {
                text: "MacBook Air"
                font {
                    family: "Roboto"
                    weight: Font.Bold
                    pixelSize: 15
                }
            }
        }

        Row {
            spacing: 5

            Text {
                text: "Microsoft"
                font {
                    family: "Roboto"
                    weight: Font.Bold
                    pixelSize: 15
                }
            }
            Text {
                text: "Surface Pro"
                font {
                    family: "Roboto"
                    weight: Font.Bold
                    pixelSize: 15
                }
                color: "gray"
            }
        }

        Column {
            anchors.right: parent.right
            spacing: 0

            Text {
                text: "Apple"
                font {
                    family: "Roboto"
                    weight: Font.Bold
                    pixelSize: 13
                }
                anchors.right: parent.right
            }
            Text {
                text: "MacBook Air"
                font {
                    family: "Roboto"
                    weight: Font.Bold
                    pixelSize: 15
                }
                color: "gray"
                anchors.right: parent.right
            }
        }
    }

    Text {
        x: 100
        anchors.verticalCenter: parent.verticalCenter

        text: "This is simple rotated text"
        font {
            family: "Roboto"
            weight: Font.Bold
            pixelSize: 15
        }
        rotation: -90 // Rotates the text 90 degrees counterclockwise, making it go from top to bottom
    }
}
