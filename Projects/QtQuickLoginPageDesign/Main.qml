import QtQuick
import QtQuick.Window
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Controls.Material


ApplicationWindow {
    width: 980
    height: 550
    visible: true
    title: qsTr("Qt Quick Login Page Design")


    Timer {
        id: timeCounter
        interval: 1000 // wait 1000 milliseconds or 1 seconds
        running: false
        repeat: false
        onTriggered:{
            timeCounter.stop()
            regPage.opacity  = 0
            versionPage.opacity = 1
            regPage.visible  = false
            versionPage.visible = true
        }
    }

    Popup {
        id: configPage
        anchors.centerIn: parent
        width: 550
        height: 450

        Rectangle {
            anchors.fill: parent

            Text {
                text: "Config page"
                font {
                    family: "Roboto"
                    weight: Font.Bold
                    pixelSize: 22
                }
            }
        }
    }

    Rectangle {
        id: versionPage
        anchors.fill: parent
        opacity: 0.0

        Behavior on opacity {
            NumberAnimation {
                duration: 2000 // Fade in duration in milliseconds
            }
        }
        Label {
            anchors.centerIn: parent
            font {
                family: "Roboto"
                weight: Font.Bold
                pixelSize: 150
            }
            text: qsTr("v23.1")
            color: "whitesmoke"
        }
        ColumnLayout {
            anchors.centerIn: parent
            spacing: 0

            Text {
                text: qsTr("Welcome")
                font {
                    family: "Roboto"
                    weight: Font.Bold
                    pixelSize: 14
                }
            }
            Text {
                text: qsTr("eSmart Analyzer LIS")
                font {
                    family: "Roboto"
                    weight: Font.Bold
                    pixelSize: 22
                }
            }
        }

        Button {
            id: btnConfig
            x: parent.width - width - 15
            y: parent.height - height - 10
            text: "Configure ->"
            font.family: "ubuntu"
            font.bold: true
            font.pixelSize: 14

            background: Rectangle {
                implicitWidth: 80
                implicitHeight: 32
                radius: 5
                color: "whitesmoke"

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor

                    onEntered: parent.border.color = "lightgray"
                    onExited: parent.border.color = "transparent"
                }
            }
            onClicked: {
                console.log("Configure button clicked")
            }
        }
    }

    Rectangle {
        id: regPage
        anchors.fill: parent
        color: "white"
        opacity: 1.0

        Behavior on opacity {
            NumberAnimation {
                duration: 2000 // Fade out duration in milliseconds
            }
        }

        ColumnLayout {
            y: 30
            anchors.right: parent.right
            anchors.rightMargin: 20
            spacing: 5


            Rectangle {
                Layout.alignment: Qt.AlignRight
                width: 70
                height: 65

                Image {
                    source: "images/lock.ico"
                    width: 70
                    height: 65
                    opacity: 0.5
                }
            }

            RowLayout {
                spacing: 5

                Rectangle {
                    implicitWidth: 165
                    implicitHeight: 30

                    Text {
                        id: titleText
                        anchors.verticalCenter: parent.verticalCenter
                        text: 'Security Key & Password'
                        font {
                            family: "Roboto"
                            weight: Font.Bold
                            pixelSize: 12
                        }
                    }
                }
                TextField {
                    id: passwordKey
                    implicitWidth: 210
                    implicitHeight: 30
                    font {
                        family: "Roboto"
                        weight: Font.Bold
                        pixelSize: 12
                    }
                    echoMode: TextField.Password
                    onFocusChanged: {
                        titleText.text  = "Enter Password Key"
                        titleText.color = Material.accentColor
                    }

                    function passwordFunc() {
                        if (passwordKey.text && passwordKey.length >= 8){
                            securityKey.focus = true
                            messageBox.text   = ""
                        } else {
                            messageBox.text  = "Please enter valid password key length"
                            messageBox.color = "red"
                        }
                    }
                    Keys.onReturnPressed: passwordKey.passwordFunc()
                    Keys.onEnterPressed: passwordKey.passwordFunc()
                }
            }
            TextField {
                id: securityKey
                implicitWidth: 380
                implicitHeight: 30
                font {
                    family: "Roboto"
                    weight: Font.Bold
                    pixelSize: 12
                }
                echoMode: TextField.Password
                onFocusChanged: {
                    titleText.text  = "Enter Security Key"
                    titleText.color = Material.accentColor
                }

                function registerFunc() {
                    if (securityKey.text && securityKey.length >= 25){
                        // read info from database and check
                        if (securityKey.text && passwordKey.text){
                            messageBox.text  = "Successfully registered"
                            messageBox.color = "green"
                            timeCounter.start()

                        } else {
                            messageBox.text  = "Wrong password or security key"
                            messageBox.color = "red"
                        }
                    } else {
                        messageBox.text  = "Please enter valid security key length"
                        messageBox.color = "red"
                    }
                }
                Keys.onReturnPressed: securityKey.registerFunc()
                Keys.onEnterPressed: securityKey.registerFunc()
            }
            Label {
                id: messageBox
                font {
                    family: "Roboto"
                    weight: Font.Bold
                    pixelSize: 12
                }
            }
        }
        Rectangle {
            anchors.bottom: parent.bottom
            width: parent.width

            Text {
                x: 10
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 5
                text: "<p>Copyright (c) 2023-2024 All rights reserved | Jonaki Soft Network</p>"
                font {
                    family: "Roboto"
                    weight: Font.Bold
                }
                textFormat: Text.RichText
                color: "gray"
            }
        }
        Image {
            x: parent.width - width - 30
            y: parent.height - height - 30
            source: "images/main.ico"
            opacity: 0.1
        }

        Text {
            x: 20
            y: 95
            text: "<h3><u>Attention! Please!</u></h3><ul><li>Register for new user registration</li><li>Config for registration process</li><li>Don't enter without product key</li></ul><br/><h3>If any query then contact us: +880 XXXXXXXXXX</h3>"
            font {
                family: "Roboto"
                weight: Font.Bold
            }
            textFormat: Text.RichText
            color: "gray"
        }

        Text {
            x: parent.width - width - 200
            y: parent.height - height - 110
            text: qsTr("eSmart Analyzer LIS")
            font {
                family: "ubuntu"
                weight: Font.Bold
                pixelSize: 30
            }
            opacity: 0.1
        }
        Text {
            x: parent.width - width - 200
            y: parent.height - height - 90
            text: qsTr("Version v24.1, 25 January 2024")
            font {
                family: "ubuntu"
                weight: Font.Bold
                pixelSize: 16
            }
            opacity: 0.1
        }
    }
}
