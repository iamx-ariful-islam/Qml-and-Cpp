import QtQuick
import QtQuick.Window
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Controls.Material


Window {
    width: 850
    height: 500
    visible: true
    title: qsTr("Qt Quick Contact List")

    property list<string> colors: ["orange", "green", "yellow", "cyan", "blue", "red"]

    Column {
        anchors.centerIn: parent
        spacing: 10

        Row {
            spacing: 10

            TextField {
                id: name
                width: 250
                height: 40
                placeholderText: 'Enter name'
            }
            TextField {
                id: mobile
                width: 160
                height: 40
                placeholderText: 'Enter mobile'
            }
            Button {
                id: btnAdd
                height: 40
                text: 'Add'
                onClicked: {
                    if (name.text && mobile.text){
                        myListView.model.append({myName: name.text, myMobile: mobile.text,  colorCode: colors[Math.floor(Math.random()*colors.length)]})
                    }
                }
            }
        }
        Row {
            Frame {
                width: 500
                height: 250
                ListView {
                    id: myListView
                    anchors.fill: parent
                    model: ListModel {}
                    spacing: 5
                    clip: true
                    delegate: Rectangle {
                        color: colorCode
                        radius: 5
                        width: parent.width
                        height: 50
                        Column {
                            anchors.fill: parent
                            leftPadding: 5
                            Text {
                                font.pointSize: 15
                                text: myName
                            }
                            Text {
                                font.pointSize: 11
                                text: myMobile
                            }
                        }
                    }
                }
            }
        }
    }
}
