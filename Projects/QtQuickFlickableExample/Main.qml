import QtQuick
import QtQuick.Window
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Controls.Material


Window {
    width: 850
    height: 500
    visible: true
    title: qsTr("Qt Quick Flickable Example")


    Flickable {
        anchors.fill: parent
        contentWidth: 100
        contentHeight: 100

        onFlickStarted: {
            rect.color = "green"
        }
        onFlickEnded: {
            rect.color = "red"
        }

        Rectangle {
            id: rect
            width: 100
            height: 95
            radius: 5
            color: "red"
        }
    }
}
