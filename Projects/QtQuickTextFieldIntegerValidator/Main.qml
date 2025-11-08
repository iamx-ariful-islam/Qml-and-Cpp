import QtQuick
import QtQuick.Window
import QtQuick.Layouts
import QtQuick.Controls.Material


ApplicationWindow {
    width: 850
    height: 500
    visible: true
    title: qsTr("Qt Quick Text Field Integer Validator")

    font {
        weight: Font.Bold
        family: "ubuntu"
        pixelSize: 12
    }

    ColumnLayout {
        anchors.centerIn: parent
        TextField {
            id: txt
            implicitHeight: 35
            implicitWidth: 250
            placeholderText: "Enter integer value without Limit"
            validator: IntValidator {} // validate with integer value without limit
        }

        TextField {
            id: txt2
            implicitHeight: 35
            implicitWidth: 250
            placeholderText: "Enter integer value with Limit"
            validator: IntValidator {bottom: 0; top: 999 } // validate with integer value with limit min=0 and max=999
        }
    }
}
