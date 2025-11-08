import QtQuick
import QtQuick.Window
import QtQuick.Controls.Material


Window {
    width: 850
    height: 480
    visible: true
    title: qsTr("Qt Quick Button Click Animation")


    Rectangle {
        id: rectangle
        width: parent.width
        height: parent.height

        color: parent.backgroundColor

        Button {
            id: button
            text: qsTr("Press me")
            anchors.verticalCenter: parent.verticalCenter
            checkable: true
            anchors.horizontalCenter: parent.horizontalCenter

            Connections {
                target: button
                onClicked: animation.start()
            }
        }

        Text {
            id: label
            text: qsTr("Hello button")
            anchors.top: button.bottom
            anchors.topMargin: 45
            anchors.horizontalCenter: parent.horizontalCenter

            SequentialAnimation {
                id: animation

                ColorAnimation {
                    id: colorAnimation1
                    target: rectangle
                    property: "color"
                    to: "#2294c6"
                    from: "white"
                }
                ColorAnimation {
                    id: colorAnimation2
                    target: rectangle
                    property: "color"
                    to: "white"
                    from: "#2294c6"
                }
            }
        }
        states: [
            State {
                name: "clicked"
                when: button.checked

                PropertyChanges {
                    target: label
                    text: qsTr("Button Checked")
                }
            }
        ]
    }
}
