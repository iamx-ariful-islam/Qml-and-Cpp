import QtQuick
import QtQuick.Window
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Controls.Material


Window {
    width: 850
    height: 500
    visible: true
    title: qsTr("Qt Quick Simple Button")


    Rectangle {
        width: 100
        height: 30
        color: "red"
        radius: 5
        anchors.centerIn: parent

        Text {
            id: btnText
            text: qsTr("Simple Button")
            anchors.centerIn: parent
        }
        MouseArea {
            anchors.fill: parent

            onClicked: {
                btnText.text = qsTr("Clicked")
                btnText.color = 'black'
            }
        }
    }
}
