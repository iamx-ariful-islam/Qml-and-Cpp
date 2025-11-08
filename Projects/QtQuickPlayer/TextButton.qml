import QtQuick

Item {
    id: root

    property color color: 'gray'
    property alias text: btnText.text

    signal clicked

    Rectangle {
        id: background
        anchors.fill: parent

        color: if (btnMouseArea.containsPress){
                   return Qt.lighter(root.color)
               }else if (btnMouseArea.containsMouse){
                   return Qt.darker(root.color)
               }else {
                   return root.color
               }
        radius: 5
    }
    Text {
        id: btnText
        anchors.centerIn: parent
    }
    MouseArea {
        id: btnMouseArea
        anchors.fill: parent
        hoverEnabled: true
        onClicked: {
            root.clicked()
        }
        HoverHandler {
            cursorShape: Qt.PointingHandCursor
        }
    }
}
