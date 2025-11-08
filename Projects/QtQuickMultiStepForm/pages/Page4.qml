import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Controls.Material


Page {
    signal buttonClicked(var buttonId)

    Component.onCompleted: {
        btnSubmit.clicked.connect(function() {
            buttonClicked(4)
        });
    }

    Rectangle {
        id: headerSection
        width: parent.width
        height: 100
        anchors.top: parent.top

        ColumnLayout {
            anchors.verticalCenter: parent.verticalCenter
            x: 25
            spacing: 0

            Label {
                id: stepCounter
                text: qsTr("Step 3/3")
            }
            Label {
                id: title
                text: qsTr("Complete or view the all details")
                font {
                    family: "Roboto"
                    pixelSize: 20
                    weight: Font.Bold
                }
            }
            Label {
                id: subTitle
                text: qsTr("Please check and correct all details before submit, otherwise click the previous button")
            }
        }

        Rectangle {
            anchors.bottom: parent.bottom
            width: parent.width - 50
            height: 1
            color: "lightgray"
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }

    Rectangle {
        width: parent.width
        height: parent.height - headerSection.height
        anchors.top: headerSection.bottom

        RowLayout {
            x: 25
            y: 50
            spacing: 200

            ColumnLayout {
                spacing: 5

                Label {
                    text: qsTr("Name")
                    font {
                        family: "Roboto"
                    }
                }
                Label {
                    text: qsTr("Jonaki Soft Network")
                    font {
                        family: "Roboto"
                        weight: Font.Bold
                        pixelSize: 15
                    }
                }
                Label {
                    text: qsTr("Mobile")
                    font {
                        family: "Roboto"
                    }
                }
                Label {
                    text: qsTr("+880 1912345678")
                    font {
                        family: "Roboto"
                        weight: Font.Bold
                        pixelSize: 15
                    }
                }
                Label {
                    text: qsTr("Address")
                    font {
                        family: "Roboto"
                    }
                }
                Label {
                    text: qsTr("Rajshahi, Bangladesh-6000")
                    font {
                        family: "Roboto"
                        weight: Font.Bold
                    }
                    wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                }
            }

            ColumnLayout {
                spacing: 5

                Label {
                    text: qsTr("Name")
                    font {
                        family: "Roboto"
                    }
                }
                Label {
                    text: qsTr("Jonaki Hospital Ltd")
                    font {
                        family: "Roboto"
                        weight: Font.Bold
                        pixelSize: 15
                    }
                }
                Label {
                    text: qsTr("Mobile")
                    font {
                        family: "Roboto"
                    }
                }
                Label {
                    text: qsTr("+880 1712345678")
                    font {
                        family: "Roboto"
                        weight: Font.Bold
                        pixelSize: 15
                    }
                }
                Label {
                    text: qsTr("Address")
                    font {
                        family: "Roboto"
                    }
                }
                Label {
                    text: qsTr("Paltan, Dhaka, Bangladesh-1000")
                    font {
                        family: "Roboto"
                        weight: Font.Bold
                    }
                    wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                }
            }
        }

        RoundButton {
            id: btnSubmit
            anchors.bottom: parent.bottom
            anchors.right: parent.right
            anchors.bottomMargin: 20
            anchors.rightMargin: 20
            text: qsTr("Submit")
            implicitWidth: 100
            radius: 5
        }
        RoundButton {
            id: btnPrevious
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 20
            anchors.right: btnSubmit.left
            text: qsTr("Previous")
            implicitWidth: 100
            radius: 5
            onClicked: {
                myStackView.pop();
            }
        }
    }
}
