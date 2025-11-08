import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Controls.Material


Window {
    width: 850
    height: 500
    visible: true
    title: qsTr("Qt Quick Number Generator")

    Column {
        id: column
        width: 200
        anchors.centerIn: parent
        spacing: 25

        Label {
            id: label
            text: qsTr("Status ")
            font.pointSize: 20
            anchors.horizontalCenter: parent.horizontalCenter
        }
        ComboBox {
            id: combobox
            anchors.horizontalCenter: parent.horizontalCenter
            model: ListModel {
                id: listModel
                ListElement {text: 1}
                ListElement {text: 2}
                ListElement {text: 3}
                ListElement {text: 4}
                ListElement {text: 5}
                ListElement {text: 6}
                ListElement {text: 7}
                ListElement {text: 8}
                ListElement {text: 9}
            }
        }
        Button {
            id: button
            text: qsTr("Calculate")
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: {
                label.text += combobox.currentValue
            }
        }
    }
}
