import QtQuick
import QtQuick.Window
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Controls.Material


Window {
    width: 950
    height: 500
    visible: true
    title: qsTr("Qt Quick Dashboard Image Label Design")


    Rectangle {
        anchors.centerIn: parent
        width: parent.width * 0.8
        height: parent.height * 0.55
        radius: 10
        color: "whitesmoke"

        Rectangle {
            id: topRectangle
            anchors.top: parent.top
            width: parent.width
            height: 50
            radius: 10
            color: "whitesmoke"

            RowLayout {
                anchors.centerIn: parent
                spacing: 5

                Label {
                    text: qsTr("Model Number")
                    font {
                        family: "ubuntu"
                        weight: Font.Bold
                        pixelSize: 14
                    }
                    color: "gray"
                }

                Label {
                    text: qsTr("REGA01024")
                    font {
                        family: "ubuntu"
                        weight: Font.Bold
                        pixelSize: 14
                    }
                }

                Rectangle {
                    width: 20
                }

                Label {
                    text: qsTr("Registration Number")
                    font {
                        family: "ubuntu"
                        weight: Font.Bold
                        pixelSize: 14
                    }
                    color: "gray"
                }

                Label {
                    text: qsTr("AK24 202401015")
                    font {
                        family: "ubuntu"
                        weight: Font.Bold
                        pixelSize: 14
                    }
                }

                Rectangle {
                    width: 20
                }

                Label {
                    text: qsTr("Version Number")
                    font {
                        family: "ubuntu"
                        weight: Font.Bold
                        pixelSize: 14
                    }
                    color: "gray"
                }

                Label {
                    text: qsTr("A2024B0123")
                    font {
                        family: "ubuntu"
                        weight: Font.Bold
                        pixelSize: 14
                    }
                }
            }
        }

        Rectangle {
            width: parent.width
            height: parent.height - topRectangle.height // - 5
            anchors.top: topRectangle.bottom
            color: "whitesmoke"
            radius: 10

            ColumnLayout {
                anchors.centerIn: parent
                spacing: 10

                Label {
                    text: "Documents"
                    font {
                        family: "ubuntu"
                        weight: Font.Bold
                        pixelSize: 14
                    }
                }
                RowLayout {
                    spacing: 25

                    Image {
                        source: "images/registration.jpg"
                        fillMode: Image.PreserveAspectCrop
                        sourceSize.width: width * 0.6
                        sourceSize.height: height * 0.6
                        clip: true
                    }
                    Image {
                        source: "images/bank_card.png"
                        fillMode: Image.PreserveAspectCrop
                        sourceSize.width: width * 0.65
                        sourceSize.height: height * 0.65
                        clip: true
                    }
                    Image {
                        source: "images/registration.jpg"
                        fillMode: Image.PreserveAspectCrop
                        sourceSize.width: width * 0.6
                        sourceSize.height: height * 0.6
                        clip: true
                    }
                }
            }
        }
    }
}
