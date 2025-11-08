import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Controls.Material


ApplicationWindow {
    id: window
    width: 850
    height: 500
    visible: true
    title: qsTr("Qt Quick TabBar")


    header: TabBar { //you can use footer: TabBar{}
        id: bar
        TabButton {
            text: qsTr("Tab1")
        }
        TabButton {
            text: qsTr("Tab2")
        }
        TabButton {
            text: qsTr("Tab3")
        }
    }
    SwipeView {
        anchors.fill: parent
        currentIndex: bar.currentIndex

        Item {
            id: fTab
            Rectangle {
                color: "red"
                anchors.fill: parent
            }
        }
        Item {
            id: sTab
            Rectangle {
                color: "green"
                anchors.fill: parent
            }
        }
        Item {
            id: tTab
            Rectangle {
                color: "blue"
                anchors.fill: parent
            }
        }
    }
}
