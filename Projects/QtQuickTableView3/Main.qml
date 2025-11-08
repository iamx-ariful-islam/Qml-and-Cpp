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
    title: qsTr("Qt Quick Table View 3")


    Row {
        anchors.fill: parent
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
                implicitHeight: 28

                property bool column0: column === 0
                property int del_height: 25

                Rectangle {
                    anchors.fill: parent
                    clip: true
                    border.width: 1
                    border.color: "lightgray"

                    Text {
                        id: del_text
                        height: del_item.del_height
                        text: display
                    }
                }
            }
        }
    }
    TableModel {
        id: tablemodel

        TableModelColumn { display: "text" }
        TableModelColumn { display: "path" }
        TableModelColumn { display: "image" }

        rows: [
            {
                text: "one",
                path: "/root/one.txt",
                image: "/root/one.png",
            },
            {
                text: "two",
                path: "/root/two.txt",
                image: "/root/two.png",
            },
            {
                text: "three",
                path: "/root/three.txt",
                image: "/root/three.png",
            },
        ]
    }

}
