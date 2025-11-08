import QtQuick
import QtQuick.Window
import QtQuick.Layouts
import QtQuick.Controls
//import QtQuick.Controls.Material

import myBackend 0.1

ApplicationWindow {
    id: window
    width: 1280
    height: 850
    visible: true
    title: qsTr("Qt Quick Desktop Tip Calculator")
    color: "#c5e4e7"

    MyBackend{
        id: tipObject
    }

    Label {
        id: appTitle
        text: qsTr("TIP CALCULATOR")
        anchors.top: parent.top
        anchors.bottom: appControls.top
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.pointSize: 32
        anchors.bottomMargin: 92
        anchors.topMargin: 92
        anchors.horizontalCenter: appControls.horizontalCenter
    }

    Rectangle {
        id: appControls
        color: "#ffffff"
        radius: 20
        anchors.fill: parent
        anchors.rightMargin: 228
        anchors.leftMargin: 228
        anchors.bottomMargin: 256
        anchors.topMargin: 256

        RowLayout {
            id: rowLayout
            anchors.fill: parent
            anchors.rightMargin: 32
            anchors.leftMargin: 32
            anchors.bottomMargin: 32
            anchors.topMargin: 32
            spacing: 32

            ColumnLayout {
                id: inputSection
                width: 100
                height: 100
                Layout.minimumHeight: 384
                Layout.maximumHeight: 384
                Layout.minimumWidth: 396
                Layout.maximumWidth: 396
                Layout.fillHeight: true
                Layout.fillWidth: true

                Label {
                    id: label
                    color: "#26c2ad"
                    text: qsTr("Bill")
                    Layout.maximumWidth: 396
                    Layout.minimumWidth: 396
                    font.pointSize: 12
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                }

                TextField {
                    id: billInput
                    horizontalAlignment: Text.AlignRight
                    Layout.maximumHeight: 49
                    Layout.minimumHeight: 49
                    Layout.minimumWidth: 396
                    font.pointSize: 18
                    Layout.maximumWidth: 396
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    placeholderText: qsTr("0.00")
                    onEditingFinished: {
                        tipObject.billAmount = billInput.text
                        tipObject.calculateTotal()
                    }
                }

                Item {
                    id: item2
                    width: 200
                    height: 200
                    Layout.maximumWidth: 396
                    Layout.minimumWidth: 396
                    Layout.maximumHeight: 24
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                }

                Label {
                    id: label1
                    color: "#26c2ad"
                    text: qsTr("Select Tip %")
                    Layout.maximumHeight: 25
                    Layout.minimumHeight: 25
                    Layout.maximumWidth: 396
                    Layout.minimumWidth: 396
                    font.pointSize: 12
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                }

                GridLayout {
                    id: gridLayout
                    width: 100
                    height: 100
                    Layout.maximumWidth: 396
                    Layout.minimumWidth: 396
                    rowSpacing: 16
                    columnSpacing: 16
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    rows: 2
                    columns: 3

                    RoundButton {
                        id: roundButton
                        radius: 8
                        text: "5%"
                        Layout.minimumHeight: 56
                        Layout.maximumHeight: 56
                        Layout.minimumWidth: 96
                        Layout.maximumWidth: 128
                        font.pointSize: 18
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                        onClicked: {
                            tipObject.tipRate = 5
                            tipObject.calculateTotal()
                        }
                    }

                    RoundButton {
                        id: roundButton1
                        radius: 8
                        text: "10%"
                        Layout.minimumHeight: 56
                        Layout.maximumHeight: 56
                        Layout.minimumWidth: 96
                        Layout.maximumWidth: 128
                        font.pointSize: 18
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                        onClicked: {
                            tipObject.tipRate = 10
                            tipObject.calculateTotal()
                        }
                    }

                    RoundButton {
                        id: roundButton2
                        radius: 8
                        text: "15%"
                        Layout.minimumHeight: 56
                        Layout.maximumHeight: 56
                        Layout.minimumWidth: 96
                        Layout.maximumWidth: 128
                        font.pointSize: 18
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                        onClicked: {
                            tipObject.tipRate = 15
                            tipObject.calculateTotal()
                        }
                    }

                    RoundButton {
                        id: roundButton3
                        radius: 8
                        text: "25%"
                        Layout.minimumHeight: 56
                        Layout.maximumHeight: 56
                        Layout.minimumWidth: 96
                        Layout.maximumWidth: 128
                        font.pointSize: 18
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                        onClicked: {
                            tipObject.tipRate = 25
                            tipObject.calculateTotal()
                        }
                    }

                    RoundButton {
                        id: roundButton4
                        radius: 8
                        text: "50%"
                        Layout.minimumHeight: 56
                        Layout.maximumHeight: 56
                        Layout.minimumWidth: 96
                        Layout.maximumWidth: 128
                        font.pointSize: 18
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                        onClicked: {
                            tipObject.tipRate = 50
                            tipObject.calculateTotal()
                        }
                    }

                    RoundButton {
                        id: roundButton5
                        radius: 8
                        text: "Custom"
                        Layout.minimumHeight: 56
                        Layout.maximumHeight: 56
                        Layout.minimumWidth: 96
                        Layout.maximumWidth: 128
                        font.pointSize: 18
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                    }
                }

                Item {
                    id: item3
                    width: 200
                    height: 200
                    Layout.maximumWidth: 396
                    Layout.minimumWidth: 396
                    Layout.maximumHeight: 24
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                }

                Label {
                    id: label2
                    color: "#26c2ad"
                    text: qsTr("Number of People")
                    Layout.maximumHeight: 25
                    Layout.minimumHeight: 25
                    Layout.minimumWidth: 396
                    font.pointSize: 12
                    Layout.maximumWidth: 396
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                }

                TextField {
                    id: peopleInput
                    horizontalAlignment: Text.AlignRight
                    Layout.maximumHeight: 49
                    Layout.minimumHeight: 49
                    Layout.minimumWidth: 396
                    font.pointSize: 18
                    Layout.maximumWidth: 396
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    placeholderText: qsTr("1")
                    onEditingFinished: {
                        tipObject.numberOfPeople = peopleInput.text
                        tipObject.calculateTotal()
                    }
                }
            }

            Rectangle {
                id: totalSection
                width: 200
                height: 200
                color: "#00474b"
                radius: 20
                Layout.minimumWidth: 342
                Layout.maximumWidth: 342
                Layout.maximumHeight: 384
                Layout.minimumHeight: 384
                Layout.fillHeight: true
                Layout.fillWidth: true

                ColumnLayout {
                    id: columnLayout
                    anchors.fill: parent

                    RowLayout {
                        id: rowLayout1
                        width: 100
                        height: 100
                        Layout.margins: 32
                        Layout.fillHeight: true
                        Layout.fillWidth: true

                        Label {
                            id: label3
                            color: "#ededed"
                            text: qsTr("Tip Amount Per Person")
                            verticalAlignment: Text.AlignVCenter
                            Layout.maximumHeight: 36
                            Layout.minimumHeight: 36
                            Layout.minimumWidth: 132
                            Layout.maximumWidth: 132
                            font.pointSize: 12
                            Layout.fillHeight: true
                            Layout.fillWidth: true
                        }

                        Label {
                            id: labelTip
                            color: "#26c2ad"
                            text: "$" + (tipObject.tipAmount).toFixed(2)
                            horizontalAlignment: Text.AlignRight
                            verticalAlignment: Text.AlignVCenter
                            Layout.maximumHeight: 36
                            Layout.minimumHeight: 36
                            Layout.maximumWidth: 132
                            Layout.minimumWidth: 132
                            Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                            font.bold: true
                            font.pointSize: 24
                            Layout.fillHeight: true
                            Layout.fillWidth: true
                        }
                    }

                    RowLayout {
                        id: rowLayout2
                        width: 100
                        height: 100
                        Layout.margins: 32
                        Layout.fillHeight: true
                        Layout.fillWidth: true

                        Label {
                            id: label4
                            color: "#ededed"
                            text: qsTr("Total Per Person")
                            verticalAlignment: Text.AlignVCenter
                            Layout.maximumHeight: 36
                            Layout.minimumHeight: 36
                            Layout.minimumWidth: 132
                            Layout.maximumWidth: 132
                            font.pointSize: 12
                            Layout.fillHeight: true
                            Layout.fillWidth: true
                        }

                        Label {
                            id: labelTotal
                            color: "#26c2ad"
                            text: "$" + (tipObject.totalAmount).toFixed(2)
                            horizontalAlignment: Text.AlignRight
                            verticalAlignment: Text.AlignVCenter
                            Layout.maximumHeight: 36
                            Layout.minimumHeight: 36
                            Layout.maximumWidth: 132
                            Layout.minimumWidth: 132
                            font.bold: true
                            font.pointSize: 24
                            Layout.fillHeight: true
                            Layout.fillWidth: true
                        }
                    }

                    Item {
                        id: item1
                        width: 200
                        height: 200
                        Layout.topMargin: 24
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                    }

                    RoundButton {
                        id: roundButton6
                        radius: 8
                        text: "RESET"
                        Layout.minimumHeight: 49
                        Layout.maximumHeight: 49
                        Layout.minimumWidth: 269
                        Layout.maximumWidth: 269
                        font.pointSize: 18
                        Layout.topMargin: -72
                        Layout.margins: 32
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                        onClicked: {
                            tipObject.resetValues()
                            peopleInput.text = tipObject.numberOfPeople
                            billInput.text = tipObject.billAmount
                        }
                    }
                }
            }
        }
    }
}
