import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Controls.Material

import myStopwatch

Window {
    width: 850
    height: 500
    visible: true
    title: qsTr("Qt Quick Stopwatch2")

    property bool running: false
    property var lapTimes: []
    property int elapsedTime: 0
    property int lastLapTime: 0
    property string currentMsg: ""

    MyStopwatch {
        id: dbStopwatch
    }

    Timer {
        id: timer
        interval: 10
        running: running
        repeat: true
        onTriggered: elapsedTime += 10
    }

    function formatTime(elapsedTime) {
        let hh = Math.floor(elapsedTime / 3600000).toString().padStart(2, '0')
        let mm = Math.floor((elapsedTime % 3600000) / 60000).toString().padStart(2, '0')
        let ss = Math.floor((elapsedTime % 60000) / 1000).toString().padStart(2, '0')
        let ms = Math.floor((elapsedTime % 1000) / 10).toString().padStart(2, '0')
        return `${hh}.${mm}:${ss}.${ms}`
    }

    ColumnLayout {
        anchors.centerIn: parent
        spacing: 0

        RowLayout {
            spacing: 0
            Layout.alignment: Qt.AlignCenter

            Label {
                text: formatTime(elapsedTime).slice(0, 3)
                font { pixelSize: 24; bold: true }
                Layout.alignment: Qt.AlignBottom
                bottomPadding: 6
            }
            Label {
                text: formatTime(elapsedTime).slice(3, -3)
                font { pixelSize: 48; bold: true }
            }
            Label {
                text: formatTime(elapsedTime).slice(-3)
                font { pixelSize: 24; bold: true }
                Layout.alignment: Qt.AlignBottom
                bottomPadding: 6
            }
        }


        RowLayout {
            Layout.alignment: Qt.AlignCenter

            Button {
                id: lapResetButton
                text: running ? "Lap" : "Reset"
                enabled: running || elapsedTime > 0
                onClicked: {
                    if (running) {
                        var lapTime = elapsedTime - lastLapTime
                        lastLapTime = elapsedTime
                        // Changed insert to unshift for arrays
                        // lapTimes.unshift({
                        //    lapTime: formatTime(lapTime),
                        //    totalTime: formatTime(elapsedTime)
                        // })
                        myListView.model.append({
                                                    lapTime: formatTime(lapTime),
                                                    totalTime: formatTime(elapsedTime)
                                                })
                    } else {
                        elapsedTime = 0
                        lastLapTime = 0
                        lapTimes    = []
                    }
                }
            }
            Button {
                text: running ? "Stop" : "Start"
                onClicked: {
                    running = !running
                    running ? timer.start() : timer.stop()
                }
            }

            Button {
                id: saveButton
                text: qsTr("Save")
                onClicked: {
                    if (lapListModel.count === 0) {
                        console.log("No laps to save.")
                        return
                    }

                    popup.open()
                    currentMsg = msgTextField.text //new Date().toISOString()
                    if (currentMsg) {
                        let lapData = []
                        for (let i = 0; i < lapListModel.count; i++) {
                            let item = lapListModel.get(i)
                            lapData.push([item.lapTime, item.totalTime])
                        }

                        dbStopwatch.insertLapData(currentMsg, lapData)
                        console.log("Data saved to database with message:", currentMsg)
                    }
                }
            }
            Button {
                text: qsTr("Delete")
                onClicked: {
                    popup.open()
                    currentMsg = msgTextField.text
                    if (currentMsg) {
                        dbStopwatch.deleteAllLapData(currentMsg)
                        lapListModel.clear()
                        console.log("Deleted records for message:", currentMsg)
                    } else {
                        console.log("No message to delete records.")
                    }
                }
            }
        }
        Rectangle {
            width: 750
            height: 250
            color: "lightgray"

            ListView {
                id: myListView
                anchors.fill: parent
                model: ListModel { id: lapListModel }
                spacing: 5
                clip: true

                delegate: Rectangle {
                    width: parent.width
                    height: 50
                    color: index % 2 === 0 ? "lightblue" : "lightgreen" // Alternate row color
                    radius: 5

                    Column {
                        anchors.fill: parent
                        spacing: 5
                        Text {
                            font.pointSize: 15
                            text: lapTime
                        }
                        Text {
                            font.pointSize: 11
                            text: totalTime
                        }
                    }
                }
            }
        }
    }
    Popup {
        id: popup
        width: 450
        height: 250
        modal: true
        focus: true
        clip: true  // Ensure content is clipped before expanding
        closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside

        background: Rectangle { radius: 10 }

        anchors.centerIn: parent

        TextField {
            anchors.centerIn: parent
            id: msgTextField
            implicitWidth: 350
            placeholderText: qsTr("Enter Lap Time Message")
        }
    }
}
