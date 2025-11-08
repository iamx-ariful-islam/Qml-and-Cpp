import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Controls.Material


Page {

    Rectangle {
        id: headerSection
        width: parent.width
        height: 100
        anchors.top: parent.top
    }

    Rectangle {
        width: parent.width
        height: parent.height - headerSection.height
        anchors.top: headerSection.bottom

        ColumnLayout {
            y: parent.height / 4
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 0

            Text {
                text: qsTr("Welcome")
                font {
                    family: "Roboto"
                    weight: Font.Bold
                    pixelSize: 14
                }
            }
            Text {
                text: qsTr("eSmart Analyzer LIS")
                font {
                    family: "Roboto"
                    weight: Font.Bold
                    pixelSize: 22
                }
            }
            Text {
                text: qsTr("Version v24.1, 25 January 2024")
                font {
                    family: "Roboto"
                    weight: Font.Bold
                    pixelSize: 14
                }
                opacity: 0.3
            }
        }
        Button {
            anchors.bottom: parent.bottom
            anchors.right: parent.right
            anchors.bottomMargin: 20
            anchors.rightMargin: 20
            text: "Next ->"
            font.family: "ubuntu"
            font.bold: true
            font.pixelSize: 12

            contentItem: Text {
                text: parent.text
                font: parent.font
                // opacity: enabled ? 1.0 : 0.3
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
                scale: parent.down ? 0.9 : 1.0
                Behavior on scale {
                    NumberAnimation {
                        duration: 70
                    }
                }
            }

            background: Rectangle {
                implicitWidth: 80
                implicitHeight: 32
                radius: 5
                color: "whitesmoke"

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor

                    onEntered: parent.border.color = "lightgray"
                    onExited: parent.border.color = "transparent"
                }
            }
            onClicked: {
                myStackView.push(page2);
            }
        }
    }
}
