import QtQuick
import QtQuick.Window
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Controls.Material


ApplicationWindow {
    width: 950
    height: 500
    visible: true
    title: qsTr("Qt Quick Popup Login Page")

    font {
        family: "ubuntu"
        weight: Font.Bold
        pixelSize: 14
    }

    property bool isVisible: false

    Component.onCompleted: {
        loginPage.open()
    }

    function userLogin() {
        if (userName.text && userPassword) {
            if (userName.text === "admin" && userPassword.text === "admin") {
                console.log("Successfully login...")
                loginPage.close()
            } else {
                console.log("Username or password not valid")
            }
        } else {
            console.log("First enter username and password")
        }
    }

    Popup {
        id: loginPage
        modal: true
        focus: true
        width: 600
        height: 350
        anchors.centerIn: parent
        closePolicy: Popup.NoAutoClose

        onClosed: {
            isVisible = true // close popup window then show dashboard
            userName.text = "";
            userPassword.text = "";
        }

        background: Rectangle {
            radius: 10
        }

        ColumnLayout {
            anchors.centerIn: parent
            spacing: 10

            TextField {
                id: userName
                implicitWidth: 350
                implicitHeight: 35
                placeholderText: "Enter your username"
            }
            TextField {
                id: userPassword
                implicitWidth: 350
                implicitHeight: 35
                placeholderText: "Enter your password"
                echoMode: TextInput.Password
            }
            RoundButton {
                id: btnLogin
                text: qsTr("Login")
                implicitWidth: 100
                radius: 5
                focus: true

                onClicked: userLogin()
                Keys.onReturnPressed: userLogin() // enter key
                Keys.onEnterPressed: userLogin()  // numpad enter key
            }
        }
    }
    Rectangle {
        id: dashboard
        width: parent.width
        height: parent.height
        color: "green"
        anchors.centerIn: parent
        opacity: 0.0
        Text {
            text: qsTr("Welcome to dashboard")
            anchors.centerIn: parent
            font.pixelSize: 30
        }
        NumberAnimation on opacity {
            running: isVisible
            from: 0.0
            to: 1.0
            duration: 2000 // animation duration in milliseconds
        }
    }
}
