import QtQuick
import QtQuick.Controls


TextField {
    id: textField
    implicitWidth: textField.widthSize
    implicitHeight: 26
    verticalAlignment: Text.AlignVCenter


    property int widthSize: 300
    property color colorDefault: "gray"
    property color colorBorderOnFocus: "#FF007F"

    property string placeText: ""


    placeholderText: placeText
    font {
        family: "ubuntu"
        weight: Font.Bold
    }
    leftPadding: 8
    rightPadding: 8
    selectByMouse: true
    selectedTextColor: "#FFFFFF"
    selectionColor: colorBorderOnFocus

    background: Rectangle {
        radius: 3
        color: textField.activeFocus ? "lightgray" : "whitesmoke"

        Rectangle {
            width: parent.width * 0.99
            height: 1.5
            radius: height / 2
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            color: textField.activeFocus ? colorBorderOnFocus : colorDefault
        }
    }
}
