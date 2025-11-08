import QtQuick
import QtQuick.Window
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Controls.Material


Window {
    width: 850
    height: 500
    visible: true
    title: qsTr("Qt Quick Digital Clock")


    Column {
        anchors.centerIn: parent

        Label {
            id: currentTime
            font {
                weight: Font.Bold //Font.Light
                pixelSize: 30
                family: "Roboto"
            }
        }
        Label {
            id: currentDate
            font {
                weight: Font.Bold //Font.Light
                pixelSize: 15
                family: "Roboto"
            }
        }

        Timer {
            interval: 500
            running: true
            repeat: true
            onTriggered: {
                var date = new Date()
                currentTime.text = date.toLocaleTimeString(Qt.locale(), "hh:mm:ssap")
                currentDate.text = date.toLocaleDateString(Qt.locale(), "dddd MMMM dd, yyyy")
            }
        }
    }
}
