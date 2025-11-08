import QtQuick
import QtQuick.Window
import QtQuick.Effects
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Controls.Material

import "components"

Window {
    width: 1250
    height: 750
    visible: true
    title: qsTr("Qt Quick Learn Page")


    property var infoItems: [
        ["First Title of API", "This is the first title and this title contains the details of the first title of API, that's how API work?", "../icons/api.png", "START HERE"],
        ["More CPU Options details", "How CPU work, learn about this and show what percentage use to CPU", "../icons/cpu.png", "SHOW MORE"],
        ["Learn about Hospital", "What is think about the hospital? Now time to know or learn about hospital activities", "../icons/hospital_icon.png", "VIEW DETAILS"],
        ["Know about eSmart LIS", "Know about eSmart LIS. How Laboratory Information System work and integration with analyzer", "../icons/software.png", "ABOUT LIS"],
//        ["First Title of API", "This is the first title and this title contains the details of the first title of API, that's how API work?", "../icons/api.png", "START HERE"],
//        ["More CPU Options details", "How CPU work, learn about this and show what percentage use to CPU", "../icons/cpu.png", "SHOW MORE"],
//        ["Learn about Hospital", "What is think about the hospital? Now time to know or learn about hospital activities", "../icons/hospital_icon.png", "VIEW DETAILS"],
//        ["Know about eSmart LIS", "Know about eSmart LIS. How Laboratory Information System work and integration with analyzer", "../icons/software.png", "ABOUT LIS"]
    ]


    Rectangle {
        width: parent.width * 0.95
        height: parent.height * 0.7
        anchors.centerIn: parent
        border.width: 1
        radius: 10
        clip: true

        Flickable {
            anchors.fill: parent
            contentWidth: parent.width
            contentHeight: grid.implicitHeight + 25

            GridLayout {
                id: grid
                anchors.centerIn: parent
                columns: 2
                columnSpacing: 50
                rowSpacing: 50

                Repeater {
                    model: infoItems.length

                    CustomRectangle {
                        titleText: infoItems[index][0]
                        descriptionText: infoItems[index][1]
                        iconSource: infoItems[index][2]
                        buttonText: infoItems[index][3]
                    }
                }
            }
        }
    }
}
