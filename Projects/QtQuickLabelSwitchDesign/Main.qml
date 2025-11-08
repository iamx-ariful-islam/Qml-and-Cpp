import QtQuick
import QtQuick.Window
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Controls.Material


Window {
    width: 950
    height: 550
    visible: true
    title: qsTr("Qt Quick Label Switch Design")


    Rectangle {
        anchors.centerIn: parent
        width: parent.width * 0.8
        height: parent.height * 0.7
        clip: true

        ListView {
            id: listView
            width: parent.width * 0.8
            height: parent.height
            anchors.horizontalCenter: parent.horizontalCenter

            model: [
                ["Show Terminal Log", "This is the first issue", false],
                ["Data Received Notification", "This issue is the second issue", true],
                ["Update Notification", "When update available then show the notification", false]
            ]
            delegate: contactDelegate
        }

        Component {
            id: contactDelegate
            Item {
                width: listView.width
                height: 50

                RowLayout {
                    spacing: 10
                    anchors.fill: parent

                    ColumnLayout {
                        spacing: 0
                        Layout.fillWidth: true

                        Label {
                            text: '<b>' + modelData[0] + '</b>'
                            font {
                                family: "ubuntu"
                                weight: Font.Bold
                                pixelSize: 14
                            }
                        }
                        Label {
                            text: modelData[1]
                            font {
                                family: "ubuntu"
                                weight: Font.Bold
                                pixelSize: 11
                            }
                            color: "gray"
                        }
                    }

                    CustomSwitch {
                        id: mySwitch
                        Layout.alignment: Qt.AlignRight
                        switchStatus: modelData[2]
                        onClicked: {
                            if (mySwitch.checked) {
                                console.log("Switch is ON", index)
                            } else {
                                console.log("Switch is OFF", index)
                            }
                        }
                    }
                }

                Rectangle {
                    width: listView.width
                    height: 1
                    color: index === 0 ? "transparent" : "lightgray"
                }
            }
        }
    }
}
