import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Controls.Material

import Qt.labs.qmlmodels


Window {
    id: root
    width: 850
    height: 500
    visible: true
    title: qsTr("Qt Quick Table View 2")


    Row {
        id: root_row

        TableView {
            id: tableview1

            width: root.width/2
            height: root.height - 50

            clip: true

            model: tablemodel

            delegate: Item {
                id: del_item

                implicitWidth: tableview1.width/3
                implicitHeight: del_height + progbar_height

                property bool column0: column === 0
                property int del_height: 25
                property int progbar_height: statusTip < 1.0 ? 20 : 0

                Rectangle {
                    anchors.fill: parent
                    // color: "white"
                    clip: true
                    border.width: 1
                    border.color: "lightgray"

                    Text {
                        id: del_text
                        height: del_item.del_height
                        text: display
                    }

                    Popup {
                        y: del_item.del_height
                        width: tableview1.width
                        height: del_item.progbar_height
                        visible: del_item.column0 && del_item.progbar_height > 0
                        modal: false
                        focus: false
                        closePolicy: Popup.NoAutoClose

                        background: Rectangle {
                            color: "transparent"
                        }

                        contentItem: ProgressBar {
                            from: 0
                            to: 1.0
                            value: statusTip

                            anchors.fill: parent
                            anchors.margins: 5
                        }
                    }
                }
            }
        }
    }

    Slider {
        id: progress_slider
        anchors.top: root_row.bottom
        value: 1.0
        from: 0
        to: 1.0
    }

    TableModel {
        id: tablemodel

        property real progress: progress_slider.value

        TableModelColumn { display: "text"; statusTip: "progress" }
        TableModelColumn { display: "path"; statusTip: "progress" }
        TableModelColumn { display: "image"; statusTip: "progress" }

        rows: [
            {
                text: "one",
                path: "/root/one.txt",
                image: "/root/one.png",
                progress: progress
            },
            {
                text: "two",
                path: "/root/two.txt",
                image: "/root/two.png",
                progress: progress
            },
            {
                text: "three",
                path: "/root/three.txt",
                image: "/root/three.png",
                progress: progress
            },
        ]
    }
}
