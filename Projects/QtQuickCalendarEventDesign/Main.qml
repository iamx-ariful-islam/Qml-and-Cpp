import QtQuick
import QtQuick.Window
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Controls.Material


Window {
    width: 1250
    height: 700
    visible: true
    title: qsTr("Qt Quick Calendar Event Desing")


    property int dateNumber: 11
    property string dayName: "Monday"
    property string yearName: "January"
    property int yearNumber: 2024


    Rectangle {
        width: parent.width * 0.9
        height: parent.height * 0.8
        anchors.centerIn: parent
        color: "lightgray"
        radius: 10

        RowLayout {
            spacing: 0
            anchors.centerIn: parent

            Text {
                text: (parseInt(dateNumber) < 10) ? "0" + dateNumber : dateNumber
                font {
                    family: "Roboto"
                    weight: Font.Bold
                    pixelSize: 350
                }
                color: "gray"
            }
            Text {
                Layout.alignment: Qt.AlignTop
                text: "'th"
                font {
                    family: "Roboto"
                    weight: Font.Bold
                    pixelSize: 180
                }
                color: "gray"
            }
        }

        ColumnLayout {
            spacing: 0

            RowLayout {
                spacing: 5

                Text {
                    id: dateText
                    text: (parseInt(dateNumber) < 10) ? "0" + dateNumber : dateNumber
                    font {
                        family: "Roboto"
                        weight: Font.Bold
                        pixelSize: 80
                    }
                }
                ColumnLayout {
                    spacing: 0

                    Text {
                        id: dayText
                        text: dayName
                        font {
                            family: "Roboto"
                            weight: Font.Bold
                            pixelSize: 28
                        }
                    }
                    Text {
                        id: yearNameNumber
                        text: yearName + " | " + yearNumber
                        font {
                            family: "Roboto"
                            weight: Font.Bold
                            pixelSize: 20
                        }
                    }
                }
            }
            RowLayout {
                spacing: 10

                Text {
                    text: "Holiday"
                    font {
                        family: "Roboto"
                        weight: Font.Bold
                        pixelSize: 20
                    }
                }
                //                Rectangle {
                //                    width: 180
                //                    height: 2
                //                    color: "black"
                //                    radius: 5
                //                }
            }
            RowLayout {
                Layout.topMargin: 35

                Text {
                    text: "Event"
                    font {
                        family: "Roboto"
                        weight: Font.Bold
                        pixelSize: 24
                    }
                }
                Button {
                    id: addEvent
                    Layout.leftMargin: 10
                    text: "+ Add"
                    font {
                        family: "Roboto"
                        weight: Font.Bold
                        pixelSize: 15
                    }
                    background: Rectangle {
                        id: bgColor
                        color: "transparent"
                        radius: 5

                        MouseArea {
                            anchors.fill: parent
                            hoverEnabled: true
                            cursorShape: Qt.PointingHandCursor
                            onEntered: bgColor.border.width = 2
                            onExited: bgColor.border.width = 0
                        }
                    }
                    onPressed: bgColor.color = "gray"
                    onReleased: bgColor.color = "transparent"
                    onClicked: {
                        popupEvent.eventDate = "11.12.2023"
                        popupEvent.open()
                    }
                }
            }
            Rectangle {
                width: 600
                height: 350
                color: "transparent"
                Layout.alignment: Qt.AlignHCenter

                ListView {
                    id: itemListView
                    model: ListModel {
                        ListElement { title: "Item1"; description: "Item information1" }
                        ListElement { title: "Item2"; description: "Item information2" }
                        ListElement { title: "Item3"; description: "Item information3" }
                    }
                    spacing: 5
                    anchors.centerIn: parent
                    width: parent.width * 0.9
                    height: parent.height * 0.9

                    clip: true
                    delegate: Rectangle {
                        id: btnEvent
                        width: itemListView.width
                        height: 80
                        color: "transparent"
                        border.width: 1
                        border.color: "whitesmoke"
                        radius: 10

                        MouseArea {
                            anchors.fill: parent
                            hoverEnabled: true
                            cursorShape: Qt.PointingHandCursor
                            onEntered: btnEvent.color = "whitesmoke"
                            onExited: btnEvent.color = "transparent"
                            onPressed: {
                                btnEvent.border.color = "gray"
                                btnEvent.color = "gray"
                            }
                            onReleased: {
                                btnEvent.border.color = "whitesmoke"
                                btnEvent.color = "whitesmoke"
                            }
                        }

                        Column {
                            spacing: 10

                            Row {
                                x: 10
                                spacing: 10

                                Rectangle {
                                    y: 7
                                    width: 5
                                    height: parent.height * 0.83
                                    color: generateRandomColor()
                                    radius: 5
                                }

                                Column {
                                    spacing: 5

                                    Text {
                                        topPadding: 5
                                        text: model.title
                                        font.family: "Roboto"
                                        font.bold: true
                                        font.pixelSize: 15
                                    }
                                    Text {
                                        text: model.description
                                        font.family: "Roboto"
                                        font.bold: true
                                        font.pixelSize: 12
                                        color: "gray"
                                    }
                                }
                            }
                            Row {
                                x: 10
                                spacing: 10

                                Text {
                                    text: "09:10am"
                                    font {
                                        family: "Roboto"
                                        weight: Font.Bold
                                        pixelSize: 15
                                    }
                                }
                                Text {
                                    text: "10:00pm"
                                    font {
                                        family: "Roboto"
                                        weight: Font.Bold
                                        pixelSize: 15
                                    }
                                    color: "gray"
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    Popup {
        id: popupEvent
        anchors.centerIn: parent
        modal: true
        width: 650
        height: 350

        property string eventDate: ""
        property string titleText: "Add"

        background: Rectangle {
            radius: 10
        }

        Button {
            x: parent.width - width + 20
            y: -10
            id: btnClose
            opacity: 0.5

            background: Rectangle {
                color: "transparent"

                Image {
                    source: "icons/close.png"
                    fillMode: Image.PreserveAspectFit
                    sourceSize.height: 28
                }
                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor
                    onEntered: btnClose.opacity = 1
                    onExited: btnClose.opacity = 0.5
                }
            }
            onClicked: popupEvent.close()
        }

        Rectangle {
            width: parent.width * 0.8
            height: parent.height * 0.7
            anchors.centerIn: parent

            ColumnLayout {
                spacing: 10
                anchors.fill: parent

                RowLayout {
                    spacing: 5

                    Text {
                        Layout.fillWidth: true
                        text: qsTr("%1 Calendar Event").arg(popupEvent.titleText)
                        font {
                            family: "Roboto"
                            weight: Font.Bold
                            pixelSize: 20
                        }
                    }
                    Text {
                        Layout.alignment: Qt.AlignRight
                        text: qsTr("%1").arg(popupEvent.eventDate)
                        font {
                            family: "Roboto"
                            weight: Font.Bold
                            pixelSize: 15
                        }
                    }
                }

                TextField {
                    id: titleText
                    Layout.fillWidth: true
                    implicitHeight: 35
                    placeholderText: "Enter Title"
                    font {
                        family: "Roboto"
                        weight: Font.Bold
                        pixelSize: 16
                    }
                }
                TextArea {
                    id: descText
                    Layout.fillWidth: true
                    implicitHeight: 120
                    placeholderText: "Enter Description"
                    font {
                        family: "Roboto"
                        weight: Font.Bold
                        pixelSize: 14
                    }
                }

                RowLayout {
                    spacing: 5

                    Button {
                        id: startEvent
                        text: "09:00am"
                        implicitWidth: 70
                        opacity: 0.5

                        contentItem: Text {
                            id: startText
                            text: startEvent.text
                            font {
                                family: "Roboto"
                                weight: Font.Bold
                                pixelSize: 14
                            }
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }

                        background: Rectangle {
                            id: startBackground
                            color: "transparent"
                            radius: 5

                            MouseArea {
                                anchors.fill: parent
                                hoverEnabled: true
                                cursorShape: Qt.PointingHandCursor
                                onEntered: startEvent.opacity = 1
                                onExited: startEvent.opacity = 0.5
                                onClicked: (mouse)=> {
                                               console.log(mouse.button)
                                               if (mouse.button === Qt.RightButton) {
                                                   console.log("if click right button then edit field and enter start time")
                                               }
                                           }
                            }
                        }
                        onClicked: {
                            popupTime.timeTitle = "Start"
                            popupTime.fontColor = "green"
                            popupTime.open()
                        }
                    }

                    Text {
                        text: "to"
                        font {
                            family: "Roboto"
                            weight: Font.Bold
                            pixelSize: 15
                        }
                    }

                    Button {
                        id: endEvent
                        text: "11:55pm"
                        implicitWidth: 70
                        opacity: 0.5

                        contentItem: Text {
                            id: endText
                            text: endEvent.text
                            font {
                                family: "Roboto"
                                weight: Font.Bold
                                pixelSize: 14
                            }
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }

                        background: Rectangle {
                            id: endBackground
                            color: "transparent"
                            radius: 5

                            MouseArea {
                                anchors.fill: parent
                                hoverEnabled: true
                                cursorShape: Qt.PointingHandCursor
                                onEntered: endEvent.opacity = 1
                                onExited: endEvent.opacity = 0.5
                            }
                        }
                        onClicked: {
                            popupTime.timeTitle = "End"
                            popupTime.fontColor = "red"
                            popupTime.open()
                        }
                    }

                    Rectangle { Layout.fillWidth: true }

                    Button {
                        id: btnSave
                        text: qsTr("Save")
                        implicitWidth: 90

                        contentItem: Text {
                            id: btnSaveText
                            text: btnSave.text
                            font.pixelSize: 14
                            font.family: "Roboto"
                            font.weight: Font.Bold
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            elide: Text.ElideRight
                        }

                        background: Rectangle {
                            id: btnSaveBackground
                            border.width: 1
                            border.color: "gray"
                            radius: 5
                            MouseArea {
                                anchors.fill: parent
                                hoverEnabled: true
                                cursorShape: Qt.PointingHandCursor

                                onEntered: {
                                    btnSaveBackground.border.color = "black"
                                }
                                onExited: {
                                    btnSaveBackground.border.color = "gray"
                                }
                            }
                        }
                        onPressed: {
                            btnSaveText.color = "whitesmoke"
                            btnSaveBackground.color = "gray"
                            btnSaveBackground.border.color = "gray"
                        }
                        onReleased: {
                            btnSaveText.color = "black"
                            btnSaveBackground.color = "transparent"
                            btnSaveBackground.border.color = "black"
                        }
                    }
                }
            }
        }
    }

    PopupTime {
        id: popupTime

        Connections {
            target: popupTime
            function onTimeSelected (time, position) {
                if (position === "Start") {
                    startEvent.text = time.toLowerCase()
                } else {
                    endEvent.text = time.toLowerCase()
                }
            }
        }
    }

    function generateRandomColor() {
        var letters = "0123456789ABCDEF";
        var color = "#";
        for (var i = 0; i < 6; i++) {
            color += letters[Math.floor(Math.random() * 16)];
        }
        return color;
    }
}
