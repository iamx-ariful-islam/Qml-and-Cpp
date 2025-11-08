import QtQuick
import QtQuick.Window


Window {
    width: 850
    height: 480
    visible: true
    title: qsTr("Qt Quick Basic")


    Rectangle {
        id: btnClick

        property color baseColor: 'red'

        anchors {
            bottom: parent.verticalCenter
            horizontalCenter: parent.horizontalCenter
            bottomMargin: 20
        }
        width: 150
        height: 50
        radius: 10
        color: if(mouseArea1.containsPress){
                   return Qt.darker(baseColor)
               } else if (mouseArea1.containsMouse){
                   return Qt.lighter(baseColor)
               } else {
                   return baseColor
               }

        Text {
            anchors.centerIn: parent
            text: qsTr("Click ME")
        }
        MouseArea {
            id: mouseArea1
            anchors.fill: parent
            hoverEnabled: true
            onClicked: {
                btnClick.baseColor = 'orange'
            }
            HoverHandler {
                cursorShape: Qt.PointingHandCursor
            }
        }
    }
    Rectangle {
        id: btnClose

        property color baseColor: 'green'

        anchors {
            top: parent.verticalCenter
            horizontalCenter: parent.horizontalCenter
            topMargin: 20
        }
        width: 150
        height: 50
        radius: 10
        color: if(mouseArea2.containsPress){
                   return Qt.darker(baseColor)
               }else if(mouseArea2.containsMouse){
                   return Qt.lighter(baseColor)
               }else{
                   return baseColor
               }

        Text {
            anchors.centerIn: parent
            text: qsTr("Close")
        }
        MouseArea {
            id: mouseArea2
            anchors.fill: parent
            hoverEnabled: true
            onClicked: {
                Qt.quit()
            }
            HoverHandler {
                cursorShape: Qt.PointingHandCursor
            }
        }
    }
}
