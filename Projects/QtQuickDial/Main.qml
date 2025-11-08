import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts


ApplicationWindow {
    width: 850
    height: 500
    visible: true
    title: qsTr("Qt Quick Dial")


    ColumnLayout {
        anchors.fill: parent

        ProgressBar {
            id: myProgressBar
            Layout.fillWidth: true
            from: myDial.from
            to: myDial.to
            value: myDial.value
        }
        Dial {
            id: myDial
            Layout.fillWidth: true
            Layout.fillHeight: true
            from: 0
            to: 100
            value: 50
        }
    }
}
