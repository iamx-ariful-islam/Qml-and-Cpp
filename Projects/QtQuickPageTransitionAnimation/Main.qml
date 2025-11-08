import QtQuick
import QtQuick.Window
import QtQuick.Controls.Material


ApplicationWindow {
    width: 850
    height: 500
    visible: true
    title: qsTr("Qt Quick Page Transition Animation")


    Rectangle {
        id: regPage
        anchors.fill: parent
        color: "blue"
        opacity: 1.0

        Behavior on opacity {
            NumberAnimation {
                duration: 3000 // fade out duration in milliseconds
            }
        }
    }

    Rectangle {
        id: mainPage
        anchors.fill: parent
        color: "green"
        opacity: 0.0

        Behavior on opacity {
            NumberAnimation {
                duration: 3000 // fade in duration in milliseconds
            }
        }
    }

    Timer {
        id: timeCounter
        interval: 1000 // wait 1000 milliseconds or 1 second
        running: false
        repeat: false
        onTriggered: {
            timeCounter.stop()
            regPage.opacity = 0
            mainPage.opacity = 1
        }
    }

    Component.onCompleted: {
        timeCounter.start() // just wait 1 second (optional)
        // regPage.opacity = 0
        // mainPage.opacity = 1
    }
}
