import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Controls.Material



Window {
    width: 850
    height: 500
    visible: true
    title: qsTr("Qt Quick Modern ToDo List")

    ListModel {
        id: todoModel
    }

    Item {
        anchors.fill: parent

        Rectangle {
            id: topRect
            height: 60
            width: parent.width
            color: "#711F1F"
            anchors.top: parent.top

            Text {
                text: qsTr("My Todo List")
                font.bold: true
                font.pixelSize: 32
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 35
                color: "white"
            }
        }
        Item {
            width: parent.width
            anchors.bottom: parent.bottom
            anchors.top: topRect.bottom

            Rectangle {
                id: leftRect
                width: 0.5 * parent.width
                height: parent.height
                anchors.left: parent.left
                color: "#C4C4C4"
                ListView {
                    id: lv
                    model: todoModel
                    spacing: 5
                    anchors.centerIn: parent
                    width: parent.width * 0.7
                    height: parent.height * 0.8
                    delegate: Rectangle {
                        id: dlg
                        width: lv.width
                        height: 100
                        color: "white"
                        radius: 10

                        property string title: _title
                        property string description: _desc

                        Rectangle {
                            color: "red"
                            width: 100
                            radius: 10
                            height: parent.height
                            anchors.right: parent.right

                            Text {
                                id: btnDelete
                                text: qsTr("Delete")
                                color: "black"
                                font.bold: true
                                font.pixelSize: 18
                                anchors.centerIn: parent
                            }

                            MouseArea {
                                anchors.fill: parent
                                onClicked: {
                                    todoModel.remove(index)
                                }
                            }
                        }

                        Column {
                            anchors.fill: parent
                            anchors.leftMargin: 20
                            anchors.rightMargin: 100
                            anchors.topMargin: 5
                            anchors.bottomMargin: 5

                            Text {
                                text: dlg.title
                                color: "black"
                                font.bold: true
                                font.pixelSize: 18
                            }
                            Text {
                                text: dlg.description
                                color: "black"
                                font.pixelSize: 16
                            }
                        }
                    }
                }
            }
            Item {
                id: rightItem
                width: 0.5 * parent.width
                height: parent.height
                anchors.right: parent.right

                Column {
                    anchors.top: parent.top
                    anchors.topMargin: 50
                    spacing: 10
                    anchors.horizontalCenter: parent.horizontalCenter

                    TextField {
                        id: title
                        placeholderText: "Enter the title"
                        width: rightItem.width * 0.7
                    }
                    TextArea {
                        id: desc
                        placeholderText: "Enter the todo description"
                        height: 250
                        width: rightItem.width *0.7
                    }
                    Button {
                        text: qsTr("Add Item")
                        width: rightItem.width * 0.7
                        onClicked: {
                            if (title.text)
                            {
                                todoModel.append({ "_title": title.text, "_desc": desc.text })
                                title.text = ""
                                desc.text = ""
                            }
                        }
                    }
                }
            }
        }
    }
}
