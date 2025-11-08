import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Controls.Material


Window {
    width: 850
    height: 500
    visible: true
    title: qsTr("Qt Quick Timer")

    property bool running: false
    property int remainingTime: 0
    property var remainTimeList: [1, 2, 3, 5, 7, 10]

    Timer {
        id: timer
        interval: 1000
        running: running
        repeat: true
        onTriggered: {
            if (remainingTime > 0) {
                remainingTime--
            } else {
                running = false
                timer.stop()
                timeDisplay.blinkAnimation()
            }
        }
    }

    function formatTime(seconds) {
        let hh = Math.floor(seconds / 3600).toString().padStart(2, '0')
        let mm = Math.floor((seconds % 3600) / 60).toString().padStart(2, '0')
        let ss = (seconds % 60).toString().padStart(2, '0')
        return `${hh}:${mm}:${ss}`
    }

    Rectangle {
        width: 280
        height: 170

        radius: 8
        color: "#ECECEC"
        x: parent.width - width - 20
        anchors.verticalCenter: parent.verticalCenter

        ColumnLayout {
            spacing: 0
            anchors.centerIn: parent

            CheckBox {
                id: timeModeCheckBox
                text: "Interpret as mm:ss format"
                font { family: "roboto"; pixelSize: 11; bold: true }
                checked: false
                implicitHeight: 32
            }

            RowLayout {
                spacing: 5

                TextField {
                    id: addNums
                    placeholderText: "Enter Number"
                    font { family: "roboto"; pixelSize: 11; bold: true }
                    implicitWidth: 150
                    implicitHeight: 32
                }

                RoundButton {
                    text: "Add"
                    font { family: "roboto"; pixelSize: 12; bold: true }
                    radius: 5
                    implicitWidth: 105
                    implicitHeight: 42
                    onClicked: {
                        var val = parseInt(addNums.text)
                        if (!isNaN(val)) {
                            if (timeModeCheckBox.checked) {
                                // Interpret as mmss → 130 → 1 min 30 sec
                                var mins = Math.floor(val / 100)
                                var secs = val % 100
                                remainingTime = (mins * 60) + secs
                            } else {
                                // Interpret as total minutes → 130 → 130 minutes
                                remainingTime = val * 60
                            }
                        }
                    }
                }
            }
            GridLayout {
                rows: 2
                columns: 5
                rowSpacing: 0
                columnSpacing: 0

                Repeater {
                    model: remainTimeList
                    RoundButton {
                        text: modelData.toString()
                        onClicked: remainingTime = modelData * 60
                        font { family: "roboto"; pixelSize: 12; bold: true }
                        radius: 5
                        implicitHeight: 42
                    }
                }
                RoundButton {
                    text: "+ 30"
                    onClicked: remainingTime += 30
                    font { family: "roboto"; pixelSize: 12; bold: true }
                    radius: 5

                    implicitWidth: 105
                    implicitHeight: 42
                    Layout.columnSpan: 2
                }
                RoundButton {
                    text: "- 30"
                    enabled: remainingTime > 0
                    onClicked: remainingTime -= 30
                    font { family: "roboto"; pixelSize: 12; bold: true }
                    radius: 5
                    implicitWidth: 105
                    implicitHeight: 42
                    Layout.columnSpan: 2
                }
            }
        }
    }

    ColumnLayout {
        anchors.centerIn: parent
        spacing: 20

        Label {
            id: timeDisplay
            text: formatTime(remainingTime)
            font { family: "roboto"; pixelSize: 48; bold: true }

            function blinkAnimation() {
                hideAnimation.restart()
            }

            SequentialAnimation {
                id: hideAnimation
                loops: 10
                NumberAnimation { target: timeDisplay; property: "opacity"; to: 0; duration: 500 }
                NumberAnimation { target: timeDisplay; property: "opacity"; to: 1; duration: 500 }
            }
        }

        RowLayout {
            Layout.alignment: Qt.AlignCenter

            Button {
                id: lapResetButton
                text: qsTr("Reset")
                enabled: remainingTime > 0

                onClicked: {
                    timer.stop()
                    running = false
                    remainingTime = 0
                }
            }

            Button {
                text: running ? qsTr("Pause") : qsTr("Start")
                enabled: remainingTime > 0
                onClicked: {
                    running = !running
                    running ? timer.start() : timer.stop()
                }
            }
        }
    }
}
