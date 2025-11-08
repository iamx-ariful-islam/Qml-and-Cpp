import QtQuick
import QtQuick.Window
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Controls.Material


ApplicationWindow {
    width: 850
    height: 500
    visible: true
    title: qsTr("QtQuick Repeater")


    header: Rectangle {
        width: parent.width
        height: 50
        color: 'green'
        Label {
            id: myTitle
            anchors.centerIn: parent
            color: "white"
            font.bold: true
            font.pointSize: 20
        }
    }

    ColumnLayout {
        anchors.fill: parent
        spacing: 5
        Repeater {
            model: 5
            RowLayout {
                width: parent.width
                height: 10
                spacing: 10
                Repeater {
                    model: ListModel {
                        ListElement {
                            mytext: "button 1"
                        }
                        ListElement {
                            mytext: "button 2"
                        }
                        ListElement {
                            mytext: "button 3"
                        }
                        ListElement {
                            mytext: "button 4"
                        }
                        ListElement {
                            mytext: "button 5"
                        }
                    }
                    Button {
                        text: mytext
                        onClicked: {
                            myTitle.text = text
                        }
                    }
                }
            }
        }
    }
}
