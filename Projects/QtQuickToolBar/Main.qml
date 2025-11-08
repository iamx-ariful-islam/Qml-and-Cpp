import QtQuick
import QtQuick.Window
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Controls.Material



ApplicationWindow {
    width: 850
    height: 500
    visible: true
    title: qsTr("Qt Quick ToolBar")


    header: ToolBar {
        RowLayout {
            anchors.fill: parent

            ToolButton {
                text: qsTr(":")
                onClicked: {
                    menu.open()
                }
            }
            Label {
                id: myText
                text: qsTr("ToolBar Application")
                elide: Label.ElideRight
                horizontalAlignment: Qt.AlignHCenter
                verticalAlignment: Qt.AlignVCenter
                Layout.fillWidth: true
            }
            ToolButton {
                text: qsTr("<")
                onClicked: {
                    stack.pop()
                }
            }
        }
    }
    StackView {
        id: stack
        anchors.fill: parent
    }
    Menu {
        id: menu
        MenuItem {
            id: one
            text: qsTr("Option1")
            onClicked: {
                myText.text = one.text
                stack.push(redItem)
            }
        }
        MenuItem {
            id: two
            text: qsTr("Option2")
            onClicked: {
                myText.text = two.text
                stack.push(greenItem)
            }
        }
        MenuItem {
            id: three
            text: qsTr("Option3")
            onClicked: {
                myText.text = three.text
                stack.push(blueItem)
            }
        }
    }
    Item {
        id: redItem
        Rectangle {
            anchors.fill: parent
            color: 'red'
        }
    }
    Item {
        id: greenItem
        Rectangle {
            anchors.fill: parent
            color: 'green'
        }
    }
    Item {
        id: blueItem
        Rectangle {
            anchors.fill: parent
            color: 'blue'
        }
    }
}
