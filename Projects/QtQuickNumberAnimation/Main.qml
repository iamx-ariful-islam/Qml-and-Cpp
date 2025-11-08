import QtQuick
import QtQuick.Window
import QtQuick.Controls


ApplicationWindow {
    id: root
    width: 850
    height: 500
    visible: true
    title: qsTr("Qt Quick Number Animation")

    Component.onCompleted: {
        animation1.start();
        animation2.start();
    }

    Rectangle {
        id: myRect
        width: 55
        height: 55
        radius: 10
        color: "red"
        x: 0
        y: 0
    }

    Rectangle {
        id: myRect2
        width: 55
        height: 55
        radius: 10
        color: "red"
        x: 0
        y: 0
    }

    NumberAnimation {
        id: animation1
        target: myRect
        property: "x"
        duration: 2000
        easing.type: Easing.InOutQuad
        from: 0
        to: root.width - myRect.width
    }

    NumberAnimation {
        id: animation2
        target: myRect2
        property: "y"
        duration: 2000
        easing.type: Easing.InOutQuad
        from: 0
        to: root.height - myRect2.height
    }
}
