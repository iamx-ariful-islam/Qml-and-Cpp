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

        ColumnLayout {
            anchors.verticalCenter: parent.verticalCenter
            x: 25
            spacing: 0

            Label {
                id: stepCounter
                text: qsTr("Step 2/3")
            }
            Label {
                id: title
                text: qsTr("Now set or add lis company information")
                font {
                    family: "Roboto"
                    pixelSize: 20
                    weight: Font.Bold
                }
            }
            Label {
                id: subTitle
                text: qsTr("Please fill or add the information of lis company below so that you can get in contact with them")
            }
        }

        Rectangle {
            anchors.bottom: parent.bottom
            width: parent.width - 50
            height: 1
            color: "lightgray"
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }

    Rectangle {
        width: parent.width
        height: parent.height - headerSection.height
        anchors.top: headerSection.bottom

        ColumnLayout {
            x: 25
            y: 50
            spacing: 30

            RowLayout {
                spacing: 10

                ComboBox {
                    id: cbox
                    implicitWidth: 480
                    implicitHeight: 53
                    font.bold: true
                    model: ['-Select-', 'Item1', 'Item2', 'Item3']

                    popup: Popup {
                        y: cbox.height-2
                        width: cbox.width

                        padding: 0
                        contentItem: ListView {
                            clip: true
                            implicitHeight: contentHeight
                            model: cbox.popup.visible ? cbox.delegateModel : []
                            currentIndex: cbox.highlightedIndex
                        }
                    }
                    delegate: ItemDelegate {
                        width: cbox.width
                        height: cbox.height-14
                        HoverHandler {
                            cursorShape: Qt.PointingHandCursor
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
                    onActivated: {
                        console.log(cbox.currentIndex)
                    }
                }
                RoundButton {
                    id: btnAddNew
                    text: qsTr("Add New")
                    implicitWidth: 150
                    radius: 5
                }
            }
            Rectangle {
                Layout.rowSpan: 2
                Layout.fillWidth: true
                height: 150
                radius: 5
                border.width: 0.5
                border.color: "lightgray"

                Label {
                    anchors.centerIn: parent
                    text: qsTr("Note: If needed then click for add new")
                    font {
                        family: "Roboto"
                        weight: Font.Bold
                    }
                    wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                    color: "red"
                }
            }
        }
    }

    RoundButton {
        id: btnNext
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.bottomMargin: 20
        anchors.rightMargin: 20
        text: qsTr("Next ->")
        implicitWidth: 100
        radius: 5
        enabled: cbox.currentIndex === 0 ? false : true
        onClicked: {
            myStackView.push(page4)
        }
    }
    RoundButton {
        id: btnPrevious
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 20
        anchors.right: btnNext.left
        text: qsTr("Previous")
        implicitWidth: 100
        radius: 5
        onClicked: {
            myStackView.pop();
        }
    }
}
