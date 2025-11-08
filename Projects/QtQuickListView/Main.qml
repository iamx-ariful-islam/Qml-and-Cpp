import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Controls.Material


ApplicationWindow {
    id: mainWindow
    width: 850
    height: 500
    visible: true
    title: qsTr("Qt Quick ListView")


    Component.onCompleted: {
        var colors = ["orange", "green", "yellow", "cyan", "blue", "red"]
        for(var x=1; x<=10; x++){
            myListView.model.append({myText: "Hello "+x, colorCode: colors[x%6]});
        }
    }

    ListView {
        id: myListView
        anchors.fill: parent
        model: ListModel {}
        spacing: 5
        delegate: Rectangle {
            color: colorCode
            border.color: "black"
            border.width: 5
            radius: 10
            width: mainWindow.width
            height: mainWindow.height/5
            Text {
                anchors {
                    verticalCenter: parent.verticalCenter
                    horizontalCenter: parent.horizontalCenter
                }
                font.pointSize: 20
                text: myText
            }
        }
    }
}
