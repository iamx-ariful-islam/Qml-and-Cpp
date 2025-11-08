import QtQuick
import QtQuick.Window
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Controls.Material


Window {
    width: 850
    height: 500
    visible: true
    title: qsTr("Qt Quick Timer Animation")

    Timer {
        id: timer
        onTriggered: tf.counter--; // 2
        interval: 1000
        repeat: true
    }
    // this is invisible rectangle
    Rectangle {
        width: 100
        height: 100
        focus: true
        Keys.onPressed: {
            if (Qt.Key_Up) {
                rect.visible = true
                timer.start()
            } // 1
        }
    }
    Rectangle{
        id: rect
        anchors.centerIn: parent
        visible: false
        color:  "green"
        width: 300
        height: 250
        radius: 5
        Text {
            id: tf
            anchors.centerIn: parent
            font {
                family: "Roboto"
                weight: Font.Bold
                pixelSize: 150
            }

            property int counter: 5
            onCounterChanged: {
                if(counter == 0) {
                    rect.visible = false
                    timer.stop()
                    counter = 5
                } // 3
            }
            text: counter
        }
    }
}
