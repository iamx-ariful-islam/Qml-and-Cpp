import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Controls.Material


Window {
    width: 950
    height: 500
    visible: true
    title: qsTr("Qt Quick Info Page Design")

    Item {
        anchors.fill: parent

        Rectangle {
            id: topRect
            height: 30
            width: parent.width
            anchors.top: parent.top

            Text {
                text: qsTr("My Info List")
                font {
                    family: "ubuntu"
                    weight: Font.Bold
                    pixelSize: 18
                }
                anchors.bottom: parent.bottom
                anchors.right: parent.right
                anchors.rightMargin: 10
            }
        }
        Item {
            width: parent.width
            anchors.bottom: parent.bottom
            anchors.top: topRect.bottom

            Rectangle {
                id: leftRect
                width: 450
                height: parent.height
                anchors.left: parent.left

                ListView {
                    id: itemListView
                    model: ListModel {
                        ListElement { title: "Item1"; description: "Item information1"; image: "icons/analyzers/dymind.ico" }
                        ListElement { title: "Item2"; description: "Item information2"; image: "icons/analyzers/excbio.ico" }
                        ListElement { title: "Item3"; description: "Item information3"; image: "icons/analyzers/rayto.ico" }
                        ListElement { title: "Item4"; description: "Item information4"; image: "icons/analyzers/mindray.ico" }
                        ListElement { title: "Item5"; description: "Item information5"; image: "icons/analyzers/agappe.ico" }
                        ListElement { title: "Item6"; description: "Item information6"; image: "icons/analyzers/biobase.ico" }
                        ListElement { title: "Item7"; description: "Item information7"; image: "icons/analyzers/genrui.ico" }
                    }
                    spacing: 5
                    anchors.centerIn: parent
                    width: parent.width * 0.9
                    height: parent.height * 0.9

                    clip: true
                    delegate: Rectangle {
                        width: itemListView.width
                        height: 80
                        color: "lightgray" //generateRandomColor()
                        radius: 10

                        Row {
                            x: 10
                            anchors.verticalCenter: parent.verticalCenter
                            spacing: 10

                            Image {
                                width: 50
                                height: 50
                                source: model.image
                            }

                            Column {
                                spacing: 5

                                Text {
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
                                }
                            }
                        }

                        MouseArea {
                            anchors.fill: parent
                            hoverEnabled: true

                            HoverHandler {
                                cursorShape: Qt.PointingHandCursor
                            }

                            onClicked: {
                                titleText.text = model.title
                                console.log(model.title + ": " + model.description)
                            }

                            // Change the background color on hover
                            onEntered: parent.color = "lightblue"
                            onExited: parent.color = "lightgray" //generateRandomColor()
                        }
                    }
                }
            }
            Item {
                id: rightItem
                width: parent.width - leftRect.width
                height: parent.height
                anchors.right: parent.right

                Rectangle {
                    anchors.centerIn: parent
                    width: parent.width
                    height: parent.height * 0.9
                    radius: 10
                    color: "lightgray"
                    Text {
                        id: titleText
                        text: qsTr("No analyzers have been selected yet!")
                        anchors.centerIn: parent
                        font.family: "Courier New"
                        font.bold: true
                        font.pixelSize: 18
                        color: "#149414"
                    }
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
