import QtQuick
import QtQuick.Window


Window {
    width: 850
    height: 500
    visible: true
    title: qsTr("Qt Quick Number Animation 3")

    Rectangle {
        id: rect
        anchors.centerIn: parent
        height: 100
        width: 100
        color: "blue"
        MouseArea {
            anchors.fill: parent
            onClicked: numAnimation.running = true
        }

        NumberAnimation {
            id: numAnimation
            target: rect
            property: "height"
            duration: 200
            from: rect.height
            to: 200
            easing.type: Easing.InOutQuad
        }
    }
}
