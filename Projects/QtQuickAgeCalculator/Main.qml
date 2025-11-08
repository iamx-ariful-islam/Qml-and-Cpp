import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Controls.Material

import myBackend

Window {
    width: 800
    height: 500
    visible: true
    title: qsTr("Qt Quick Age Calculator")


    MyBackend { id: backend }


    ColumnLayout {
        spacing: 10
        anchors.centerIn: parent

        Label {
            text: "Enter Information:"
            font { family: "roboto"; weight: Font.Bold; pixelSize: 14 }
        }

        TextField {
            id: birthDate
            placeholderText: "DD/MM/YYYY"
            Layout.preferredWidth: 275
            Layout.preferredHeight: 35
            maximumLength: 10

            property bool manualMode: false

            onTextChanged: {
                if (text.length === 0) manualMode = false;
                if (/\D/.test(text.slice(-1))) manualMode = true;
                if (manualMode) return;

                var digits = text.replace(/\D/g, "").slice(0, 8);
                var formatted = digits.length >= 5 ? digits.slice(0,2)+"/"+digits.slice(2,4)+"/"+digits.slice(4) : digits.length >= 3 ? digits.slice(0,2)+"/"+digits.slice(2) : digits;

                if (formatted !== text) {
                    text = formatted;
                    cursorPosition = formatted.length;
                }
            }
        }

        RowLayout {
            spacing: 10

            TextField {
                id: birthYears
                placeholderText: "YY"
                validator: IntValidator { bottom: 0; top: 200 }
                Layout.preferredWidth: 85
                Layout.preferredHeight: 35
            }
            TextField {
                id: birthMonths
                placeholderText: "MM"
                validator: IntValidator { bottom: 0; top: 11 }
                Layout.preferredWidth: 85
                Layout.preferredHeight: 35
            }
            TextField {
                id: birthDays
                placeholderText: "DD"
                validator: IntValidator { bottom: 0; top: 31 }
                Layout.preferredWidth: 85
                Layout.preferredHeight: 35
            }
        }

        RowLayout {
            spacing: -5

            RoundButton {
                text: "Calculate Age"
                radius: 5
                implicitWidth: 130
                onClicked: {
                    backend.calculateAge(birthDate.text)
                }
            }
            RoundButton {
                text: "Calculate Birth Date"
                radius: 5
                implicitWidth: 155
                onClicked: {
                    backend.calculateBirthDate(birthYears.text, birthMonths.text, birthDays.text)
                }
            }
        }
    }

    Label {
        x: 20
        y: parent.height - height - 20
        id: showLabel
        font { family: "roboto"; weight: Font.Bold; pixelSize: 14 }
        color: "blue"
    }

    Connections {
        target: backend

        function onCalculationCompleted(result) {
            showLabel.text = result
        }
    }
}
