import QtQuick
import QtQuick.Window
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Controls.Material


import dbManager 1.0

ApplicationWindow {
    width: 850
    height: 500
    visible: true
    title: qsTr("Qt Quick Simple Sqlite User Information Project")

    font {
        weight: Font.Bold
        family: "Roboto"
    }

    DBManager {
        id: db_info
    }

    RowLayout {
        anchors.centerIn: parent
        spacing: 10

        ColumnLayout {
            spacing: 5

            TextField {
                id: textName
                implicitWidth: 250
                implicitHeight: 35
                placeholderText: "Enter your name"
            }
            RowLayout {
                spacing: 10

                TextField {
                    id: textAge
                    implicitWidth: 100
                    implicitHeight: 35
                    placeholderText: "Enter age"
                    validator: IntValidator {bottom: 0; top: 100} // validate with integer value with limit min=0 and max=999
                }
                ComboBox {
                    id: comboGender
                    Layout.fillWidth: true
                    implicitHeight: 46
                    model: ['-Select-', 'Male', 'Female', 'Others']

                    popup: Popup {
                        y: comboGender.height - 2
                        width: comboGender.width

                        padding: 0
                        contentItem: ListView {
                            clip: true
                            implicitHeight: contentHeight
                            model: comboGender.delegateModel
                            currentIndex: comboGender.highlightedIndex
                        }
                    }
                    delegate: ItemDelegate {
                        width: comboGender.width
                        height: comboGender.height - 14
                        HoverHandler {
                            cursorShape: Qt.PointingHandCursor
                        }
                        contentItem: Text {
                            text: modelData
                            font: comboGender.font
                            color: Material.accent
                            elide: Text.ElideRight
                            verticalAlignment: Text.AlignVCenter
                        }
                    }
                    HoverHandler {
                        cursorShape: Qt.PointingHandCursor
                    }
                }
            }
        }
        RoundButton {
            id: btnAdd
            text: qsTr("Add")
            implicitWidth: 100
            Layout.fillHeight: true
            Layout.rowSpan: 2
            radius: 5
            HoverHandler {
                cursorShape: Qt.PointingHandCursor
            }
            onClicked: {
                if (textName && textAge && comboGender.currentIndex !== 0){
                    db_info.insertUserData(textName.text, textAge.text, comboGender.currentText)
                    // textName.text = ""
                    // textAge.text  = ""
                    // comboGender.currentIndex = 0
                    notify.notificationMsg('Success', 'Successfully save user information', 'success')
                }
                else {
                    notify.notificationMsg('Error', 'Please enter all fields correctly', 'error')
                }
            }
        }
    }
    CustomNotification {
        id: notify
    }
    Connections {
        target: db_info
        function onGetAllUserData(user_data){
            console.log(user_data)
        }
    }
}
