import QtQuick
import QtQuick.Window
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Controls.Material



ApplicationWindow {
    width: 850
    height: 500
    visible: true
    title: qsTr("Qt Quick TextArea")


    ColumnLayout {
        anchors.fill: parent
        ScrollView {
            Layout.fillWidth: true
            Layout.fillHeight: true
            TextArea {
                id: myText
                selectByKeyboard: true
                selectByMouse: true
                wrapMode: TextArea.WrapAtWordBoundaryOrAnywhere
                font.bold: true
                font.pointSize: 20
            }
        }
        Button {
            text: qsTr("Clear")
            Layout.fillWidth: true
            onClicked: {
                myText.clear();
            }
        }
    }
}
