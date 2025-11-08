import QtQuick
import QtQuick.Window
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Controls.Material


ApplicationWindow {
    width: 850
    height: 500
    visible: true
    title: qsTr("Qt Quick SpinBox")


    ColumnLayout {
        anchors.fill: parent

        ProgressBar {
            id: myProgressBar
            from: mySpin.from
            to: mySpin.to
            value: mySpin.value
            Layout.fillWidth: true
        }

        SpinBox {
            id: mySpin
            from: 0
            to: 100
            stepSize: 20
            Layout.fillWidth: true
            height: 50
            font.bold: true
            font.pointSize: 30
        }
    }
}
