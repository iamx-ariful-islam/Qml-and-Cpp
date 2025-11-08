import QtQuick
import QtQuick.Window
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Controls.Material

import com.jonaki.password 0.1

ApplicationWindow {
    width: 950
    height: 550
    visible: true
    title: qsTr("Qt Quick Password Generator")

    Password{
        id: passwordGenerator
    }

    Rectangle {
        id: passwordBackground
        width: parent.width * 0.95
        height: 80
        radius: 10
        color: "lightblue"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 25

        RowLayout {
            id: rowLayout
            anchors.fill: parent

            Text {
                id: text1
                text: passwordGenerator.password
                horizontalAlignment: Text.AlignHCenter
                fontSizeMode: Text.Fit
                font {
                    family: "ubuntu"
                    weight: Font.Bold
                    pixelSize: 48
                }
                Layout.fillWidth: true
            }

            RoundButton {
                id: button1
                implicitWidth: 85
                implicitHeight: 70
                Layout.alignment: Qt.AlignRight
                Layout.rightMargin: 5
                radius: 10
                text: qsTr("Copy")
                font {
                    family: "ubuntu"
                    weight: Font.Bold
                    pixelSize: 12
                }
                icon.color: "#000000"
                display: AbstractButton.TextUnderIcon
                icon.source: "copy.png"
                HoverHandler {
                    cursorShape: Qt.PointingHandCursor
                }
            }
        }
    }

    Rectangle {
        id: controlsBackground
        color: "lightblue"
        width: parent.width * 0.95
        height: parent.height - passwordBackground.height - 70
        anchors.top: passwordBackground.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: 20
        radius: 10

        ColumnLayout {
            id: columnLayout
            anchors.fill: parent
            anchors.margins: 20
            spacing: 10

            RowLayout {
                id: rowLayout1

                Text {
                    id: text2
                    text: qsTr("Character Length")
                    font {
                        family: "ubuntu"
                        weight: Font.Bold
                        pixelSize: 24
                    }
                    Layout.fillWidth: true
                }

                Text {
                    id: characterLengthText
                    text: passwordGenerator.passwordLength
                    font {
                        family: "ubuntu"
                        weight: Font.Bold
                        pixelSize: 24
                    }
                    Layout.alignment: Qt.AlignRight
                }
            }

            Slider {
                id: passwordLengthSlider
                Layout.fillHeight: true
                Layout.fillWidth: true
                stepSize: 1
                to: 20
                from: 5
                value: 5
                onValueChanged: {
                    passwordGenerator.passwordLength = passwordLengthSlider.value
                }
            }

            CheckBox {
                id: upperCase
                text: qsTr("Use Uppercase Characters")
                font {
                    family: "ubuntu"
                    weight: Font.Bold
                    pixelSize: 18
                }
                Layout.fillWidth: true
                onCheckedChanged: {
                    passwordGenerator.useUpperCase = upperCase.checked
                }
            }

            CheckBox {
                id: lowerCase
                text: qsTr("Use Lowercase Characters")
                font {
                    family: "ubuntu"
                    weight: Font.Bold
                    pixelSize: 18
                }
                Layout.fillWidth: true
                onCheckedChanged: {
                    passwordGenerator.useLowerCase = lowerCase.checked
                }
            }

            CheckBox {
                id: numbers
                text: qsTr("Use Numbers")
                font {
                    family: "ubuntu"
                    weight: Font.Bold
                    pixelSize: 18
                }
                Layout.fillWidth: true
                onCheckedChanged: {
                    passwordGenerator.useNumbers = numbers.checked
                }
            }

            CheckBox {
                id: specialCharacters
                text: qsTr("Use Special Characters")
                font {
                    family: "ubuntu"
                    weight: Font.Bold
                    pixelSize: 18
                }
                Layout.fillWidth: true
                onCheckedChanged: {
                    passwordGenerator.useSpecialCharacters = specialCharacters.checked
                }
            }
            RoundButton {
                id: button
                radius: 5
                implicitHeight: 65
                text: qsTr("Generate Password")
                font {
                    family: "ubuntu"
                    weight: Font.Bold
                    pixelSize: 18
                }
                Layout.fillWidth: true
                onClicked: {
                    passwordGenerator.makeAlphabet();
                }
                HoverHandler {
                    cursorShape: Qt.PointingHandCursor
                }
            }
        }
    }
}
