import QtQuick
import QtQuick.Window
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Controls.Material



Window {
    width: 850
    height: 500
    visible: true
    title: qsTr("Qt Quick Slider & ProgressBar")


    ColumnLayout {
        anchors.fill: parent
        ProgressBar {
            id: myProgressBar
            Layout.fillWidth: true
            from: mySlider.to
            value: mySlider.value
        }
        Slider {
            id: mySlider
            Layout.fillWidth: true
            from: 0
            to: 100
            stepSize: 5
            value: 50
        }
        Text {
            id: myText
            text: mySlider.value
            Layout.fillWidth: true
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
            font.bold: true
            font.pointSize: 30
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
    }
}
