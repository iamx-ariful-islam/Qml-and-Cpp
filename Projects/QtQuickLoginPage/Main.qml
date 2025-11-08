import QtQuick
import QtQuick.Window
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Controls.Material


Window {
    width: 850
    height: 500
    visible: true
    title: qsTr("Qt Quick Login Page")

    ColumnLayout {
        anchors.centerIn: parent
        spacing: 0

        TextField {
            id: username
            implicitWidth: 250
            implicitHeight: 42
            placeholderText: "Username"
            font {
                family: "ubuntu"
                weight: Font.Bold
                pixelSize: 14
            }
        }
        TextField {
            id: password
            implicitWidth: 250
            implicitHeight: 42
            placeholderText: "Password"
            font {
                family: "ubuntu"
                weight: Font.Bold
                pixelSize: 14
            }
        }
        Button {
            id: login
            implicitWidth: 250
            implicitHeight: 42
            text: "Login"
            font {
                family: "ubuntu"
                weight: Font.Bold
                pixelSize: 14
            }
        }
    }
}
