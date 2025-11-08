import QtQuick
import QtQuick.Window
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Controls.Material


Window {
    width: 850
    height: 500
    visible: true
    title: qsTr("Qt Quick Resizable and Dragable Rectangle")


    Rectangle {
        id: mainRect
        width: 170
        height: 150
        radius: 5
        x: parent.width/2 - (width/2)
        y: parent.height/2 - (height/2)
        border {
            color: "red"
            width: 2
        }
        Drag.active: mouseArea.drag.active

        MouseArea {
            id: mouseArea
            anchors.fill: parent
            drag.target: mainRect
        }
    }

    Circle {
        id: left
        anchors {
            horizontalCenter: mainRect.left
            verticalCenter: mainRect.verticalCenter
        }
        MouseArea {
            anchors.fill: parent
            onMouseXChanged: {
                mainRect.x = mainRect.x + mouseX
                mainRect.width = mainRect.width - mouseX
                if(mainRect.width < 5)
                {
                    mainRect.width = 5
                }
            }
        }
    }

    Circle {
        id: right
        anchors {
            horizontalCenter: mainRect.right
            verticalCenter: mainRect.verticalCenter
        }
        MouseArea {
            anchors.fill: parent
            onMouseXChanged: {
                mainRect.width = mainRect.width + mouseX
                if(mainRect.width < 5)
                {
                    mainRect.width = 5
                }
            }
        }
    }

    Circle {
        id: top
        anchors {
            horizontalCenter: mainRect.horizontalCenter
            verticalCenter: mainRect.top
        }
        MouseArea {
            anchors.fill: parent
            onMouseYChanged: {
                mainRect.y = mainRect.y + mouseY
                mainRect.height = mainRect.height - mouseY
                if(mainRect.height < 5)
                {
                    mainRect.height = 5
                }
            }
        }
    }

    Circle {
        id: bottom
        anchors {
            horizontalCenter: mainRect.horizontalCenter
            verticalCenter: mainRect.bottom
        }
        MouseArea {
            anchors.fill: parent
            onMouseYChanged: {
                mainRect.height = mainRect.height + mouseY
                if(mainRect.height < 5)
                {
                    mainRect.height = 5
                }
            }
        }
    }
}
