import QtQuick
import QtQuick.Dialogs
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Controls.Material


Page {

    Rectangle {
        id: headerSection
        width: parent.width
        height: 100
        anchors.top: parent.top

        ColumnLayout {
            x: 25
            anchors.verticalCenter: parent.verticalCenter
            spacing: 0

            Label {
                id: stepCounter
                text: qsTr("Step 1/3")
            }
            Label {
                id: title
                text: qsTr("Let's start with hospital details")
                font {
                    family: "Roboto"
                    pixelSize: 20
                    weight: Font.Bold
                }
            }
            Label {
                id: subTitle
                text: qsTr("Please fill the details below so that we can get in contact with you about our product")
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

        ColumnLayout {
            x: 25
            y: 50
            spacing: 5

            RowLayout{
                spacing: 10

                ColumnLayout {

                    Label {
                        text: qsTr("Enter Hospital Name")
                    }
                    TextField {
                        id: hospitalName
                        implicitWidth: 400
                        implicitHeight: 35
                        onTextChanged: {
                            if (hospitalName && hospitalName.length >= 10){
                                btnNext.enabled = true
                            } else {
                                btnNext.enabled = false
                            }
                        }
                    }
                }
                ColumnLayout {

                    Label {
                        text: qsTr("Enter Mobile Number")
                    }
                    TextField {
                        id: hospitalMobile
                        implicitWidth: 230
                        implicitHeight: 35
                    }
                }
            }

            Label {
                text: qsTr("Enter Hospital Address")
            }
            TextArea {
                id: hospitalAddress
                Layout.rowSpan: 2
                Layout.fillWidth: true
            }
            RowLayout {
                spacing: 5

                RoundButton {
                    text: qsTr("Browse")
                    radius: 5
                    implicitWidth: 80
                    implicitHeight: 40
                    onClicked: openFileDialog.open()
                }
                Label {
                    id: imgPath
                    Layout.fillWidth: true
                    text: "No image selected"
                }
            }
        }

        RoundButton {
            id: btnNext
            anchors.bottom: parent.bottom
            anchors.right: parent.right
            anchors.bottomMargin: 20
            anchors.rightMargin: 20
            text: qsTr("Next ->")
            implicitWidth: 100
            radius: 5
            enabled: false
            onClicked: {
                myStackView.push(page3)
            }
        }
        RoundButton {
            id: btnPrevious
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 20
            anchors.right: btnNext.left
            text: qsTr("Previous")
            implicitWidth: 100
            radius: 5
            onClicked: {
                myStackView.pop();
            }
        }
    }
    FileDialog {
        id: openFileDialog
        title: "Open"
        // currentFolder: shortcut.home
        nameFilters: ["All files (*)"]

        onAccepted: {
            imgPath.text = selectedFile
            console.log(selectedFile)
        }
        onRejected: {
            imgPath.text = "No image selected"
        }
    }
}
