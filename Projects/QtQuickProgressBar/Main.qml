import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Controls.Material


Window {
    width: 850
    height: 500
    visible: true
    title: qsTr("Qt Quick ProgressBar")


    ProgressBar {
        id: progressBar
        anchors.centerIn: parent
        width: 350
        from: 0
        to: 100

        Behavior on value {
            NumberAnimation {
                target: object
                property: "width"
                duration: 250
                easing.type: Easing.InOutQuad
            }
        }
    }
}
