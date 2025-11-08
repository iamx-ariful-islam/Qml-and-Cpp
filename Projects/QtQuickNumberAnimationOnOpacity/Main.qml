import QtQuick
import QtQuick.Window
import QtQuick.Controls.Material


Window {
    width: 850
    height: 500
    visible: true
    title: qsTr("Qt Quick Number Animation On Opacity")


    Rectangle {
        id: firstRectangle
        anchors.centerIn: parent
        width: 400
        height: 350
        color: "blue"
        radius: 5

        // initial state
        NumberAnimation on opacity {
            running: true
            from: 1.0
            to: 0.0
            duration: 3000 // animation duration in milliseconds
        }
    }

    Rectangle {
        id: secondRectangle
        anchors.centerIn: parent
        width: 400
        height: 350
        color: "red"
        radius: 5
        opacity: 0

        // initial state
        NumberAnimation on opacity {
            running: true
            from: 0.0
            to: 1.0
            duration: 3000 // animation duration in milliseconds
            loops: 1       // number of loops (1 for playing once)
            onStopped: {
                // actions to perform when the animation is complete
                console.log("Animation complete!")
            }
        }
    }
}
