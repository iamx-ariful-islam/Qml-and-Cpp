import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Controls.Material


Item {
    property alias textField1: textField1
    property alias button1: button1

    RowLayout {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: 20
        anchors.top: parent.top

        TextField {
            id: textField1
            implicitWidth: 350
            implicitHeight: 35
            placeholderText: qsTr("Enter you name")
            font.family: "Roboto"
            font.bold: true
        }

        RoundButton {
            id: button1
            implicitWidth: 120
            implicitHeight: 42
            text: qsTr("Press Me")
            font.family: "Roboto"
            font.bold: true
            radius: 5
        }
    }
}
