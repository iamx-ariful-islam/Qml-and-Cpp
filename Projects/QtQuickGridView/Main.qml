import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Controls.Material


ApplicationWindow {
    width: 850
    height: 500
    visible: true
    title: qsTr("Qt Quick GridView")


    Component.onCompleted: {
        var colors = ["orange", "green", "yellow", "cyan", "blue", "red"];
        var count = 1;
        for(var x=1; x<10; x++)
        {
            for(var j=0; j<colors.length; j++)
            {
                gridView.model.append({myColor: colors[j], myText: count});
                count++;
            }
        }
    }

    GridView {
        id: gridView
        anchors {
            top: parent.top
            bottom: parent.bottom
            left: parent.left
            right: parent.right
            leftMargin: 20
            topMargin: 20
        }
        cellWidth: width/3
        cellHeight: height/3

        model: ListModel {}

        delegate: Rectangle {
            width: gridView.cellWidth * 0.9
            height: gridView.cellHeight * 0.9
            color: myColor
            radius: 5

            Text {
                color: "white"
                text: myText
                font.pointSize: 70
                font.bold: true
                anchors {
                    verticalCenter: parent.verticalCenter
                    horizontalCenter: parent.horizontalCenter
                }

            }
        }
    }
}
