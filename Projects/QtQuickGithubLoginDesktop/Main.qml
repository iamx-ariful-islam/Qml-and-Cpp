import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Controls.Material


ApplicationWindow{
    id: window
    width: 400
    height: 580
    visible: true
    title: qsTr("Qt Quick Github Login Desktop")

    // set flags
    flags: Qt.WindowCloseButtonHint | Qt.WindowMinimizeButtonHint | Qt.CustomizeWindowHint | Qt.MSWindowsFixedSizeDialogHint | Qt.Dialog | Qt.WindowTitleHint

    // set material style
    Material.theme: Material.Dark
    Material.accent: Material.LightGrey

    font {
        weight: Font.Bold
        family: "Roboto"
    }


    // create top bar
    Rectangle {
        id: topbar
        height: 40
        color: Material.color(Material.Blue)
        anchors {
            left: parent.left
            right: parent.right
            top: parent.top
            margins: 10
        }
        radius: 10

        Text {
            text: qsTr("Login Page")
            anchors.verticalCenter: parent.verticalCenter
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            color: "#ffffff"
            anchors.horizontalCenter: parent.horizontalCenter
            font.pointSize: 10
        }
    }

    // image import
    Image {
        id: image
        width: 300
        height: 120
        source: "images/logo.png"

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: topbar.bottom
        anchors.topMargin: 60
    }

    // text field username
    TextField{
        id: username
        width: 300
        text: qsTr("")
        selectByMouse: true
        placeholderText: qsTr("Enter your email")
        verticalAlignment: TextField.AlignVCenter
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: image.bottom
        anchors.topMargin: 60
    }

    TextField{
        id: password
        width: 300
        text: qsTr("")
        selectByMouse: true
        placeholderText: qsTr("Enter your password")
        verticalAlignment: TextField.AlignVCenter
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: username.bottom
        anchors.topMargin: 10
        echoMode: TextField.Password
    }

    CheckBox {
        id: checkbox
        text: qsTr("Remember me")
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: password.bottom
        anchors.topMargin: 10
    }

    Button {
        id: button
        text: qsTr("Enter")
        width: 300
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: checkbox.bottom
        anchors.topMargin: 10
        onClicked: {
            print("Enter clicked")
        }
    }
}
