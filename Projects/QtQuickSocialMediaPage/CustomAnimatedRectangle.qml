import QtQuick
import QtQuick.Layouts
import QtQuick.Controls


import myBackend 0.1

Item {
    id: root
    width: 300
    height: 52

    property string titleText: ""
    property string tempTitleText: ""
    property url iconSource: ""
    property string infoUrl: ""
    property color colorCode: "whitesmoke"

    MyBackend {
        id: back
    }

    Rectangle {
        id: backgroundRect
        width: parent.width
        height: parent.height
        radius: 5
        color: "whitesmoke"

        MouseArea {
            id: mouseArea
            anchors.fill: parent
            hoverEnabled: true
            cursorShape: Qt.PointingHandCursor

            onEntered: animation.start()
            onExited: animation.start()

            onClicked: {
                root.tempTitleText = root.titleText
                root.titleText = root.titleText.split('').join(' ')
                back.openUrlInNewTab(root.infoUrl)
                console.log("Open url in default browser", root.infoUrl)
                openingTimer.start();
            }
        }

        Rectangle {
            id: logoRect
            x: 10
            anchors.verticalCenter: parent.verticalCenter
            width: 40
            height: 36
            border.color: "lightgray"
            radius: 5
            color: "transparent"

            Image {
                source: root.iconSource
                anchors.centerIn: parent
                fillMode: Image.PreserveAspectFit
                sourceSize.height: 28
            }
        }

        ColumnLayout {
            Text {
                anchors.centerIn: parent
                text: qsTr(root.titleText)
                font {
                    family: "ubuntu"
                    weight: Font.Bold
                    pixelSize: root.titleText === root.tempTitleText.split('').join(' ') ? 16 : 14
                }
                color: mouseArea.containsMouse ? "white" : root.colorCode
            }
            Text {
                anchors.centerIn: parent
                text: qsTr(root.infoUrl)
                font {
                    family: "ubuntu"
                    weight: Font.Bold
                    pixelSize: 12
                }
                color: mouseArea.containsMouse ? "white" : root.colorCode
            }
        }

        PropertyAnimation {
            id: backgroundAnimation
            target: backgroundRect
            property: "color"
            duration: 150
            easing.type: Easing.InOutQuad
        }

        NumberAnimation {
            id: animation
            target: logoRect
            property: "x"
            duration: 150
            easing.type: Easing.InOutQuad
            from: mouseArea.containsMouse ? 10 : root.width - logoRect.width - 10
            to: mouseArea.containsMouse ? root.width - logoRect.width - 10 : 10

            onStarted: {
                backgroundAnimation.to = mouseArea.containsMouse ? root.colorCode : "whitesmoke";
                backgroundAnimation.start();
            }
        }

        Timer {
            id: openingTimer
            interval: 2000
            onTriggered: root.titleText = root.tempTitleText
        }
    }
}
