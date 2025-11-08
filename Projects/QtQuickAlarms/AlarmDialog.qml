import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Controls.Material

Dialog {
    id: alarmDialog
    modal: true
    width: 350
    height: 320
    anchors.centerIn: parent
    background: Rectangle { radius: 10 }

    function formatText(count, modelData) {
        var data = count === 12 ? modelData + 1 : modelData;
        return data.toString().length < 2 ? "0" + data : data;
    }
    Component {
        id: delegateComponent

        Label {
            text: formatText(Tumbler.tumbler.count, modelData)
            opacity: 1.0 - Math.abs(Tumbler.displacement) / (Tumbler.tumbler.visibleItemCount / 2)
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font { family: "roboto"; pixelSize: 20; bold: true }
        }
    }

    contentItem: ColumnLayout {
        spacing: 10
        anchors.fill: parent
        anchors.margins: 10

        RowLayout {
            spacing: 5
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignTop | Qt.AlignVCenter

            ColumnLayout {
                spacing: 0

                Text {
                    id: title
                    text: "08:25pm"
                    font { family: "roboto"; pixelSize: 15; bold: true }
                }
                Text {
                    id: subTitle
                    text: "Daily | Alarm in 7 hours 10 minutes"
                    font { family: "roboto"; pixelSize: 11; bold: true }
                    opacity: 0.5
                }
            }
            Item { Layout.fillWidth: true }

            Switch {
                id: enableSwitch
                checked: true
            }
        }
        // first rectangle
        Rectangle {
            height: 2
            width: parent.width
            Layout.alignment: Qt.AlignHCenter
            gradient: Gradient {
                orientation: Gradient.Horizontal
                GradientStop { position: 0.0; color: "transparent" }
                GradientStop { position: 0.2; color: "gray" }      // Start gray at 0.2
                GradientStop { position: 0.8; color: "gray" }      // End gray at 0.8
                GradientStop { position: 1.0; color: "transparent" }
            }
            // or
            //color: "gray"
        }

        RowLayout {
            spacing: 0
            Layout.alignment: Qt.AlignHCenter

            Tumbler {
                id: hourTumbler
                model: 12
                delegate: delegateComponent
            }

            Rectangle {
                width: 2
                height: hourTumbler.height
                gradient: Gradient {
                    GradientStop { position: 0.0; color: "transparent" }
                    GradientStop { position: 0.5; color: "gray" }
                    GradientStop { position: 1.0; color: "transparent" }
                }
            }

            Tumbler {
                id: minuteTumbler
                model: 60
                delegate: delegateComponent
            }

            Rectangle {
                width: 2
                height: minuteTumbler.height
                gradient: Gradient {
                    GradientStop { position: 0.0; color: "transparent" }
                    GradientStop { position: 0.5; color: "gray" }
                    GradientStop { position: 1.0; color: "transparent" }
                }
            }

            Tumbler {
                id: periodTumbler
                model: ["AM", "PM"]
                delegate: delegateComponent
            }
        }

        RowLayout {
            spacing: 0
            Layout.alignment: Qt.AlignBottom | Qt.AlignRight

            RoundButton {
                text: "CANCEL"
                font { family: "roboto"; pixelSize: 11; bold: true }
                implicitWidth: 100
                implicitHeight: 42
                radius: 5
                onClicked: alarmDialog.close()
            }

            RoundButton {
                text: "SAVE"
                font { family: "roboto"; pixelSize: 11; bold: true }
                implicitWidth: 100
                implicitHeight: 42
                radius: 5
                onClicked: {
                    alarmDialog.close()
                }
            }
        }
    }

    Component.onCompleted: {
        var date = new Date()
        var hours = date.getHours()    // 0-23
        var minutes = date.getMinutes() // 0-59

        // Set AM/PM
        periodTumbler.currentIndex = hours >= 12 ? 1 : 0

        // Convert to 12-hour format
        var hour12 = hours % 12
        if (hour12 === 0) hour12 = 12

        // Tumbler index is 0-based, model is 1-12
        hourTumbler.currentIndex = hour12 - 1

        // Minute tumbler index is 0-based, model 0-59
        minuteTumbler.currentIndex = minutes
    }
}
