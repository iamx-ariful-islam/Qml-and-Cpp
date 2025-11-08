import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Controls.Material


Window {
    width: 850
    height: 500
    visible: true
    title: qsTr("Qt Quick SwipView")


    property bool positionChecker: false
    property int nextIndex: 0

    SwipeView {
        id: swpView
        anchors.fill: parent
        currentIndex: 0
        Item {
            id: fItem
            Rectangle {
                anchors.fill: parent
                color: "red"
            }
        }
        Item {
            id: sItem
            Rectangle {
                anchors.fill: parent
                color: "blue"
            }
        }
        Item {
            id: tItem
            Rectangle {
                anchors.fill: parent
                color: "orange"
            }
        }
    }

    PageIndicator {
        id: indicator
        count: swpView.count
        currentIndex: swpView.currentIndex
        anchors.bottom: swpView.bottom
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Timer {
        running: true
        repeat: true
        interval: 3000 //time set from database
        onTriggered: {
            positionChecker = (nextIndex >= swpView.count - 1) ? true : (nextIndex <= 0) ? false : positionChecker
            nextIndex += (positionChecker) ? -1 : 1
            console.log("Next: " + nextIndex)
            swpView.setCurrentIndex(nextIndex)
        }
    }
}
