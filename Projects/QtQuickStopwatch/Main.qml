import QtQuick
import QtQuick.Window
import QtQuick.Controls


Window {
    id: applicationWindow
    width: 850
    height: 500
    visible: true
    title: qsTr("Stopwatch")


    Row {
        anchors.top: parent.top
        anchors.topMargin: 8
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 3
        Button {
            id: btnStart
            text: "Start"
            width: 100
            height: 28
            font.pointSize: 12
            font.family: "Arial"
            font.bold: true
            onClicked: {
                console.log("Start")
            }
        }

        Button {
            id: btnStop
            text: "Stop"
            width: 100
            height: 28
            font.pointSize: 12
            font.family: "Arial"
            font.bold: true
            onClicked: {
                console.log("Stop")
            }
        }

        Button {
            id: btnReset
            text: "Reset"
            width: 100
            height: 28
            font.pointSize: 12
            font.family: "Arial"
            font.bold: true
            onClicked: {
                console.log("Reset")
            }
        }

        Button {
            id: btnGoal
            text: "Goal: 3.0"
            width: 100
            height: 28
            font.pointSize: 12
            font.family: "Arial"
            font.bold: true
            onClicked: {
                console.log("Set goal")
            }
        }
    }

    Text {
        id: timeLabel
        width: 155
        height: 41
        text: qsTr("Current time:")
        anchors.verticalCenterOffset: -60
        anchors.horizontalCenterOffset: 5
        font.pointSize: 13
        font.bold: true
        font.family: "Arial"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
    }

    Text {
        id: userDisplay
        width: 155
        height: 41
        text: "0.0"
        anchors.verticalCenterOffset: -50
        anchors.horizontalCenterOffset: 5
        font.pointSize: 60
        font.bold: true
        font.family: "Arial"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
    }

    Text {
        id: bestLabel
        text: qsTr("Best time:")
        width: 79
        height: 41
        color: "#af0b0b"
        anchors.verticalCenterOffset: 45
        anchors.horizontalCenterOffset: 5
        font.pointSize: 13
        font.bold: true
        font.family: "Arial"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
    }

    Text {
        id: userBest
        width: 79
        height: 41
        color: "#af0b0b"
        text: Number(12.1234).toFixed(2) //Best time
        anchors.verticalCenterOffset: 60
        anchors.horizontalCenterOffset: 0
        font.pointSize: 30
        font.bold: true
        font.family: "Arial"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
    }

    Switch {
        id: switch1
        y: 248
        text: qsTr("Slowest")
        font.pointSize: 10
        font.family: "Arial"
        font.bold: true
        anchors.left: parent.left
        anchors.leftMargin: 12
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 12
        onToggled: {
            console.log(switch1.checked)
            if(switch1.checked)
            {
                switch1.text = "Fastest"
            }
            else
            {
                switch1.text = "Slowest"
            }
        }
    }
}
