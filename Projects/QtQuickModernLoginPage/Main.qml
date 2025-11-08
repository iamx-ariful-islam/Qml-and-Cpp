import QtQuick
import QtQuick.Window
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Controls.Material


Window {
    width: 1050
    height: 550
    visible: true
    title: qsTr("Qt Quick Modern Login Page")

    Rectangle {
        width: parent.width
        height: 90
        color: "lightgray"
        anchors.top: parent.top
    }

    Rectangle {
        width: parent.width * 0.8
        height: parent.height - 130
        anchors.centerIn: parent
        radius: 10
        color: "whitesmoke"

        ColumnLayout {
            x: 50
            y: 40
            spacing: 0

            Text {
                id: title
                text: qsTr("Sign In")
                font {
                    family: "ubuntu"
                    weight: Font.Bold
                    pixelSize: 28
                }
            }
            Text {
                id: subtitle
                text: qsTr("Authentication System")
                font {
                    family: "ubuntu"
                    weight: Font.Bold
                    pixelSize: 16
                }
            }
        }

        ColumnLayout {
            anchors.centerIn: parent
            spacing: 0

            TextField {
                id: username
                implicitWidth: 250
                implicitHeight: 42
                font {
                    family: "ubuntu"
                    weight: Font.Bold
                    pixelSize: 14
                }
                placeholderText: "Username"
            }
            TextField {
                id: password
                implicitWidth: 250
                implicitHeight: 42
                font {
                    family: "ubuntu"
                    weight: Font.Bold
                    pixelSize: 14
                }
                echoMode: TextField.Password
                placeholderText: "Password"
            }
            Button {
                id: btnSignIn
                implicitWidth: 250
                implicitHeight: 42
                text: "Log In"
                font {
                    family: "ubuntu"
                    weight: Font.Bold
                    pixelSize: 14
                }
                onClicked: {
                    console.log("Username:", username.text, "Password:", password.text)
                }
            }
        }
        Rectangle {
            width: 40
            height: parent.height - 200
            y: parent.height - height - 85
            color: "lightgray"
            radius: 5
        }

        RowLayout {
            x: 50
            y: parent.height - height - 5
            spacing: 0

            Text {
                text: qsTr("Try if not have?")
                font {
                    family: "ubuntu"
                    weight: Font.Bold
                    pixelSize: 14
                }
            }
            Button {
                id: btnSignUp
                text: "Log In"
                opacity: 0.5
                font {
                    family: "ubuntu"
                    weight: Font.Bold
                    pixelSize: 16
                }
                background: Rectangle {
                    color: "transparent"

                    MouseArea {
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        hoverEnabled: true

                        onEntered: btnSignUp.opacity = 1
                        onExited: btnSignUp.opacity = 0.5
                    }
                }
                onClicked: {
                    console.log("Open sign up page")
                }
            }
        }
    }
}
