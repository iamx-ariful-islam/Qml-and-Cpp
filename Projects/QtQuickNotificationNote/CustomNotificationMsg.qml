import QtQuick
import QtQuick.Layouts
import QtQuick.Controls


Rectangle {
    id: control
    width: 0
    height: 45
    radius: 8
    color: "lightyellow"
    border.color: "whitesmoke"
    visible: false

    property int targetWidth: 350
    property string notificationText: ""

    Behavior on width {
        NumberAnimation {
            duration: 500
        }
    }

    onWidthChanged: {
        if (width <= 0) visible = false
    }
    function showNotification() {
        visible = true
        width = targetWidth
    }
    function hideNotification() { width = 0 }


    clip: true
    RowLayout {
        anchors.fill: parent
        spacing: 10

        Image {
            Layout.alignment: Qt.AlignLeft
            Layout.leftMargin: 10
            source: "icons/notification.ico"
            fillMode: Image.PreserveAspectFit
            sourceSize.height: 20
            opacity: control.width / control.targetWidth
        }

        Text {
            text: qsTr(control.notificationText)
            font {
                family: "ubuntu"
                weight: Font.Bold
                pixelSize: 12
            }
            color: "red"
            opacity: control.width / control.targetWidth
            wrapMode: Text.WordWrap
            Layout.preferredWidth: control.targetWidth * 0.78
        }

        Image {
            Layout.alignment: Qt.AlignRight
            Layout.rightMargin: 8
            source: "icons/close.png"
            fillMode: Image.PreserveAspectFit
            sourceSize.height: 20
            opacity: mouseArea.containsMouse ? 1.0 : 0.5

            MouseArea {
                id: mouseArea
                anchors.fill: parent
                hoverEnabled: true
                cursorShape: Qt.PointingHandCursor
                onClicked: control.hideNotification()
            }
        }
    }
}
