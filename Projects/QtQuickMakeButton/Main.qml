import QtQuick
import QtQuick.Window
import QtQuick.Effects
import QtQuick.Controls.Material


Window {
    width: 850
    height: 500
    visible: true
    title: qsTr("Qt Quick Make Button")


    property color baseColor: 'white'
    property int rectWidth: 0
    property int rectHeight: 0


    Item {
        anchors.fill: parent

        Rectangle {
            id: myrect
            anchors.centerIn: parent
            implicitWidth: rectWidth ? rectWidth : 200
            implicitHeight: rectHeight ? rectHeight : 80
            radius: 8
//            border.width: 1
            color: if(mouseArea.containsPress){
                       return Qt.darker(baseColor)
                   } else if (mouseArea.containsMouse){
                       return Qt.lighter(baseColor)
                   } else {
                       return baseColor
                   }
//            Column {
//                leftPadding: 5
//                Text {
//                    font.pointSize: 15
//                    text: 'Button Name'
//                }
//                Text {
//                    font.pointSize: 11
//                    text: 'Descriptions'
//                }
//            }
            Text {
                anchors.centerIn: parent
                font {
                    family: "ubuntu"
                    weight: Font.Bold
                    pixelSize: 15
                }
                text: 'Click Me'
            }
            MouseArea {
                id: mouseArea

                anchors.fill: parent
                hoverEnabled: true
                cursorShape: Qt.PointingHandCursor
                onClicked: {
                    console.log("Button clicked!")
                }
            }
        }
        MultiEffect {
            id: mEffect
            blurMax: 64
            shadowColor: 'lightgray'
            contrast: 1.0
            shadowEnabled: true
            shadowBlur: 0.4
            shadowOpacity: 0.8
            source: myrect
            anchors.fill: myrect
        }
    }
}
