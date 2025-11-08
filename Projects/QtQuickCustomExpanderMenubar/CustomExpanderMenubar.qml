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
                source: "images/menu_2.png"
                fillMode: Image.PreserveAspectFit
                sourceSize.height: 20
            }
            Text {
                Layout.fillWidth: true
                Layout.alignment: Text.AlignLeft
                text: "Custom Expander Menubar"
                font {
                    family: "ubuntu"
                    weight: Font.Bold
                    pixelSize: 14
                }
            }
        }

        Image {
            id: iconAction
            source: expanded ? "images/close.png" : "images/down-arrow.png"
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
        height: expanded ? menuListView.contentHeight : 0
        radius: 5
        border.color: "lightgray"

        ListView {
            id: menuListView
            anchors.fill: parent
            model: [["Profile", "images/user.png"], ["Password", "images/lock.png"], ["Logout", "images/turn-off.png"]]

            delegate: Item {
                width: menuListView.width
                height: 32

                Rectangle {
                    width: parent.width * 0.995
                    height: 32
                    radius: 5
                    anchors.horizontalCenter: parent.horizontalCenter
                    color: mouseArea2.containsMouse ? "whitesmoke" : "transparent"

                    Image {
                        id: icon
                        source: modelData[1]
                        fillMode: Image.PreserveAspectFit
                        sourceSize.height: 18
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.leftMargin: 5
                    }
                    Text {
                        text: modelData[0]
                        font {
                            family: "ubuntu"
                            weight: Font.Bold
                            pixelSize: 14
                        }
                        anchors.left: icon.right
                        anchors.leftMargin: 10
                        anchors.verticalCenter: parent.verticalCenter
                    }
                    Rectangle {
                        width: 2
                        height: parent.height * 0.5
                        anchors.right: parent.right
                        anchors.rightMargin: 5
                        anchors.verticalCenter: parent.verticalCenter
                        color: "#E91E63"
                        radius: 5
                        visible: mouseArea2.containsMouse ? true : false
                    }
                    MouseArea {
                        id: mouseArea2
                        anchors.fill: parent
                        hoverEnabled: true
                        cursorShape: Qt.PointingHandCursor
                        onClicked: {
                            console.log("Clicked on", modelData[0]);
                        }
                    }
                }
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
