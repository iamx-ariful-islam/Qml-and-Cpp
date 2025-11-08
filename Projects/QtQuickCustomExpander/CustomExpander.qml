import QtQuick
import QtQuick.Layouts
import QtQuick.Controls


Item {
    width: 300
    height: 32

    property bool expanded: false

    Rectangle {
        id: headerItem
        anchors.fill: parent
        radius: 5
        color: mouseArea.containsMouse ? "whitesmoke" : "transparent"
        border.color: "lightgray"

        RowLayout {
            anchors.fill: parent
            Layout.alignment: Qt.AlignVCenter
            spacing: 10

            Image {
                Layout.leftMargin: 10
                source: "images/app.png"
                fillMode: Image.PreserveAspectFit
                sourceSize.height: 20
            }

            Text {
                Layout.fillWidth: true
                Layout.alignment: Text.AlignLeft
                text: "Custom Expander"
                font {
                    family: "ubuntu"
                    weight: Font.Bold
                    pixelSize: 14
                }
            }
        }

        Image {
            id: iconAction
            source: expanded ? "images/up-arrow.png" : "images/down-arrow.png"
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: 8
            fillMode: Image.PreserveAspectFit
            sourceSize.height: 18
            opacity: mouseArea.containsMouse ? 1 : 0.5
        }

        MouseArea {
            id: mouseArea
            anchors.fill: parent
            hoverEnabled: true
            cursorShape: Qt.PointingHandCursor
            onClicked: expanded = !expanded
        }
    }

    Rectangle {
        id: contentItem
        anchors.top: headerItem.bottom
        anchors.topMargin: 5
        width: headerItem.width
        height: expanded ? 150 : 0
        radius: 5
        border.color: "lightgray"

        Text {
            anchors.centerIn: parent
            text: "Custom Content"
            font {
                family: "ubuntu"
                weight: Font.Bold
                pixelSize: 14
            }
            visible: expanded
        }

        Behavior on height {
            NumberAnimation {
                duration: 500
                easing.type: Easing.OutQuint
            }
        }
    }
}
