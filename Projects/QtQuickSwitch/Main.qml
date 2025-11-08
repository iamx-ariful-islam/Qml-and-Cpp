import QtQuick
import QtQuick.Window
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Controls.Material


ApplicationWindow {
    width: 850
    height: 500
    visible: true
    title: qsTr("Qt Quick Switch")


    ColumnLayout {
        anchors.fill: parent
        Repeater {
            model: ListModel {
                ListElement {
                    myText: "Wi-Fi"
                }
                ListElement {
                    myText: "Bluetooth"
                }
                ListElement {
                    myText: "Others"
                }
            }
            RowLayout {
                Layout.fillWidth: true
                Layout.fillHeight: true
                Label {
                    text: myText + " = " + mySwitch.position
                    font.bold: true
                    font.pointSize: 20
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
                Switch {
                    id: mySwitch
                    text: myText
                    font.bold: true
                    font.pointSize: 20
                }
            }
        }
    }
}
