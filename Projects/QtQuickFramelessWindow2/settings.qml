import QtQuick
import QtQuick.Window
import QtQuick.Layouts
import QtQuick.Controls


ApplicationWindow {
    id: settingsWindow
    color: "transparent"
    flags: Qt.FramelessWindowHint
    visible: true
    minimumWidth: 400
    height: 250


    Rectangle {
        id: rect
        anchors.fill: parent
        anchors.margins: 10
        width: Math.round(parent.width / 1.5)
        height: Math.round(parent.height / 2)
        radius: 10
    }

    Page {
        anchors.fill: rect

        header: ToolBar {
            id: header
            background: Rectangle {
                gradient: "NightFade"
                implicitWidth: 100
                implicitHeight: 40
                opacity: enabled ? 1 : 0.3
            }
            Item {
                anchors.fill: parent
                TapHandler {
                    onTapped: if (tapCount === 2) toggleMaximized()
                    gesturePolicy: TapHandler.DragThreshold
                }
                DragHandler {
                    grabPermissions: TapHandler.CanTakeOverFromAnything
                    onActiveChanged: if (active) { window.startSystemMove(); }
                }
                RowLayout {
                    anchors.centerIn: parent
                    Image {
                        source: "images/peace.svg"
                        width: 24
                        height: 24
                        sourceSize.width: 24
                        sourceSize.height: 24
                    }
                    Label {
                        text: "Settings"
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }
                }
                RowLayout {
                    anchors.right: parent.right
                    spacing: 0
                    ToolButton {
                        text: "🗕"
                        font.pixelSize: Qt.application.font.pixelSize * 1.6
                        onClicked: window.showMinimized();
                    }
                    ToolButton {
                        text: qsTr("🗙")
                        font.pixelSize: Qt.application.font.pixelSize * 1.4
                        contentItem: Text {
                            text: parent.text
                            font: parent.font
                            opacity: enabled ? 1.0 : 0.3
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            elide: Text.ElideRight
                        }
                        onClicked: settingsWindow.close()
                    }
                }
            }
        }

        Rectangle {
            anchors.fill: parent
            gradient: "RainyAshville"
        }
        layer.enabled: true
    }
}
