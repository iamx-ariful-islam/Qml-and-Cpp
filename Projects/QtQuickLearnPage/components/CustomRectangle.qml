import QtQuick
import QtQuick.Effects
import QtQuick.Layouts
import QtQuick.Controls


Item {
    width: 520
    height: 120

    property string titleText: ""
    property string descriptionText: ""
    property string iconSource: ""
    property string buttonText: ""

    Rectangle {
        id: sourceItem
        width: parent.width
        height: parent.height
        radius: 10

        RowLayout {
            spacing: 10
            anchors.fill: parent

            ColumnLayout {
                spacing: 5
                Layout.alignment: Qt.AlignTop
                Layout.topMargin: 15
                Layout.leftMargin: 20

                Text {
                    text: qsTr(titleText)
                    font {
                        family: "ubuntu"
                        weight: Font.Bold
                        pixelSize: 15
                    }
                    wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                }

                Text {
                    width: 10
                    text: qsTr(descriptionText)
                    font {
                        family: "ubuntu"
                        weight: Font.Bold
                    }
                    color: "gray"
                    wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                    Layout.fillWidth: true
                    maximumLineCount: 2
                }

                CustomButton {
                    Layout.alignment: Qt.AlignRight
                    btnText: buttonText
                    onClicked: {
                        console.log("Button Clicked")
                    }
                }
            }

            Image {
                Layout.alignment: Qt.AlignRight
                Layout.rightMargin: 15
                source: iconSource
                fillMode: Image.PreserveAspectFit
                sourceSize {
                    width: 45
                    height: 45
                }
            }
        }
    }

    MultiEffect {
        source: sourceItem
        anchors.fill: sourceItem
        shadowBlur: 1.0
        shadowEnabled: true
        shadowColor: "whitesmoke"
    }
}
