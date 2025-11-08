import QtQuick
import QtQuick.Window
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Controls.Material


Window {
    width: 1150
    height: 650
    visible: true
    title: qsTr("Qt Quick Version Animation")


    function formatText(inputText) {
        var formattedText = ""
        for (var i = 0; i < inputText.length; i++) {
            formattedText += inputText.charAt(i).toUpperCase() + " "
        }
        return formattedText.trim()
    }

    Rectangle {
        width: parent.width * 0.9
        height: parent.height * 0.8
        anchors.centerIn: parent
        border.width: 1
        radius: 10

        ColumnLayout {
            anchors.centerIn: parent
            spacing: 0

            Image {
                id: companyLogo
                Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
                source: "icons/icon.png"
                sourceSize.width: 80
                sourceSize.height: 80
                fillMode: Image.PreserveAspectFit
            }

            Text {
                id: companyName
                text: formatText("Jonaki Soft Network")
                font {
                    family: "ubuntu"
                    weight: Font.Bold
                    pixelSize: 20
                }
                Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
            }

            Text {
                id: mottoVersion
                text: formatText("Together Forever") + " | 2024"
                font {
                    family: "ubuntu"
                    weight: Font.Bold
                    pixelSize: 15
                }
                Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
            }

            SequentialAnimation on opacity {
                loops: Animation.Infinite
                running: true

                NumberAnimation {
                    to: 0
                    duration: 3000
                }

                PauseAnimation {
                    duration: 3000
                }

                NumberAnimation {
                    to: 1
                    duration: 3000
                }
            }
        }

        Rectangle {
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottomMargin: 5
            width: parent.width - 30
            height: 70
            radius: 10

            Text {
                text: "<p>JONAKI SOFT NETWORK AUTHORIZE LICENSE<br/>Version v2024.1, 25 January 2024</p><p>Copyright (c) 2023-2024 All rights reserved | <span style=\" color:#55aaff; \">Jonaki Soft Network</span></p>"
                anchors.fill: parent
                font {
                    family: "ubuntu"
                    weight: Font.Bold
                    pixelSize: 13
                }
                textFormat: Text.RichText
            }

            Image {
                id: companyLogo2
                anchors.right: parent.right
                anchors.verticalCenter: parent.verticalCenter
                source: "icons/icon.png"
                sourceSize.width: 80
                sourceSize.height: 80
                fillMode: Image.PreserveAspectFit
            }
        }
    }
}
