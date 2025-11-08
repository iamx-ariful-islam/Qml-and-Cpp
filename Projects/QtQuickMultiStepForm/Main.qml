import QtQuick
import QtQuick.Window
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Controls.Material

import "pages"


ApplicationWindow {
    width: 980
    height: 550
    visible: true
    title: qsTr("Qt Quick Multi Step Form")

    property int currentStep: 0
    property Page1 page1: Page1{}
    property Page2 page2: Page2{}
    property Page3 page3: Page3{}
    property Page4 page4: Page4{}


    Component.onCompleted: {
        page4.buttonClicked.connect(function(buttonId) {
            currentStep = buttonId
            console.log("current step: ", currentStep)
        });
    }


    Item {
        anchors.fill: parent

        Rectangle {
            id: topSection
            height: 60
            width: parent.width
            anchors.top: parent.top
            // color: parent.backgroundColor

            Rectangle {
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: parent.bottom
                width: parent.width - 30
                height: 1
                color: "lightgray"
            }
            ColumnLayout {
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 15
                spacing: 0

                Text {
                    text: currentStep === 4 ? qsTr("Thank you for your patience") : qsTr("Complete Multi Step Form")
                    font {
                        family: "Roboto"
                        weight: Font.Bold
                        pixelSize: 18
                    }
                }
                Text {
                    text: currentStep === 4 ? qsTr("You complete all the following steps, In a few moments we will go to the next step") : qsTr("Follow the 4 simple steps to complete your mapping")
                    font.family: "Roboto"
                }
            }
        }
        Item {
            width: parent.width
            anchors.bottom: parent.bottom
            anchors.top: topSection.bottom

            visible: currentStep === 4 ? false : true

            Rectangle {
                id: leftSection
                width: 290
                height: parent.height
                anchors.left: parent.left

                Rectangle {
                    anchors.right: parent.right
                    width: 1
                    height: parent.height - 20
                    color: "lightgray"
                }
                ColumnLayout {
                    anchors.centerIn: parent
                    spacing: 5

                    RowLayout {
                        Layout.alignment: Qt.AlignRight
                        spacing: 20

                        ColumnLayout {
                            spacing: 0

                            Text {
                                text: qsTr("Welcome")
                                font {
                                    weight: Font.Bold
                                    pixelSize: 14
                                }
                                Layout.alignment: Text.AlignRight
                            }
                            Text {
                                text: qsTr("Click or press next")
                                Layout.alignment: Text.AlignRight
                            }
                        }
                        RoundButton {
                            id: btnWelcome
                            text: "\u2713"
                        }
                    }
                    RowLayout {
                        Layout.alignment: Qt.AlignRight
                        spacing: 20

                        ColumnLayout {
                            spacing: 0

                            Text {
                                text: qsTr("Hospital")
                                font {
                                    weight: Font.Bold
                                    pixelSize: 14
                                }
                                Layout.alignment: Text.AlignRight
                            }
                            Text {
                                text: qsTr("Enter & press next")
                                Layout.alignment: Text.AlignRight
                            }
                        }
                        RoundButton {
                            text: "H"
                        }
                    }
                    RowLayout {
                        Layout.alignment: Qt.AlignRight
                        spacing: 20

                        ColumnLayout {
                            spacing: 0

                            Text {
                                text: qsTr("Company")
                                font {
                                    weight: Font.Bold
                                    pixelSize: 14
                                }
                                Layout.alignment: Text.AlignRight
                            }
                            Text {
                                text: qsTr("Select & press next")
                                Layout.alignment: Text.AlignRight
                            }
                        }
                        RoundButton {
                            text: "C"
                        }
                    }
                    RowLayout {
                        Layout.alignment: Qt.AlignRight
                        spacing: 20

                        ColumnLayout {
                            spacing: 0

                            Text {
                                text: qsTr("Complete")
                                font {
                                    weight: Font.Bold
                                    pixelSize: 14
                                }
                                Layout.alignment: Text.AlignRight
                            }
                            Text {
                                text: qsTr("Finaly press submit")
                                Layout.alignment: Text.AlignRight
                            }
                        }
                        RoundButton {
                            text: "S"
                        }
                    }
                }
            }
            Item {
                id: rightSection
                width: parent.width - leftSection.width
                height: parent.height
                anchors.left: leftSection.right

                Rectangle {
                    anchors.fill: parent
                    color: "white"

                    StackView {
                        id: myStackView
                        initialItem: page1
                        anchors.fill: parent
                    }
                }
            }
        }
        Item {
            width: parent.width
            anchors.bottom: parent.bottom
            anchors.top: topSection.bottom

            visible: currentStep === 4 ? true : false

            Rectangle {
                anchors.fill: parent
                color: "white"

                ColumnLayout {
                    y: parent.height / 3
                    anchors.horizontalCenter: parent.horizontalCenter
                    spacing: 0

                    Text {
                        text: qsTr("Successfully")
                        font {
                            family: "Roboto"
                            weight: Font.Bold
                            pixelSize: 14
                        }
                    }
                    Text {
                        text: qsTr("Completed your registration")
                        font {
                            family: "Roboto"
                            weight: Font.Bold
                            pixelSize: 22
                        }
                    }
                }
            }
        }
    }
    Label {
        id: lblVersion
        x: 15
        y: parent.height - height - 5
        text: qsTr("v2024.1")
        font {
            family: "Roboto"
            weight: Font.Bold
            pixelSize: 12
        }
        color: "gray"
    }
}
