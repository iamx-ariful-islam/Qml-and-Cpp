import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Controls.Material


Window {
    width: 850
    height: 500
    visible: true
    title: qsTr("Qt Quick Custom ComboBox")


    ComboBox {
        id: cbox
        anchors.centerIn: parent
        implicitWidth: 200
        implicitHeight: 46
        font.bold: true
        font.pointSize: 8
        model: ['Item1', 'Item2', 'Item3']

        popup: Popup {
            y: cbox.height-2
            width: cbox.width

            padding: 0
            contentItem: ListView {
                clip: true
                implicitHeight: contentHeight

                Behavior on implicitHeight {
                    NumberAnimation {
                        duration: 500
                        easing.type: Easing.OutQuint
                    }
                }
                model: cbox.popup.visible ? cbox.delegateModel : []
                currentIndex: cbox.highlightedIndex
            }
        }
        delegate: ItemDelegate {
            width: cbox.width
            height: cbox.height-14
            MouseArea {
                id: mouseArea
                anchors.fill: parent
                hoverEnabled: true
                cursorShape: Qt.PointingHandCursor
                onClicked: {
                    console.log("Selected Item: " + modelData)
                    cbox.currentIndex = index
                    cbox.popup.close()
                }
            }
            Rectangle {
                width: 2
                height: parent.height * 0.5
                anchors.verticalCenter: parent.verticalCenter
                color: Material.accent
                radius: width / 2
                visible: mouseArea.containsMouse ? true : false
            }
            contentItem: Text {
                text: modelData
                font: cbox.font
                color: Material.accent
                elide: Text.ElideRight
                verticalAlignment: Text.AlignVCenter
            }
        }
        HoverHandler {
            cursorShape: Qt.PointingHandCursor
        }
    }
}
