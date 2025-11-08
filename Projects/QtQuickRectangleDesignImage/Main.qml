import QtQuick
import QtQuick.Window
import QtQuick.Controls.Material


Window {
    width: 850
    height: 500
    visible: true
    title: qsTr("Qt Quick Rectangle Design Image")

    Rectangle {
        anchors.centerIn: parent

        width: 60
        height: 55

        border.width: 2
        border.color: "lightgray"

        radius: 5

        Image {
            id: analyzerIcon
            anchors.centerIn: parent
            source: "images/main.png"
            width: 50
            height: 45
        }
    }
}
