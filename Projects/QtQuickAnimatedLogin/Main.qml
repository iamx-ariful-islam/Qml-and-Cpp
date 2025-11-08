import QtQuick
import QtQuick.Window
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Controls.Material


Window {
    width: 850
    height: 500
    visible: true
    title: qsTr("Qt Quick Animated Login")

    color: "lightblue"

    LoginStack {
        id: loginPage
        width: 500
        height: 40
        anchors.centerIn: parent
    }

    Text {
        anchors.top: loginPage.bottom
        anchors.left: loginPage.left
        anchors.topMargin: 10
        text: "<p>JONAKI SOFT NETWORK AUTHORIZE <span style=\" color: red; \">WARNING</span><br/>Attention! Please don't enter without permission. It's used only for admin</p>"
        font {
            family: "ubuntu"
            weight: Font.Bold
        }
        textFormat: Text.RichText
        opacity: 0.3
    }
}
