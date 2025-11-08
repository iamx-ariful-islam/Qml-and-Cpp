import QtQuick
import QtQuick.Window
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Controls.Material


ApplicationWindow {
    visible: true
    width: 850
    height: 500
    title: qsTr("Qt Quick Alarms")


    ListView {
        id: alarmListView
        anchors.fill: parent
        clip: true
        model: ListModel {
            ListElement { time: "06:00"; date: "01.09.2018"; enabled: true }
            ListElement { time: "07:00"; date: "02.09.2018"; enabled: false }
            ListElement { time: "05:15"; date: "01.10.2018"; enabled: true }
            ListElement { time: "05:45"; date: "01.11.2018"; enabled: false }
        }

        delegate: Item {
            width: width
            height: 50
            RowLayout {
                anchors.verticalCenter: parent.verticalCenter
                spacing: 20

                Column {
                    Text {
                        text: model.time
                        font {family: "roboto"; weight: Font.Bold; pixelSize: 15 }
                        opacity: enableSwitch.checked ? 1 : 0.5
                    }
                    Text {
                        text: model.date
                        font {family: "roboto"; weight: Font.Bold; pixelSize: 11 }
                        opacity: 0.5
                    }
                }
                Switch {
                    id: enableSwitch
                    checked: model.enabled
                    // Break loop: only update model when user toggles
                    onToggled: model.enabled = enableSwitch.checked
                }
            }
        }
    }

    ColumnLayout {
        spacing: 10
        anchors.centerIn: parent

        // Days of the week for repetition
        Flow {
            Layout.fillWidth: true
            Repeater {
                model: ["M", "T", "W", "T", "F", "S", "S"]
                delegate: RoundButton {
                    text: modelData
                    checkable: true
                    checked: index < 5 // Example for weekdays being selected
                    width: 40
                    height: 40
                    Material.background: checked ? Material.accent : "transparent"
                }
            }
        }

        TextField {
            id: alarmDescriptionTextField
            placeholderText: qsTr("Enter description here")
            Layout.fillWidth: true
            implicitHeight: 32
            font {family: "roboto"; weight: Font.Bold; pixelSize: 12 }
        }

        RowLayout {
            spacing: 5

            Button {
                text: "DELETE"
                width: 100
                implicitHeight: 42
                font {family: "roboto"; weight: Font.Bold; pixelSize: 11 }
                onClicked: {
                    alarmListView.model.remove(alarmListView.currentIndex)
                }
            }
            RoundButton {
                text: "+"
                width: 40
                height: 40
                font {family: "roboto"; weight: Font.Bold; pixelSize: 12 }
                onClicked: alarmDialog.open()
            }
        }
    }

    AlarmDialog {
        id: alarmDialog
    }
}
