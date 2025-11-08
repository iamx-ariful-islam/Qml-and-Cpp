import QtQuick
import QtQuick.Window
import QtQuick.Layouts
import QtQuick.Controls.Material


Window {
    width: 850
    height: 500
    visible: true
    title: qsTr("Qt Quick Group Box")


    GroupBox {
        anchors.centerIn: parent

        label: CheckBox {
            id: checkBox
            checked: true
            text: qsTr("All in group")
        }
        ColumnLayout {
            anchors.fill: parent
            CheckBox { text: qsTr("E-mail") }
            CheckBox { text: qsTr("Calendar") }
            CheckBox { text: qsTr("Contacts") }
        }
    }
}
