import QtQuick
import QtQuick.Window
import QtQuick.Controls.Material


Window {
    width: 850
    height: 500
    visible: true
    title: qsTr("Qt Quick Image Opacity")

    Image {
        anchors.centerIn: parent
        opacity: 0.3
        source: "images/main.png"
    }
}
