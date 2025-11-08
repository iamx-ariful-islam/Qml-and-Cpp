import QtQuick
import QtQuick.Window
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Controls.Material


Window {
    width: 850
    height: 500
    visible: true
    title: qsTr("Qt Quick Primary Secondary Button Design")



    RowLayout {
        anchors.centerIn: parent
        spacing: 10

        Button {
            text: "Normal"
            font.family: "Roboto"
            font.bold: true
            font.pixelSize: 15

            background: Rectangle {
                implicitWidth: 80
                implicitHeight: 32
                color: "transparent"
                radius: 5

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true

                    onEntered: {
                        parent.border.width = 2
                    }
                    onExited: {
                        parent.border.width = 0
                    }

                }
            }
        }

        Button {
            text: "Outlined"
            font.family: "Roboto"
            font.bold: true
            font.pixelSize: 15

            background: Rectangle {
                implicitWidth: 80
                implicitHeight: 32
                color: mouseArea2.containsMouse ? "whitesmoke" : "transparent"
                border.width: 2
                radius: 5

                MouseArea {
                    id: mouseArea2
                    anchors.fill: parent
                    hoverEnabled: true
                }
            }
        }

        Button {
            id: root
            text: qsTr("Primary")
            contentItem: Text {
                id: btn
                text: root.text
                color: "blue"
                font.pixelSize: 15
                font.family: "Arial"
                font.weight: Font.Bold
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
            }

            background: Rectangle {
                implicitWidth: 80
                implicitHeight: 32
                color: if (mouseArea.containsMouse) {
                           return "blue"
                       } else if (mouseArea.containsPress) {
                           return Qt.darker("blue", 1.2)
                       } else {
                           return "transparent"
                       }

                border.width: 2
                border.color: "blue"
                radius: 5
                MouseArea {
                    id: mouseArea
                    anchors.fill: parent
                    hoverEnabled: true

                    onEntered: {
                        btn.color  = "white"
                    }
                    onExited: {
                        btn.color  = "blue" // default color
                    }

                    HoverHandler {
                        cursorShape: Qt.PointingHandCursor
                    }
                }
            }
        }
        Button {
            contentItem: Text {
                color: "white"
                text: qsTr("Secondary")
                font.family: "Roboto"
                font.bold: true
                font.pixelSize: 15
            }
            background: Rectangle {
                implicitWidth: 80
                implicitHeight: 32
                color: "orange"
                radius: 5
            }
        }

        Button {
            text: "Simple"
            font.family: "Roboto"
            font.bold: true
            font.pixelSize: 15

            background: Rectangle {
                implicitWidth: 80
                implicitHeight: 32
                radius: 5
                color: "transparent"

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true

                    onEntered: parent.color = "whitesmoke"
                    onExited: parent.color = "transparent"
//                    onPressed: parent.color = Qt.darker("whitesmoke", 5)
//                    onReleased: parent.color = "whitesmoke"
                }
            }
        }
    }
}
