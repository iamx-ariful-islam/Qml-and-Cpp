import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Controls.Material


Window {
    width: 850
    height: 500
    visible: true
    title: qsTr("Qt Quick Custom CheckBox")


    CheckBox {
        id: customCheckbox
        anchors.centerIn: parent

        property color checkedColor: "#0ACF97"

        text: qsTr("CheckBox")

        font {
            family: "Roboto"
            weight: Font.Bold
            pixelSize: 15
        }

        indicator: Rectangle {
            x: customCheckbox.leftPadding
            anchors.verticalCenter: parent.verticalCenter
            width: 26
            height: width
            antialiasing: true

            radius: 5
            border.width: 2
            border.color: customCheckbox.checkedColor

            Rectangle {
                anchors.centerIn: parent
                width: parent.width * 0.55
                height: width
                antialiasing: true
                radius: parent.radius * 0.7
                color: customCheckbox.checkedColor
                visible: customCheckbox.checked
            }
        }
    }
}
