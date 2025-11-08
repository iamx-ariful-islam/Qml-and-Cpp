import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material


TextField {
    id: textField
    width: 40
    implicitHeight: 43

    // custom properties
    property color colorDefault: "#282C34"
    property color colorOnFocus: "#202225"
    property color colorMouseOver: "#2B2F38"
    property color colorDorderOnFocus: "#FF007F"

//    placeholderText: "Search..."
    font.family: "Roboto"
    font.bold: true
    font.pointSize: 10
    clip: true
    leftPadding: 40
    rightPadding: 35
    selectByMouse: true
    selectedTextColor: "#FFFFFF"
    selectionColor: "#FF007F"
//    placeholderTextColor: "#81848C"


    // create background
    background: Rectangle {
        id: bgColor
        radius: 5
        border.width: 1.5

        // create search icon
        Image {
            id: iconSearch
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            source: "icons/search2.png"
            anchors.leftMargin: 10
            fillMode: Image.PreserveAspectFit
            sourceSize.height: 20
        }
        // create close icon
        Image {
            id: iconClose
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            source: "icons/close2.png"
            anchors.rightMargin: 10
            fillMode: Image.PreserveAspectFit
            sourceSize.height: 20
            opacity: 0.5
            visible: false
        }
        MouseArea {
            cursorShape: Qt.PointingHandCursor
            anchors.fill: iconClose
            hoverEnabled: true
            onEntered: iconClose.opacity = 0.75
            onExited: iconClose.opacity = 0.5
            onClicked: {
                console.log("close button click")
                textField.text = ""
            }
            visible: iconClose.visible
        }
    }
    // on focus events
    onFocusChanged: {
        if (textField.focus) {
            textOnFocus.running = true
            bgColor.border.color = colorDorderOnFocus
        } else {
            textLostFocus.running = true
            textField.text = ""
            iconClose.visible = false
            bgColor.border.color = ""
        }
    }

    onTextChanged: {
        if (textField.text.length > 0) {
            iconClose.visible = true
        } else {
            iconClose.visible = false
        }
    }

    // create animations
    PropertyAnimation {
        id: textOnFocus
        target: textField
        properties: "width"
        to: 300
        duration: 500
        easing.type: Easing.OutQuint
    }
    PropertyAnimation {
        id: textLostFocus
        target: textField
        properties: "width"
        to: 40
        duration: 500
        easing.type: Easing.OutQuint
    }
}
