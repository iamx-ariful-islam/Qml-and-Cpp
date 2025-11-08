import QtQuick
import QtQuick.Window
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Controls.Material



ApplicationWindow {
    width: 850
    height: 500
    visible: true
    title: qsTr("Qt Quick SplitView")


    SplitView {
        anchors.fill: parent
        Item {
            width: 250
            height: parent.height
            Rectangle {
                anchors.fill: parent
                color: "orange"
            }
        }
        Item {
            width: 250
            height: parent.height
            Rectangle {
                anchors.fill: parent
                color: "blue"
            }
        }
        Item {
            width: 250
            height: parent.height
            Rectangle {
                anchors.fill: parent
                color: "cyan"
            }
        }
    }
}
